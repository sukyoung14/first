-- 공통 기간 변수
SET @start_date = '2024-01-01';
SET @end_date   = '2025-12-31';
/* ================================================
   1) 인증
   ================================================ */
-- [게스트] 신규 가입 대비 '완료' 인증율 (이메일/폰/신분증 등 전체)
SELECT
  DATE_FORMAT(u.created_at, '%Y-%m') AS ym,
  COUNT(DISTINCT u.user_id)          AS signups,
  COUNT(DISTINCT CASE WHEN v.status='verified' THEN v.user_id END) AS verified_users,
  ROUND(100 * COUNT(DISTINCT CASE WHEN v.status='verified' THEN v.user_id END)
             / NULLIF(COUNT(DISTINCT u.user_id),0), 2) AS verified_rate_pct
FROM AIRBnB_Common.users u
LEFT JOIN AIRBnB_Guest.verifications v
       ON v.user_id = u.user_id
      AND v.verified_at BETWEEN @start_date AND @end_date
WHERE u.created_at BETWEEN @start_date AND @end_date
GROUP BY ym
ORDER BY ym;
-- [호스트] 사용자→호스트 전환 및 인증단계별 성공률
SELECT
  DATE_FORMAT(h.created_at, '%Y-%m')                         AS ym,
  COUNT(*)                                                   AS new_hosts,
  ROUND(100*AVG(h.is_superhost=TRUE),2)                      AS superhost_share_pct,
  hv.verification_type,
  ROUND(100*AVG(hv.status='verified'),2)                     AS verified_rate_pct
FROM AIRBnB_Common.hosts h
LEFT JOIN AIRBnB_Host.host_verifications hv ON hv.host_id = h.host_id
WHERE h.created_at BETWEEN @start_date AND @end_date
GROUP BY ym, hv.verification_type
ORDER BY ym, hv.verification_type;
/* ================================================
   2) 프로필
   ================================================ */
-- [게스트] 프로필 다변화: 사용 언어 토큰화 간단 집계(쉼표 구분 가정)
SELECT
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(up.languages, ',', n.n), ',', -1)) AS language,
  COUNT(*) AS users_cnt
FROM AIRBnB_Guest.user_profiles up
JOIN (
  SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) n
  ON n.n <= 1 + LENGTH(up.languages) - LENGTH(REPLACE(up.languages, ',', ''))
WHERE up.languages IS NOT NULL
GROUP BY language
ORDER BY users_cnt DESC;
-- [호스트] 신뢰/활성도: 평균 평점 분포 및 슈퍼호스트율
SELECT
  CASE
    WHEN average_rating IS NULL THEN 'no-rating'
    WHEN average_rating < 4.5 THEN '<4.5'
    WHEN average_rating < 4.8 THEN '4.5~4.79'
    WHEN average_rating < 5.0 THEN '4.8~4.99'
    ELSE '5.0'
  END AS rating_bucket,
  COUNT(*)                                       AS hosts_cnt,
  ROUND(100*AVG(is_superhost=TRUE),2)            AS superhost_share_pct
FROM AIRBnB_Common.hosts
GROUP BY rating_bucket
ORDER BY FIELD(rating_bucket,'no-rating','<4.5','4.5~4.79','4.8~4.99','5.0');
/* ================================================
   3) 결제/정산
   ================================================ */
