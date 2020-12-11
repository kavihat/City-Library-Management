-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: MAY 06, 2019 at 05:27 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(007, 'Meghashyam Senapathi', 'meghashyamsenapathi004@gmail.com', 'megha', 'f925916e2754e5e03f75dd58a5733251', '2017-07-16 18:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `AuthorId` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`AuthorId`, `AuthorName`) VALUES
(1, 'RL STINE'),
(2, 'J K ROWLING'),
(3, 'STAN LEE'),
(4, 'STEPHEN KING'),
(5, 'GEORGE R R MARTIN'),
(6, 'WILLIAM SHAKESPHERE'),
(7, 'VYASA'),
(8, 'VALMIKI'),
(9, 'R D SHARMA'),
(10, 'H C VERMA');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `PubId` int(11) NOT NULL,
  `PubName` varchar(159) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`PubId`, `PubName`) VALUES
(1, 'SCHOLASTIC'),
(2, 'McGraw-Hill Education'),
(3, 'Wiley'),
(4, 'Macmillian'),
(5, 'Oxford'),
(6, 'Pearson'),
(7, 'Penguin Random'),
(8, 'Harper Collins'),
(9, 'Three Rivers Press'),
(10, 'Elsevier');

-- ----------------------------------------------------------

--
-- Table structure for table `editors`
--

