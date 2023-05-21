SHOW VARIABLES LIKE 'secure_file_priv';

CREATE DATABASE internship ;

USE internship;

CREATE TABLE project2 (
    step INT DEFAULT NULL,
    Type TEXT DEFAULT NULL,
    amount DOUBLE DEFAULT NULL,
    nameOrig TEXT DEFAULT NULL,
    oldbalanceOrg INT DEFAULT NULL,
    newbalanceOrig DOUBLE DEFAULT NULL,
    nameDest TEXT DEFAULT NULL,
    oldbalanceDest INT DEFAULT NULL,
    newbalanceDest INT DEFAULT NULL,
    isFraud INT DEFAULT NULL,
    isFlaggedFraud INT DEFAULT NULL
);

Load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ps.csv"
into table project2
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;


# counting rows in the table
SELECT 
    COUNT(*) total_count_of_rows
FROM
    project2;
    

# to check data type and constaraints of column

DESC project2;

# to check null values in type column
SELECT 
    *
FROM
    project2
WHERE
    type IS NULL;


# to check null values in amount column
SELECT 
    *
FROM
    project2
WHERE
    amount IS NULL;
    
    
# to check null values in nameOrig
 
SELECT 
    *
FROM
    project2
WHERE
    nameOrig IS NULL;
    
# to check null values in nameDest

SELECT 
    *
FROM
    project2
WHERE
    nameDest IS NULL;
    
    
# to check count of different kind of transactions

SELECT 
    type, COUNT(*) Total_count
FROM
    project2
GROUP BY type;


# to get sum of amount based on type of transaction

SELECT 
    type, SUM(amount) Sum_of_amount
FROM
    project2
GROUP BY type;




SELECT 
    COUNT(*) total_rows,
    SUM(amount) total_transaction_amount,
    MAX(amount) max_transaction_amount,
    MIN(amount) min_transaction_amount
FROM
    project2;
    
    
    
    
    
    
SELECT 
    type,
    COUNT(isFraud) total_fraud_transaction,
    SUM(amount) total_fraud_transaction_amount
FROM
    project2 WHERE isFraud = 1 GROUP BY type ;
    
    
SELECT * FROM project2 WHERE isFraud = 1;




SELECT 
    SUM(amount)
FROM
    project2
WHERE
    isFraud = 1;
    
SELECT step, count(step) count_of_fraud_transaction FROM project2 WHERE isFraud = 1 group by step order by count(step) DESC;

SELECT Type, COUNT(Type) count FROM project2 WHERE isFraud = 1 group by Type order by COUNT(Type) DESC;

