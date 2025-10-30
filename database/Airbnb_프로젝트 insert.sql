USE AIRBnB_Common;
-- =====================================
-- 1. users
-- =====================================
INSERT INTO users (name, email, password, phone_number, date_of_birth, gender, created_at, updated_at)
VALUES
('Alice Kim', 'alice@example.com', 'password1', '010-1111-1111', '1990-01-01', 'F', NOW(), NOW()),
('Bob Lee', 'bob@example.com', 'password2', '010-2222-2222', '1985-05-15', 'M', NOW(), NOW()),
('Charlie Park', 'charlie@example.com', 'password3', '010-3333-3333', '1992-07-20', 'M', NOW(), NOW()),
('Diana Choi', 'diana@example.com', 'password4', '010-4444-4444', '1988-03-10', 'F', NOW(), NOW()),
('Edward Jung', 'edward@example.com', 'password5', '010-5555-5555', '1995-09-25', 'M', NOW(), NOW()),
('Fiona Han', 'fiona@example.com', 'password6', '010-6666-6666', '1991-11-11', 'F', NOW(), NOW()),
('George Oh', 'george@example.com', 'password7', '010-7777-7777', '1987-12-12', 'M', NOW(), NOW()),
('Hannah Yoon', 'hannah@example.com', 'password8', '010-8888-8888', '1993-06-06', 'F', NOW(), NOW()),
('Ian Kang', 'ian@example.com', 'password9', '010-9999-9999', '1990-08-08', 'M', NOW(), NOW()),
('Julia Seo', 'julia@example.com', 'password10', '010-1010-1010', '1989-04-04', 'F', NOW(), NOW());

-- =====================================
-- 2. listings
-- =====================================
INSERT INTO listings (host_id, title, description, property_type, room_type, max_guests, bedrooms, beds, bathrooms, address_line1, city, country, status)
VALUES
(2, 'Seoul Cozy Apartment', 'Comfortable 1-bedroom apartment in Seoul.', 'apartment', 'entire_place', 2, 1, 1, 1.0, '123 Gangnam St', 'Seoul', 'South Korea', 'active'),
(2, 'Hanok Stay in Bukchon', 'Traditional hanok experience.', 'hanok', 'private_room', 4, 2, 3, 2.0, '45 Bukchon', 'Seoul', 'South Korea', 'active'),
(5, 'Beach House in Busan', 'Sea view villa.', 'villa', 'entire_place', 6, 3, 4, 2.5, '12 Haeundae Beach', 'Busan', 'South Korea', 'active'),
(5, 'Mountain Cabin', 'Cozy cabin in the mountains.', 'house', 'entire_place', 4, 2, 2, 1.5, '99 Mountain Rd', 'Gangwon', 'South Korea', 'active'),
(9, 'City Studio', 'Modern studio apartment.', 'apartment', 'entire_place', 2, 1, 1, 1.0, '88 Seoul St', 'Seoul', 'South Korea', 'active'),
(9, 'Guesthouse in Jeju', 'Relaxing stay near beach.', 'guesthouse', 'private_room', 3, 2, 2, 1.5, '7 Jeju Rd', 'Jeju', 'South Korea', 'active'),
(7, 'Luxury Villa', 'High-end villa with pool.', 'villa', 'entire_place', 8, 4, 5, 3.0, '33 Gangnam St', 'Seoul', 'South Korea', 'active'),
(7, 'Countryside House', 'Peaceful countryside house.', 'house', 'entire_place', 5, 3, 3, 2.0, '55 Country Rd', 'Chungcheong', 'South Korea', 'active'),
(10, 'Downtown Loft', 'Modern loft in downtown.', 'apartment', 'entire_place', 2, 1, 1, 1.0, '100 Central Ave', 'Seoul', 'South Korea', 'active'),
(10, 'Riverside Cabin', 'Cabin by the river.', 'house', 'entire_place', 4, 2, 2, 1.5, '22 River Rd', 'Gangwon', 'South Korea', 'active');

