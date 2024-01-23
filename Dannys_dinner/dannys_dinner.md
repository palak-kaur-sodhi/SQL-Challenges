# Case Study 1: Danny's Dinner
<img width="500" height="520" alt="Image" src="https://github.com/palak-kaur-sodhi/SQL-Challenges/assets/128562893/1b316671-b29a-4d06-8086-720973a93443">

## Introduction:
This case study is about a restuarant which includes data about the menu, customers visiting to the restaurant and items they ordered.<a href="https://8weeksqlchallenge.com/case-study-1/"> Find more details here </a>

## Objective:
We are expected to answer various questions that may help the owner to run the business successfully by providing him useful insights.
<br><br><b> Case study questions: </b> 
1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

## Dataset and ER Diagram:
Three tables have been given: Sales, Menu and Members. check <a href="https://github.com/palak-kaur-sodhi/SQL-Challenges/blob/main/Dannys_dinner/create_dannys_dinner.sql"> Dannys Dinner Data </a> to explore more about data.
<br><b> ER Diagram for the dataset: </b>
<br><img width="450" height="300" alt="ER_dannys_dinner" src="https://github.com/palak-kaur-sodhi/SQL-Challenges/assets/128562893/f369755f-1a42-49b2-b74b-175372c9f91d">


## Results and Output:
Check <a href="https://github.com/palak-kaur-sodhi/SQL-Challenges/blob/main/Dannys_dinner/dannys_dinner.sql"> Dannys Dinner Solutions </a> to see SQL queries.
<br><br><b> Result: </b>
1. Total amount spent by customers - A: $76; B: $74; C: $36
2. No. of days customers visited - A: 4 days; B: 6 days, C: 2 days
3. First item purchased from the menu - A: curry & sushi; B: curry; C: ramen
4. Most purchased item - Ramen: 8 times
5. Most popular item for each customer - A: ramen: 3 times; B: curry, ramen, sushi: 2 times; C: ramen: 3 times
6. First item purchased after becoming member - A: curry; B: sushi
7. Last item purchased before becoming member - A: sushi; curry; B: sushi
8. Total items purchased and amount spent before becoming member - A: 2: $25; B: 3: $40
9. Total points each customer have - A: 860 points; B: 940 points; C: 360 points
