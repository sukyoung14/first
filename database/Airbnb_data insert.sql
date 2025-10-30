USE AIRBnB_Common;
-- 1) users (email UNIQUE 가정) : UPSERT
INSERT INTO users
(email, password_hash, first_name, last_name, phone_number, date_of_birth, user_type, auth_provider, is_email_verified, is_phone_verified)
VALUES
('kim.minsoo@email.com', '$2b$12$hash1','민수','김','010-1234-5678','1990-05-15','both','email',TRUE,TRUE),
('lee.jieun@email.com', '$2b$12$hash2','지은','이','010-2345-6789','1993-03-22','guest','email',TRUE,TRUE),
('park.junho@email.com','$2b$12$hash3','준호','박','010-3456-7890','1988-11-30','host','email',TRUE,FALSE),
('choi.yuna@gmail.com', NULL,'유나','최','010-4567-8901','1995-07-18','guest','google',TRUE,TRUE),
('jung.hyunwoo@email.com','$2b$12$hash4','현우','정','010-5678-9012','1991-09-25','both','email',TRUE,TRUE),
('kang.sora@email.com', '$2b$12$hash5','소라','강','010-6789-0123','1994-02-14','guest','email',TRUE,FALSE),
('han.seojun@kakao.com',NULL,'서준','한','010-7890-1234','1989-12-05','host','kakao',TRUE,TRUE),
('lim.nayeon@email.com','$2b$12$hash6','나연','임','010-8901-2345','1996-04-20','guest','email',TRUE,TRUE),
('song.minho@email.com','$2b$12$hash7','민호','송','010-9012-3456','1992-08-10','both','email',TRUE,TRUE),
('oh.seunghee@apple.com',NULL,'승희','오','010-0123-4567','1997-01-28','guest','apple',TRUE,TRUE)
ON DUPLICATE KEY UPDATE
password_hash=VALUES(password_hash), first_name=VALUES(first_name), last_name=VALUES(last_name),
phone_number=VALUES(phone_number), date_of_birth=VALUES(date_of_birth), user_type=VALUES(user_type),
auth_provider=VALUES(auth_provider), is_email_verified=VALUES(is_email_verified),
is_phone_verified=VALUES(is_phone_verified), updated_at=NOW();
-- 2) hosts (user_id UNIQUE 가정) : UPSERT + FK 안전 참조
INSERT INTO hosts (user_id, status, bio, languages, average_rating, total_reviews, is_superhost, hosting_since)
VALUES
((SELECT user_id FROM users WHERE email='kim.minsoo@email.com'),'verified','서울 호스트 민수입니다.','한국어, English',4.92,127,TRUE,'2020-03-15'),
((SELECT user_id FROM users WHERE email='park.junho@email.com'),'verified','제주 한옥 운영','한국어, 日本語',4.85,89,FALSE,'2021-06-20'),
((SELECT user_id FROM users WHERE email='jung.hyunwoo@email.com'),'verified','부산 오션뷰','한국어, English, 中文',4.95,203,TRUE,'2019-11-10'),
((SELECT user_id FROM users WHERE email='han.seojun@kakao.com'),'verified','비즈니스 최적 공간','한국어, English',4.88,156,TRUE,'2020-08-01'),
((SELECT user_id FROM users WHERE email='song.minho@email.com'),'pending','홍대 레지던스','한국어',NULL,0,FALSE,'2024-10-01')
ON DUPLICATE KEY UPDATE
status=VALUES(status), bio=VALUES(bio), languages=VALUES(languages),
average_rating=VALUES(average_rating), total_reviews=VALUES(total_reviews),
is_superhost=VALUES(is_superhost), hosting_since=VALUES(hosting_since), updated_at=NOW();
-- 3) listings (title UNIQUE 가정 추천) : UPSERT
INSERT INTO listings
(host_id, title, description, property_type, room_type, max_guests, bedrooms, beds, bathrooms,
 address_line1, city, country, latitude, longitude, status)
VALUES
((SELECT h.host_id FROM hosts h JOIN users u USING(user_id) WHERE u.email='kim.minsoo@email.com'),
 '아늑한 강남 아파트','강남역 인근 모던 아파트','apartment','entire_place',4,2,2,1.5,'서울시 강남구 테헤란로','서울','대한민국',37.4979,127.0276,'active'),
