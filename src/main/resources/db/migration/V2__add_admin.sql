INSERT INTO users (id, archive, email, name, password, role)
-- bucket_id
VALUES (1, false, 'adilmurzaliev@gmail.com', 'admin', '$2a$10$y/IS4FJ.JZXv54/l7sITSO7HQVcmf1gS9rV9JX5pOkul5HozQjEQm', 'ADMIN');
-- null

ALTER SEQUENCE user_seq RESTART WITH 2;