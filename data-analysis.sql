###	6‐92a. 	List the agreement number, agreement date, and gross amount for each agreement that has a gross
###				amount greater than or equal to $1,500 and less than or equal to $2,000.
SELECT AgreementNbr, AgreementDate, GrossAmount
FROM AGREEMENT_T
WHERE GrossAmount >= 1500 and GrossAmount <= 2000;
### NULL???

###	6‐92b.	 Provide a list of those customers (include their ID and name) the name of which includes the word
###				“Arts”
SELECT CustomerID, CustomerName
FROM CUSTOMER_T
WHERE CustomerName like "%Arts%";


###	6‐92c. List the artist ID, last name, first name, year of birth, and artist type for all female artists who live
###	either in Pennsylvania or New Jersey.
SELECT ArtistID, LastName, FirstName, YearOfBirth, State
FROM ARTIST_T
WHERE Gender = 'F' and (State ='PA' or State = 'NJ');

###	6‐92d. List the artist ID, start date, end date, and royalty percentage for all currently valid contracts that
###	have a royalty percentage greater than 20%. Sort the list in the ascending order by artist ID.
SELECT ArtistID, StartDate, EndDate, RoyaltyPerc
FROM CONTRACT_T
WHERE EndDate > CURDATE() and RoyaltyPerc > 20
ORDER BY ArtistID;


###	6‐92e. What is the total amount of those customer payments that were made in either February 2015 or
###	March 2015?


SELECT SUM(Amount) as 'Total Payment'
FROM CUSTOMERPAYMENT_T
WHERE  CPaymentDate >= '2015-02-01' and CPaymentDate <= '2015-03-31';

### 6‐92f. List the IDs of those artists that were paid at least $2000 during the first three months of 2015.
SELECT ArtistID, Amount as 'Total Payment'
FROM ARTISTPAYMENT_T
WHERE APaymentDate >='2015-01-01' and APaymentDate < '2015-04-01' and Amount >= 2000
GROUP BY ArtistID;

### 6‐92g. List the number of events organized at each of the venues (for those included in the Event table).
SELECT VenueID, Count(EventID) as 'Number of Event'
FROM EVENT_T
GROUP BY VenueID;

###	6‐92h. Modify the previous query so that you include only those venues at which at least two events have
###	been organized

SELECT VenueID, Count(EventID) as 'Number of Event'
FROM EVENT_T
GROUP BY VenueID
Having Count(EventID)>=2;

###	6‐92i. List the ID, description, amount, and expense type for all manager expense items the amount of
###	which is less than $100 and for all artist expense items the amount of which is less than $50.


SELECT GE.ExpenseID, Description, Amount, ExpenseType
FROM EXPENSE_T  GE RIGHT JOIN ARTISTMGREXPENSE_T  AME ON GE.ExpenseID =AME.ExpenseID
WHERE Amount <100
UNION
SELECT GE.ExpenseID, Description, Amount, ExpenseType
FROM EXPENSE_T  GE RIGHT JOIN ARTISTEXPENSE_T  AE ON GE.ExpenseID =AE.ExpenseID
WHERE Amount <50;

# Answer 2

SELECT ExpenseID, Description, Amount, ExpenseType
FROM EXPENSE_T
WHERE (ExpenseType = 'M' and Amount<100) or (ExpenseType='A' and Amount <50)