((SELECT h.host_id FROM hosts h JOIN users u USING(user_id) WHERE u.email='kim.minsoo@email.com'),
 '한강뷰 럭셔리 펜트하우스','한강 조망 펜트하우스','apartment','entire_place',6,3,4,2.0,'서울시 용산구 이촌로','서울','대한민국',37.5219,126.9652,'active'),
((SELECT h.host_id FROM hosts h JOIN users u USING(user_id) WHERE u.email='park.junho@email.com'),
 '북촌 한옥 게스트하우스','전통 한옥 체험','hanok','private_room',2,1,1,1.0,'서울시 종로구 북촌로','서울','대한민국',37.5834,126.9834,'active'),
((SELECT h.host_id FROM hosts h JOIN users u USING(user_id) WHERE u.email='jung.hyunwoo@email.com'),
 '부산 해운대 비치 아파트','오션뷰 아파트','apartment','entire_place',5,2,3,2.0,'부산시 해운대구 우동','부산','대한민국',35.1586,129.1603,'active'),
((SELECT h.host_id FROM hosts h JOIN users u USING(user_id) WHERE u.email='han.seojun@kakao.com'),
 '광안리 모던 스튜디오','광안대교 야경 원룸','apartment','entire_place',2,1,1,1.0,'부산시 수영구 광안해변로','부산','대한민국',35.1532,129.1186,'active')
ON DUPLICATE KEY UPDATE
description=VALUES(description), property_type=VALUES(property_type), room_type=VALUES(room_type),
max_guests=VALUES(max_guests), bedrooms=VALUES(bedrooms), beds=VALUES(beds), bathrooms=VALUES(bathrooms),
address_line1=VALUES(address_line1), city=VALUES(city), country=VALUES(country),
latitude=VALUES(latitude), longitude=VALUES(longitude), status=VALUES(status), updated_at=NOW();
-- 4) listing_photos : 중복( listing_id + url ) 방지를 위해 IGNORE 권장
INSERT IGNORE INTO listing_photos (listing_id, photo_url, caption, display_order, is_cover_photo)
SELECT l.listing_id,'https://cdn.example.com/gangnam-1.jpg','거실 전경',0,TRUE  FROM listings l WHERE l.title='아늑한 강남 아파트'
UNION ALL
SELECT l.listing_id,'https://cdn.example.com/gangnam-2.jpg','침실',1,FALSE FROM listings l WHERE l.title='아늑한 강남 아파트'
UNION ALL
SELECT l.listing_id,'https://cdn.example.com/hanriver-1.jpg','한강뷰',0,TRUE  FROM listings l WHERE l.title='한강뷰 럭셔리 펜트하우스';
-- 5) availability_calendar : IGNORE
INSERT IGNORE INTO availability_calendar (listing_id, calendar_date, status, price_override)
SELECT l.listing_id,'2025-12-01','available',NULL FROM listings l WHERE l.title='아늑한 강남 아파트'
UNION ALL
SELECT l.listing_id,'2025-12-02','booked',NULL FROM listings l WHERE l.title='아늑한 강남 아파트'
UNION ALL
SELECT l.listing_id,'2025-12-10','available',300000 FROM listings l WHERE l.title='한강뷰 럭셔리 펜트하우스';
-- 6) pricing_rules : UPSERT( listing_id UNIQUE 권장 시)
INSERT INTO pricing_rules
(listing_id, base_price, currency_code, pricing_type, weekend_price, min_nights, max_nights)
SELECT l.listing_id,85000,'KRW','per_night',95000,2,30 FROM listings l WHERE l.title='아늑한 강남 아파트'
ON DUPLICATE KEY UPDATE
base_price=VALUES(base_price), currency_code=VALUES(currency_code), pricing_type=VALUES(pricing_type),
weekend_price=VALUES(weekend_price), min_nights=VALUES(min_nights), max_nights=VALUES(max_nights), updated_at=NOW();
-- 7) booking_requests : IGNORE (요청은 중복허용 구조면 UPSERT 불필요)
INSERT IGNORE INTO booking_requests
(listing_id, guest_id, check_in_date, check_out_date, number_of_guests, guest_message, status, expires_at)
VALUES
((SELECT listing_id FROM listings WHERE title='아늑한 강남 아파트'),
 (SELECT user_id FROM users WHERE email='lee.jieun@email.com'),
 '2025-12-01','2025-12-03',2,'깨끗한 숙소 기대합니다.','accepted','2025-11-30 23:59:59');
