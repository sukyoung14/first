
-- ============================================
-- 에어비앤비 데이터베이스 전체 DDL
-- 3개 스키마 구조: Common, Guest, Host
-- 총 32개 테이블 (공유 11개 + 게스트 9개 + 호스트 12개)
-- ============================================
-- ============================================
-- 스키마 생성
-- ============================================
-- 공통(공유) 스키마
CREATE SCHEMA IF NOT EXISTS AIRBnB_Common;
-- 게스트 전용 스키마
CREATE SCHEMA IF NOT EXISTS AIRBnB_Guest;
-- 호스트 전용 스키마
CREATE SCHEMA IF NOT EXISTS AIRBnB_Host;
-- ============================================
-- AIRBnB_Common 스키마 (공유 테이블 11개)
-- ============================================
USE AIRBnB_Common;
-- 1. users: 사용자 (게스트와 호스트 공통)
CREATE TABLE users (
    user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) COMMENT '소셜 로그인 시 NULL',
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20),
    date_of_birth DATE,
    user_type ENUM('guest', 'host', 'both') DEFAULT 'guest',
    auth_provider ENUM('email', 'google', 'apple', 'kakao'),
    provider_user_id VARCHAR(255),
    is_email_verified BOOLEAN DEFAULT FALSE,
    is_phone_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    last_login_at TIMESTAMP NULL,
    INDEX idx_email (email),
    INDEX idx_auth_provider (auth_provider, provider_user_id)
) COMMENT '사용자 기본 정보 (게스트/호스트 공통)';
-- 2. listings: 숙소
CREATE TABLE listings (
    listing_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    host_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    property_type ENUM('apartment', 'house', 'villa', 'hanok', 'guesthouse', 
'other') NOT NULL,
    room_type ENUM('entire_place', 'private_room', 'shared_room') NOT NULL,
    max_guests INT NOT NULL,
    bedrooms INT NOT NULL,
    beds INT NOT NULL,
    bathrooms DECIMAL(3,1) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),
    status ENUM('draft', 'pending', 'active', 'inactive', 'deleted') DEFAULT 
'draft',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_host (host_id),
    INDEX idx_location (city, country),
    INDEX idx_status (status),
    FOREIGN KEY (host_id) REFERENCES users(user_id)
) COMMENT '숙소 정보';
-- 3. listing_photos: 숙소 사진
CREATE TABLE listing_photos (
    photo_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    photo_url VARCHAR(500) NOT NULL,
    caption TEXT,
    display_order INT DEFAULT 0,
    is_cover_photo BOOLEAN DEFAULT FALSE,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_listing (listing_id),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id) ON DELETE 
CASCADE
) COMMENT '숙소 사진';
-- 4. availability_calendar: 예약 가능 캘린더
CREATE TABLE availability_calendar (
    calendar_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    calendar_date DATE NOT NULL,
    status ENUM('available', 'booked', 'blocked') DEFAULT 'available',
    price_override DECIMAL(10,2),
    min_nights_override INT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    UNIQUE KEY unique_listing_date (listing_id, calendar_date),
    INDEX idx_calendar_date (calendar_date),
    INDEX idx_status (status),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id) ON DELETE 
CASCADE
) COMMENT '예약 가능 캘린더';
-- 5. pricing_rules: 가격 규칙
CREATE TABLE pricing_rules (
    pricing_rule_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    currency_code CHAR(3) DEFAULT 'USD',
    pricing_type ENUM('per_night', 'per_week', 'per_month') DEFAULT 
'per_night',
    weekend_price DECIMAL(10,2),
    weekly_discount_percent DECIMAL(5,2),
    monthly_discount_percent DECIMAL(5,2),
    min_nights INT DEFAULT 1,
    max_nights INT DEFAULT 365,
    effective_from DATE,
    effective_to DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_listing (listing_id),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id) ON DELETE 