-- [게스트] 결제 성공률/금액/수수료 (플랫폼 수수료는 AIRBnB_Guest.platform_fees)
WITH p AS (
  SELECT booking_id,
         COUNT(*)                                     AS payments,
         SUM(CASE WHEN payment_status='completed' THEN 1 ELSE 0 END) AS completed_cnt,
         SUM(CASE WHEN payment_status='completed' THEN amount ELSE 0 END) AS completed_amount
  FROM AIRBnB_Guest.payments
  WHERE paid_at BETWEEN @start_date AND @end_date
  GROUP BY booking_id
),
fees AS (
  SELECT booking_id, SUM(fee_amount) AS platform_fee_amount
  FROM AIRBnB_Guest.platform_fees
  GROUP BY booking_id
)
SELECT
  DATE_FORMAT(b.booked_at, '%Y-%m')  AS ym,
  COUNT(DISTINCT b.booking_id)       AS bookings,
  SUM(p.payments)                    AS payments_attempts,
  SUM(p.completed_cnt)               AS payments_completed,
  ROUND(100*SUM(p.completed_cnt)/NULLIF(SUM(p.payments),0),2) AS payment_success_rate_pct,
  SUM(p.completed_amount)            AS completed_amount_sum,
  SUM(COALESCE(fees.platform_fee_amount,0)) AS platform_fees_sum
FROM AIRBnB_Common.bookings b
LEFT JOIN p    ON p.booking_id    = b.booking_id
LEFT JOIN fees ON fees.booking_id = b.booking_id
WHERE b.booked_at BETWEEN @start_date AND @end_date
GROUP BY ym
ORDER BY ym;
-- [호스트] 정산 주기·상태·수익 구조(원장)
SELECT
  DATE_FORMAT(p.payout_date,'%Y-%m') AS ym,
  p.status,
  COUNT(*)                           AS payouts_cnt,
  SUM(p.gross_amount)                AS gross_sum,
  SUM(p.platform_commission)         AS commission_sum,
  SUM(p.net_amount)                  AS net_sum,
  ROUND(AVG(ps.frequency='weekly')*100,2)  AS weekly_sched_pct
FROM AIRBnB_Host.payouts p
LEFT JOIN AIRBnB_Host.payout_schedules ps ON ps.host_id = p.host_id
WHERE p.payout_date BETWEEN @start_date AND @end_date
GROUP BY ym, p.status
ORDER BY ym, FIELD(p.status,'scheduled','processing','completed','failed');
-- (보너스) 원장 기준 수익 구조
SELECT
  transaction_type,
  COUNT(*)                                   AS cnt,
  SUM(amount)                                AS amount_sum
FROM AIRBnB_Host.ledgers
WHERE transaction_date BETWEEN @start_date AND @end_date
GROUP BY transaction_type
ORDER BY amount_sum DESC;
/* ================================================
   4) 예약
   ================================================ */
-- [게스트] 예약 퍼널: 요청→확정
SELECT
  DATE_FORMAT(br.request_date,'%Y-%m')                 AS ym,
  COUNT(*)                                             AS req_cnt,
  SUM(br.status='accepted')                            AS accepted_cnt,
  SUM(br.status='declined')                            AS declined_cnt,
  SUM(br.status='expired')                             AS expired_cnt,
  SUM(b.booking_id IS NOT NULL)                        AS confirmed_cnt,
  ROUND(100*SUM(b.booking_id IS NOT NULL)/NULLIF(COUNT(*),0),2) AS confirm_rate_pct
FROM AIRBnB_Common.booking_requests br
LEFT JOIN AIRBnB_Common.bookings b
       ON b.request_id = br.request_id
WHERE br.request_date BETWEEN @start_date AND @end_date
GROUP BY ym
ORDER BY ym;
-- [호스트] 호스트별 수락/거절/확정률
SELECT
  h.host_id,
  CONCAT(u.first_name,' ',u.last_name) AS host_name,
  COUNT(DISTINCT br.request_id)        AS requests,
  SUM(br.status='accepted')            AS accepted,
  SUM(br.status='declined')            AS declined,
  SUM(b.booking_id IS NOT NULL)        AS confirmed,
  ROUND(100*SUM(br.status='accepted')/NULLIF(COUNT(DISTINCT br.request_id),0),2) AS accept_rate_pct,
  ROUND(100*SUM(b.booking_id IS NOT NULL)/NULLIF(COUNT(DISTINCT br.request_id),0),2) AS confirm_rate_pct