-- 8) bookings : UPSERT( confirmation_code UNIQUE 권장 )
INSERT INTO bookings
(listing_id, guest_id, host_id, request_id, confirmation_code, check_in_date, check_out_date,
 number_of_guests, number_of_nights, base_amount, cleaning_fee, service_fee, total_amount, currency_code,
 payment_status, booking_status, booked_at)
SELECT
 (SELECT listing_id FROM listings WHERE title='아늑한 강남 아파트'),
 (SELECT user_id   FROM users    WHERE email='lee.jieun@email.com'),
 (SELECT h.host_id FROM hosts h JOIN users u USING(user_id) WHERE u.email='kim.minsoo@email.com'),
 (SELECT br.request_id FROM booking_requests br
   WHERE br.listing_id=(SELECT listing_id FROM listings WHERE title='아늑한 강남 아파트')
     AND br.guest_id  =(SELECT user_id FROM users WHERE email='lee.jieun@email.com')
   ORDER BY br.request_id DESC LIMIT 1),
 'AIRBNB001','2025-12-01','2025-12-03',2,2,170000,30000,20000,220000,'KRW','paid','confirmed',NOW()
ON DUPLICATE KEY UPDATE
payment_status=VALUES(payment_status), booking_status=VALUES(booking_status), total_amount=VALUES(total_amount), updated_at=NOW();
-- 9) reviews : IGNORE (동일 booking+reviewer 조합 UNIQUE 권장)
INSERT IGNORE INTO reviews
(booking_id, reviewer_id, reviewee_id, listing_id, review_type, rating_overall, review_text, is_published, published_at)
SELECT
 (SELECT booking_id FROM bookings WHERE confirmation_code='AIRBNB001'),
 (SELECT user_id FROM users WHERE email='lee.jieun@email.com'),
 (SELECT h.host_id FROM hosts h JOIN users u USING(user_id) WHERE u.email='kim.minsoo@email.com'),
 (SELECT listing_id FROM listings WHERE title='아늑한 강남 아파트'),
 'guest_to_host',5,'아주 만족!',TRUE,'2025-12-05 10:00:00';
-- 10) notifications : IGNORE
INSERT IGNORE INTO notifications
(user_id, booking_id, listing_id, notification_type, title, content, delivery_method, is_read, sent_at)
SELECT
 (SELECT user_id FROM users WHERE email='lee.jieun@email.com'),
 (SELECT booking_id FROM bookings WHERE confirmation_code='AIRBNB001'),
 (SELECT listing_id FROM listings WHERE title='아늑한 강남 아파트'),
 'booking_confirmed','예약 확정','예약이 확정되었습니다.','email',TRUE,NOW();
-- 11) policies : UPSERT( listing_id+type UNIQUE 권장)
INSERT INTO policies (listing_id, policy_type, policy_name, policy_description, policy_details)
VALUES (
    (SELECT listing_id FROM listings WHERE title='아늑한 강남 아파트'),
    'cancellation',
    '유연한 환불',
    '체크인 24시간 전까지 전액 환불',
    '{"refund_percent":100,"cutoff_hours":24}'
) AS new_policy
ON DUPLICATE KEY UPDATE
policy_name = new_policy.policy_name,
policy_description = new_policy.policy_description,
policy_details = new_policy.policy_details,
updated_at = NOW();

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------

USE AIRBnB_Guest;
-- 1) verifications : IGNORE (user_id+type UNIQUE 권장)
INSERT IGNORE INTO verifications
(user_id, verification_type, verification_code, status, verified_at, expires_at)
SELECT (SELECT user_id FROM AIRBnB_Common.users WHERE email='lee.jieun@email.com'),
       'email','EMAIL123456','verified','2024-01-15 10:30:00','2024-01-15 11:30:00'
UNION ALL
SELECT (SELECT user_id FROM AIRBnB_Common.users WHERE email='lee.jieun@email.com'),
       'phone','SMS789012','verified','2024-01-15 10:35:00','2024-01-15 11:35:00';