CASCADE
) COMMENT '가격 규칙';
-- 6. booking_requests: 예약 요청
CREATE TABLE booking_requests (
    request_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    guest_id BIGINT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    number_of_guests INT NOT NULL,
    guest_message TEXT,
    status ENUM('pending', 'accepted', 'declined', 'expired', 'cancelled') 
DEFAULT 'pending',
    request_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    response_date TIMESTAMP NULL,
    host_response_message TEXT,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_listing (listing_id),
    INDEX idx_guest (guest_id),
    INDEX idx_status (status),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id),
    FOREIGN KEY (guest_id) REFERENCES users(user_id)
) COMMENT '예약 요청 (승인 대기)';
-- 7. bookings: 확정 예약
CREATE TABLE bookings (
    booking_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    guest_id BIGINT NOT NULL,
    host_id BIGINT NOT NULL,
    request_id BIGINT,
    confirmation_code VARCHAR(20) NOT NULL UNIQUE,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    number_of_guests INT NOT NULL,
    number_of_nights INT NOT NULL,
    base_amount DECIMAL(10,2) NOT NULL,
    cleaning_fee DECIMAL(10,2) DEFAULT 0,
    service_fee DECIMAL(10,2) DEFAULT 0,
    taxes DECIMAL(10,2) DEFAULT 0,
    total_amount DECIMAL(10,2) NOT NULL,
    currency_code CHAR(3) DEFAULT 'USD',
    booking_type ENUM('request', 'instant') NOT NULL,
    payment_status ENUM('pending', 'paid', 'refunded', 'partially_refunded') 
DEFAULT 'pending',
    booking_status ENUM('confirmed', 'checked_in', 'checked_out', 'cancelled') 
DEFAULT 'confirmed',
    booked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cancelled_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_listing (listing_id),
    INDEX idx_guest (guest_id),
    INDEX idx_host (host_id),
    INDEX idx_dates (check_in_date, check_out_date),
    INDEX idx_status (booking_status),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id),
    FOREIGN KEY (guest_id) REFERENCES users(user_id),
    FOREIGN KEY (host_id) REFERENCES users(user_id),
    FOREIGN KEY (request_id) REFERENCES booking_requests(request_id)
) COMMENT '확정 예약';
-- 8. reviews: 리뷰
CREATE TABLE reviews (
    review_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT NOT NULL,
    reviewer_id BIGINT NOT NULL,
    reviewee_id BIGINT NOT NULL,
    listing_id BIGINT NOT NULL,
    review_type ENUM('guest_to_host', 'host_to_guest') NOT NULL,
    rating_overall INT NOT NULL CHECK (rating_overall BETWEEN 1 AND 5),
    rating_cleanliness INT CHECK (rating_cleanliness BETWEEN 1 AND 5),
    rating_accuracy INT CHECK (rating_accuracy BETWEEN 1 AND 5),
    rating_checkin INT CHECK (rating_checkin BETWEEN 1 AND 5),
    rating_communication INT CHECK (rating_communication BETWEEN 1 
AND 5),
    rating_location INT CHECK (rating_location BETWEEN 1 AND 5),
    rating_value INT CHECK (rating_value BETWEEN 1 AND 5),
    review_text TEXT,
    public_response TEXT,
    is_published BOOLEAN DEFAULT FALSE,
    published_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_booking (booking_id),
    INDEX idx_listing (listing_id),
    INDEX idx_rating (rating_overall),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (reviewer_id) REFERENCES users(user_id),
    FOREIGN KEY (reviewee_id) REFERENCES users(user_id),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
) COMMENT '리뷰 및 평점';
-- 9. hosts: 호스트 정보
CREATE TABLE hosts (
    host_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL UNIQUE,
    status ENUM('pending', 'verified', 'suspended') DEFAULT 'pending',
    bio TEXT,
    profile_photo_url VARCHAR(500),
    languages VARCHAR(255),
    response_rate DECIMAL(5,2),
    response_time_minutes INT,
    average_rating DECIMAL(3,2),
    total_reviews INT DEFAULT 0,
    is_superhost BOOLEAN DEFAULT FALSE,
    hosting_since DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_user (user_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE 
CASCADE
) COMMENT '호스트 프로필';
-- 10. notifications: 알림
CREATE TABLE notifications (
    notification_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    booking_id BIGINT,
    listing_id BIGINT,
    notification_type ENUM('booking_confirmed', 'booking_request', 
'payment_success', 'check_in_reminder', 'review_received', 'message_received', 
'payout_scheduled') NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    metadata JSON,
    delivery_method ENUM('email', 'push', 'sms', 'in_app') NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user (user_id),
    INDEX idx_booking (booking_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE 
CASCADE,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON 
DELETE SET NULL,
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id) ON DELETE 
SET NULL
) COMMENT '알림 (이메일/푸시/SMS)';
-- 11. policies: 정책
CREATE TABLE policies (
    policy_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    policy_type ENUM('cancellation', 'house_rules', 'check_in_out') NOT NULL,
    policy_name VARCHAR(100) NOT NULL,
    policy_description TEXT NOT NULL,
    policy_details JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_listing (listing_id),
    FOREIGN KEY (listing_id) REFERENCES listings(listing_id) ON DELETE 
CASCADE
) COMMENT '정책 (취소/하우스룰/체크인아웃)';
-- ============================================
-- AIRBnB_Guest 스키마 (게스트 전용 테이블 9개)
-- ============================================ -- ============================================ -- ============================================ -- ============================================
USE AIRBnB_Guest;
-- 1. verifications: 게스트 인증
CREATE TABLE verifications (
    verification_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    verification_type ENUM('email', 'phone', 'identity', 'government_id') NOT 
NULL,
    verification_code VARCHAR(100),
    status ENUM('pending', 'verified', 'expired', 'failed') DEFAULT 'pending',
    verified_at TIMESTAMP NULL,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user (user_id),
    INDEX idx_type_status (verification_type, status),
    FOREIGN KEY (user_id) REFERENCES AIRBnB_Common.users(user_id) ON
DELETE CASCADE
) COMMENT '게스트 인증 (이메일/전화/신분증)';
-- 2. user_profiles: 게스트 프로필
CREATE TABLE user_profiles (
    profile_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL UNIQUE,
    profile_photo_url VARCHAR(500),
    bio TEXT,
    location VARCHAR(255),
    languages VARCHAR(255),
    work VARCHAR(255),
    school VARCHAR(255),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(20),
    government_id_provided BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_user (user_id),
    FOREIGN KEY (user_id) REFERENCES AIRBnB_Common.users(user_id) ON
DELETE CASCADE
) COMMENT '게스트 상세 프로필';
-- 3. payment_methods: 게스트 결제수단
CREATE TABLE payment_methods (
    payment_method_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    method_type ENUM('card', 'paypal', 'apple_pay', 'google_pay', 'kakaopay') 
NOT NULL,
    card_last4 CHAR(4),
    card_brand VARCHAR(50),
    card_exp_month INT,
    card_exp_year INT,
    billing_name VARCHAR(255) NOT NULL,
    billing_country CHAR(2) NOT NULL,
    billing_postal_code VARCHAR(20),
    is_default BOOLEAN DEFAULT FALSE,
    payment_provider_token VARCHAR(500) COMMENT '암호화된 토큰',
    status ENUM('active', 'expired', 'invalid') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_user (user_id),
    INDEX idx_status (status),
    FOREIGN KEY (user_id) REFERENCES AIRBnB_Common.users(user_id) ON
DELETE CASCADE
) COMMENT '게스트 결제수단';
-- 4. payments: 결제
CREATE TABLE payments (
    payment_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    payment_method_id BIGINT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    currency_code CHAR(3) NOT NULL,
    payment_type ENUM('full', 'partial', 'installment') NOT NULL,
    payment_status ENUM('pending', 'processing', 'completed', 'failed', 
'refunded') DEFAULT 'pending',
    payment_provider VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(255),
    payment_intent_id VARCHAR(255),
    paid_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_booking (booking_id),
    INDEX idx_user (user_id),
    INDEX idx_status (payment_status),
    FOREIGN KEY (booking_id) REFERENCES 
AIRBnB_Common.bookings(booking_id),
    FOREIGN KEY (user_id) REFERENCES AIRBnB_Common.users(user_id),
    FOREIGN KEY (payment_method_id) REFERENCES 
payment_methods(payment_method_id)
) COMMENT '결제 거래';
-- 5. platform_fees: 플랫폼 수수료
CREATE TABLE platform_fees (
    fee_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    payment_id BIGINT NOT NULL,
    booking_id BIGINT NOT NULL,
    fee_type ENUM('service_fee', 'vat', 'occupancy_tax', 'tourism_tax', 
'cleaning_fee') NOT NULL,
    fee_name VARCHAR(100) NOT NULL,
    fee_amount DECIMAL(10,2) NOT NULL,
    fee_percentage DECIMAL(5,2),
    currency_code CHAR(3) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_payment (payment_id),
    INDEX idx_booking (booking_id),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id) ON 
DELETE CASCADE,
    FOREIGN KEY (booking_id) REFERENCES 
AIRBnB_Common.bookings(booking_id)
) COMMENT '플랫폼 수수료 및 세금';
-- 6. check_ins: 체크인 기록
CREATE TABLE check_ins (
    check_in_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT NOT NULL UNIQUE,
    guest_id BIGINT NOT NULL,
    listing_id BIGINT NOT NULL,
    check_in_method ENUM('self', 'host_greeting', 'lockbox', 'keypad', 
'smart_lock') NOT NULL,
    check_in_code VARCHAR(100) COMMENT '암호화된 체크인 코드',
    actual_check_in_time TIMESTAMP NULL,
    actual_check_out_time TIMESTAMP NULL,
    special_requests TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_booking (booking_id),
    INDEX idx_guest (guest_id),
    FOREIGN KEY (booking_id) REFERENCES 
AIRBnB_Common.bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (guest_id) REFERENCES AIRBnB_Common.users(user_id),
    FOREIGN KEY (listing_id) REFERENCES 
AIRBnB_Common.listings(listing_id)
) COMMENT '체크인 기록';
-- 7. review_stats: 리뷰 통계
CREATE TABLE review_stats (
    stat_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    review_id BIGINT NOT NULL UNIQUE,
    helpful_count INT DEFAULT 0,
    report_count INT DEFAULT 0,
    view_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_review (review_id),
    FOREIGN KEY (review_id) REFERENCES 
AIRBnB_Common.reviews(review_id) ON DELETE CASCADE
) COMMENT '리뷰 통계 (도움됨/신고/조회)';
-- 8. cancellations: 예약 취소
CREATE TABLE cancellations (
    cancellation_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT NOT NULL UNIQUE,
    cancelled_by BIGINT NOT NULL,
    cancellation_reason ENUM('change_of_plans', 'emergency', 'price_issue', 
'found_better', 'host_issue', 'other') NOT NULL,
    cancellation_note TEXT,
    cancelled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    refund_eligible BOOLEAN NOT NULL,
    refund_percentage DECIMAL(5,2),
    penalty_amount DECIMAL(10,2) DEFAULT 0,
    policy_applied VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_booking (booking_id),
    INDEX idx_cancelled_by (cancelled_by),
    FOREIGN KEY (booking_id) REFERENCES 
AIRBnB_Common.bookings(booking_id),
    FOREIGN KEY (cancelled_by) REFERENCES 
AIRBnB_Common.users(user_id)
) COMMENT '예약 취소';
-- 9. refunds: 환불
CREATE TABLE refunds (
    refund_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    payment_id BIGINT NOT NULL UNIQUE,
    cancellation_id BIGINT,
    refund_amount DECIMAL(10,2) NOT NULL,
    currency_code CHAR(3) NOT NULL,
    refund_method ENUM('original_payment', 'bank_transfer', 'credit') NOT 
NULL,
    refund_status ENUM('pending', 'processing', 'completed', 'failed') DEFAULT 
'pending',
    refund_provider_transaction_id VARCHAR(255),
    refunded_at TIMESTAMP NULL,
    estimated_arrival_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_payment (payment_id),
    INDEX idx_cancellation (cancellation_id),
    INDEX idx_status (refund_status),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id),
    FOREIGN KEY (cancellation_id) REFERENCES 