CREATE TABLE `editors` (
  `EditorId` int(11) NOT NULL,
  `EditorName` varchar(159) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `editors`
--

INSERT INTO `editors` (`EditorId`, `EditorName`) VALUES
(1, 'Jason Epstein'),
(2, 'Bill Buford'),
(3, 'Jim Baen'),
(4, 'Donald A'),
(5, 'Robert B Silvers');

-- ----------------------------------------------------------

--
-- Table structure for table `guesteditors`
--

CREATE TABLE `guesteditors` (
  `GEditorId` int(11) NOT NULL,
  `GEditorName` varchar(159) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guesteditors`
--

INSERT INTO `guesteditors` (`GEditorId`, `GEditorName`) VALUES
(1, 'Dan Mallory'),
(2, 'Stephen Jones'),
(3, 'Martin H'),
(4, 'Lou Aronica'),
(5, 'Lester Ray');

-- ----------------------------------------------------------

--
-- Table structure for table `confeditors`
--

CREATE TABLE `confeditors` (
  `CEditorId` int(11) NOT NULL,
  `CEditorName` varchar(159) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `confeditors`
--

INSERT INTO `confeditors` (`CEditorId`, `CEditorName`) VALUES
(1, 'Dan Mallory'),
(2, 'Stephen Jones'),
(3, 'Martin H'),
(4, 'Lou Aronica'),
(5, 'Lester Ray');

-- ----------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `LibId` int(11) NOT NULL,
  `LibName` varchar(159) DEFAULT NULL,
  `Location` varchar(159) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`LibId`, `LibName`, `Location`) VALUES
(1, 'Martin Luther King Library', 'New York'),
(2, 'Van Houten Library', 'Newark'),
(3, 'Central King Library', 'Kearny'),
(4, 'JFK Library', 'Edison'),
(5, 'Kingsman Library', 'Jersey City');


-- -----------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `DocId` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `PubDate` DATE DEFAULT NULL,
  `PublisherId` int(11) DEFAULT NULL,
  `LibId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`DocId`, `Title`, `AuthorId`, `ISBNNumber`, `PubDate`, `PublisherId`, `LibId`) VALUES
(1, 'Goosebumps Part 1', 1, 1256, '2002-07-22', 1, 1),
(2, 'Harry Potter - The Sorcers Stone', 2, 12565, '2001-01-14', 5, 2),
(3, 'Stephen King Biography', 4, 12556, '2005-08-06', 3, 3),
(4, 'Spider Man ', 3, 12576, '2005-08-20', 8, 4),
(5, 'Song Of Ice and Fire', 5, 15256, '2018-07-19', 6, 5),
(6, 'Julius caesar', 6, 12526, '2002-09-22', 5, 1),
(7, 'MahaBharata', 7, 51256, '2018-08-2', 9, 2),
(8, 'Ramayana', 8, 61256, '2018-07-12', 9, 3),
(9, 'Integral Mathematics', 9, 91256, '2018-07-22', 4, 4),
(10, 'Physics', 10, 81256, '2018-05-18', 2, 5);


-- --------------------------------------------------------
--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `DocId` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `EditorId` int(11) DEFAULT NULL,
  `VolNo` int(11) DEFAULT NULL,
  `IssNo` int(11) DEFAULT NULL,
  `GEditorId` int(11) DEFAULT NULL,
  `PubDate` DATE DEFAULT NULL,
  `PublisherId` int(11) DEFAULT NULL,
  `LibId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`DocId`, `Title`, `EditorId`, `VolNo`, `IssNo`, `GEditorId`, `PubDate`, `PublisherId`, `LibId`) VALUES
(11, 'Elsevier - Neural Networks', 1, 1, 4, 1, '2002-07-22', 1, 1),
(12, 'IEEE - Machine Learning', 2, 12, 5, 2, '2001-01-14', 5, 2),
(13, 'Oxford University Press - Bioinformatics', 4, 56, 12, 3, '2005-08-06', 3, 3),
(14, 'Springer - Information Technology ', 3, 15, 2, 4, '2018-08-20', 8, 4),
(15, 'Microtome - Machine Learning', 5, 4, 8, 5, '2018-07-19', 6, 5);


-- --------------------------------------------------------


--
-- Table structure for table `proceedings`
--

CREATE TABLE `proceedings` (
  `DocId` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `CEditorId` int(11) DEFAULT NULL,
  `CLocation` varchar(255) DEFAULT NULL,
  `PubDate` DATE DEFAULT NULL,
  `PublisherId` int(11) DEFAULT NULL,
  `LibId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Proceedings`
--

INSERT INTO `proceedings` (`DocId`, `Title`, `CEditorId`, `CLocation`, `PubDate`, `PublisherId`, `LibId`) VALUES
(16, 'Elsevier', 1, 'Paris', '2018-07-22', 1, 1),
(17, 'IEEE', 2, 'Tokyo', '2018-01-14', 5, 2),
(18, 'Oxford University Press', 4, 'Mumbai', '2005-08-06', 3, 3),
(19, 'Springer', 3, 'London', '2005-08-20', 8, 4),
(20, 'Microtome', 5, 'Washington', '2018-07-19', 6, 5);


-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `DocId` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `PubDate` DATE DEFAULT NULL,
  `PublisherId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`DocId`, `Title`, `PubDate`, `PublisherId`) VALUES
(1, 'Goosebumps Part 1', '2002-07-22', 1),
(2, 'Harry Potter - The Sorcers Stone', '2001-01-14', 5),
(3, 'Stephen King Biography', '2005-08-06', 3),
(4, 'Spider Man ', '2005-08-20', 8),
(5, 'Song Of Ice and Fire', '2018-07-19', 6),
(6, 'Julius caesar', '2002-09-22', 5),
(7, 'MahaBharata', '2018-08-2', 9),
(8, 'Ramayana', '2018-07-12', 9),
(9, 'Integral Mathematics', '2018-07-22', 4),
(10, 'Physics', '2018-05-18', 2),
(11, 'Elsevier - Neural Networks', '2002-07-22', 1),
(12, 'IEEE - Machine Learning', '2001-01-14', 5),
(13, 'Oxford University Press - Bioinformatics', '2005-08-06', 3),
(14, 'Springer - Information Technology ', '2018-08-20', 8),
(15, 'Microtome - Machine Learning', '2018-07-19', 6),
(16, 'Elsevier', '2018-07-22', 1),
(17, 'IEEE', '2018-01-14', 5),
(18, 'Oxford University Press', '2005-08-06', 3),
(19, 'Springer', '2005-08-20', 8),
(20, 'Microtome', '2018-07-19', 6);



