// Solution 1

SELECT 
    start_activity.machine_id,
    ROUND(AVG(end_activity.timestamp - start_activity.timestamp), 3) AS processing_time
FROM 
    Activity start_activity
JOIN 
    Activity end_activity
ON 
    start_activity.machine_id = end_activity.machine_id
AND 
    start_activity.activity_type = 'start'
AND 
    end_activity.activity_type = 'end'
GROUP BY 
    start_activity.machine_id;



// solution 2

SELECT 
    a.machine_id,
    -- Calculate the average processing time for each machine
    ROUND(
        AVG(CASE WHEN a.activity_type = 'end' THEN a.timestamp END) - 
        AVG(CASE WHEN a.activity_type = 'start' THEN a.timestamp END), 
        3
    ) AS processing_time
FROM 
    Activity a
GROUP BY 
    a.machine_id;
