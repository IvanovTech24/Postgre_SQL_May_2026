SELECT
    p.id AS photo_id,
    (SELECT COUNT(l.id) FROM likes AS l WHERE l.photo_id = p.id) AS likes_count,
    (SELECT COUNT(c.id) FROM comments AS c WHERE c.photo_id = p.id) AS comments_count
FROM
    photos AS p
ORDER BY
    likes_count DESC,
    comments_count DESC,
    photo_id ASC;