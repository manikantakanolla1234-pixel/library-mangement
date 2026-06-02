create  database library_managementSystem;

use library_managementSystem;

	CREATE TABLE Book_publisher (
		PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		PublisherAddress VARCHAR(200) NOT NULL,
		PublisherPhone VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_book (
		BookID INT auto_increment PRIMARY KEY NOT NULL ,
		bookTitle VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL ,CONSTRAINT fk_publisher_name1 FOREIGN KEY(book_PublisherName ) REFERENCES Book_publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE Library_branch (
		library_BranchID INT Auto_increment PRIMARY KEY NOT NULL ,
		library_BranchName VARCHAR(100) NOT NULL,
		library_BranchAddress VARCHAR(200) NOT NULL
	);

	SELECT * FROM Library_branch;

	CREATE TABLE tbl_borrower (
		borrower_CardNo INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
		BorrowerName VARCHAR(100) NOT NULL,
	    BorrowerAddress VARCHAR(200) NOT NULL,
		BorrowerPhone VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_borrower;

	CREATE TABLE tbl_book_loans (
		book_loans_LoansID INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
		book_loans_BookID INT NOT NULL, CONSTRAINT fk_book_id1 FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_BranchID INT NOT NULL, CONSTRAINT fk_branch_id1 FOREIGN KEY (book_loans_BranchID)REFERENCES library_branch(library_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_CardNo INT NOT NULL, CONSTRAINT fk_cardno FOREIGN KEY (book_loans_CardNo)REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_DateOut VARCHAR(50) NOT NULL,
		book_loans_DueDate VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_book_loans;	 
	CREATE TABLE Book_copies (
		book_CopiesID INT auto_increment PRIMARY KEY NOT NULL ,
		book_copies_BookID INT NOT NULL, CONSTRAINT fk_book_id2 FOREIGN KEY(book_copies_BookID) REFERENCES tbl_book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_BranchID INT NOT NULL, CONSTRAINT fk_branch_id2 FOREIGN KEY(book_copies_BranchID) REFERENCES library_branch(library_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_No_Of_Copies INT NOT NULL
	);

	SELECT * FROM Book_copies;

	CREATE TABLE Book_authors (
		AuthorID INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
		Authors_BookID INT NOT NULL, CONSTRAINT fk_book_id3 FOREIGN KEY (Authors_BookID)REFERENCES tbl_book(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	);

	SELECT * FROM Book_authors;
	INSERT INTO book_publisher VALUES
		('Penguin Random House India','7th Floor, Infinity Tower C, DLF Cyber City, Phase II, Gurgaon – 122002, Haryana','+91-11-46511222'),
		('HarperCollins Publishers India','HarperCollins Publishers India Ltd, 7th Floor, Infinity Tower C, DLF Cyber City, Phase II, Gurgaon – 122002, Haryana','+91-11-40698888'),
		('Hachette India','Sector 44, Gurgaon, Haryana','+91-124-4195000'),
		('Rupa Publications','Ansari Road, Daryaganj, New Delhi','+91-11-23253400'),
		('Oxford University Press India','YMCA Library Building, Jai Singh Road, New Delhi 110001','+91-11-23747100'),
		('Orient Blackswan','1–8–303/34, Begumpet, Hyderabad – 500016, Telangana','+91-40-27638197'),		
		('Aleph Book Company','Panchsheel Park, New Delhi','+91-11-46018200'),
		('Cambridge University Press India','4381/4B, Ansari Road, Daryaganj, New Delhi 110002','+91-11-43543500'),
		('Macmillan Education India','D-90, Sector 2, Noida – 201301, Uttar Pradesh	','+91-120-4000100'),
		('Academic Foundation','4772/23 Bharat Ram Road, Ansari Road, Daryaganj, New Delhi 110002','+91-11-23245001'),
		('New Century Publications','4735/23, Ansari Road, Daryaganj, New Delhi 110002','+91-11-23272500'),
		('Deep & Deep Publications','F-159, Rajouri Garden, New Delhi 110027','+91-11-25435369');
	SELECT * FROM book_publisher;

	INSERT INTO tbl_book (bookTitle, book_PublisherName)VALUES 
		('Economic Reforms in India 1991–2001', 'Academic Foundation'),
		('Sacred Games', 'Penguin Random House India'),
		('Let’s Talk Money ', 'HarperCollins Publishers India'),
        ('Applied Econometric Analysis Using Cross Section and Panel Data', 'Deep & Deep Publications'),
		('My Country My Life', 'Rupa Publications'),
		('The Girl on the Train ', 'Hachette India'),
		('Development as Freedom ', 'Oxford University Press India'),
		('Unbound: 2000 Years of Indian Women’s Writing', 'Aleph Book Company'),
		('Cambridge Economic History of India', 'Cambridge University Press India'),
		('Percy Jackson series', 'Hachette India'),
        ('Environmental Economics', 'New Century Publications'),
		('Frank Social Studies textbooks', 'Macmillan Education India'),
		('Atlas for Competitive Exams', 'Orient Blackswan'),
		('Atomic Habits', 'Penguin Random House India'),
		('Changing India (multi-volume)', 'Academic Foundation'),
		('Cambridge International AS & A Level Economics Coursebook', 'Cambridge University Press India'),
		('Chinese Strategies for Rapid Economic Growth', 'Deep & Deep Publications'),
		('Gulmohar Readers (school series)', 'Orient Blackswan'),
		('Jeet Aapki ', 'Macmillan Education India'),
        ('Song of Draupadi', 'Aleph Book Company'),
		('Indian Economy: Performance and Policies', 'Oxford University Press India'),
		('Five Point Someone ', 'Rupa Publications'),
        ('International Trade and Economic Development titles', 'New Century Publications'),
		('HarperCollins Publishers India', 'HarperCollins Publishers India');
select *from tbl_book;
	SELECT * FROM tbl_book WHERE book_PublisherName = 'Orient Blackswan';
	INSERT INTO library_branch (library_BranchName, library_BranchAddress)VALUES
		('Dr. B.R. Ambedkar Library','Near Andhra University Campus, Visakhapatnam – 530003'),
		('District Central Library','Near Brodipet, Guntur – 522002'),
		('Nellore District Library','Pogathota, Nellore – 524001'),
		('Renigunta Branch Library','Near Railway Station Road, Renigunta – 517520');

	/*UPDATE library_branch
	SET library_BranchName = 'District Central Library'
	WHERE library_BranchID = 2;*/
	
	SELECT * FROM library_branch;

	INSERT INTO tbl_borrower(BorrowerName, BorrowerAddress,BorrowerPhone)VALUES
		('satheesh','nellore,Ap','212-312-1234'),
		('murali','vishakapatanam,Ap','212-931-4124'),
		('Chandra prasad','Sri kalahastri,Ap','734-902-7455'),
		('Venkatesh','Allur,Nellore,Ap','313-591-2122'),
		('harsha vardhan ','Hindupur,Ap','412-512-5522'),
		('Sunil','chikballapur,karnataka','212-631-3418'),
		('Anush','Nellore,Ap','212-419-9935'),
		('Dirosh','nellore,Ap','734-998-1513'),
        ('Sukumar','Nellore,Ap','890-765-432');
	
	SELECT * FROM tbl_borrower;

	INSERT INTO tbl_book_loans(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
		('1','1','1','1/1/26','2/2/26'),
		('2','1','2','1/1/26','2/2/26'),
		('3','1','1','1/1/26','2/2/26'),
		('4','1','3','1/1/26','2/2/26'),
		('5','1','5','1/3/26','2/4/26'),
		('6','1','9','1/3/26','2/4/26'),
		('7','1','8','1/3/26','2/4/26'),
		('8','1','4','1/3/26','2/4/26'),
		('9','1','6','1/3/26','2/4/26'),
		('11','1','7','1/3/26','2/4/26'),
		('12','2','5','12/12/25','13/1/26'),
		('10','2','9','12/12/25','13/1/26'),
		('20','2','5','2/3/26','3/4/26'),
		('18','2','5','1/5/26','2/6/26'),
		('19','2','5','1/5/26','2/6/26'),
		('19','2','1','1/3/26','2/4/26'),
		('11','2','6','1/7/26','2/8/26'),
		('1','2','6','1/7/26','2/8/26'),
		('2','2','7','1/7/26','2/8/26'),
		('3','2','8','1/7/26','2/8/26'),
		('5','2','5','12/12/26','13/1/26'),
		('4','3','3','1/9/26','2/10/26'),
		('7','3','2','1/3/26','2/4/26'),
		('17','3','2','1/3/26','2/4/26'),
		('16','3','4','1/3/26','2/4/26'),
		('15','3','4','1/3/26','2/4/26'),
		('15','3','7','1/3/26','2/4/26'),
		('14','3','4','1/3/26','2/4/26'),
		('13','3','7','1/3/26','2/4/26'),
		('13','3','2','1/3/26','2/4/26'),
		('19','3','2','12/12/25','13/1/26'),
		('20','4','3','1/3/26','2/4/26'),
		('1','4','2','1/12/26','2/1/26'),
		('3','4','7','1/3/26','2/4/26'),
		('18','4','7','1/3/26','2/4/26'),
		('12','4','2','1/4/26','2/5/26'),
		('11','4','3','1/5/26','2/6/26'),
		('9','4','3','1/5/26','2/6/26'),
		('7','4','7','1/1/26','2/2/26'),
		('4','4','3','1/1/26','2/2/26'),
		('1','4','3','2/2/26','3/3/26'),
		('20','4','3','1/3/26','2/4/26'),
		('1','4','2','1/2/26','2/3/26'),
		('3','4','7','1/3/26','2/4/26'),
		('18','4','7','1/3/26','2/4/26'),
		('12','4','2','1/4/26','2/5/26'),
		('11','4','3','1/5/26','2/6/26'),
		('9','4','3','1/5/26','2/6/26'),
		('7','4','7','19/1/26','2/2/26'),
		('4','4','3','1/1/26','2/2/26'),
		('1','4','3','1/2/26','2/3/26');

		
	SELECT * FROM tbl_book_loans;

	INSERT INTO book_copies(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
		('1','1','5'),
		('2','1','6'),
		('3','1','7'),
		('4','1','5'),
		('5','1','29'),
		('6','1','30'),
		('7','1','5'),
		('8','1','4'),
		('9','1','5'),
		('10','1','8'),
		('11','1','1'),
		('12','1','2'),
		('13','1','3'),
		('14','1','4'),
		('15','1','6'),
		('16','1','7'),
		('17','1','9'),
		('18','1','10'),
		('19','1','9'),
		('20','1','8'),
		('1','2','7'),
		('2','2','6'),
		('3','2','5'),
		('4','2','4'),
		('5','2','3'),
		('6','2','2'),
		('7','2','1'),
		('8','2','29'),
		('9','2','28'),
		('10','2','27'),
		('11','2','26'),
		('12','2','5'),
		('13','2','25'),
		('14','2','24'),
		('15','2','5'),
		('16','2','23'),
		('17','2','22'),
		('18','2','21'),
		('19','2','20'),
		('20','2','16'),
		('1','3','19'),
		('2','3','18'),
		('3','3','17'),
		('4','3','15'),
		('5','3','5'),
		('6','3','14'),
		('7','3','5'),
		('8','3','13'),
		('9','3','12'),
		('10','3','5'),
		('11','3','11'),
		('12','3','10'),
		('13','3','5'),
		('14','3','60'),
		('15','3','51'),
		('16','3','56'),
		('17','3','54'),
		('18','3','53'),
		('19','3','52'),
		('20','3','51'),
		('1','4','5'),
		('2','4','45'),
		('3','4','46'),
		('4','4','29'),
		('5','4','44'),
		('6','4','48'),
		('7','4','45'),
		('8','4','40'),
		('9','4','39'),
		('10','4','38'),
		('11','4','37'),
		('12','4','36'),
		('13','4','35'),
		('14','4','32'),
		('15','4','30'),
		('16','4','5'),
		('17','4','45'),
		('18','4','55'),
		('19','4','55'),
		('20','4','65');

	SELECT * FROM book_copies;
 INSERT INTO book_authors(Authors_BookID,AuthorName)VALUES
		('1','Vijay Joshi, Ian Malcolm David Little'),
		('2','Vikram Chandra'),
        ('3',' Monika Halan'),
		('4','Dr. P. K. Mishra'),
		('5','L. K. Advani'),
		('6','Paula Hawkins'),
		('7','Amartya Sen'),
		('8','Annie Zaidi'),
		('9','Tapan Raychaudhuri, Irfan Habib'),
		('10','Rick Riordan'),
		('11','Dr. N. Mani'),
		('12','Annie Mathew'),
		('13','Orient Blackswan'),
		('14','James Clear'),
		('15','Manmohan Singh'),
		('16','Colin Bamford, Susan Grant'),
		('17','Gagan Deep Ahuja'),
		('18','M. L. Tickoo'),
		('19','Shiv Khera'),
		('20','Ira Mukhoty'),
        ('21','Uma Kapila'),
        ('22','Chetan Bhagat'),
        ('23','Various authors'),
        ('24','not available');

	SELECT * FROM book_authors;

/* #1- How many copies of the book titled "My Country My Life" are owned by the library branch whose name is "Dr. B.R. Ambedkar Library"? */

DELIMITER $$

CREATE PROCEDURE bookCopiesAtAmbedkarLibrary (
    IN bookTitle VARCHAR(70),
    IN branchName VARCHAR(70)
)
BEGIN
    SELECT copies.book_copies_BranchID AS BranchID,
           branch.library_BranchName AS BranchName,
           copies.book_copies_No_Of_Copies AS NumberOfCopies,
           book.bookTitle AS BookTitle
    FROM book_copies AS copies
    INNER JOIN tbl_book AS book 
        ON copies.book_copies_BookID = book.BookID
    INNER JOIN library_branch AS branch 
        ON copies.book_copies_BranchID = branch.library_BranchID
    WHERE book.bookTitle = BookTitle 
      AND branch.library_BranchName = branchName;
END$$

DELIMITER ;

SHOW PROCEDURE STATUS LIKE 'bookCopiesAtAmbedkarLibrary';
CALL bookCopiesAtAmbedkarLibrary('My Country My Life', 'Dr. B.R. Ambedkar Library');


/* #2- How many copies of the book titled "Atomic Habits" are owned by each library branch? */
DROP PROCEDURE IF EXISTS bookCopiesAtAllBranches;

DELIMITER $$
CREATE PROCEDURE bookCopiesAtAllBranches (
    IN bookTitle VARCHAR(70)
)
BEGIN
    SELECT copies.book_copies_BranchID AS BranchID,
           branch.library_BranchName AS BranchName,
           copies.book_copies_No_Of_Copies AS NumberOfCopies,
           book.bookTitle AS BookTitle
    FROM book_copies AS copies
    INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.BookID
    INNER JOIN library_branch AS branch ON copies.book_copies_BranchID = branch.library_BranchID
    WHERE book.bookTitle = BookTitle;
END$$
DELIMITER ;
CALL bookCopiesAtAllBranches('Atomic Habits');
/* #3- Retrieve the names of all borrowers who do not have any books checked out. */
		drop procedure if exists noloans;
DELIMITER $$
CREATE PROCEDURE NoLoans ()
BEGIN
    SELECT BorrowerName
    FROM tbl_borrower
    WHERE NOT EXISTS (
        SELECT * FROM tbl_book_loans
        WHERE book_loans_CardNo = borrower_CardNo
    );
END$$

DELIMITER ;

CALL NoLoans();


/* #4- For each book that is loaned out from the "Nellore District Library" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.  */
drop procedure if exists LoanersInfo;
DELIMITER $$

CREATE PROCEDURE LoanersInfo (
    IN LibraryBranchName VARCHAR(50)
)
BEGIN
    SELECT Branch.library_BranchName AS BranchName,
           Book.bookTitle AS BookName,
           Borrower.BorrowerName AS BorroweerName,
           Borrower.BorrowerAddress AS BorroweerAddress,
           Loans.book_loans_DateOut AS DateOut,
           Loans.book_loans_DueDate AS DueDate
    FROM tbl_book_loans AS Loans
    INNER JOIN tbl_book AS Book ON Loans.book_loans_BookID = Book.BookID
    INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
    INNER JOIN library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_BranchID
    WHERE Loans.book_loans_DueDate = CURDATE()
      AND Branch.library_BranchName = LibraryBranchName;
END$$

DELIMITER ;

CALL LoanersInfo('Nellore District Library');


/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */
DROP PROCEDURE IF EXISTS TotalLoansPerBranch;

DELIMITER $$

CREATE PROCEDURE TotalLoansPerBranch()
BEGIN
    SELECT branch.library_BranchID AS BranchID,
           branch.library_BranchName AS BranchName,
           COUNT(loans.book_loans_BookID) AS TotalLoans
    FROM tbl_book_loans AS loans
    INNER JOIN book_copies AS copies
        ON loans.book_loans_BookID = copies.book_copies_BookID
    INNER JOIN library_branch AS branch
        ON copies.book_copies_BranchID = branch.library_BranchID
    GROUP BY branch.library_BranchID, branch.library_BranchName;
END$$

DELIMITER ;


CALL TotalLoansPerBranch();


/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */
drop procedure if exists BooksLoanedOut;
DELIMITER $$

CREATE PROCEDURE BooksLoanedOut (
    IN BooksCheckedOut INT
)
BEGIN
    SELECT Borrower.BorrowerName AS BorroweerName,
           Borrower.BorrowerAddress AS BorroweerAddress,
           COUNT(*) AS BooksCheckedOut
    FROM tbl_book_loans AS Loans
    INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
    GROUP BY Borrower.BorrowerName, Borrower.BorrowerAddress
    HAVING COUNT(*) >= BooksCheckedOut;
END$$

DELIMITER ;

CALL BooksLoanedOut(5);
/* #7- For each book authored by "Manmohan Singh", retrieve the title and the number of copies owned by the library branch whose name is "Renigunta Branch Library".*/
DROP PROCEDURE IF EXISTS BookbyAuthorandBranch;

DELIMITER $$

CREATE PROCEDURE BookbyAuthorandBranch (
    IN BranchName VARCHAR(50),
    IN AuthorName VARCHAR(50)
)
BEGIN
    SELECT Branch.library_BranchName AS BranchName,
           Book.bookTitle AS Title,
           Copies.book_copies_No_Of_Copies AS NumberOfCopies
    FROM book_authors AS Authors
    INNER JOIN tbl_book AS Book 
        ON Authors.Authors_BookID = Book.BookID
    INNER JOIN book_copies AS Copies 
        ON Authors.Authors_BookID = Copies.book_copies_BookID
    INNER JOIN library_branch AS Branch 
        ON Copies.book_copies_BranchID = Branch.library_BranchID
    WHERE Branch.library_BranchName = BranchName
      AND Authors.AuthorName = AuthorName;
END$$

DELIMITER ;

CALL BookbyAuthorandBranch('Renigunta Branch Library','Manmohan Singh');


