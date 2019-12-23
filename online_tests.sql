-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2019 at 10:01 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_tests`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `answerID` int(11) NOT NULL,
  `answer` text NOT NULL,
  `iscorrect` tinyint(1) DEFAULT NULL,
  `QID` int(11) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`answerID`, `answer`, `iscorrect`, `QID`, `created_at`, `updated_at`) VALUES
(1, 'simply dummy text generator', 1, 1, '2019-12-20', NULL),
(2, 'It has a normal distribution of letters', 0, 1, '2019-12-20', NULL),
(3, 'is not simply random text', 0, 1, '2019-12-20', NULL),
(4, 'many variations of passages', 0, 1, '2019-12-20', NULL),
(5, 'make a type specimen book.', 1, 4, '2019-12-20', NULL),
(6, 'standard dummy text ever', 0, 4, '2019-12-20', NULL),
(7, 'containing Lorem Ipsum passages', 0, 4, '2019-12-20', NULL),
(8, 'desktop publishing software', 0, 4, '2019-12-20', NULL),
(9, 'abstract class can provide complete,interface cannot provide any code', 0, 7, '2019-12-20', NULL),
(10, 'Overloading is to “add” or “extend” more', 0, 7, '2019-12-20', NULL),
(11, 'Override a private or static method in Java', 0, 7, '2019-12-20', NULL),
(12, 'Relationship where all object', 1, 7, '2019-12-20', NULL),
(13, 'specialized form of Aggregation', 1, 13, '2019-12-20', NULL),
(14, 'server side technologies', 0, 13, '2019-12-20', NULL),
(15, 'Limited amount of data can be sent,Large amount of data can be sent', 0, 13, '2019-12-20', NULL),
(16, 'forward the request to another resource', 0, 13, '2019-12-20', NULL),
(17, 'forward() sends the same request to another ,sendRedirect() method sends new request always', 1, 15, '2019-12-20', NULL),
(18, '5 stages in the lifecycle of a servlet', 0, 15, '2019-12-20', NULL),
(19, ' text data sent by server to the client', 1, 15, '2019-12-20', NULL),
(20, 'Servlet config object represent single servlet', 0, 15, '2019-12-20', NULL),
(21, 'conversational state between client and server', 1, 18, '2019-12-20', NULL),
(22, 'is a software component that enables', 0, 18, '2019-12-20', NULL),
(23, 'Registering the driver class\r\nCreating connection', 0, 18, '2019-12-20', NULL),
(24, 'The java.sql package contains interfaces and classes for JDBC API', 0, 18, '2019-12-20', NULL),
(26, 'correct1', 1, 27, '2019-12-12', NULL),
(27, 'wrong', 0, 27, '2019-12-12', NULL),
(28, 'wrong', 0, 27, '2019-12-12', NULL),
(29, 'wrong', 0, 27, '2019-12-12', NULL),
(30, 'correct', 1, 28, '2019-12-12', NULL),
(31, 'wrong', 0, 28, '2019-12-12', NULL),
(32, 'wrong', 0, 28, '2019-12-12', NULL),
(33, 'wrong', 0, 28, '2019-12-12', NULL),
(34, 'correct', 1, 29, '2019-12-21', NULL),
(35, 'wrong ', 0, 29, '2019-12-21', NULL),
(36, 'wrong ', 0, 29, '2019-12-21', NULL),
(37, 'wrong ', 0, 29, '2019-12-21', NULL),
(38, 'C', 1, 30, '2019-12-21', NULL),
(39, 'W', 0, 30, '2019-12-21', NULL),
(40, 'W', 0, 30, '2019-12-21', NULL),
(41, 'W', 0, 30, '2019-12-21', NULL),
(42, 'C', 1, 31, '2019-12-21', NULL),
(43, 'W', 0, 31, '2019-12-21', NULL),
(44, 'W', 0, 31, '2019-12-21', NULL),
(45, 'W', 0, 31, '2019-12-21', NULL),
(46, 'C', 1, 32, '2019-12-21', NULL),
(47, 'W', 0, 32, '2019-12-21', NULL),
(48, 'WE', 0, 32, '2019-12-21', NULL),
(49, 'WR', 0, 32, '2019-12-21', NULL),
(50, 'CC', 1, 33, '2019-12-22', NULL),
(51, 'W', 0, 33, '2019-12-22', NULL),
(52, 'w', 0, 33, '2019-12-22', NULL),
(53, 'fdsdes', 0, 33, '2019-12-22', NULL),
(54, 'CCCCC', 1, 34, '2019-12-22', NULL),
(55, 'fds', 0, 34, '2019-12-22', NULL),
(56, 'lkj', 0, 34, '2019-12-22', NULL),
(57, 'lkjhklj', 0, 34, '2019-12-22', NULL),
(58, 'COR', 1, 35, '2019-12-22', NULL),
(59, 'WW', 0, 35, '2019-12-22', NULL),
(60, 'ww', 0, 35, '2019-12-22', NULL),
(61, 'ww', 0, 35, '2019-12-22', NULL),
(62, 'cc', 1, 36, '2019-12-22', NULL),
(63, 'lkj', 0, 36, '2019-12-22', NULL),
(64, 'ew', 0, 36, '2019-12-22', NULL),
(65, 'olkj', 0, 36, '2019-12-22', NULL),
(66, 'c', 1, 37, '2019-12-22', NULL),
(67, 'kj', 0, 37, '2019-12-22', NULL),
(68, 'kl', 0, 37, '2019-12-22', NULL),
(69, 'jkl', 0, 37, '2019-12-22', NULL),
(70, 'c', 1, 38, '2019-12-22', NULL),
(71, 'lkj', 0, 38, '2019-12-22', NULL),
(72, 'lkj', 0, 38, '2019-12-22', NULL),
(73, '098i9kol', 0, 38, '2019-12-22', NULL),
(74, 'lkj', 1, 39, '2019-12-22', NULL),
(75, ';ljk', 0, 39, '2019-12-22', NULL),
(76, 'l;kjm', 0, 39, '2019-12-22', NULL),
(77, 'lkjkj', 0, 39, '2019-12-22', NULL),
(78, 'c', 1, 40, '2019-12-22', NULL),
(79, 'lkj', 0, 40, '2019-12-22', NULL),
(80, 'lkj', 0, 40, '2019-12-22', NULL),
(81, ';ljk', 0, 40, '2019-12-22', NULL),
(82, 'kj', 1, 41, '2019-12-22', NULL),
(83, 'hkjhk', 0, 41, '2019-12-22', NULL),
(84, 'jkh', 0, 41, '2019-12-22', NULL),
(85, 'hkjhkjhkj', 0, 41, '2019-12-22', NULL),
(86, 'c', 1, 42, '2019-12-22', NULL),
(87, 'l;k', 0, 42, '2019-12-22', NULL),
(88, 'l;k;l', 0, 42, '2019-12-22', NULL),
(89, 'l;k', 0, 42, '2019-12-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cv`
--