-- 2) user_profiles : UPSERT(user_id UNIQUE)
INSERT INTO user_profiles (user_id, profile_photo_url, bio, location, languages, work, school)
SELECT (SELECT user_id FROM AIRBnB_Common.users WHERE email='lee.jieun@email.com'),
       'https://cdn.example.com/profile/u2.jpg','여행 좋아요','서울, 대한민국','한국어, English','IT','서울대'
ON DUPLICATE KEY UPDATE
profile_photo_url=VALUES(profile_photo_url), bio=VALUES(bio), location=VALUES(location),
languages=VALUES(languages), work=VALUES(work), school=VALUES(school), updated_at=NOW();
-- 3) payment_methods : IGNORE(여러 개 허용)
INSERT IGNORE INTO payment_methods
(user_id, method_type, card_last4, card_brand, card_exp_month, card_exp_year, billing_name, billing_country, billing_postal_code, is_default, status)
SELECT (SELECT user_id FROM AIRBnB_Common.users WHERE email='lee.jieun@email.com'),
       'card','1234','Visa',12,2027,'이지은','KR','06234',TRUE,'active';
-- 4) payments : IGNORE( booking별 1건 예시 )
INSERT IGNORE INTO payments
(booking_id, user_id, payment_method_id, amount, currency_code, payment_type, payment_status, payment_provider, transaction_id, paid_at)
SELECT
 (SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001'),
 (SELECT u.user_id FROM AIRBnB_Common.users u WHERE u.email='lee.jieun@email.com'),
 (SELECT pm.payment_method_id FROM payment_methods pm
   WHERE pm.user_id=(SELECT u.user_id FROM AIRBnB_Common.users u WHERE u.email='lee.jieun@email.com')
   ORDER BY pm.payment_method_id LIMIT 1),
 220000,'KRW','full','completed','stripe','pi_demo_001','2025-11-25 10:00:00';
-- 5) platform_fees : IGNORE
INSERT IGNORE INTO platform_fees
(payment_id, booking_id, fee_type, fee_name, fee_amount, fee_percentage, currency_code, description)
SELECT
 (SELECT p.payment_id FROM payments p
   WHERE p.booking_id=(SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001')
   ORDER BY p.payment_id LIMIT 1),
 (SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001'),
 'service_fee','서비스 수수료',20000,10.0,'KRW','플랫폼 수수료';
-- 6) check_ins : UPSERT( booking_id UNIQUE 가정)
INSERT INTO check_ins
(booking_id, guest_id, listing_id, check_in_method, check_in_code, actual_check_in_time)
SELECT
 (SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001'),
 (SELECT u.user_id FROM AIRBnB_Common.users u WHERE u.email='lee.jieun@email.com'),
 (SELECT l.listing_id FROM AIRBnB_Common.listings l WHERE l.title='아늑한 강남 아파트'),
 'keypad','1234','2025-12-01 15:30:00'
ON DUPLICATE KEY UPDATE
check_in_method=VALUES(check_in_method), check_in_code=VALUES(check_in_code),
actual_check_in_time=VALUES(actual_check_in_time), updated_at=NOW();
-- 7) review_stats : IGNORE (review_id UNIQUE)
INSERT IGNORE INTO review_stats (review_id, helpful_count, report_count, view_count)
SELECT (SELECT r.review_id FROM AIRBnB_Common.reviews r
        WHERE r.booking_id=(SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001')
        AND r.review_type='guest_to_host' LIMIT 1),
       10,0,100;
-- 8) cancellations : UPSERT( booking_id UNIQUE 가정)
INSERT INTO cancellations
(booking_id, cancelled_by, cancellation_reason, cancellation_note, refund_eligible, refund_percentage, penalty_amount, policy_applied)
VALUES
((SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001'),
 (SELECT u.user_id FROM AIRBnB_Common.users u WHERE u.email='lee.jieun@email.com'),
 'change_of_plans','일정 변경',TRUE,100.0,0,'유연한 환불')
ON DUPLICATE KEY UPDATE
cancellation_reason=VALUES(cancellation_reason), cancellation_note=VALUES(cancellation_note),
refund_eligible=VALUES(refund_eligible), refund_percentage=VALUES(refund_percentage),
penalty_amount=VALUES(penalty_amount), policy_applied=VALUES(policy_applied), created_at=NOW();
-- 9) refunds : UPSERT( payment_id UNIQUE 가정)
INSERT INTO refunds
(payment_id, cancellation_id, refund_amount, currency_code, refund_method, refund_status, refunded_at, estimated_arrival_date)
SELECT
 (SELECT p.payment_id FROM payments p
   WHERE p.booking_id=(SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001')
   ORDER BY p.payment_id LIMIT 1),
 (SELECT c.cancellation_id FROM cancellations c
   WHERE c.booking_id=(SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001')),
 220000,'KRW','original_payment','completed','2025-11-26 10:00:00','2025-11-29'
ON DUPLICATE KEY UPDATE
refund_amount=VALUES(refund_amount), refund_status=VALUES(refund_status),
refunded_at=VALUES(refunded_at), estimated_arrival_date=VALUES(estimated_arrival_date), updated_at=NOW();
-- -----------------------------------------------------------------------------------------------------------------
USE AIRBnB_Host;
-- 0) amenities 초기값(이미 있으면 무시)
INSERT IGNORE INTO amenities (amenity_id, name, category)
VALUES (1,'Wi-Fi','basic'),(2,'Kitchen','basic'),(3,'Washer','basic'),
       (4,'Air conditioning','basic'),(5,'Heating','basic'),
       (8,'Pool','leisure'),(9,'Gym','leisure');
-- 1) host_verifications : IGNORE
INSERT IGNORE INTO host_verifications
(host_id, verification_type, status, document_url, verified_at, verified_by)
SELECT (SELECT h.host_id FROM AIRBnB_Common.hosts h JOIN AIRBnB_Common.users u USING(user_id)
        WHERE u.email='kim.minsoo@email.com'),
       'identity','verified','https://cdn.example.com/host1-id.pdf','2020-03-10 10:00:00','admin_kim';
-- 2) payout_methods : UPSERT( host_id + method_type UNIQUE 권장)
INSERT INTO payout_methods
(host_id, method_type, account_holder_name, bank_name, account_number_encrypted, country_code, currency_code, is_default, status)
SELECT (SELECT h.host_id FROM AIRBnB_Common.hosts h JOIN AIRBnB_Common.users u USING(user_id)
        WHERE u.email='kim.minsoo@email.com'),
       'bank_account','김민수','국민은행','ENC_123456789012','KR','KRW',TRUE,'verified'
ON DUPLICATE KEY UPDATE
account_holder_name=VALUES(account_holder_name), bank_name=VALUES(bank_name),
account_number_encrypted=VALUES(account_number_encrypted), is_default=VALUES(is_default),
status=VALUES(status), updated_at=NOW();
-- 3) listing_amenities : IGNORE
INSERT IGNORE INTO listing_amenities (listing_id, amenity_id)
SELECT (SELECT listing_id FROM AIRBnB_Common.listings WHERE title='아늑한 강남 아파트'), 1
UNION ALL
SELECT (SELECT listing_id FROM AIRBnB_Common.listings WHERE title='아늑한 강남 아파트'), 2
UNION ALL
SELECT (SELECT listing_id FROM AIRBnB_Common.listings WHERE title='한강뷰 럭셔리 펜트하우스'), 8;
-- 4) fees : IGNORE (여러 행 허용)
INSERT IGNORE INTO fees (listing_id, fee_type, fee_name, amount, is_percentage, currency_code, description, is_active)
SELECT (SELECT listing_id FROM AIRBnB_Common.listings WHERE title='아늑한 강남 아파트'),
       'cleaning','청소비',30000,FALSE,'KRW','체크아웃 후 청소',TRUE;
