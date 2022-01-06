SELECT PersonType, FirstName, LastName, EmailPromotion FROM Person.Person

/*
WHERE EmailPromotion=0 or EmailPromotion=2 and PersonType='EM'
-just bring emailpromotion equals zero or two.
-you cannot use here "and".
-also you can use ">=1"
-also called "EM"
*/


/*
WHERE PersonType!='SC' and FirstName='Eric' (that was a question)
<> : is not equal (!= yerine bunu kullan)
*/

/*
WHERE BusinessEntityID Between 2000 and 5000
(do not use operator when you looking for interspaces (belirli aralık))
*/

/*
WHERE Firstname Between 'Berntrandt' and 'Denis'
(that brings names alphabetically)
*/

/*
WHERE Firstname <= 'Denis'
(that brings names alphabetically)
*/

/*
WHERE PersonType='EM' and Firstname Between 'Berntrandt' and 'Denis'
(both conditions can be applied)
*/

/*
WHERE PersonType='EM' and (Firstname Between 'Berntrandt' and 'Denis' or EmailPromotion=0)
in here, paranthesis are important. that makes orders.
*/

/*
WHERE MiddleName IS NULL
middlename is null.
*/

/*
WHERE MiddleName IS NULL and FirstName>'Kylie'
middlename is null, and greater than Kylie
*/

/*
WHERE MiddleName IS NOT NULL
persons that have least middlename.
*/

/*
WHERE MiddleName IS NOT NULL and Title IS NOT NULL and Suffix IS NOT NULL
more examples..
*/

/*
WHERE FirstName LIKE 'A%'
Lists the names who starts with A.
*/

/*
WHERE FirstName LIKE '%A%'
All the names that contains A.
*/

/*
WHERE FirstName LIKE '%A'
Tha names that contains A as last letter.
*/

/*
WHERE FirstName LIKE 'B%N'
starts with B and ends with N
*/

/*
WHERE FirstName LIKE 'A__A'
contains 4 letter and starts & ends with A. It contains EXACTLY 4 character.

alternative version :
WHERE FirstName LIKE 'A%A' and len(FirstName)=4
*/

/*
WHERE FirstName LIKE 'A%_'
starts with A and contains at least 2 characters. It can be 2 or higher.
*/

/*
WHERE FirstName LIKE 'A%__%'
starts with A and contains at least 3 characters.
*/

/*
WHERE FirstName IN ('John', 'Jim', 'James')
finds that 3 names and brings it. filtering..

its equal: WHERE Fname='John' or Fname='Jim'..
*/

/*
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM person.personphone WHERE PhoneNumberTypeID=1)
kind of a filter

alternative :
SELECT BusinessEntityID  FROM person.PersonPhone
WHERE PhoneNumberTypeID = 1
*/

/*
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM person.personphone WHERE PhoneNumberTypeID=1
and EmailPromotion>=1)

its advanced filter question.
*/