INSERT INTO listing_photos (listing_id, photo_url, caption, is_cover_photo)
VALUES
(1, 'https://example.com/apt1.jpg', 'Living room view', TRUE),
(1, 'https://example.com/apt1_bed.jpg', 'Bedroom', FALSE),
(2, 'https://example.com/hanok1.jpg', 'Front yard', TRUE),
(2, 'https://example.com/hanok2.jpg', 'Traditional room', FALSE),
(3, 'https://example.com/beachhouse1.jpg', 'Sea view', TRUE),
(4, 'https://example.com/cabin1.jpg', 'Mountain view', TRUE),
(5, 'https://example.com/studio1.jpg', 'Studio interior', TRUE),
(6, 'https://example.com/guesthouse1.jpg', 'Guesthouse lounge', TRUE),
(7, 'https://example.com/villa1.jpg', 'Villa pool', TRUE),
(8, 'https://example.com/countryside1.jpg', 'Garden view', TRUE);

INSERT INTO availability_calendar (listing_id, calendar_date, status, price_override)
VALUES
(1, '2025-11-01', 'available', 80.00),
(1, '2025-11-02', 'booked', NULL),
(2, '2025-11-01', 'available', 120.00),
(3, '2025-11-03', 'available', 200.00),
(4, '2025-11-04', 'blocked', NULL),
(5, '2025-11-05', 'available', 90.00),
(6, '2025-11-06', 'available', 100.00),
(7, '2025-11-07', 'booked', NULL),
(8, '2025-11-08', 'available', 150.00),
(9, '2025-11-09', 'available', 85.00);


INSERT INTO pricing_rules (listing_id, base_price, currency_code, pricing_type, weekend_price, weekly_discount_percent)
VALUES
(1, 70.00, 'USD', 'per_night', 90.00, 10.00),
(2, 100.00, 'USD', 'per_night', 130.00, 15.00),
(3, 180.00, 'USD', 'per_night', 220.00, 20.00),
(4, 120.00, 'USD', 'per_night', 150.00, 12.00),
(5, 85.00, 'USD', 'per_night', 100.00, 10.00),
(6, 95.00, 'USD', 'per_night', 110.00, 5.00),
(7, 300.00, 'USD', 'per_night', 350.00, 25.00),
(8, 140.00, 'USD', 'per_night', 160.00, 15.00),
(9, 80.00, 'USD', 'per_night', 95.00, 8.00),
(10, 130.00, 'USD', 'per_night', 160.00, 18.00);

INSERT INTO booking_requests (listing_id, guest_id, check_in_date, check_out_date, number_of_guests, guest_message, status, expires_at)
VALUES
(1, 1, '2025-11-01', '2025-11-03', 2, 'Looking forward to staying!', 'pending', '2025-10-30 23:59:59'),
(2, 3, '2025-11-05', '2025-11-08', 3, 'I love hanoks!', 'pending', '2025-11-03 23:59:59'),
(3, 6, '2025-11-10', '2025-11-15', 4, 'Family vacation.', 'pending', '2025-11-08 23:59:59'),
(4, 1, '2025-11-12', '2025-11-14', 2, 'Quick mountain trip.', 'pending', '2025-11-10 23:59:59'),
(5, 8, '2025-11-20', '2025-11-22', 2, 'Business trip.', 'pending', '2025-11-18 23:59:59'),
(6, 3, '2025-11-18', '2025-11-21', 3, 'Looking forward to the beach!', 'pending', '2025-11-16 23:59:59'),
(7, 9, '2025-11-25', '2025-11-30', 5, 'Holiday with friends.', 'pending', '2025-11-23 23:59:59'),
(8, 4, '2025-11-28', '2025-12-01', 4, 'Family getaway.', 'pending', '2025-11-26 23:59:59'),
(9, 10, '2025-12-02', '2025-12-05', 2, 'Weekend trip.', 'pending', '2025-11-30 23:59:59'),
(10, 2, '2025-12-07', '2025-12-10', 3, 'Riverside cabin experience.', 'pending', '2025-12-05 23:59:59');

