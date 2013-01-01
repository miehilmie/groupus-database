-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 01, 2013 at 03:58 PM
-- Server version: 5.5.28-0ubuntu0.12.04.3
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `groupus`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `path` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `directmessages`
--

CREATE TABLE IF NOT EXISTS `directmessages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `receiver_id` int(10) unsigned NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `attachment_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directmessages_sender_id_foreign` (`sender_id`),
  KEY `directmessages_receiver_id_foreign` (`receiver_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `directmessages`
--

INSERT INTO `directmessages` (`id`, `sender_id`, `receiver_id`, `subject`, `message`, `attachment_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'testing', 'hi jack', NULL, '2012-12-28 16:25:20', '2012-12-28 16:25:20'),
(2, 2, 1, 'testing 2', 'hi my name is muhammad hilmi bin hassan, i''m a web developer for php. i''m interested in developing an ajax application. follow me on twitter @miehilmie', NULL, '2012-12-28 16:38:45', '2012-12-28 16:38:45'),
(3, 1, 2, 'testing 3', 'bla bla bla im looking for friends,', NULL, '2012-12-28 16:43:50', '2012-12-28 16:43:50'),
(4, 2, 1, 'abu bakar', 'abu bakar', NULL, '2012-12-28 17:01:11', '2012-12-28 17:01:11'),
(5, 2, 2, 'sending to miehilmie', 'sending to miehilmie', NULL, '2012-12-28 17:01:53', '2012-12-28 17:01:53'),
(6, 2, 1, 'send more', 'send more', NULL, '2012-12-28 17:02:09', '2012-12-28 17:02:09'),
(7, 2, 2, 'send more', 'send more', NULL, '2012-12-28 17:02:20', '2012-12-28 17:02:20'),
(8, 2, 1, 'and more', 'and more', NULL, '2012-12-28 17:02:30', '2012-12-28 17:02:30'),
(9, 2, 2, 'and more', 'and more', NULL, '2012-12-28 17:02:41', '2012-12-28 17:02:41'),
(10, 2, 2, 'testing send more', 'testing send more', NULL, '2012-12-28 17:03:00', '2012-12-28 17:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE IF NOT EXISTS `enrollments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `semester_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollments_user_id_foreign` (`user_id`),
  KEY `enrollments_subject_id_foreign` (`subject_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `subject_id`, `semester_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31'),
(2, 1, 2, 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE IF NOT EXISTS `faculties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `abbrevation` varchar(200) NOT NULL,
  `university_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `faculties_university_id_foreign` (`university_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`, `abbrevation`, `university_id`, `created_at`, `updated_at`) VALUES
(1, 'Faculty of Computing and Informatics', 'FCI', 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31'),
(2, 'Faculty of Engineering', 'FOE', 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31'),
(3, 'Faculty of Management', 'FOM', 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31'),
(4, 'Faculty of Creative and Multimedia', 'FCM', 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE IF NOT EXISTS `genders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gender` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `gender`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_subject_id_foreign` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `laravel_migrations`
--

CREATE TABLE IF NOT EXISTS `laravel_migrations` (
  `bundle` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`bundle`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laravel_migrations`
--

INSERT INTO `laravel_migrations` (`bundle`, `name`, `batch`) VALUES
('application', '2012_11_26_085600_create_genders_table', 1),
('application', '2012_11_26_090608_create_universities_table', 1),
('application', '2012_11_26_090754_create_users_table', 1),
('application', '2012_11_26_091745_create_usertypes_table', 1),
('application', '2012_11_26_093607_add_column_usertype_id_on_users_table', 1),
('application', '2012_11_26_094611_create_students_table', 1),
('application', '2012_11_26_094650_create_lecturers_table', 1),
('application', '2012_11_26_095130_create_faculties_table', 1),
('application', '2012_11_26_104101_create_subjects_table', 1),
('application', '2012_11_26_104443_create_directmessages_table', 1),
('application', '2012_11_26_104644_create_attachments_table', 1),
('application', '2012_11_26_105011_create_enrollments_table', 1),
('application', '2012_11_26_105115_create_groups_table', 1),
('application', '2012_11_26_110701_create_student_group_table', 1),
('application', '2012_12_20_140019_add_faculty_id_to_users_table', 1),
('application', '2012_12_20_141543_add_contact_to_users_table', 1),
('application', '2012_12_20_142020_add_unique_username_to_users_table', 1),
('application', '2012_12_27_105625_create_announcements_table', 1),
('application', '2012_12_31_154750_create_table_votes', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE IF NOT EXISTS `lecturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lecturers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `user_id`, `room_no`) VALUES
(1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cgpa` float NOT NULL,
  `distance_f_c` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `students_user_id_foreign` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `cgpa`, `distance_f_c`) VALUES
(1, 1, 3.66, 1),
(2, 6, 2.72, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE IF NOT EXISTS `student_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_group_group_id_foreign` (`group_id`),
  KEY `student_group_student_id_foreign` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `faculty_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjects_faculty_id_foreign` (`faculty_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `code`, `name`, `faculty_id`, `created_at`, `updated_at`) VALUES
(1, 'TCP1231', 'Computer Programming 1', 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31'),
(2, 'TCP1232', 'Computer Programming 2', 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE IF NOT EXISTS `universities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `abbrevation` varchar(200) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `name`, `abbrevation`, `semester_id`, `created_at`, `updated_at`) VALUES
(1, 'Multimedia University', 'MMU', 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `img_url` varchar(100) NOT NULL DEFAULT '/uploads/default.png',
  `gender_id` int(10) unsigned NOT NULL,
  `university_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `usertype_id` int(10) unsigned NOT NULL,
  `faculty_id` int(10) unsigned NOT NULL,
  `contact` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_gender_id_foreign` (`gender_id`),
  KEY `users_university_id_foreign` (`university_id`),
  KEY `users_usertype_id_foreign` (`usertype_id`),
  KEY `users_faculty_id_foreign` (`faculty_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `age`, `address`, `phone`, `img_url`, `gender_id`, `university_id`, `created_at`, `updated_at`, `usertype_id`, `faculty_id`, `contact`) VALUES
(1, 'miebaik', '$2a$08$yZEJ6n9DWzWqfOlXws.8U.c2UfuKS91RK2j7lwVDgXMLR1Xv6AT3u', 'Muhammad Hilmi', 24, NULL, NULL, '/uploads/default.png', 2, 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31', 1, 1, ''),
(2, 'miehilmie', '$2a$08$V5NdpIxflFgcTOPPS/E7l..BScCWO8B8mLBC3kUbhtT1mA86UAqhy', 'Muhammad Hilmie', NULL, NULL, NULL, '/uploads/default.png', 2, 1, '2012-12-28 02:53:31', '2012-12-28 02:53:31', 2, 1, ''),
(6, 'miebaik@gmail.com', '$2a$08$TfYU4FAmmYLUKycBqnyTUe8Kd5HA8wCIc46F7ekNaSyaiDPZbfinO', 'Muhammad Hilmi bin Hassan', 12, '123', '123', '/uploads/default.png', 1, 1, '2012-12-31 17:35:51', '2012-12-31 17:35:51', 1, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE IF NOT EXISTS `usertypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`id`, `type`) VALUES
(1, 'Student'),
(2, 'Lecturer'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE IF NOT EXISTS `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `voter_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `votes_user_id_foreign` (`user_id`),
  KEY `votes_voter_id_foreign` (`voter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `value`, `voter_id`, `user_id`, `type`) VALUES
(2, 5, 1, 2, 1),
(3, 2, 1, 2, 2),
(4, 3, 1, 2, 3),
(6, 4, 1, 2, 4),
(7, 1, 6, 2, 1),
(8, 5, 6, 2, 2),
(9, 4, 6, 2, 3),
(10, 5, 6, 2, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `directmessages`
--
ALTER TABLE `directmessages`
  ADD CONSTRAINT `directmessages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `directmessages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `faculties`
--
ALTER TABLE `faculties`
  ADD CONSTRAINT `faculties_university_id_foreign` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD CONSTRAINT `lecturers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `student_group`
--
ALTER TABLE `student_group`
  ADD CONSTRAINT `student_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  ADD CONSTRAINT `student_group_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_faculty_id_foreign` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`),
  ADD CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`),
  ADD CONSTRAINT `users_university_id_foreign` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`),
  ADD CONSTRAINT `users_usertype_id_foreign` FOREIGN KEY (`usertype_id`) REFERENCES `usertypes` (`id`);

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `votes_voter_id_foreign` FOREIGN KEY (`voter_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
