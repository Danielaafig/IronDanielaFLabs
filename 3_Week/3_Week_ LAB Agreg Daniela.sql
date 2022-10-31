# Query 1
#Get the id values of the first 5 clients from district_id 
#with a value equals to 1.

select client_id from bank.client
WHERE district_id =1
LIMIT 5;

#2) In the client table, get an id value of the last client 
#where the district_id equals to 72.

SELECT max(client_id) FROM bank.client
WHERE district_id = 72; 

#3) Get the 3 lowest amounts in the loan table.

SELECT amount FROM bank.loan
order by amount asc
LIMIT 3;

#4) What are the possible values for status, ordered 
#alphabetically in ascending order in the loan table?

SELECT DISTINCT status FROM bank.loan
order by status asc;

#5) What is the loan_id of the highest payment received 
#in the loan table?
SELECT loan_id FROM bank.loan
order by amount desc
LIMIT 1;

#6)What is the loan amount of the lowest 5 account_ids in the 
#loan table? Show the account_id and the corresponding amount

SELECT account_id, amount FROM bank.loan
order by account_id asc
LIMIT 5;

#7)What are the top 5 account_ids with the lowest loan amount that have a loan duration 
#of 60 in the loan table?

SELECT amount, account_id FROM bank.loan
WHERE  duration = 60
ORDER BY amount
LIMIT 5;

#8) What are the unique values of k_symbol in the order table?
#Note: There shouldn't be a table name order, since order is reserved 
#from the ORDER BY clause. You have to use backticks to escape the order table name.

SELECT DISTINCT k_symbol  FROM bank.order;

#9) In the order table, what are the order_ids of the client with the account_id 34?

SELECT account_id, order_id FROM bank.order
WHERE  account_id = 34;

#10)In the order table, which account_ids were responsible for orders between 
#order_id 29540 and order_id 29560 (inclusive)?

SELECT distinct account_id FROM bank.order
WHERE  order_id > 29540 and order_id < 29561;

#11)In the order table, what are the individual amounts that were sent 
#to (account_to) id 30067122?

SELECT distinct amount FROM bank.order 
WHERE  account_to = 30067122;

#12) In the trans table, show the trans_id, date, type and amount of the 10 first 
#transactions from account_id 793 in chronological order, from newest to oldest.

SELECT trans_id, date, type,account_id amount FROM bank.trans
WHERE  account_id = 793
ORDER BY date desc
LIMIT 10;

#13) In the client table, of all districts with a district_id lower than 10, how many clients 
#are from each district_id? Show the results sorted by the district_id in ascending order.

SELECT district_id, COUNT(client_id) FROM bank.client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id asc;

#14) In the card table, how many cards exist for each type? Rank the result starting with 
#the most frequent type.
	
SELECT type, COUNT(card_id) as total_card FROM bank.card
GROUP BY type
ORDER BY total_card desc;

#15) Using the loan table, print the top 10 account_ids based on the sum of all of their
# loan amounts.

SELECT account_id, sum(amount) as total_amount FROM bank.loan
GROUP BY account_id
ORDER BY total_amount desc
LIMIT 10;

#16) In the loan table, retrieve the number of loans issued for each day, 
#before (excl) 930907, ordered by date in descending order.

SELECT distinct date, COUNT(loan_id) as number_loans_date FROM bank.loan
WHERE date < 930907
GROUP BY date
ORDER BY date desc;

#17) In the loan table, for each day in December 1997, count the number of loans issued 
#for each unique loan duration, ordered by date and duration, both in ascending order. 
#You can ignore days without any loans in your output. 971200 

SELECT distinct duration, COUNT(loan_id) as number_loans_dec FROM bank.loan
WHERE date > 971200 and date < 971232
GROUP BY duration
ORDER BY date desc;

#18) In the trans table, for account_id 396, sum the amount of transactions for each type 
#(VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, 
#the type and the sum of amount, named as total_amount. Sort alphabetically by type.

SELECT type, sum(amount) as total_amount FROM bank.trans
WHERE account_id = 396
GROUP BY type
ORDER BY type asc;

#19) From the previous output, translate the values for type to English, rename the column 
#to transaction_type, round total_amount down to an integer

select account_id,sum(amount), 
case WHEN type='VYDAJ' THEN 'Outgoing'
WHEN type='PRIJEM' THEN ' Incoming' END as new_type from bank.trans
where account_id=396
group by type;

#20) From the previous result, modify your query so that it returns only one row, 
#with a column for incoming amount, outgoing amount and the difference.

SELECT account_id, new_type AS Incoming FROM bank.trans
WHERE account_id=396 and new_type = "Incoming";