FROM AIRBnB_Common.listings l
JOIN AIRBnB_Common.hosts h  ON h.host_id = l.host_id
JOIN AIRBnB_Common.users u  ON u.user_id = h.user_id
LEFT JOIN AIRBnB_Common.booking_requests br ON br.listing_id = l.listing_id
LEFT JOIN AIRBnB_Common.bookings b          ON b.request_id  = br.request_id
WHERE br.request_date BETWEEN @start_date AND @end_date
GROUP BY h.host_id, host_name
ORDER BY requests DESC;
/* ================================================
   5) 리뷰
   ================================================ */
-- [게스트] 리뷰 작성행동/항목별 평가 요약
SELECT
  DATE_FORMAT(r.created_at,'%Y-%m') AS ym,
  COUNT(*)                          AS reviews,
  AVG(r.rating_overall)             AS avg_overall,
  AVG(NULLIF(r.rating_cleanliness,0))      AS avg_cleanliness,
  AVG(NULLIF(r.rating_accuracy,0))         AS avg_accuracy,
  AVG(NULLIF(r.rating_checkin,0))          AS avg_checkin,
  AVG(NULLIF(r.rating_communication,0))    AS avg_communication,
  AVG(NULLIF(r.rating_location,0))         AS avg_location,
  AVG(NULLIF(r.rating_value,0))            AS avg_value
FROM AIRBnB_Common.reviews r
WHERE r.created_at BETWEEN @start_date AND @end_date
GROUP BY ym
ORDER BY ym;
-- [호스트] 호스트가 받은 리뷰 수/평점/응답률(공개 응답 여부)
SELECT
  b.host_id,
  CONCAT(u.first_name,' ',u.last_name) AS host_name,
  COUNT(*)                             AS reviews_received,
  AVG(r.rating_overall)                AS avg_overall,
  ROUND(100*AVG(r.public_response IS NOT NULL AND r.public_response<>''),2) AS response_rate_pct
FROM AIRBnB_Common.reviews r
JOIN AIRBnB_Common.bookings b ON b.booking_id = r.booking_id
JOIN AIRBnB_Common.hosts h     ON h.host_id   = b.host_id
JOIN AIRBnB_Common.users u     ON u.user_id   = h.user_id
WHERE r.created_at BETWEEN @start_date AND @end_date
GROUP BY b.host_id, host_name
ORDER BY reviews_received DESC;
/* ================================================
   6) 커뮤니케이션
   ================================================ */
-- [게스트] 예약별 문의 발생률(스레드/메시지 존재 비율)
SELECT
  DATE_FORMAT(b.booked_at,'%Y-%m') AS ym,
  COUNT(*)                         AS bookings,
  SUM(t.thread_id IS NOT NULL)     AS with_thread,
  SUM(m.message_id IS NOT NULL)    AS with_message,
  ROUND(100*SUM(t.thread_id IS NOT NULL)/NULLIF(COUNT(*),0),2) AS thread_rate_pct,
  ROUND(100*SUM(m.message_id IS NOT NULL)/NULLIF(COUNT(*),0),2) AS message_rate_pct
FROM AIRBnB_Common.bookings b
LEFT JOIN AIRBnB_Host.threads t  ON t.booking_id = b.booking_id
LEFT JOIN AIRBnB_Host.messages m ON m.thread_id  = t.thread_id
WHERE b.booked_at BETWEEN @start_date AND @end_date
GROUP BY ym
ORDER BY ym;
-- [호스트] 응답 속도(첫 게스트 메시지→첫 호스트 답변)
WITH first_msgs AS (
  SELECT
    t.thread_id,
    MIN(CASE WHEN m.sender_id = b.guest_id THEN m.sent_at END) AS first_guest_msg_at,
    MIN(CASE WHEN m.sender_id = b.host_id  THEN m.sent_at END) AS first_host_reply_at,
    b.host_id
  FROM AIRBnB_Host.threads t
  JOIN AIRBnB_Common.bookings b ON b.booking_id = t.booking_id
  JOIN AIRBnB_Host.messages m   ON m.thread_id  = t.thread_id
  WHERE m.sent_at BETWEEN @start_date AND @end_date
  GROUP BY t.thread_id, b.host_id
)
SELECT
  fm.host_id,
  CONCAT(u.first_name,' ',u.last_name) AS host_name,
  COUNT(*)                              AS threads_cnt,
  ROUND(AVG(TIMESTAMPDIFF(MINUTE, fm.first_guest_msg_at, fm.first_host_reply_at)),1) AS avg_first_reply_min
