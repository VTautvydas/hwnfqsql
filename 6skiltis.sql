--
-- Database: `Books`
--

--
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;

CREATE TABLE `Authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `bookId` int(11) DEFAULT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Authors`
--

INSERT INTO `Authors` VALUES
  (1,'Chris Smith',1),
  (2,'Steven Levithan',2),
  (3,' Jan Goyvaerts',2),
  (4,'Ryan Benedetti',3),
  (5,' Al Anderson',3),
  (6,'Clay Breshears',4),
  (7,'Kevlin Henney',5);

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;

CREATE TABLE `Books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `genreId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB CHARSET=latin7 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` VALUES
  (1,'Programming F# 3.0, 2nd Edition',2012,NULL),
  (2,'Regular Expressions Cookbook, 2nd Edition',2012,NULL),
  (3,'Head First Networking',2009,NULL),
  (4,'The Art of Concurrency',2009,NULL),
  (5,'97 Things Every Programmer Should Know',2010,NULL),
  (12,'Žydi šermukšnis ąsos šešėly',1994,4);

--
-- Table structure for table `Genres`
--

DROP TABLE IF EXISTS `Genres`;

CREATE TABLE `Genres` (
  `genreId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`genreId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` VALUES
  (1,'Handbook'),
  (2,'Scientific'),
  (3,'Manual'),
  (4,'History');