-- 5) listing_requirements : UPSERT( listing_id UNIQUE )
INSERT INTO listing_requirements
(listing_id, instant_book_enabled, require_profile_photo, require_verified_id, require_payment_method,
 min_positive_reviews, max_negative_reviews)
SELECT (SELECT listing_id FROM AIRBnB_Common.listings WHERE title='아늑한 강남 아파트'),
       TRUE, TRUE, TRUE, TRUE, 3, 0
ON DUPLICATE KEY UPDATE
instant_book_enabled=VALUES(instant_book_enabled), require_profile_photo=VALUES(require_profile_photo),
require_verified_id=VALUES(require_verified_id), require_payment_method=VALUES(require_payment_method),
min_positive_reviews=VALUES(min_positive_reviews), max_negative_reviews=VALUES(max_negative_reviews),
updated_at=NOW();
-- 6) threads : IGNORE (booking_id UNIQUE 가정 시 UPSERT로 전환 가능)
INSERT IGNORE INTO threads (booking_id, host_id, guest_id, listing_id, status, last_message_at)
SELECT
 (SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001'),
 (SELECT h.host_id FROM AIRBnB_Common.hosts h JOIN AIRBnB_Common.users u USING(user_id)
   WHERE u.email='kim.minsoo@email.com'),
 (SELECT u.user_id FROM AIRBnB_Common.users u WHERE u.email='lee.jieun@email.com'),
 (SELECT l.listing_id FROM AIRBnB_Common.listings l WHERE l.title='아늑한 강남 아파트'),
 'active','2025-11-28 15:30:00';
-- 7) messages : IGNORE
INSERT IGNORE INTO messages (thread_id, sender_id, message_content, message_type, is_read, sent_at)
SELECT
 (SELECT t.thread_id FROM threads t
   WHERE t.booking_id=(SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001')
   LIMIT 1),
 (SELECT u.user_id FROM AIRBnB_Common.users u WHERE u.email='lee.jieun@email.com'),
 '안녕하세요! 체크인 시간 조정 가능할까요?','text',TRUE,'2025-11-28 14:30:00';
-- 8) payouts : UPSERT( transaction_id UNIQUE 권장 )
INSERT INTO payouts
(host_id, payout_method_id, gross_amount, platform_commission, net_amount, currency_code, status, payout_date, scheduled_date, completed_at, transaction_id)
SELECT
 (SELECT h.host_id FROM AIRBnB_Common.hosts h JOIN AIRBnB_Common.users u USING(user_id)
   WHERE u.email='kim.minsoo@email.com'),
 (SELECT pm.payout_method_id FROM payout_methods pm
   WHERE pm.host_id=(SELECT h.host_id FROM AIRBnB_Common.hosts h JOIN AIRBnB_Common.users u USING(user_id)
                     WHERE u.email='kim.minsoo@email.com')
   ORDER BY pm.payout_method_id LIMIT 1),
 220000, 22000, 198000, 'KRW', 'completed', '2025-12-05', '2025-12-05', '2025-12-05 09:00:00', 'PO_demo_001'