CREATE TABLE `cv` (
  `id` int(11) NOT NULL,
  `CVtitle` text NOT NULL,
  `candidateUsername` text NOT NULL,
  `testIsSent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cv`
--

INSERT INTO `cv` (`id`, `CVtitle`, `candidateUsername`, `testIsSent`) VALUES
(1, '10361526_10208536024904915_5647798923286394664_n.jpg', 'nour', 0),
(2, '__Ù?Ù? Ù?Ø­Ù?_.docx', 'ess', 0),
(3, 'Project.pdf', 'poula', 0),
(4, 'Project.pdf', 'hrpola', 0),
(5, 'null', 'null', 0),
(6, 'index.html', 'hossam', 0),
(7, 'index.html', 'bashar', 0),
(8, 'index.html', 'ali', 0),
(9, 'index.html', 'ali2', 0),
(10, 'index.html', 'ali33', 0),
(11, 'index.html', 'bola', 0),
(12, 'index.html', 'tota', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `examID` int(11) NOT NULL,
  `examName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`examID`, `examName`) VALUES
(1, 'Java'),
(2, 'Economics'),
(3, 'Electronics'),
(4, 'Linear Programming'),
(23, 'C++'),
(24, 'Dummy'),
(25, 'Dummy2');

-- --------------------------------------------------------

--
-- Table structure for table `examsanswers`
--

CREATE TABLE `examsanswers` (
  `id` int(11) NOT NULL,
  `answerName` text NOT NULL,
  `questionID` int(11) NOT NULL,
  `isCorrect` tinyint(1) NOT NULL DEFAULT 0,
  `isChosen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `examsanswers`
--

INSERT INTO `examsanswers` (`id`, `answerName`, `questionID`, `isCorrect`, `isChosen`, `created_at`, `updated_at`) VALUES
(705, 'dsdsd', 123, 0, 1, '2019-12-22 17:32:18', NULL),
(707, 'C', 188, 0, 1, '2019-12-22 17:37:28', NULL),
(708, 'correct1', 175, 0, 1, '2019-12-22 17:42:35', NULL),
(709, 'correct', 176, 0, 1, '2019-12-22 17:42:36', NULL),
(710, 'C', 174, 0, 1, '2019-12-22 17:42:38', NULL),
(711, 'correct', 172, 0, 1, '2019-12-22 17:42:40', NULL),
(712, 'C', 194, 0, 1, '2019-12-22 17:45:37', NULL),
(713, 'C', 179, 0, 1, '2019-12-22 17:45:39', NULL),
(716, 'specialized form of Aggregation', 178, 0, 1, '2019-12-22 17:49:53', NULL),
(717, 'Relationship where all object', 192, 0, 1, '2019-12-22 17:49:57', NULL),
(718, 'C', 179, 0, 1, '2019-12-22 17:52:57', NULL),
(721, 'Relationship where all object', 177, 0, 1, '2019-12-22 17:56:14', NULL),
(722, 'correct1', 210, 0, 1, '2019-12-22 18:00:30', NULL),
(723, 'C', 209, 0, 1, '2019-12-22 18:00:31', NULL),
(724, 'C', 208, 0, 1, '2019-12-22 18:00:32', NULL),
(725, 'make a type specimen book.', 213, 0, 1, '2019-12-22 18:09:59', NULL),
(726, 'C', 216, 0, 1, '2019-12-22 18:13:07', NULL),
(727, 'Limited amount of data can be sent,Large amount of data can be sent', 215, 0, 1, '2019-12-22 18:26:12', NULL),
(728, 'Relationship where all object', 214, 0, 1, '2019-12-22 18:26:25', NULL),
(731, 'forward() sends the same request to another ,sendRedirect() method sends new request always', 217, 0, 1, '2019-12-22 18:37:34', NULL),
(732, 'conversational state between client and server', 218, 0, 1, '2019-12-22 18:37:41', NULL),
(737, 'Overloading is to “add” or “extend” more', 223, 0, 1, '2019-12-22 18:43:01', NULL),
(738, '5 stages in the lifecycle of a servlet', 226, 0, 1, '2019-12-22 18:43:06', NULL),
(748, 'COR', 286, 1, 1, '2019-12-22 19:48:57', NULL),
(749, 'cc', 287, 1, 1, '2019-12-22 19:48:58', NULL),
(750, 'l;k', 288, 0, 1, '2019-12-22 19:48:59', NULL),
(751, 'CC', 284, 1, 1, '2019-12-22 19:49:00', NULL),
(752, 'l;k', 285, 0, 1, '2019-12-22 19:49:02', NULL),
(753, 'C', 291, 1, 1, '2019-12-22 19:49:09', NULL),
(754, 'Limited amount of data can be sent,Large amount of data can be sent', 290, 0, 1, '2019-12-22 19:49:12', NULL),
(755, 'Override a private or static method in Java', 289, 0, 1, '2019-12-22 19:49:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `examsquestions`
--

CREATE TABLE `examsquestions` (
  `id` int(11) NOT NULL,
  `questionName` text NOT NULL,
  `questionID` int(11) NOT NULL,
  `examID` int(11) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `examsquestions`
--

INSERT INTO `examsquestions` (`id`, `questionName`, `questionID`, `examID`, `created_at`, `updated_at`) VALUES
(172, 'dss2', 28, 38, '2019-12-21', NULL),
(173, 'integer', 31, 38, '2019-12-21', NULL),
(174, 'lllinear', 30, 38, '2019-12-21', NULL),
(175, 'dss q1', 27, 38, '2019-12-21', NULL),
(176, 'dss3', 29, 38, '2019-12-21', NULL),
(177, 'What is the difference between equals() and == ?', 7, 39, '2019-12-21', NULL),
(178, 'What is composition in Java?', 13, 39, '2019-12-21', NULL),
(179, 'ADVAN1', 32, 39, '2019-12-21', NULL),
(180, 'dss2', 28, 40, '2019-12-21', NULL),
(181, 'integer', 31, 40, '2019-12-21', NULL),
(182, 'lllinear', 30, 40, '2019-12-21', NULL),
(183, 'dss q1', 27, 40, '2019-12-21', NULL),
(184, 'dss3', 29, 40, '2019-12-21', NULL),
(185, 'What is Lorem Ipsum?', 1, 41, '2019-12-21', NULL),
(186, 'Where can I get some?', 4, 41, '2019-12-21', NULL),
(187, 'dss2', 28, 38, '2019-12-22', NULL),
(188, 'integer', 31, 38, '2019-12-22', NULL),
(189, 'lllinear', 30, 38, '2019-12-22', NULL),
(190, 'dss q1', 27, 38, '2019-12-22', NULL),
(191, 'dss3', 29, 38, '2019-12-22', NULL),
(192, 'What is the difference between equals() and == ?', 7, 39, '2019-12-22', NULL),
(193, 'What is composition in Java?', 13, 39, '2019-12-22', NULL),
(194, 'ADVAN1', 32, 39, '2019-12-22', NULL),
(195, 'dss2', 28, 35, '2019-12-22', NULL),
(196, 'integer', 31, 35, '2019-12-22', NULL),
(197, 'lllinear', 30, 35, '2019-12-22', NULL),
(198, 'dss q1', 27, 35, '2019-12-22', NULL),
(199, 'dss3', 29, 35, '2019-12-22', NULL),
(200, 'dss2', 28, 40, '2019-12-22', NULL),
(201, 'integer', 31, 40, '2019-12-22', NULL),
(202, 'lllinear', 30, 40, '2019-12-22', NULL),
(203, 'dss q1', 27, 40, '2019-12-22', NULL),
(204, 'dss3', 29, 40, '2019-12-22', NULL),
(205, 'What is Lorem Ipsum?', 1, 41, '2019-12-22', NULL),
(206, 'Where can I get some?', 4, 41, '2019-12-22', NULL),
(207, 'dss2', 28, 42, '2019-12-22', NULL),
(208, 'integer', 31, 42, '2019-12-22', NULL),
(209, 'lllinear', 30, 42, '2019-12-22', NULL),
(210, 'dss q1', 27, 42, '2019-12-22', NULL),
(211, 'dss3', 29, 42, '2019-12-22', NULL),
(212, 'What is Lorem Ipsum?', 1, 43, '2019-12-22', NULL),
(213, 'Where can I get some?', 4, 43, '2019-12-22', NULL),
(214, 'What is the difference between equals() and == ?', 7, 44, '2019-12-22', NULL),
(215, 'What is composition in Java?', 13, 44, '2019-12-22', NULL),
(216, 'ADVAN1', 32, 44, '2019-12-22', NULL),
(217, 'What are the differences between Get and Post methods?', 15, 45, '2019-12-22', NULL),
(218, 'What is the life-cycle of a servlet?', 18, 45, '2019-12-22', NULL),
(219, 'What is Lorem Ipsum?', 1, 46, '2019-12-22', NULL),
(220, 'Where can I get some?', 4, 46, '2019-12-22', NULL),
(221, 'What is Lorem Ipsum?', 1, 47, '2019-12-22', NULL),
(222, 'Where can I get some?', 4, 47, '2019-12-22', NULL),
(223, 'What is the difference between equals() and == ?', 7, 48, '2019-12-22', NULL),
(224, 'What is composition in Java?', 13, 48, '2019-12-22', NULL),
(225, 'ADVAN1', 32, 48, '2019-12-22', NULL),
(226, 'What are the differences between Get and Post methods?', 15, 49, '2019-12-22', NULL),
(227, 'What is the life-cycle of a servlet?', 18, 49, '2019-12-22', NULL),
(228, 'dss2', 28, 50, '2019-12-22', NULL),
(229, 'integer', 31, 50, '2019-12-22', NULL),
(230, 'lllinear', 30, 50, '2019-12-22', NULL),
(231, 'dss q1', 27, 50, '2019-12-22', NULL),
(232, 'dss3', 29, 50, '2019-12-22', NULL),
(233, 'dss2', 28, 38, '2019-12-22', NULL),
(234, 'integer', 31, 38, '2019-12-22', NULL),
(235, 'lllinear', 30, 38, '2019-12-22', NULL),
(236, 'dss q1', 27, 38, '2019-12-22', NULL),
(237, 'dss3', 29, 38, '2019-12-22', NULL),
(238, 'What is the difference between equals() and == ?', 7, 39, '2019-12-22', NULL),
(239, 'What is composition in Java?', 13, 39, '2019-12-22', NULL),
(240, 'ADVAN1', 32, 39, '2019-12-22', NULL),
(241, 'dss2', 28, 40, '2019-12-22', NULL),
(242, 'integer', 31, 40, '2019-12-22', NULL),
(243, 'lllinear', 30, 40, '2019-12-22', NULL),
(244, 'dss q1', 27, 40, '2019-12-22', NULL),
(245, 'dss3', 29, 40, '2019-12-22', NULL),
(246, 'What is Lorem Ipsum?', 1, 41, '2019-12-22', NULL),
(247, 'Where can I get some?', 4, 41, '2019-12-22', NULL),
(248, 'dss2', 28, 42, '2019-12-22', NULL),
(249, 'integer', 31, 42, '2019-12-22', NULL),
(250, 'lllinear', 30, 42, '2019-12-22', NULL),
(251, 'dss q1', 27, 42, '2019-12-22', NULL),
(252, 'dss3', 29, 42, '2019-12-22', NULL),
(253, 'What is Lorem Ipsum?', 1, 43, '2019-12-22', NULL),
(254, 'Where can I get some?', 4, 43, '2019-12-22', NULL),
(255, 'What is the difference between equals() and == ?', 7, 44, '2019-12-22', NULL),
(256, 'What is composition in Java?', 13, 44, '2019-12-22', NULL),
(257, 'ADVAN1', 32, 44, '2019-12-22', NULL),
(258, 'What are the differences between Get and Post methods?', 15, 45, '2019-12-22', NULL),
(259, 'What is the life-cycle of a servlet?', 18, 45, '2019-12-22', NULL),
(260, 'What is Lorem Ipsum?', 1, 51, '2019-12-22', NULL),
(261, 'Where can I get some?', 4, 51, '2019-12-22', NULL),
(262, 'What is the difference between equals() and == ?', 7, 52, '2019-12-22', NULL),
(263, 'What is composition in Java?', 13, 52, '2019-12-22', NULL),
(264, 'ADVAN1', 32, 52, '2019-12-22', NULL),
(265, 'What are the differences between Get and Post methods?', 15, 53, '2019-12-22', NULL),
(266, 'What is the life-cycle of a servlet?', 18, 53, '2019-12-22', NULL),
(267, 'dss2', 28, 54, '2019-12-22', NULL),
(268, 'integer', 31, 54, '2019-12-22', NULL),
(269, 'lllinear', 30, 54, '2019-12-22', NULL),
(270, 'dss q1', 27, 54, '2019-12-22', NULL),
(271, 'dss3', 29, 54, '2019-12-22', NULL),
(272, 'What is the difference between equals() and == ?', 7, 55, '2019-12-22', NULL),
(273, 'What is composition in Java?', 13, 55, '2019-12-22', NULL),
(274, 'ADVAN1', 32, 55, '2019-12-22', NULL),
(275, 'What is Lorem Ipsum?', 1, 56, '2019-12-22', NULL),
(276, 'Where can I get some?', 4, 56, '2019-12-22', NULL),
(277, 'What are the differences between Get and Post methods?', 15, 57, '2019-12-22', NULL),
(278, 'What is the life-cycle of a servlet?', 18, 57, '2019-12-22', NULL),
(279, 'dss2', 28, 58, '2019-12-22', NULL),
(280, 'integer', 31, 58, '2019-12-22', NULL),
(281, 'lllinear', 30, 58, '2019-12-22', NULL),
(282, 'dss q1', 27, 58, '2019-12-22', NULL),
(283, 'dss3', 29, 58, '2019-12-22', NULL),
(284, 'PROG1', 33, 59, '2019-12-22', NULL),
(285, 'PROG7', 42, 59, '2019-12-22', NULL),
(286, 'PROG3', 35, 59, '2019-12-22', NULL),
(287, 'OOP1', 36, 59, '2019-12-22', NULL),
(288, 'PROG7', 42, 59, '2019-12-22', NULL),
(289, 'What is the difference between equals() and == ?', 7, 60, '2019-12-22', NULL),
(290, 'What is composition in Java?', 13, 60, '2019-12-22', NULL),
(291, 'ADVAN1', 32, 60, '2019-12-22', NULL),
(292, 'dss2', 28, 61, '2019-12-22', NULL),
(293, 'integer', 31, 61, '2019-12-22', NULL),
(294, 'lllinear', 30, 61, '2019-12-22', NULL),
(295, 'dss q1', 27, 61, '2019-12-22', NULL),
(296, 'dss3', 29, 61, '2019-12-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `examssent`
--

CREATE TABLE `examssent` (
  `id` int(11) NOT NULL,
  `candidateID` int(11) NOT NULL,
  `examID` int(11) NOT NULL,
  `examName` text NOT NULL,
  `prerequisiteID` int(11) DEFAULT NULL,
  `isexamined` tinyint(1) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `isPassed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `examssent`
--

INSERT INTO `examssent` (`id`, `candidateID`, `examID`, `examName`, `prerequisiteID`, `isexamined`, `score`, `isPassed`, `created_at`, `updated_at`) VALUES
(59, 24, 23, 'C++', 0, 1, 3, 1, '2019-12-22', NULL),
(60, 24, 2, 'Economics', 59, 1, 1, 0, '2019-12-22', NULL),
(61, 24, 4, 'Linear Programming', 60, 0, 0, 0, '2019-12-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `content`, `created_at`) VALUES
(1, 'Software-Engineer', '0000-00-00'),
(2, 'Web-Developer', '0000-00-00'),
(3, 'Front-end-Developer', '0000-00-00'),
(4, 'Back-End-Developer', '0000-00-00'),
(5, 'IOS-Developer', '2019-12-21'),
(6, 'Android-Developer', '2019-12-21'),
(7, 'Full-Stack-Developer', '2019-12-21'),
(8, 'MEAN-Developer', '2019-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `QID` int(11) NOT NULL,
  `question` text NOT NULL,
  `topicID` int(11) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`QID`, `question`, `topicID`, `created_at`, `updated_at`) VALUES
(1, 'What is Lorem Ipsum?', 1, '2019-12-20', NULL),
(4, 'Where can I get some?', 2, '2019-12-20', NULL),
(7, 'What is the difference between equals() and == ?', 3, '2019-12-20', NULL),
(13, 'What is composition in Java?', 4, '2019-12-20', NULL),
(15, 'What are the differences between Get and Post methods?', 5, '2019-12-20', NULL),
(18, 'What is the life-cycle of a servlet?', 6, '2019-12-20', NULL),
(27, 'dss q1', 10, '2019-12-12', NULL),
(28, 'dss2', 7, '2019-12-12', NULL),
(29, 'dss3', 10, '2019-12-12', NULL),
(30, 'lllinear', 8, '2019-12-12', NULL),
(31, 'integer', 7, '2019-12-12', NULL),
(32, 'ADVAN1', 4, '2019-12-12', NULL),
(33, 'PROG1', 11, '2019-12-12', NULL),
(34, 'PROG2', 11, '2019-12-12', NULL),
(35, 'PROG3', 11, '2019-12-12', NULL),
(36, 'OOP1', 12, '2019-12-12', NULL),
(37, 'OOP2', 0, '2019-12-12', NULL),
(38, 'OOP3', 0, '2019-12-12', NULL),
(39, 'OOP4', 0, '2019-12-12', NULL),
(40, 'OOP5', 12, '2019-12-12', NULL),
(41, 'OOP6', 12, '2019-12-12', NULL),
(42, 'PROG7', 11, '2019-12-12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topicID` int(11) NOT NULL,
  `topicName` text NOT NULL,
  `examID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topicID`, `topicName`, `examID`) VALUES
(1, 'OOP', 1),
(2, 'Fundamentals', 1),
(3, 'Essentials', 2),
(4, 'Advanced', 2),
(5, 'Electronics 1', 3),
(6, 'Electronics 2', 3),
(7, 'Integer Linear Programming', 4),
(8, 'Non-Linear Programming', 4),
(10, 'DSS', 4),
(11, 'PROG1', 23),
(12, 'OOP@', 23);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `usertype` text NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `usertype`, `position`, `phone`, `validated`, `created_at`, `updated_at`) VALUES
(3, 'hr@gmail.com', 'hr', '12345', 'hr', 'HR', '123456', 0, '2019-12-20', NULL),
(5, 'poula@pola.com', 'poula', '12345', 'candidate', 'Front-End Developer', '123456789', 0, '2019-12-20', NULL),
(8, 'hossam@hos.com', 'hossam', '123', 'candidate', 'IOS Developer', '123456', 0, '2019-12-20', NULL),
(9, 'bashar@bosh.com', 'bashar', '123', 'candidate', 'Web Developer', '123', 0, '2019-12-20', NULL),
(10, 'kimo@kimo.com', 'kimo', '123', 'candidate', 'Front-End Developer', '123456789', 0, '0000-00-00', NULL),
(20, 'besho@pola.com', 'beshoy', '123', 'candidate', 'Front-End Developer', '123456789', 0, '0000-00-00', NULL),
(24, 'bola@bola.com', 'bola', '12345', 'candidate', 'Software-Engineer', '123654799', 1, '2019-12-22', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answerID`);

--
-- Indexes for table `cv`
--
ALTER TABLE `cv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`examID`);

--
-- Indexes for table `examsanswers`
--
ALTER TABLE `examsanswers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examsquestions`
--
ALTER TABLE `examsquestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examssent`
--
ALTER TABLE `examssent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`QID`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topicID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `answerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `cv`
--
ALTER TABLE `cv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `examID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `examsanswers`
--
ALTER TABLE `examsanswers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=756;

--
-- AUTO_INCREMENT for table `examsquestions`
--
ALTER TABLE `examsquestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `examssent`
--
ALTER TABLE `examssent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `QID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
