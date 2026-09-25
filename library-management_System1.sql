CREATE DATABASE library_managementSystem;

USE library_managementSystem;
CREATE TABLE Book_publisher (
    PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
    PublisherAddress VARCHAR(200) NOT NULL,
    PublisherPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book (
    BookID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    bookTitle VARCHAR(100) NOT NULL,
    book_PublisherName VARCHAR(100) NOT NULL,

    CONSTRAINT fk_publisher_name1
    FOREIGN KEY (book_PublisherName)
    REFERENCES Book_publisher(PublisherName)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
CREATE TABLE Library_branch (
    library_BranchID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    library_BranchName VARCHAR(100) NOT NULL,
    library_BranchAddress VARCHAR(200) NOT NULL
);
CREATE TABLE tbl_borrower (
    borrower_CardNo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    BorrowerName VARCHAR(100) NOT NULL,
    BorrowerAddress VARCHAR(200) NOT NULL,
    BorrowerPhone VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    book_loans_BookID INT NOT NULL,

    book_loans_BranchID INT NOT NULL,

    book_loans_CardNo INT NOT NULL,

    book_loans_DateOut VARCHAR(50) NOT NULL,

    book_loans_DueDate VARCHAR(50) NOT NULL,

    CONSTRAINT fk_book_id1
    FOREIGN KEY (book_loans_BookID)
    REFERENCES tbl_book(BookID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_branch_id1
    FOREIGN KEY (book_loans_BranchID)
    REFERENCES Library_branch(library_BranchID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_cardno
    FOREIGN KEY (book_loans_CardNo)
    REFERENCES tbl_borrower(borrower_CardNo)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
CREATE TABLE Book_copies (
    book_CopiesID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    book_copies_BookID INT NOT NULL,

    book_copies_BranchID INT NOT NULL,

    book_copies_No_Of_Copies INT NOT NULL,

    CONSTRAINT fk_book_id2
    FOREIGN KEY (book_copies_BookID)
    REFERENCES tbl_book(BookID)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

    CONSTRAINT fk_branch_id2
    FOREIGN KEY (book_copies_BranchID)
    REFERENCES Library_branch(library_BranchID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
CREATE TABLE Book_authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    Authors_BookID INT NOT NULL,

    AuthorName VARCHAR(100) NOT NULL,

    CONSTRAINT fk_book_id3
    FOREIGN KEY (Authors_BookID)
    REFERENCES tbl_book(BookID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
INSERT INTO Book_publisher VALUES
('Penguin Random House India',
'7th Floor, Infinity Tower C, DLF Cyber City, Gurgaon',
'+91-11-46511222'),

('HarperCollins Publishers India',
'Infinity Tower C, DLF Cyber City, Gurgaon',
'+91-11-40698888'),

('Hachette India',
'Sector 44, Gurgaon, Haryana',
'+91-124-4195000'),

('Rupa Publications',
'Ansari Road, Daryaganj, New Delhi',
'+91-11-23253400'),

('Oxford University Press India',
'Jai Singh Road, New Delhi',
'+91-11-23747100'),

('Orient Blackswan',
'Begumpet, Hyderabad',
'+91-40-27638197'),

('Aleph Book Company',
'Panchsheel Park, New Delhi',
'+91-11-46018200'),

('Cambridge University Press India',
'Ansari Road, Daryaganj, New Delhi',
'+91-11-43543500'),

('Macmillan Education India',
'Sector 2, Noida',
'+91-120-4000100'),

('Academic Foundation',
'Ansari Road, New Delhi',
'+91-11-23245001'),

('New Century Publications',
'Ansari Road, New Delhi',
'+91-11-23272500'),

('Deep & Deep Publications',
'Rajouri Garden, New Delhi',
'+91-11-25435369');
SELECT *
FROM tbl_book
WHERE book_PublisherName = 'Orient Blackswan';
INSERT INTO Library_branch
(library_BranchName, library_BranchAddress)
VALUES
('Dr. B.R. Ambedkar Library',
'Near Andhra University Campus, Visakhapatnam'),

('District Central Library',
'Near Brodipet, Guntur'),

('Nellore District Library',
'Pogathota, Nellore'),

('Renigunta Branch Library',
'Near Railway Station Road, Renigunta');

INSERT INTO tbl_borrower
(BorrowerName, BorrowerAddress, BorrowerPhone)
VALUES
('Satheesh', 'Nellore, AP', '212-312-1234'),
('Murali', 'Visakhapatnam, AP', '212-931-4124'),
('Chandra Prasad', 'Srikalahasti, AP', '734-902-7455'),
('Venkatesh', 'Allur, Nellore, AP', '313-591-2122'),
('Harsha Vardhan', 'Hindupur, AP', '412-512-5522'),
('Sunil', 'Chikballapur, Karnataka', '212-631-3418'),
('Anush', 'Nellore, AP', '212-419-9935'),
('Dirosh', 'Nellore, AP', '734-998-1513'),
('Sukumar', 'Nellore, AP', '890-765-432');

SELECT
    b.BookID,
    b.bookTitle,
    b.book_PublisherName
FROM tbl_book b;
SELECT
    b.BookID,
    b.bookTitle,
    a.AuthorName
FROM tbl_book b
JOIN Book_authors a
ON b.BookID = a.Authors_BookID;
SELECT
    b.bookTitle,
    lb.library_BranchName,
    bc.book_copies_No_Of_Copies
FROM Book_copies bc
JOIN tbl_book b
ON bc.book_copies_BookID = b.BookID
JOIN Library_branch lb
ON bc.book_copies_BranchID = lb.library_BranchID;

SELECT
    b.bookTitle,
    br.BorrowerName,
    lb.library_BranchName,
    bl.book_loans_DateOut,
    bl.book_loans_DueDate
FROM tbl_book_loans bl
JOIN tbl_book b
ON bl.book_loans_BookID = b.BookID
JOIN tbl_borrower br
ON bl.book_loans_CardNo = br.borrower_CardNo
JOIN Library_branch lb
ON bl.book_loans_BranchID = lb.library_BranchID;
SELECT
    b.bookTitle,
    bc.book_copies_No_Of_Copies
FROM Book_copies bc
JOIN tbl_book b
ON bc.book_copies_BookID = b.BookID
JOIN Library_branch lb
ON bc.book_copies_BranchID = lb.library_BranchID
WHERE lb.library_BranchName = 'Nellore District Library';
SELECT
    b.bookTitle,
    bc.book_copies_No_Of_Copies
FROM Book_copies bc
JOIN tbl_book b
ON bc.book_copies_BookID = b.BookID
WHERE bc.book_copies_No_Of_Copies < 5;
SHOW TABLES;
SELECT * FROM Book_authors;
DESCRIBE Book_publisher;
SELECT * FROM Library_branch;
SELECT * FROM tbl_borrower;
SELECT * FROM Book_publisher;
SELECT * FROM tbl_book;
SELECT * FROM tbl_book_loans;
SELECT * FROM Book_copies;
SELECT * FROM Library_branch;
INSERT INTO tbl_book
(bookTitle, book_PublisherName)
VALUES
('Introduction to SQL', 'Academic Foundation');
SELECT * FROM tbl_book;
SELECT *
FROM tbl_book
WHERE BookID = 1;
UPDATE tbl_book SET bookTitle = 'Advanced SQL' WHERE BookID = 25;
SELECT *FROM tbl_book WHERE BookID = 25;
DELETE FROM tbl_book WHERE BookID = 25;
SELECT * FROM tbl_book;
CREATE VIEW book_details AS
SELECT
    b.BookID,
    b.bookTitle,
    b.book_PublisherName,
    a.AuthorName
FROM tbl_book b
LEFT JOIN Book_authors a
ON b.BookID = a.Authors_BookID;
SELECT * FROM book_details;
CREATE VIEW loan_details AS
SELECT
    bl.book_loans_LoansID,
    b.bookTitle,
    br.BorrowerName,
    lb.library_BranchName,
    bl.book_loans_DateOut,
    bl.book_loans_DueDate
FROM tbl_book_loans bl
JOIN tbl_book b
ON bl.book_loans_BookID = b.BookID
JOIN tbl_borrower br
ON bl.book_loans_CardNo = br.borrower_CardNo
JOIN Library_branch lb
ON bl.book_loans_BranchID = lb.library_BranchID;
SELECT * FROM loan_details;

SELECT COUNT(*) AS Total_Books FROM tbl_book;

SELECT COUNT(*) AS Total_Borrowers
FROM tbl_borrower;

SELECT COUNT(*) AS Total_Branches
FROM Library_branch;

SELECT COUNT(*) AS Total_Loans
FROM tbl_book_loans;