ON DUPLICATE KEY UPDATE
gross_amount=VALUES(gross_amount), platform_commission=VALUES(platform_commission),
net_amount=VALUES(net_amount), status=VALUES(status), payout_date=VALUES(payout_date),
scheduled_date=VALUES(scheduled_date), completed_at=VALUES(completed_at);
-- 9) payout_schedules : UPSERT( host_id UNIQUE 권장 )
INSERT INTO payout_schedules
(host_id, frequency, day_of_week, day_of_month, minimum_payout_amount, is_active)
SELECT
 (SELECT h.host_id FROM AIRBnB_Common.hosts h JOIN AIRBnB_Common.users u USING(user_id)
  WHERE u.email='kim.minsoo@email.com'),
 'weekly',5,NULL,100000,TRUE
ON DUPLICATE KEY UPDATE
frequency=VALUES(frequency), day_of_week=VALUES(day_of_week), day_of_month=VALUES(day_of_month),
minimum_payout_amount=VALUES(minimum_payout_amount), is_active=VALUES(is_active), updated_at=NOW();
-- 10) ledgers : IGNORE (여러 행 허용)
INSERT IGNORE INTO ledgers
(booking_id, host_id, payout_id, transaction_type, amount, currency_code, description, transaction_date, status)
SELECT
 (SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001'),
 (SELECT h.host_id FROM AIRBnB_Common.hosts h JOIN AIRBnB_Common.users u USING(user_id)
  WHERE u.email='kim.minsoo@email.com'),
 (SELECT p.payout_id FROM payouts p WHERE p.transaction_id='PO_demo_001'),
 'booking_revenue',170000,'KRW','숙박 수익','2025-12-01','completed';
-- 11) review_moderations : IGNORE
INSERT IGNORE INTO review_moderations
(review_id, status, reason, moderated_by, moderated_at)
SELECT
 (SELECT r.review_id FROM AIRBnB_Common.reviews r
  WHERE r.booking_id=(SELECT b.booking_id FROM AIRBnB_Common.bookings b WHERE b.confirmation_code='AIRBNB001')
  AND r.review_type='guest_to_host' LIMIT 1),
 'approved',NULL,'admin_kim','2025-12-06 11:00:00';