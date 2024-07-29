create database Assessment2


 
create table Subject
( 
subjectId int primary key,
subtitle varchar(20)
);
  
 
  
create table Book
(
  bookId int primary key,
  title varchar(20),
  price int,
  volume int,
  author varchar(20),
  publishDate Date,
  subjectId int foreign key references Subject(subjectId)
  );

  INSERT INTO Subject (subjectId, subtitle)
VALUES
    (1, 'Mathematics'),
    (2, 'Physics'),
    (3, 'Chemistry'),
    (4, 'Biology'),
    (5, 'Literature');

	INSERT INTO Book (bookId, title, price, volume, author, publishDate, subjectId)
VALUES
    (1, 'Calculus', 50, 1, 'sanjay', '2022-01-01', 1),
    (2, ' Algebra', 45, 1, 'harsha', '2021-06-15', 1),
    (3, 'Probability ', 55, 1, 'niketh', '2020-08-20', 1),
    (4, ' Mechanics', 60, 1, 'sai', '2019-03-10', 2),
    (5, ' machines', 52, 1, 'omp', '2018-07-25', 2),
    (6, 'Electromagnetism', 48, 1, 'ganesh', '2021-12-11', 2),
    (7, 'Organic Chemistry', 65, 1, 'aditya', '2022-05-05', 3),
    (8, 'Chemistry', 55, 1, 'sasya', '2000-10-17', 3),
    (9, 'Physics', 62, 1, 'laxmi', '2000-09-29', 3),
    (10, 'Biology', 70, 1, 'sridhar', '2022-02-18', 4),
    (11, 'Genetics', 58, 1, 'sudheer', '2021-04-21', 4),
    (12, 'Dragon', 66, 1, 'surendhar', '2020-11-30', 4),
    (13, 'house of Dragon', 40, 1, 'chaithanaya', '2018-01-01', 5),
    (14, 'game of thrones', 38, 1, 'adarash', '2019-05-23', 5),
    (15, 'Classical Literature', 45, 1, 'vasthav', '2021-08-13', 5);


select * from Book;
truncate table book;
--3. Write a query to retrieve the book and its subject details using inner join.
select b.*,s.* from subject s join Book b on b.subjectId=s.subjectId;

--4.  Write a query to retrieve the books list published in a given specific date interval
select b.title as BookTitles from book b where b.publishDate='2018-01-01';

-- 5.   Write a query to retrieve the number of books referred by each author
select author,count(bookId) as RefferedBooks from  book group by author;

--6. Write a query to retrieve the number of books referred by each subject
select s.subjectId,count(b.bookId) as RefferedBooks from Book b
join Subject s on b.subjectId=s.subjectId 
group by s.subjectId;

--7.Write a query to retrieve the number of books published by the year 2000

select Count(bookId) from book where year(publishDate)='2000';


--8. Write a query to update price and volume of a book using bookId.


update book set price=200,volume=3 where bookId=10;


--9.     Write a query to update price of English subject books 10%
update book set price=price*1.10 where subjectId in(select subjectId from Subject where subtitle='Physics');

--10.Write a query to delete a book using bookId
delete  from book where bookId=1;


--11.Write a query to retrieve books who’s price is >500 and subject is maths.

select * from book b join subject s on b.subjectId=s.subjectId where price>500 and s.subtitle='Maths';

--12. Write a query to retrieve the book and its subject details with ascending order of subject.
select * from book b join subject s on b.subjectId=s.subjectId order by s.subtitle;

--13.Write a query to retrieve the min price of book details.
select Min(price) from book;

--14.Write a query to retrieve the min price of the book details 
select Min(price) from book;

--15.Write a query to count the no of books of subject maths.
select count(*) from book b join subject s on b.subjectId=s.subjectId  where s.subtitle='maths';

--16.Write a query to display books of subject english, maths and science.
select * from book b join subject s on b.subjectId=s.subjectId where s.subtitle in('english', 'maths','science'); 