cancellations(cancellation_id)
) COMMENT '환불 처리';
-- ============================================
-- AIRBnB_Host 스키마 (호스트 전용 테이블 12개)
-- ============================================ -- ============================================ -- ============================================ -- ============================================
USE AIRBnB_Host;
-- 1. host_verifications: 호스트 인증
CREATE TABLE host_verifications (
    verification_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    host_id BIGINT NOT NULL,
    verification_type ENUM('identity', 'government_id', 'email', 'phone', 
'business_license', 'selfie') NOT NULL,
    status ENUM('pending', 'verified', 'rejected', 'expired') DEFAULT 'pending',
    document_url VARCHAR(500),
    verified_at TIMESTAMP NULL,
    verified_by VARCHAR(100),
    rejection_reason TEXT,
    expires_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_host (host_id),
    INDEX idx_type_status (verification_type, status),
    FOREIGN KEY (host_id) REFERENCES AIRBnB_Common.hosts(host_id) ON
DELETE CASCADE
) COMMENT '호스트 신원 인증';
-- 2. payout_methods: 정산 수령 방법
CREATE TABLE payout_methods (
    payout_method_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    host_id BIGINT NOT NULL,
    method_type ENUM('bank_account', 'paypal', 'wise', 'payoneer') NOT NULL,
    account_holder_name VARCHAR(255) NOT NULL,
    bank_name VARCHAR(255),
    account_number_encrypted VARCHAR(255) NOT NULL COMMENT '암호화된
계좌번호',
    routing_number VARCHAR(50),
    swift_code VARCHAR(20),
    iban VARCHAR(50),
    paypal_email VARCHAR(255),
    country_code CHAR(2) NOT NULL,
    currency_code CHAR(3) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    status ENUM('pending', 'verified', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_host (host_id),
    INDEX idx_status (status),
    FOREIGN KEY (host_id) REFERENCES AIRBnB_Common.hosts(host_id) ON
DELETE CASCADE
) COMMENT '정산 수령 계좌';
-- 3. amenities: 편의시설 마스터
CREATE TABLE amenities (
    amenity_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    category ENUM('basic', 'facilities', 'safety', 'accessibility') NOT NULL,
    icon_name VARCHAR(100),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_category (category)
) COMMENT '편의시설 마스터 데이터';
-- 4. listing_amenities: 숙소별 편의시설
CREATE TABLE listing_amenities (
    listing_amenity_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    amenity_id BIGINT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_listing_amenity (listing_id, amenity_id),
    INDEX idx_listing (listing_id),
    INDEX idx_amenity (amenity_id),
    FOREIGN KEY (listing_id) REFERENCES 
AIRBnB_Common.listings(listing_id) ON DELETE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES amenities(amenity_id) ON 
DELETE CASCADE
) COMMENT '숙소별 편의시설 매핑';
-- 5. fees: 추가 요금
CREATE TABLE fees (
    fee_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL,
    fee_type ENUM('cleaning', 'extra_guest', 'pet', 'late_checkout', 
'early_checkin', 'service') NOT NULL,
    fee_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    is_percentage BOOLEAN DEFAULT FALSE,
    applies_after_guest_count INT,
    currency_code CHAR(3) DEFAULT 'USD',
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_listing (listing_id),
    FOREIGN KEY (listing_id) REFERENCES 
AIRBnB_Common.listings(listing_id) ON DELETE CASCADE
) COMMENT '추가 요금 (청소비/반려동물 등)';
-- 6. listing_requirements: 즉시예약 조건
CREATE TABLE listing_requirements (
    requirement_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    listing_id BIGINT NOT NULL UNIQUE,
    instant_book_enabled BOOLEAN DEFAULT FALSE,
    require_profile_photo BOOLEAN DEFAULT FALSE,
    require_verified_id BOOLEAN DEFAULT FALSE,
    require_payment_method BOOLEAN DEFAULT TRUE,
    require_good_track_record BOOLEAN DEFAULT FALSE,
    min_positive_reviews INT DEFAULT 0,
    max_negative_reviews INT DEFAULT 0,
    custom_requirements JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_listing (listing_id),
    FOREIGN KEY (listing_id) REFERENCES 
AIRBnB_Common.listings(listing_id) ON DELETE CASCADE
) COMMENT '즉시예약 요구사항';
-- 7. threads: 대화 스레드
CREATE TABLE threads (
    thread_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT NOT NULL UNIQUE,
    host_id BIGINT NOT NULL,
    guest_id BIGINT NOT NULL,
    listing_id BIGINT NOT NULL,
    status ENUM('active', 'archived', 'deleted') DEFAULT 'active',
    last_message_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_booking (booking_id),
    INDEX idx_host (host_id),
    INDEX idx_guest (guest_id),
    FOREIGN KEY (booking_id) REFERENCES 
AIRBnB_Common.bookings(booking_id),
    FOREIGN KEY (host_id) REFERENCES AIRBnB_Common.users(user_id),
    FOREIGN KEY (guest_id) REFERENCES AIRBnB_Common.users(user_id),
    FOREIGN KEY (listing_id) REFERENCES 
AIRBnB_Common.listings(listing_id)
) COMMENT '호스트-게스트 대화방';
-- 8. messages: 메시지
CREATE TABLE messages (
    message_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    thread_id BIGINT NOT NULL,
    sender_id BIGINT NOT NULL,
    message_content TEXT NOT NULL,
    message_type ENUM('text', 'system', 'image', 'document') DEFAULT 'text',
    attachment_url VARCHAR(500),
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_thread (thread_id),
    INDEX idx_sender (sender_id),
    INDEX idx_sent_at (sent_at),
    FOREIGN KEY (thread_id) REFERENCES threads(thread_id) ON DELETE 
CASCADE,
    FOREIGN KEY (sender_id) REFERENCES AIRBnB_Common.users(user_id)
) COMMENT '메시지';
-- 9. payouts: 정산 내역
CREATE TABLE payouts (
    payout_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    host_id BIGINT NOT NULL,
    payout_method_id BIGINT NOT NULL,
    gross_amount DECIMAL(10,2) NOT NULL,
    platform_commission DECIMAL(10,2) NOT NULL,
    net_amount DECIMAL(10,2) NOT NULL,
    currency_code CHAR(3) NOT NULL,
    status ENUM('scheduled', 'processing', 'completed', 'failed', 'cancelled') 
DEFAULT 'scheduled',
    payout_date DATE NOT NULL,
    scheduled_date DATE NOT NULL,
    completed_at TIMESTAMP NULL,
    transaction_id VARCHAR(255),
    failure_reason TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_host (host_id),
    INDEX idx_status (status),
    INDEX idx_payout_date (payout_date),
    FOREIGN KEY (host_id) REFERENCES AIRBnB_Common.hosts(host_id),
    FOREIGN KEY (payout_method_id) REFERENCES 
payout_methods(payout_method_id)
) COMMENT '정산 지급 내역';
-- 10. payout_schedules: 정산 일정
CREATE TABLE payout_schedules (
    schedule_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    host_id BIGINT NOT NULL UNIQUE,
    frequency ENUM('daily', 'weekly', 'biweekly', 'monthly') DEFAULT 'weekly',
    day_of_week INT COMMENT '요일 (1-7, 월-일)',
    day_of_month INT COMMENT '일자 (1-31)',
    minimum_payout_amount DECIMAL(10,2) DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
    INDEX idx_host (host_id),
    FOREIGN KEY (host_id) REFERENCES AIRBnB_Common.hosts(host_id) ON
DELETE CASCADE
) COMMENT '정산 일정 설정';
-- 11. ledgers: 거래 원장
CREATE TABLE ledgers (
    ledger_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    booking_id BIGINT NOT NULL,
    host_id BIGINT NOT NULL,
    payout_id BIGINT,
    transaction_type ENUM('booking_revenue', 'cleaning_fee', 
'platform_commission', 'refund', 'adjustment', 'payout') NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    currency_code CHAR(3) NOT NULL,
    description TEXT,
    transaction_date DATE NOT NULL,
    status ENUM('pending', 'completed', 'cancelled') DEFAULT 'completed',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_booking (booking_id),
    INDEX idx_host (host_id),
    INDEX idx_payout (payout_id),
    INDEX idx_transaction_date (transaction_date),
    FOREIGN KEY (booking_id) REFERENCES 
AIRBnB_Common.bookings(booking_id),
    FOREIGN KEY (host_id) REFERENCES AIRBnB_Common.hosts(host_id),
    FOREIGN KEY (payout_id) REFERENCES payouts(payout_id)
) COMMENT '거래 원장 (수익/지출 기록)';
-- 12. review_moderations: 리뷰 검토
CREATE TABLE review_moderations (
    moderation_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    review_id BIGINT NOT NULL UNIQUE,
    status ENUM('pending', 'approved', 'rejected', 'flagged') DEFAULT 
'pending',
    reason TEXT,
    moderated_by VARCHAR(100),
    moderated_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_review (review_id),
    INDEX idx_status (status),
    FOREIGN KEY (review_id) REFERENCES 
AIRBnB_Common.reviews(review_id) ON DELETE CASCADE
) COMMENT '리뷰 검토 및 승인';
-- ============================================
-- 뷰(View) 생성 - 자주 사용하는 조회 쿼리
-- ============================================ -- ============================================-- ============================================-- ============================================
USE AIRBnB_Common;
-- 뷰 1: 활성 숙소 목록 (가격 포함)
CREATE OR REPLACE VIEW v_active_listings AS
SELECT
    l.listing_id,
    l.title,
    l.city,
    l.country,
    l.property_type,
    l.room_type,
    l.max_guests,
    pr.base_price,
    pr.currency_code,
    h.user_id as host_user_id,
    u.first_name as host_first_name,
    u.last_name as host_last_name,
    h.average_rating as host_rating,
    h.is_superhost
FROM listings l
JOIN pricing_rules pr ON l.listing_id = pr.listing_id
JOIN hosts h ON l.host_id = h.host_id
JOIN users u ON h.user_id = u.user_id
WHERE l.status = 'active';
-- 뷰 2: 예약 상세 정보
CREATE OR REPLACE VIEW v_booking_details AS
SELECT
    b.booking_id,
    b.confirmation_code,
    b.check_in_date,
    b.check_out_date,
    b.number_of_nights,
    b.total_amount,
    b.booking_status,
    l.title as listing_title,
    l.city,
    CONCAT(gu.first_name, ' ', gu.last_name) as guest_name,
    CONCAT(hu.first_name, ' ', hu.last_name) as host_name
FROM bookings b
JOIN listings l ON b.listing_id = l.listing_id
JOIN users gu ON b.guest_id = gu.user_id
JOIN users hu ON b.host_id = hu.user_id;
-- ============================================
-- 초기 데이터 삽입
-- ============================================
USE AIRBnB_Host;
-- amenities 마스터 데이터
INSERT INTO amenities (name, category, icon_name) VALUES
('무선 인터넷', 'basic', 'wifi'),
('주방', 'basic', 'kitchen'),
('세탁기', 'basic', 'washer'),
('에어컨', 'basic', 'ac'),
('난방', 'basic', 'heating'),
('TV', 'basic', 'tv'),
('헤어드라이어', 'basic', 'hairdryer'),
('수영장', 'facilities', 'pool'),
('헬스장', 'facilities', 'gym'),
('주차', 'facilities', 'parking'),
('화재경보기', 'safety', 'smoke_alarm'),
('일산화탄소 경보기', 'safety', 'co_alarm'),
('소화기', 'safety', 'extinguisher'),
('휠체어 접근 가능', 'accessibility', 'wheelchair');
-- ============================================
-- 완료 메시지
-- ============================================
SELECT '✅ 에어비앤비 데이터베이스 생성 완료!' as status;
SELECT '📊 총 32개 테이블 생성됨' as info;
SELECT '   - AIRBnB_Common: 11 개 (공유)' as detail1;
SELECT '   - AIRBnB_Guest: 9 개 (게스트 전용)' as detail2;
SELECT '   - AIRBnB_Host: 12 개 (호스트 전용)' as detail3;