-- --------------------------------------------------------

--
-- Table structure for table `copies`
--

CREATE TABLE `copies` (
  `DocId` int(11) NOT NULL,
  `CopyNo` int(11) DEFAULT NULL,
  `LibId` int(11) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copies`
--

INSERT INTO `copies` (`DocId`, `CopyNo`, `LibId`, `Status`) VALUES
(1, 1, 1, 1),
(1, 2, 2, 1),
(1, 3, 3, 1),
(1, 4, 4, 1),
(1, 5, 5, 1),
(2, 1, 1, 1),
(2, 2, 2, 1),
(2, 3, 3, 1),
(2, 4, 4, 1),
(2, 5, 5, 1),
(3, 1, 1, 1),
(3, 2, 2, 1),
(3, 3, 3, 1),
(3, 4, 4, 1),
(3, 5, 5, 1),
(4, 1, 1, 1),
(4, 2, 2, 1),
(4, 3, 3, 1),
(4, 4, 4, 1),
(4, 5, 5, 1),
(5, 1, 1, 1),
(5, 2, 2, 1),
(5, 3, 3, 1),
(5, 4, 4, 1),
(5, 5, 5, 1),
(6, 1, 1, 1),
(6, 2, 2, 1),
(6, 3, 3, 1),
(6, 4, 4, 1),
(6, 5, 5, 1),
(7, 1, 1, 1),
(7, 2, 2, 1),
(7, 3, 3, 1),
(7, 4, 4, 1),
(7, 5, 5, 1),
(8, 1, 1, 1),
(8, 2, 2, 1),
(8, 3, 3, 1),
(8, 4, 4, 1),
(8, 5, 5, 1),
(9, 1, 1, 1),
(9, 2, 2, 1),
(9, 3, 3, 1),
(9, 4, 4, 1),
(9, 5, 5, 1),
(10, 1, 1, 1),
(10, 2, 2, 1),
(10, 3, 3, 1),
(10, 4, 4, 1),
(10, 5, 5, 1),
(11, 1, 1, 1),
(11, 2, 2, 1),
(11, 3, 3, 1),
(11, 4, 4, 1),
(11, 5, 5, 1),
(12, 1, 1, 1),
(12, 2, 2, 1),
(12, 3, 3, 1),
(12, 4, 4, 1),
(12, 5, 5, 1),
(13, 1, 1, 1),
(13, 2, 2, 1),
(13, 3, 3, 1),
(13, 4, 4, 1),
(13, 5, 5, 1),
(14, 1, 1, 1),
(14, 2, 2, 1),
(14, 3, 3, 1),
(14, 4, 4, 1),
(14, 5, 5, 1),
(15, 1, 1, 1),
(15, 2, 2, 1),
(15, 3, 3, 1),
(15, 4, 4, 1),
(15, 5, 5, 1),
(16, 1, 1, 1),
(16, 2, 2, 1),
(16, 3, 3, 1),
(16, 4, 4, 1),
(16, 5, 5, 1),
(17, 1, 1, 1),
(17, 2, 2, 1),
(17, 3, 3, 1),
(17, 4, 4, 1),
(17, 5, 5, 1),
(18, 1, 1, 1),
(18, 2, 2, 1),
(18, 3, 3, 1),
(18, 4, 4, 1),
(18, 5, 5, 1),
(19, 1, 1, 1),
(19, 2, 2, 1),
(19, 3, 3, 1),
(19, 4, 4, 1),
(19, 5, 5, 1),
(20, 1, 1, 1),
(20, 2, 2, 1),
(20, 3, 3, 1),
(20, 4, 4, 1),
(20, 5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrows`
--

CREATE TABLE `borrows` (
  `BorrowId` int(11) NOT NULL,
  `BorrowDate` DATE NOT NULL,
  `ReturnDate` DATE DEFAULT NULL,
  `ReaderId` int(11) NOT NULL,
  `DocId` int(11) NOT NULL,
  `CopyNo` int(11) NOT NULL,
  `LibId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrows`
--

INSERT INTO `borrows` (`BorrowId`, `BorrowDate`, `ReturnDate`, `ReaderId`, `DocId`, `CopyNo`, `LibId`) VALUES
(1, '2019-01-15', '2019-01-30', 1, 1, 1, 1),
(2, '2019-01-15', '2019-01-30', 1, 2, 1, 1),
(3, '2019-01-15', NULL, 1, 9, 1, 1),
(4, '2019-01-15', '2019-01-30', 5, 7, 1, 1),
(5, '2019-01-15', NULL, 5, 6, 1, 1),
(6, '2019-01-15', NULL, 5, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `ReserveId` int(11) NOT NULL,
  `ReserveDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ReaderId` int(11) NOT NULL,
  `DocId` int(11) NOT NULL,
  `CopyNo` int(11) NOT NULL,
  `LibId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`ReserveId`, `ReserveDate`, `ReaderId`, `DocId`, `CopyNo`, `LibId`) VALUES
(1, '2019-01-14 18:35:25', 1, 1, 2, 2),
(2, '2019-01-14 18:35:25', 1, 2, 2, 2),
(3, '2019-01-14 18:35:25', 1, 9, 2, 2),
(4, '2019-01-14 18:35:25', 5, 7, 2, 2),
(5, '2019-01-14 18:35:25', 5, 6, 2, 2),
(6, '2019-01-14 18:35:25', 5, 4, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reader`
--

CREATE TABLE `reader` (
  `ReaderId` int(11) NOT NULL,
  `ReaderName` varchar(120) DEFAULT NULL,
  `RType` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Address` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reader`
--

INSERT INTO `reader` (`ReaderId`, `ReaderName`, `RType`, `MobileNumber`, `Address`) VALUES
(1, 'Meghashyam', 'Student', '98652555', '105 Central Avenue'),
(2, 'Christiana', 'Staff', '85690025', '97 Hudson St'),
(3, 'Kiran', 'Senior Citizen', '59874527', '309 Sussex St'),
(4, 'Madhukar', 'Other', '585856224', '127 Warren St'),
(5, 'Likith', 'Student', '672423754', '739 Harrison Av');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`AuthorId`);
  
--
-- Indexes for table `editors`
--
  
ALTER TABLE `editors`
  ADD PRIMARY KEY (`EditorId`);

--
-- Indexes for table `guesteditors`
--
ALTER TABLE `guesteditors`
  ADD PRIMARY KEY (`GEditorId`);

--
-- Indexes for table `confeditors`
--
ALTER TABLE `confeditors`
  ADD PRIMARY KEY (`CEditorId`);

--
-- Indexes for table `publishers`
--

ALTER TABLE `publishers`
  ADD PRIMARY KEY (`PubId`);
  
--
-- Indexes for table `branch`
--

ALTER TABLE `branch`
  ADD PRIMARY KEY (`LibId`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`DocId`);
  
--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`DocId`);
  
--
-- Indexes for table `proceedings`
--
ALTER TABLE `proceedings`
  ADD PRIMARY KEY (`DocId`);
  
  
--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`DocId`);



--
-- Indexes for table `borrows`
--
ALTER TABLE `borrows`
  ADD PRIMARY KEY (`BorrowId`);
  
  
--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`ReserveId`);
  


--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`ReaderId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `AuthorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `DocId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
  
--
-- AUTO_INCREMENT for table `journal`
--
  
ALTER TABLE `journal`
  MODIFY `DocId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `proceedings`
--
ALTER TABLE `proceedings`
  MODIFY `DocId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `borrows`
--
ALTER TABLE `borrows`
  MODIFY `BorrowId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
  
--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `ReserveId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


--
-- AUTO_INCREMENT for table `reader`
--
ALTER TABLE `reader`
  MODIFY `ReaderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;