-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 08:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `topic_id`, `title`, `image`, `body`, `published`, `created_at`) VALUES
(18, 23, 8, 'Please provide new mouse pads', '1646814577_extremely-dirty-mouse-pad-close-view-very-black-117065919.jpg', '&lt;p&gt;The computer lab has really dirty mouse pads. There was a &lt;strong&gt;fungus &lt;/strong&gt;on one of the mouse pads. Please can someone clean it or provide new ones.&lt;/p&gt;', 1, '2022-03-09 11:29:37'),
(20, 23, 8, 'Make sure you don\'t bring drinks to the computer lab', '1648022295_10-essential-computer-maintenance-tips-hero156657824639785.jpg', '&lt;p&gt;Hi, students are bring coffee to the computer lab and it has spilled into a laptop. Please make sure that you don\'t allow students to bring food and drinks&lt;/p&gt;', 1, '2022-03-23 10:58:15'),
(21, 23, 9, 'Libary books are getting dirty', '1648022451_depositphotos_5164753_s.jpg', '&lt;p&gt;The books are getting dirty. Students are leaving watermarks and fingerprints on the book. This cause the books to be damaged. Let\'s&lt;strong&gt; do something about it.&lt;/strong&gt;&lt;/p&gt;', 1, '2022-03-23 11:00:51'),
(22, 25, 10, 'Adding more lights in the classroom', '1648063311_Photograph-of-a-classroom-with-measurements-of-illuminance-indicated-lux-the-values_Q320.jpg', '&lt;p&gt;The classroom are too dim. We need to add more lights.&lt;/p&gt;', 1, '2022-03-23 22:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`) VALUES
(8, 'Computer Lab', '<p>This is everything to do &nbsp;with the computer lab</p>'),
(9, 'Libary', '<p>This is topic that are about the libary</p>'),
(10, 'Classroom', '<p>This is for topics that is involved with the classroom</p>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created_at`) VALUES
(23, 1, 'mahdimaster', 'bmike471@gmail.com', '$2y$10$/Nq01B6IQk0EpwS7klS1fek69PCeMqRDYyk2FLqkwR.oI/AYMnehm', '2022-03-09 06:55:44'),
(24, 0, 'presntation', 'mdahir471@gmail.com', '$2y$10$drRWGUQwi9ceacxlCaoEnuKQ6LL2.up280RXxNQb5iu7SRADhckym', '2022-03-16 07:07:23'),
(25, 0, 'Mr. P', 'ahmedabdi80@yahoo.co.uk', '$2y$10$lQwdOEWugiKP963pY.ZZ6eTumRpBrhSnkq04cditCoKnEGhM.C5S6', '2022-03-23 08:01:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
