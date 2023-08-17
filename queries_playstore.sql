-- Find the app with an ID of 1880 -- 
SELECT * FROM analytics WHERE id = 1880;

-- Find the ID and app name for all apps that were last updated on August 01, 2018 --
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- Count the number of apps in each category -- 
SELECT category, COUNT(*) FROM analytics GROUP BY category;

-- Top 5 most-reviewed apps and the number of reviews -- 
SELECT app_name, reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- App with the most reviews having a rating >= 4.8 -- 
SELECT app_name, MAX(reviews) FROM analytics WHERE rating >= 4.8 GROUP BY app_name;

-- Average rating for each category ordered by the highest rated to lowest rated --
SELECT category, AVG(rating) as average_rating FROM analytics GROUP BY category ORDER BY average_rating DESC;

-- Name, price, and rating of the most expensive app with a rating < 3 -- 
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- Apps with a min install not exceeding 50, ordered by highest rated first --
SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating DESC;

-- Names of all apps rated less than 3 with at least 10,000 reviews --
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- Top 10 most-reviewed apps that cost between 10 cents and a dollar -- 
SELECT app_name, reviews FROM analytics WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews DESC LIMIT 10;

-- Most out-of-date app -- 
SELECT * FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- Most expensive app -- 
SELECT * FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

-- Count all the reviews in the Google Play Store -- 
SELECT SUM(reviews) FROM analytics;

-- Categories that have more than 300 apps -- 
SELECT category FROM analytics GROUP BY category HAVING COUNT(*) > 300;

-- App with the highest proportion of min_installs to reviews, among apps with min_installs >= 100,000 --
SELECT app_name, reviews, min_installs, (min_installs::float / reviews) as proportion 
FROM analytics WHERE min_installs >= 100000 
ORDER BY proportion DESC LIMIT 1;