INSERT INTO bookings (listing_id, guest_id, host_id, request_id, confirmation_code, check_in_date, check_out_date, number_of_guests, number_of_nights, base_amount, total_amount, booking_type, payment_status, booking_status)
VALUES
(1, 1, 2, 1, 'CONF001', '2025-11-01', '2025-11-03', 2, 2, 140.00, 160.00, 'request', 'paid', 'confirmed'),
(2, 3, 2, 2, 'CONF002', '2025-11-05', '2025-11-08', 3, 3, 300.00, 330.00, 'request', 'paid', 'confirmed'),
(3, 6, 5, 3, 'CONF003', '2025-11-10', '2025-11-15', 4, 5, 900.00, 950.00, 'request', 'paid', 'confirmed'),
(4, 1, 5, 4, 'CONF004', '2025-11-12', '2025-11-14', 2, 2, 240.00, 260.00, 'request', 'paid', 'confirmed'),
(5, 8, 9, 5, 'CONF005', '2025-11-20', '2025-11-22', 2, 2, 170.00, 180.00, 'request', 'paid', 'confirmed'),
(6, 3, 9, 6, 'CONF006', '2025-11-18', '2025-11-21', 3, 3, 285.00, 300.00, 'request', 'paid', 'confirmed'),
(7, 9, 7, 7, 'CONF007', '2025-11-25', '2025-11-30', 5, 5, 1500.00, 1600.00, 'request', 'paid', 'confirmed'),
(8, 4, 7, 8, 'CONF008', '2025-11-28', '2025-12-01', 4, 3, 420.00, 450.00, 'request', 'paid', 'confirmed'),
(9, 10, 10, 9, 'CONF009', '2025-12-02', '2025-12-05', 2, 3, 240.00, 260.00, 'request', 'paid', 'confirmed'),
(10, 2, 10, 10, 'CONF010', '2025-12-07', '2025-12-10', 3, 3, 390.00, 420.00, 'request', 'paid', 'confirmed');

INSERT INTO reviews (booking_id, reviewer_id, reviewee_id, listing_id, review_type, rating_overall, rating_cleanliness, rating_accuracy, rating_checkin, rating_communication, rating_location, rating_value, review_text, is_published)
VALUES
(1, 1, 2, 1, 'guest_to_host', 5, 5, 5, 5, 5, 5, 5, 'Great stay!', TRUE),
(2, 3, 2, 2, 'guest_to_host', 4, 4, 4, 4, 5, 4, 4, 'Nice experience.', TRUE),
(3, 6, 5, 3, 'guest_to_host', 5, 5, 5, 5, 5, 5, 5, 'Amazing villa.', TRUE),
(4, 1, 5, 4, 'guest_to_host', 4, 4, 4, 4, 4, 4, 4, 'Cozy cabin.', TRUE),
(5, 8, 9, 5, 'guest_to_host', 5, 5, 5, 5, 5, 5, 5, 'Perfect location.', TRUE),
(6, 3, 9, 6, 'guest_to_host', 4, 4, 4, 4, 4, 4, 4, 'Good guesthouse.', TRUE),
(7, 9, 7, 7, 'guest_to_host', 5, 5, 5, 5, 5, 5, 5, 'Luxury stay.', TRUE),
(8, 4, 7, 8, 'guest_to_host', 4, 4, 4, 4, 4, 4, 4, 'Quiet countryside.', TRUE),
(9, 10, 10, 9, 'guest_to_host', 5, 5, 5, 5, 5, 5, 5, 'Convenient loft.', TRUE),
(10, 2, 10, 10, 'guest_to_host', 4, 4, 4, 4, 4, 4, 4, 'Nice riverside.', TRUE);

-- --
INSERT INTO hosts (user_id, status, bio, languages, response_rate, response_time_minutes, average_rating, total_reviews, is_superhost, hosting_since)
VALUES
(2, 'verified', 'Love hosting guests from all over the world.', 'English,Korean', 95.00, 60, 4.8, 50, TRUE, '2015-01-01'),
(5, 'verified', 'Passionate about travel and hospitality.', 'Korean', 90.00, 120, 4.7, 35, FALSE, '2017-05-01'),
(7, 'verified', 'Enjoy welcoming families and groups.', 'English,Korean', 85.00, 90, 4.9, 60, TRUE, '2016-03-01'),
(9, 'verified', 'Friendly host with local tips.', 'Korean', 88.00, 75, 4.6, 40, FALSE, '2018-07-01'),
(10, 'verified', 'Love hosting solo travelers.', 'English', 92.00, 50, 4.8, 30, TRUE, '2019-09-01'),
(2, 'verified', 'Experienced host in city apartments.', 'English,Korean', 90.00, 60, 4.5, 25, FALSE, '2015-02-01'),
(5, 'verified', 'Family-friendly homes.', 'Korean', 87.00, 80, 4.7, 45, FALSE, '2017-06-01'),
(7, 'verified', 'High-end properties.', 'English,Korean', 95.00, 45, 4.9, 55, TRUE, '2016-04-01'),
(9, 'verified', 'Budget-friendly stays.', 'Korean', 89.00, 70, 4.6, 35, FALSE, '2018-08-01'),
(10, 'verified', 'Nature escapes.', 'English', 93.00, 55, 4.8, 40, TRUE, '2019-10-01');


