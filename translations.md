
```
SELECT *
FROM
  users;

User.all


SELECT *
FROM
  users
WHERE
  user.id = 1;

User.where( id: 1 )

SELECT *
FROM
  posts
ORDER BY
  created_at DESC
LIMIT 1;

Post.last

SELECT *
FROM
  users
JOIN
  posts
ON
  posts.author_id = users.id
WHERE
  posts.created_at >= '2014-08-31 00:00:00';

User.joins("JOIN users ON post.author_id = users.id").where("created_at >= '2014-08-31 00:00:00'")


SELECT
  count(*)
FROM
  users
GROUP BY
  favorite_color
HAVING
  count(*) > 1;

User.select("count(*) AS user_count").group(:favorite_color).having("user_count > 1")


* The most recently updated user
User.order(updated_at: :desc).first


* The oldest user (by age)
User.order(age: :desc).first

* all the users
User.all

* all posts sorted in descending order by date created
Post.order(created_at: :desc)


Post.all
SELECT * FROM posts

Post.first

SELECT *
FROM posts
ORDER BY created_at
LIMIT 1;

Post.last

SELECT *
FROM posts
ORDER BY created_at DESC
LIMIT 1;

Post.where(:id => 4)

SELECT *
FROM posts
WHERE id = 4;

Post.find(4)

SELECT *
FROM posts
WHERE id = 4
LIMIT 1;

User.count

SELECT count(*)
FROM users


Post.select(:name).where(:created_at > 3.days.ago).order(:created_at)

SELECT name
FROM posts
WHERE created_at <= DATE_SUB(NOW(), INTERVAL 3 DAY)
ORDER_BY created_at


Post.select("COUNT(*)").group(:category_id)

SELECT COUNT(*)
FROM posts
GROUP BY category_id


All posts created before 2014

SELECT *
FROM posts
WHERE created_at < '2014-01-01'


A list of all (unique) first names for authors who have written at least 3 posts

SELECT DISTINCT COUNT(first_name) AS count
FROM authors JOIN posts ON (posts.author_id = authors.id)
GROUP BY first_name
HAVING count >= 3


The posts with titles that start with the word "The"

SELECT title
FROM posts
WHERE title LIKE "The%"


Posts with IDs of 3,5,7, and 9

SELECT *
FROM posts
WHERE id IN (3,5,7,9)


```

Number of users named "James"

User.count(first_name).group(first_name).having( first_name: "James" )

SELECT count(first_name)
FROM users
GROUP BY first_name
HAVING first_name = 'James'


Number of users having at least one post

Post.joins("JOIN users ON posts.author_id = users.id").select("count(*) AS post_count, users.id").having(post_count > 0).group("users.id")