FROM first_msgs fm
JOIN AIRBnB_Common.hosts h ON h.host_id = fm.host_id
JOIN AIRBnB_Common.users u ON u.user_id = h.user_id
WHERE fm.first_guest_msg_at IS NOT NULL
  AND fm.first_host_reply_at IS NOT NULL
GROUP BY fm.host_id, host_name
ORDER BY avg_first_reply_min ASC;
 /* ================================================
    7) 가격·정책
    ================================================ */
-- [게스트] 가격대/최소숙박일 분포(현재 액티브 숙소)
SELECT
  CASE
    WHEN pr.base_price < 80000 THEN '<80k'
    WHEN pr.base_price < 150000 THEN '80k~149k'
    WHEN pr.base_price < 300000 THEN '150k~299k'
    ELSE '300k+'
  END AS price_bucket,
  pr.min_nights,
  COUNT(*) AS listings_cnt
FROM AIRBnB_Common.listings l
JOIN AIRBnB_Common.pricing_rules pr ON pr.listing_id = l.listing_id
WHERE l.status='active'
GROUP BY price_bucket, pr.min_nights
ORDER BY price_bucket, pr.min_nights;
-- [호스트] 정책/요금 설정 채택 현황 (취소정책·하우스룰·수수료)
SELECT
  l.host_id,
  SUM(p.policy_type='cancellation') AS cancellation_policies,
  SUM(p.policy_type='house_rules')  AS house_rule_policies,
  SUM(f.fee_id IS NOT NULL)         AS fee_items
FROM AIRBnB_Common.listings l
LEFT JOIN AIRBnB_Common.policies p ON p.listing_id = l.listing_id
LEFT JOIN AIRBnB_Host.fees f       ON f.listing_id = l.listing_id
GROUP BY l.host_id
ORDER BY fee_items DESC;
 /* ================================================
    8) 취소/환불
    ================================================ */
-- [게스트] 취소율/환불 진행 현황
SELECT
  DATE_FORMAT(b.booked_at,'%Y-%m') AS ym,
  COUNT(*)                         AS bookings,
  SUM(c.cancellation_id IS NOT NULL)                                   AS cancelled_cnt,
  ROUND(100*SUM(c.cancellation_id IS NOT NULL)/NULLIF(COUNT(*),0),2)   AS cancel_rate_pct,
  SUM(r.refund_id IS NOT NULL)                                         AS refunded_cnt,
  SUM(r.refund_amount)                                                 AS refund_amount_sum
FROM AIRBnB_Common.bookings b
LEFT JOIN AIRBnB_Guest.cancellations c ON c.booking_id = b.booking_id
LEFT JOIN AIRBnB_Guest.refunds r       ON r.cancellation_id = c.cancellation_id
WHERE b.booked_at BETWEEN @start_date AND @end_date
GROUP BY ym
ORDER BY ym;
-- [호스트] 취소로 인한 손실(환불액) 및 상태별 환불 집계
SELECT
  r.refund_status,
  COUNT(*)            AS refunds_cnt,
  SUM(r.refund_amount) AS refund_amount_sum
FROM AIRBnB_Guest.refunds r
WHERE r.refunded_at BETWEEN @start_date AND @end_date
GROUP BY r.refund_status
ORDER BY FIELD(r.refund_status,'pending','processing','completed','failed');