INSERT INTO notifications (user_id, booking_id, listing_id, notification_type, title, content, delivery_method)
VALUES
(1, 1, 1, 'booking_confirmed', 'Booking Confirmed', 'Your booking has been confirmed.', 'email'),
(3, 2, 2, 'booking_request', 'New Booking Request', 'You have a new booking request.', 'push'),
(6, 3, 3, 'payment_success', 'Payment Successful', 'Your payment has been processed.', 'email'),
(1, 4, 4, 'check_in_reminder', 'Check-in Reminder', 'Your check-in is tomorrow.', 'sms'),
(8, 5, 5, 'review_received', 'New Review Received', 'You received a new review.', 'in_app'),
(3, 6, 6, 'message_received', 'New Message', 'You have a new message from guest.', 'email'),
(9, 7, 7, 'payout_scheduled', 'Payout Scheduled', 'Your payout is scheduled.', 'push'),
(4, 8, 8, 'booking_confirmed', 'Booking Confirmed', 'Your booking has been confirmed.', 'email'),
(10, 9, 9, 'booking_request', 'New Booking Request', 'You have a new booking request.', 'push'),
(2, 10, 10, 'payment_success', 'Payment Successful', 'Your payment has been processed.', 'email');
INSERT INTO policies (listing_id, policy_type, policy_name, policy_description)
VALUES
(1, 'cancellation', 'Flexible', 'Full refund 1 day prior to arrival.'),
(2, 'house_rules', 'No Smoking', 'Smoking is not allowed inside the property.'),
(3, 'check_in_out', 'Check-in 3PM', 'Check-in time is from 3 PM.'),
(4, 'cancellation', 'Moderate', 'Full refund 5 days prior to arrival.'),
(5, 'house_rules', 'No Pets', 'Pets are not allowed.'),
(6, 'check_in_out', 'Check-out 11AM', 'Check-out time is 11 AM.'),
(7, 'cancellation', 'Strict', '50% refund up to 1 week prior.'),
(8, 'house_rules', 'No Parties', 'Parties are not allowed.'),
(9, 'check_in_out', 'Self Check-in', 'Check-in with smart lock.'),
(10, 'cancellation', 'Flexible', 'Full refund 24 hours prior to arrival.');

INSERT INTO hosts (user_id, status, bio, languages, response_rate, response_time_minutes, average_rating, total_reviews, is_superhost, hosting_since)
VALUES
(2, 'verified', 'Love hosting guests from all over the world.', 'English,Korean', 95.00, 60, 4.8, 50, TRUE, '2015-01-01'),
(5, 'verified', 'Passionate about travel and hospitality.', 'Korean', 90.00, 120, 4.7, 35, FALSE, '2017-05-01'),
(7, 'verified', 'Enjoy welcoming families and groups.', 'English,Korean', 85.00, 90, 4.9, 60, TRUE, '2016-03-01'),
(9, 'verified', 'Friendly host with local tips.', 'Korean', 88.00, 75, 4.6, 40, FALSE, '2018-07-01'),
(10, 'verified', 'Love hosting solo travelers.', 'English', 92.00, 50, 4.8, 30, TRUE, '2019-09-01'),
(2, 'verified', 'Experienced host in city apartments.', 'English,Korean', 90.00, 60, 4.5, 25, FALSE, '2015-02-01'),
(5, 'verified', 'Family-friendly homes.', 'Korean', 87.00, 80, 4.7, 45, FALSE, '2017-06-01'),
(7, 'verified', 'High-end properties.', 'English,Korean', 95.00, 45, 4.9, 55, TRUE, '2016-04-01'),
(9, 'verified', 'Budget-friendly stays.', 'Korean', 89.00, 70, 4.6, 35, FALSE, '2018-08-01'),
(10, 'verified', 'Nature escapes.', 'English', 93.00, 55, 4.8, 40, TRUE, '2019-10-01');

