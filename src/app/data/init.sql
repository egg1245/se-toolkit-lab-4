-- Learning Management Service — Database Initialization
-- This script runs automatically on the first start of the PostgreSQL container.

-- Items: learning materials
CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL DEFAULT '',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Learners: students using the system
CREATE TABLE IF NOT EXISTS learners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    enrolled_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Interaction logs: records of learners interacting with items
CREATE TABLE IF NOT EXISTS interaction_logs (
    id SERIAL PRIMARY KEY,
    learner_id INTEGER NOT NULL REFERENCES learners(id),
    item_id INTEGER NOT NULL REFERENCES items(id),
    kind VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Seed data: items
INSERT INTO items (title, description) VALUES
    ('Introduction to Software Engineering', 'Overview of SE principles and practices.'),
    ('Version Control with Git', 'Learn Git basics: commits, branches, merging.'),
    ('REST API Design', 'Design RESTful APIs using HTTP methods and status codes.'),
    ('Docker Fundamentals', 'Containerize applications using Docker and Docker Compose.'),
    ('Database Integration', 'Connect a web application to a PostgreSQL database.'),
    ('Testing with pytest', 'Write and run automated tests for Python applications.'),
    ('Linux Server Administration', 'Basic server management and security hardening.'),
    ('CI/CD Pipelines', 'Automate testing and deployment with GitHub Actions.');

-- Seed data: learners
INSERT INTO learners (name, email, enrolled_at) VALUES
    ('Alice Johnson', 'alice@example.com', '2025-09-01 09:00:00'),
    ('Bob Smith', 'bob@example.com', '2025-09-01 09:15:00'),
    ('Charlie Brown', 'charlie@example.com', '2025-09-15 10:00:00'),
    ('Diana Prince', 'diana@example.com', '2025-10-01 08:30:00'),
    ('Eve Adams', 'eve@example.com', '2025-10-15 11:00:00');

-- Seed data: interaction logs
INSERT INTO interaction_logs (learner_id, item_id, kind, created_at) VALUES
    (1, 1, 'view', '2025-09-02 10:00:00'),
    (1, 2, 'view', '2025-09-02 10:30:00'),
    (1, 2, 'complete', '2025-09-03 14:00:00'),
    (2, 1, 'view', '2025-09-02 11:00:00'),
    (2, 3, 'view', '2025-09-05 09:00:00'),
    (2, 3, 'attempt', '2025-09-05 09:30:00'),
    (3, 1, 'view', '2025-09-16 10:00:00'),
    (3, 4, 'view', '2025-09-18 15:00:00'),
    (4, 1, 'view', '2025-10-02 08:00:00'),
    (4, 5, 'complete', '2025-10-05 16:00:00'),
    (5, 1, 'view', '2025-10-16 09:00:00'),
    (5, 6, 'view', '2025-10-16 09:30:00');
