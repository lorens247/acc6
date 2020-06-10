-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2020 at 01:44 PM
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
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `x1z_accounts`
--

CREATE TABLE `x1z_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_accounts`
--

INSERT INTO `x1z_accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Cash', '1', 'USD', 0.0000, 'Cash', NULL, NULL, 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(2, 2, 'Cash', '1', 'USD', 0.0000, 'Cash', NULL, NULL, 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(3, 3, 'Cash', '1', 'USD', 0.0000, 'Cash', NULL, NULL, 1, '2020-06-10 11:42:37', '2020-06-10 11:42:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_bills`
--

CREATE TABLE `x1z_bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_bill_histories`
--

CREATE TABLE `x1z_bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_bill_items`
--

CREATE TABLE `x1z_bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_bill_item_taxes`
--

CREATE TABLE `x1z_bill_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_bill_totals`
--

CREATE TABLE `x1z_bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_categories`
--

CREATE TABLE `x1z_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_categories`
--

INSERT INTO `x1z_categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Transfer', 'other', '#3c3f72', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(2, 1, 'Deposit', 'income', '#efad32', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(3, 1, 'Sales', 'income', '#6da252', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(4, 1, 'Other', 'expense', '#e5e5e5', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(5, 1, 'General', 'item', '#328aef', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(6, 2, 'Transfer', 'other', '#3c3f72', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(7, 2, 'Deposit', 'income', '#efad32', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(8, 2, 'Sales', 'income', '#6da252', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(9, 2, 'Other', 'expense', '#e5e5e5', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(10, 2, 'General', 'item', '#328aef', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(11, 3, 'Transfer', 'other', '#3c3f72', 1, '2020-06-10 11:42:37', '2020-06-10 11:42:37', NULL),
(12, 3, 'Deposit', 'income', '#efad32', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(13, 3, 'Sales', 'income', '#6da252', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(14, 3, 'Other', 'expense', '#e5e5e5', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(15, 3, 'General', 'item', '#328aef', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_companies`
--

CREATE TABLE `x1z_companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_companies`
--

INSERT INTO `x1z_companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(2, NULL, 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(3, NULL, 1, '2020-06-10 11:42:37', '2020-06-10 11:42:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_contacts`
--

CREATE TABLE `x1z_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_currencies`
--

CREATE TABLE `x1z_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_currencies`
--

INSERT INTO `x1z_currencies` (`id`, `company_id`, `name`, `code`, `rate`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'US Dollar', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(2, 1, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 1, '2020-06-10 10:20:03', '2020-06-10 11:21:57', '2020-06-10 11:21:57'),
(3, 1, 'British Pound', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 1, '2020-06-10 10:20:03', '2020-06-10 11:21:49', '2020-06-10 11:21:49'),
(4, 1, 'Turkish Lira', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 1, '2020-06-10 10:20:03', '2020-06-10 11:22:09', '2020-06-10 11:22:09'),
(5, 1, 'NGN Naira', 'NGN', 1.00000000, NULL, NULL, 1, NULL, NULL, 1, '2020-06-10 11:23:02', '2020-06-10 11:23:12', '2020-06-10 11:23:12'),
(6, 1, 'Naira', 'NGN', 1.00000000, NULL, NULL, 1, NULL, NULL, 1, '2020-06-10 11:23:38', '2020-06-10 11:23:38', NULL),
(7, 2, 'US Dollar', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(8, 2, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(9, 2, 'British Pound', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(10, 2, 'Turkish Lira', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(11, 3, 'US Dollar', 'USD', 1.00000000, '2', '$', 1, '.', ',', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(12, 3, 'Euro', 'EUR', 1.25000000, '2', '€', 1, ',', '.', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(13, 3, 'British Pound', 'GBP', 1.60000000, '2', '£', 1, '.', ',', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(14, 3, 'Turkish Lira', 'TRY', 0.80000000, '2', '₺', 1, ',', '.', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_dashboards`
--

CREATE TABLE `x1z_dashboards` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_dashboards`
--

INSERT INTO `x1z_dashboards` (`id`, `company_id`, `name`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Dashboard', 1, '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(2, 2, 'Dashboard', 1, '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(3, 3, 'Dashboard', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_email_templates`
--

CREATE TABLE `x1z_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_email_templates`
--

INSERT INTO `x1z_email_templates` (`id`, `company_id`, `alias`, `class`, `name`, `subject`, `body`, `params`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} invoice created', 'Dear {customer_name},<br /><br />We have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(2, 1, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} invoice overdue notice', 'Dear {customer_name},<br /><br />This is an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(3, 1, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} invoice overdue notice', 'Hello,<br /><br />{customer_name} has received an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(4, 1, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} recurring invoice created', 'Dear {customer_name},<br /><br />Based on your recurring circle, we have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(5, 1, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{invoice_number} recurring invoice created', 'Hello,<br /><br />Based on {customer_name} recurring circle, <strong>{invoice_number}</strong> invoice has been automatically created.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(6, 1, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Payment received for {invoice_number} invoice', 'Dear {customer_name},<br /><br />Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br />Amount: <strong>{transaction_total}</strong><br />Date: <strong>{transaction_paid_date}</strong><br />Invoice Number: <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />You can always see the invoice details from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(7, 1, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Payment received for {invoice_number} invoice', 'Hello,<br /><br />{customer_name} recorded a payment for <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(8, 1, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} bill reminding notice', 'Hello,<br /><br />This is a reminding notice for <strong>{bill_number}</strong> bill to {vendor_name}.<br /><br />The bill total is {bill_total} and is due <strong>{bill_due_date}</strong>.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(9, 1, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} recurring bill created', 'Hello,<br /><br />Based on {vendor_name} recurring circle, <strong>{bill_number}</strong> invoice has been automatically created.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(10, 2, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} invoice created', 'Dear {customer_name},<br /><br />We have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(11, 2, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} invoice overdue notice', 'Dear {customer_name},<br /><br />This is an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(12, 2, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} invoice overdue notice', 'Hello,<br /><br />{customer_name} has received an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(13, 2, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} recurring invoice created', 'Dear {customer_name},<br /><br />Based on your recurring circle, we have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(14, 2, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{invoice_number} recurring invoice created', 'Hello,<br /><br />Based on {customer_name} recurring circle, <strong>{invoice_number}</strong> invoice has been automatically created.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(15, 2, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Payment received for {invoice_number} invoice', 'Dear {customer_name},<br /><br />Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br />Amount: <strong>{transaction_total}</strong><br />Date: <strong>{transaction_paid_date}</strong><br />Invoice Number: <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />You can always see the invoice details from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(16, 2, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Payment received for {invoice_number} invoice', 'Hello,<br /><br />{customer_name} recorded a payment for <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(17, 2, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} bill reminding notice', 'Hello,<br /><br />This is a reminding notice for <strong>{bill_number}</strong> bill to {vendor_name}.<br /><br />The bill total is {bill_total} and is due <strong>{bill_due_date}</strong>.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(18, 2, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} recurring bill created', 'Hello,<br /><br />Based on {vendor_name} recurring circle, <strong>{bill_number}</strong> invoice has been automatically created.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(19, 3, 'invoice_new_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_new_customer', '{invoice_number} invoice created', 'Dear {customer_name},<br /><br />We have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(20, 3, 'invoice_remind_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_customer', '{invoice_number} invoice overdue notice', 'Dear {customer_name},<br /><br />This is an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(21, 3, 'invoice_remind_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_remind_admin', '{invoice_number} invoice overdue notice', 'Hello,<br /><br />{customer_name} has received an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(22, 3, 'invoice_recur_customer', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_customer', '{invoice_number} recurring invoice created', 'Dear {customer_name},<br /><br />Based on your recurring circle, we have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(23, 3, 'invoice_recur_admin', 'App\\Notifications\\Sale\\Invoice', 'settings.email.templates.invoice_recur_admin', '{invoice_number} recurring invoice created', 'Hello,<br /><br />Based on {customer_name} recurring circle, <strong>{invoice_number}</strong> invoice has been automatically created.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(24, 3, 'invoice_payment_customer', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_customer', 'Payment received for {invoice_number} invoice', 'Dear {customer_name},<br /><br />Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br />Amount: <strong>{transaction_total}</strong><br />Date: <strong>{transaction_paid_date}</strong><br />Invoice Number: <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />You can always see the invoice details from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us for any question.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(25, 3, 'invoice_payment_admin', 'App\\Notifications\\Portal\\PaymentReceived', 'settings.email.templates.invoice_payment_admin', 'Payment received for {invoice_number} invoice', 'Hello,<br /><br />{customer_name} recorded a payment for <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(26, 3, 'bill_remind_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_remind_admin', '{bill_number} bill reminding notice', 'Hello,<br /><br />This is a reminding notice for <strong>{bill_number}</strong> bill to {vendor_name}.<br /><br />The bill total is {bill_total} and is due <strong>{bill_due_date}</strong>.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(27, 3, 'bill_recur_admin', 'App\\Notifications\\Purchase\\Bill', 'settings.email.templates.bill_recur_admin', '{bill_number} recurring bill created', 'Hello,<br /><br />Based on {vendor_name} recurring circle, <strong>{bill_number}</strong> invoice has been automatically created.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}', NULL, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_failed_jobs`
--

CREATE TABLE `x1z_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_firewall_ips`
--

CREATE TABLE `x1z_firewall_ips` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_id` int(11) DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_firewall_logs`
--

CREATE TABLE `x1z_firewall_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `middleware` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_invoices`
--

CREATE TABLE `x1z_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `contact_id` int(11) NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_invoice_histories`
--

CREATE TABLE `x1z_invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_invoice_items`
--

CREATE TABLE `x1z_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `total` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_rate` double(15,4) NOT NULL DEFAULT 0.0000,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_invoice_item_taxes`
--

CREATE TABLE `x1z_invoice_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_invoice_totals`
--

CREATE TABLE `x1z_invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_items`
--

CREATE TABLE `x1z_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` double(15,4) NOT NULL,
  `purchase_price` double(15,4) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_jobs`
--

CREATE TABLE `x1z_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_media`
--

CREATE TABLE `x1z_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(121) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_media`
--

INSERT INTO `x1z_media` (`id`, `disk`, `directory`, `filename`, `extension`, `mime_type`, `aggregate_type`, `size`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'uploads', '1/settings', 'web dev', 'png', 'image/png', 'image', 21088, '2020-06-10 11:21:22', '2020-06-10 11:21:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_mediables`
--

CREATE TABLE `x1z_mediables` (
  `media_id` int(10) UNSIGNED NOT NULL,
  `mediable_type` varchar(152) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_mediables`
--

INSERT INTO `x1z_mediables` (`media_id`, `mediable_type`, `mediable_id`, `tag`, `order`) VALUES
(1, 'App\\Models\\Common\\Company', 1, 'logo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_migrations`
--

CREATE TABLE `x1z_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_migrations`
--

INSERT INTO `x1z_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_14_000000_core_v1', 1),
(2, '2020_01_08_000000_core_v200', 1),
(3, '2020_03_20_183732_core_v208', 1);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_modules`
--

CREATE TABLE `x1z_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_modules`
--

INSERT INTO `x1z_modules` (`id`, `company_id`, `alias`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offline-payments', 1, '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(2, 1, 'paypal-standard', 1, '2020-06-10 10:20:04', '2020-06-10 10:20:04', NULL),
(3, 2, 'offline-payments', 1, '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(4, 2, 'paypal-standard', 1, '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(5, 3, 'offline-payments', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(6, 3, 'paypal-standard', 1, '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_module_histories`
--

CREATE TABLE `x1z_module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_module_histories`
--

INSERT INTO `x1z_module_histories` (`id`, `company_id`, `module_id`, `category`, `version`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'payment-method', '2.0.0', 'offline-payments installed', '2020-06-10 10:20:03', '2020-06-10 10:20:03', NULL),
(2, 1, 2, 'payment-method', '2.0.0', 'paypal-standard installed', '2020-06-10 10:20:04', '2020-06-10 10:20:04', NULL),
(3, 2, 3, 'payment-method', '2.0.0', 'offline-payments installed', '2020-06-10 11:41:38', '2020-06-10 11:41:38', NULL),
(4, 2, 4, 'payment-method', '2.0.0', 'paypal-standard installed', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(5, 3, 5, 'payment-method', '2.0.0', 'offline-payments installed', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(6, 3, 6, 'payment-method', '2.0.0', 'paypal-standard installed', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_notifications`
--

CREATE TABLE `x1z_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_password_resets`
--

CREATE TABLE `x1z_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_permissions`
--

CREATE TABLE `x1z_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_permissions`
--

INSERT INTO `x1z_permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(2, 'read-api', 'Read Api', 'Read Api', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(3, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(4, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(5, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(6, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(7, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(8, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(9, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(10, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(11, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(12, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(13, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(14, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(15, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(16, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(17, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(18, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(19, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(20, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(21, 'create-banking-reconciliations', 'Create Banking Reconciliations', 'Create Banking Reconciliations', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(22, 'read-banking-reconciliations', 'Read Banking Reconciliations', 'Read Banking Reconciliations', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(23, 'update-banking-reconciliations', 'Update Banking Reconciliations', 'Update Banking Reconciliations', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(24, 'delete-banking-reconciliations', 'Delete Banking Reconciliations', 'Delete Banking Reconciliations', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(25, 'create-banking-transactions', 'Create Banking Transactions', 'Create Banking Transactions', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(26, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(27, 'update-banking-transactions', 'Update Banking Transactions', 'Update Banking Transactions', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(28, 'delete-banking-transactions', 'Delete Banking Transactions', 'Delete Banking Transactions', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(29, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(30, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(31, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(32, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(33, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(34, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(35, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(36, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(37, 'create-common-dashboards', 'Create Common Dashboards', 'Create Common Dashboards', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(38, 'read-common-dashboards', 'Read Common Dashboards', 'Read Common Dashboards', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(39, 'update-common-dashboards', 'Update Common Dashboards', 'Update Common Dashboards', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(40, 'delete-common-dashboards', 'Delete Common Dashboards', 'Delete Common Dashboards', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(41, 'create-common-import', 'Create Common Import', 'Create Common Import', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(42, 'create-common-items', 'Create Common Items', 'Create Common Items', '2020-06-10 10:18:44', '2020-06-10 10:18:44'),
(43, 'read-common-items', 'Read Common Items', 'Read Common Items', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(44, 'update-common-items', 'Update Common Items', 'Update Common Items', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(45, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(46, 'create-common-notifications', 'Create Common Notifications', 'Create Common Notifications', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(47, 'read-common-notifications', 'Read Common Notifications', 'Read Common Notifications', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(48, 'update-common-notifications', 'Update Common Notifications', 'Update Common Notifications', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(49, 'delete-common-notifications', 'Delete Common Notifications', 'Delete Common Notifications', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(50, 'create-common-reports', 'Create Common Reports', 'Create Common Reports', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(51, 'read-common-reports', 'Read Common Reports', 'Read Common Reports', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(52, 'update-common-reports', 'Update Common Reports', 'Update Common Reports', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(53, 'delete-common-reports', 'Delete Common Reports', 'Delete Common Reports', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(54, 'read-common-search', 'Read Common Search', 'Read Common Search', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(55, 'read-common-uploads', 'Read Common Uploads', 'Read Common Uploads', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(56, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(57, 'create-common-widgets', 'Create Common Widgets', 'Create Common Widgets', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(58, 'read-common-widgets', 'Read Common Widgets', 'Read Common Widgets', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(59, 'update-common-widgets', 'Update Common Widgets', 'Update Common Widgets', '2020-06-10 10:18:45', '2020-06-10 10:18:45'),
(60, 'delete-common-widgets', 'Delete Common Widgets', 'Delete Common Widgets', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(61, 'create-purchases-bills', 'Create Purchases Bills', 'Create Purchases Bills', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(62, 'read-purchases-bills', 'Read Purchases Bills', 'Read Purchases Bills', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(63, 'update-purchases-bills', 'Update Purchases Bills', 'Update Purchases Bills', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(64, 'delete-purchases-bills', 'Delete Purchases Bills', 'Delete Purchases Bills', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(65, 'create-purchases-payments', 'Create Purchases Payments', 'Create Purchases Payments', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(66, 'read-purchases-payments', 'Read Purchases Payments', 'Read Purchases Payments', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(67, 'update-purchases-payments', 'Update Purchases Payments', 'Update Purchases Payments', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(68, 'delete-purchases-payments', 'Delete Purchases Payments', 'Delete Purchases Payments', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(69, 'create-purchases-vendors', 'Create Purchases Vendors', 'Create Purchases Vendors', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(70, 'read-purchases-vendors', 'Read Purchases Vendors', 'Read Purchases Vendors', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(71, 'update-purchases-vendors', 'Update Purchases Vendors', 'Update Purchases Vendors', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(72, 'delete-purchases-vendors', 'Delete Purchases Vendors', 'Delete Purchases Vendors', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(73, 'create-sales-customers', 'Create Sales Customers', 'Create Sales Customers', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(74, 'read-sales-customers', 'Read Sales Customers', 'Read Sales Customers', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(75, 'update-sales-customers', 'Update Sales Customers', 'Update Sales Customers', '2020-06-10 10:18:46', '2020-06-10 10:18:46'),
(76, 'delete-sales-customers', 'Delete Sales Customers', 'Delete Sales Customers', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(77, 'create-sales-invoices', 'Create Sales Invoices', 'Create Sales Invoices', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(78, 'read-sales-invoices', 'Read Sales Invoices', 'Read Sales Invoices', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(79, 'update-sales-invoices', 'Update Sales Invoices', 'Update Sales Invoices', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(80, 'delete-sales-invoices', 'Delete Sales Invoices', 'Delete Sales Invoices', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(81, 'create-sales-revenues', 'Create Sales Revenues', 'Create Sales Revenues', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(82, 'read-sales-revenues', 'Read Sales Revenues', 'Read Sales Revenues', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(83, 'update-sales-revenues', 'Update Sales Revenues', 'Update Sales Revenues', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(84, 'delete-sales-revenues', 'Delete Sales Revenues', 'Delete Sales Revenues', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(85, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(86, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(87, 'create-modules-api-key', 'Create Modules Api Key', 'Create Modules Api Key', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(88, 'update-modules-api-key', 'Update Modules Api Key', 'Update Modules Api Key', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(89, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2020-06-10 10:18:47', '2020-06-10 10:18:47'),
(90, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(91, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(92, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(93, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(94, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(95, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(96, 'read-notifications', 'Read Notifications', 'Read Notifications', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(97, 'update-notifications', 'Update Notifications', 'Update Notifications', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(98, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(99, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(100, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2020-06-10 10:18:48', '2020-06-10 10:18:48'),
(101, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(102, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(103, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(104, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(105, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(106, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(107, 'read-settings-company', 'Read Settings Company', 'Read Settings Company', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(108, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(109, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(110, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(111, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2020-06-10 10:18:49', '2020-06-10 10:18:49'),
(112, 'read-settings-defaults', 'Read Settings Defaults', 'Read Settings Defaults', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(113, 'read-settings-email', 'Read Settings Email', 'Read Settings Email', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(114, 'read-settings-invoice', 'Read Settings Invoice', 'Read Settings Invoice', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(115, 'read-settings-localisation', 'Read Settings Localisation', 'Read Settings Localisation', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(116, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(117, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(118, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(119, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(120, 'read-settings-schedule', 'Read Settings Schedule', 'Read Settings Schedule', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(121, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2020-06-10 10:18:50', '2020-06-10 10:18:50'),
(122, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(123, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(124, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(125, 'read-widgets-account-balance', 'Read Widgets Account Balance', 'Read Widgets Account Balance', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(126, 'read-widgets-cash-flow', 'Read Widgets Cash Flow', 'Read Widgets Cash Flow', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(127, 'read-widgets-expenses-by-category', 'Read Widgets Expenses By Category', 'Read Widgets Expenses By Category', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(128, 'read-widgets-income-by-category', 'Read Widgets Income By Category', 'Read Widgets Income By Category', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(129, 'read-widgets-latest-expenses', 'Read Widgets Latest Expenses', 'Read Widgets Latest Expenses', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(130, 'read-widgets-latest-income', 'Read Widgets Latest Income', 'Read Widgets Latest Income', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(131, 'read-widgets-total-expenses', 'Read Widgets Total Expenses', 'Read Widgets Total Expenses', '2020-06-10 10:18:51', '2020-06-10 10:18:51'),
(132, 'read-widgets-total-income', 'Read Widgets Total Income', 'Read Widgets Total Income', '2020-06-10 10:18:52', '2020-06-10 10:18:52'),
(133, 'read-widgets-total-profit', 'Read Widgets Total Profit', 'Read Widgets Total Profit', '2020-06-10 10:18:52', '2020-06-10 10:18:52'),
(134, 'read-client-portal', 'Read Client Portal', 'Read Client Portal', '2020-06-10 10:18:58', '2020-06-10 10:18:58'),
(135, 'read-portal-invoices', 'Read Portal Invoices', 'Read Portal Invoices', '2020-06-10 10:18:58', '2020-06-10 10:18:58'),
(136, 'update-portal-invoices', 'Update Portal Invoices', 'Update Portal Invoices', '2020-06-10 10:18:58', '2020-06-10 10:18:58'),
(137, 'read-portal-payments', 'Read Portal Payments', 'Read Portal Payments', '2020-06-10 10:18:58', '2020-06-10 10:18:58'),
(138, 'update-portal-payments', 'Update Portal Payments', 'Update Portal Payments', '2020-06-10 10:18:58', '2020-06-10 10:18:58'),
(139, 'read-portal-profile', 'Read Portal Profile', 'Read Portal Profile', '2020-06-10 10:18:58', '2020-06-10 10:18:58'),
(140, 'update-portal-profile', 'Update Portal Profile', 'Update Portal Profile', '2020-06-10 10:18:58', '2020-06-10 10:18:58'),
(141, 'read-offline-payments-settings', 'Read Offline Payments Settings', 'Read Offline Payments Settings', '2020-06-10 10:20:04', '2020-06-10 10:20:04'),
(142, 'update-offline-payments-settings', 'Update Offline Payments Settings', 'Update Offline Payments Settings', '2020-06-10 10:20:04', '2020-06-10 10:20:04'),
(143, 'delete-offline-payments-settings', 'Delete Offline Payments Settings', 'Delete Offline Payments Settings', '2020-06-10 10:20:04', '2020-06-10 10:20:04'),
(144, 'read-paypal-standard-settings', 'Read PayPal Standard Settings', 'Read PayPal Standard Settings', '2020-06-10 10:20:04', '2020-06-10 10:20:04'),
(145, 'update-paypal-standard-settings', 'Update PayPal Standard Settings', 'Update PayPal Standard Settings', '2020-06-10 10:20:04', '2020-06-10 10:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `x1z_reconciliations`
--

CREATE TABLE `x1z_reconciliations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT 0.0000,
  `reconciled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_recurring`
--

CREATE TABLE `x1z_recurring` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurable_id` bigint(20) UNSIGNED NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_reports`
--

CREATE TABLE `x1z_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_reports`
--

INSERT INTO `x1z_reports` (`id`, `company_id`, `class`, `name`, `description`, `settings`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 10:20:04', '2020-06-10 10:20:04', NULL),
(2, 1, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 10:20:04', '2020-06-10 10:20:04', NULL),
(3, 1, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 10:20:04', '2020-06-10 10:20:04', NULL),
(4, 1, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2020-06-10 10:20:04', '2020-06-10 10:20:04', NULL),
(5, 1, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2020-06-10 10:20:04', '2020-06-10 10:20:04', NULL),
(6, 2, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(7, 2, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(8, 2, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(9, 2, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(10, 2, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(11, 3, 'App\\Reports\\IncomeSummary', 'Income Summary', 'Monthly income summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(12, 3, 'App\\Reports\\ExpenseSummary', 'Expense Summary', 'Monthly expense summary by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(13, 3, 'App\\Reports\\IncomeExpenseSummary', 'Income vs Expense', 'Monthly income vs expense by category.', '{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\",\"chart\":\"line\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(14, 3, 'App\\Reports\\ProfitLoss', 'Profit & Loss', 'Quarterly profit & loss by category.', '{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(15, 3, 'App\\Reports\\TaxSummary', 'Tax Summary', 'Quarterly tax summary.', '{\"period\":\"quarterly\",\"basis\":\"accrual\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_roles`
--

CREATE TABLE `x1z_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_roles`
--

INSERT INTO `x1z_roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2020-06-10 10:18:43', '2020-06-10 10:18:43'),
(2, 'manager', 'Manager', 'Manager', '2020-06-10 10:18:52', '2020-06-10 10:18:52'),
(3, 'customer', 'Customer', 'Customer', '2020-06-10 10:18:58', '2020-06-10 10:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `x1z_role_permissions`
--

CREATE TABLE `x1z_role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_role_permissions`
--

INSERT INTO `x1z_role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(2, 1),
(2, 7),
(2, 8),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 131),
(2, 132),
(2, 133),
(2, 141),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(3, 134),
(3, 135),
(3, 136),
(3, 137),
(3, 138),
(3, 139),
(3, 140);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_sessions`
--

CREATE TABLE `x1z_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_settings`
--

CREATE TABLE `x1z_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_settings`
--

INSERT INTO `x1z_settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'default.account', '1'),
(2, 1, 'default.payment_method', 'offline-payments.cash.1'),
(3, 1, 'default.list_limit', '25'),
(4, 1, 'default.use_gravatar', '1'),
(5, 1, 'default.currency', 'NGN'),
(6, 1, 'default.locale', 'en-GB'),
(7, 1, 'localisation.financial_start', '01-01'),
(8, 1, 'localisation.timezone', 'Europe/London'),
(9, 1, 'localisation.date_format', 'd M Y'),
(10, 1, 'localisation.date_separator', 'space'),
(11, 1, 'localisation.percent_position', 'after'),
(12, 1, 'invoice.number_prefix', 'INV-'),
(13, 1, 'invoice.number_digit', '5'),
(14, 1, 'invoice.number_next', '1'),
(15, 1, 'invoice.item_name', 'settings.invoice.item'),
(16, 1, 'invoice.price_name', 'settings.invoice.price'),
(17, 1, 'invoice.quantity_name', 'settings.invoice.quantity'),
(18, 1, 'invoice.title', 'Invoice'),
(19, 1, 'invoice.payment_terms', '0'),
(20, 1, 'invoice.template', 'default'),
(21, 1, 'invoice.color', '#55588b'),
(22, 1, 'email.protocol', 'mail'),
(23, 1, 'email.sendmail_path', '/usr/sbin/sendmail -bs'),
(24, 1, 'schedule.send_invoice_reminder', '0'),
(25, 1, 'schedule.invoice_days', '1,3,5,10'),
(26, 1, 'schedule.send_bill_reminder', '0'),
(27, 1, 'schedule.bill_days', '10,5,3,1'),
(28, 1, 'schedule.time', '09:00'),
(29, 1, 'wizard.completed', '1'),
(30, 1, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]'),
(31, 1, 'contact.type.customer', 'customer'),
(32, 1, 'contact.type.vendor', 'vendor'),
(33, 1, 'company.name', 'Sales Tech'),
(34, 1, 'company.email', 'info@example.com'),
(35, 1, 'company.address', 'Niger Delta, Nigeria'),
(37, 1, 'company.logo', '1'),
(39, 1, 'default.tax', NULL),
(40, 2, 'default.account', '2'),
(41, 2, 'default.payment_method', 'offline-payments.cash.1'),
(42, 2, 'default.list_limit', '25'),
(43, 2, 'default.use_gravatar', '0'),
(44, 2, 'default.currency', 'USD'),
(45, 2, 'default.locale', 'en-GB'),
(46, 2, 'localisation.financial_start', '01-01'),
(47, 2, 'localisation.timezone', 'Europe/London'),
(48, 2, 'localisation.date_format', 'd M Y'),
(49, 2, 'localisation.date_separator', 'space'),
(50, 2, 'localisation.percent_position', 'after'),
(51, 2, 'invoice.number_prefix', 'INV-'),
(52, 2, 'invoice.number_digit', '5'),
(53, 2, 'invoice.number_next', '1'),
(54, 2, 'invoice.item_name', 'settings.invoice.item'),
(55, 2, 'invoice.price_name', 'settings.invoice.price'),
(56, 2, 'invoice.quantity_name', 'settings.invoice.quantity'),
(57, 2, 'invoice.title', 'Invoice'),
(58, 2, 'invoice.payment_terms', '0'),
(59, 2, 'invoice.template', 'default'),
(60, 2, 'invoice.color', '#55588b'),
(61, 2, 'email.protocol', 'mail'),
(62, 2, 'email.sendmail_path', '/usr/sbin/sendmail -bs'),
(63, 2, 'schedule.send_invoice_reminder', '0'),
(64, 2, 'schedule.invoice_days', '1,3,5,10'),
(65, 2, 'schedule.send_bill_reminder', '0'),
(66, 2, 'schedule.bill_days', '10,5,3,1'),
(67, 2, 'schedule.time', '09:00'),
(68, 2, 'wizard.completed', '0'),
(69, 2, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]'),
(70, 2, 'contact.type.customer', 'customer'),
(71, 2, 'contact.type.vendor', 'vendor'),
(72, 2, 'company.name', 'Medicine Shop'),
(73, 2, 'company.email', 'medicine@example.com'),
(74, 2, 'company.address', 'Niger Delta, Nigeria'),
(75, 3, 'default.account', '3'),
(76, 3, 'default.payment_method', 'offline-payments.cash.1'),
(77, 3, 'default.list_limit', '25'),
(78, 3, 'default.use_gravatar', '0'),
(79, 3, 'default.currency', 'USD'),
(80, 3, 'default.locale', 'en-GB'),
(81, 3, 'localisation.financial_start', '01-01'),
(82, 3, 'localisation.timezone', 'Europe/London'),
(83, 3, 'localisation.date_format', 'd M Y'),
(84, 3, 'localisation.date_separator', 'space'),
(85, 3, 'localisation.percent_position', 'after'),
(86, 3, 'invoice.number_prefix', 'INV-'),
(87, 3, 'invoice.number_digit', '5'),
(88, 3, 'invoice.number_next', '1'),
(89, 3, 'invoice.item_name', 'settings.invoice.item'),
(90, 3, 'invoice.price_name', 'settings.invoice.price'),
(91, 3, 'invoice.quantity_name', 'settings.invoice.quantity'),
(92, 3, 'invoice.title', 'Invoice'),
(93, 3, 'invoice.payment_terms', '0'),
(94, 3, 'invoice.template', 'default'),
(95, 3, 'invoice.color', '#55588b'),
(96, 3, 'email.protocol', 'mail'),
(97, 3, 'email.sendmail_path', '/usr/sbin/sendmail -bs'),
(98, 3, 'schedule.send_invoice_reminder', '0'),
(99, 3, 'schedule.invoice_days', '1,3,5,10'),
(100, 3, 'schedule.send_bill_reminder', '0'),
(101, 3, 'schedule.bill_days', '10,5,3,1'),
(102, 3, 'schedule.time', '09:00'),
(103, 3, 'wizard.completed', '0'),
(104, 3, 'offline-payments.methods', '[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]'),
(105, 3, 'contact.type.customer', 'customer'),
(106, 3, 'contact.type.vendor', 'vendor'),
(107, 3, 'company.name', 'Branding'),
(108, 3, 'company.email', 'branding@example.com'),
(109, 3, 'company.address', 'Niger Delta, Nigeria');

-- --------------------------------------------------------

--
-- Table structure for table `x1z_taxes`
--

CREATE TABLE `x1z_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_transactions`
--

CREATE TABLE `x1z_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `account_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `reconciled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_transfers`
--

CREATE TABLE `x1z_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `expense_transaction_id` int(11) NOT NULL,
  `income_transaction_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_users`
--

CREATE TABLE `x1z_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB',
  `landing_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT 'dashboard',
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_users`
--

INSERT INTO `x1z_users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `locale`, `landing_page`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 'admin@admin.com', '$2y$10$pdFKTrJjEp2pBHsWjSC9uOZXnjaZgJOH66ahyEHRCJGazQP9t8RKq', NULL, '2020-06-10 10:20:17', 'en-GB', 'dashboard', 1, '2020-06-10 10:20:05', '2020-06-10 10:20:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `x1z_user_companies`
--

CREATE TABLE `x1z_user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_user_companies`
--

INSERT INTO `x1z_user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users'),
(1, 2, 'users'),
(1, 3, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `x1z_user_dashboards`
--

CREATE TABLE `x1z_user_dashboards` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `dashboard_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_user_dashboards`
--

INSERT INTO `x1z_user_dashboards` (`user_id`, `dashboard_id`, `user_type`) VALUES
(1, 1, 'users'),
(1, 2, 'users'),
(1, 3, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `x1z_user_permissions`
--

CREATE TABLE `x1z_user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `x1z_user_roles`
--

CREATE TABLE `x1z_user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_user_roles`
--

INSERT INTO `x1z_user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `x1z_widgets`
--

CREATE TABLE `x1z_widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `dashboard_id` int(11) NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `x1z_widgets`
--

INSERT INTO `x1z_widgets` (`id`, `company_id`, `dashboard_id`, `class`, `name`, `sort`, `settings`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(2, 1, 1, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(3, 1, 1, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(4, 1, 1, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(5, 1, 1, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(6, 1, 1, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(7, 1, 1, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(8, 1, 1, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(9, 1, 1, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', '2020-06-10 10:20:05', '2020-06-10 10:20:05', NULL),
(10, 2, 2, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(11, 2, 2, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(12, 2, 2, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(13, 2, 2, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(14, 2, 2, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(15, 2, 2, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(16, 2, 2, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(17, 2, 2, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(18, 2, 2, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', '2020-06-10 11:41:39', '2020-06-10 11:41:39', NULL),
(19, 3, 3, 'App\\Widgets\\TotalIncome', 'Total Income', 1, '{\"width\":\"col-md-4\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(20, 3, 3, 'App\\Widgets\\TotalExpenses', 'Total Expenses', 2, '{\"width\":\"col-md-4\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(21, 3, 3, 'App\\Widgets\\TotalProfit', 'Total Profit', 3, '{\"width\":\"col-md-4\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(22, 3, 3, 'App\\Widgets\\CashFlow', 'Cash Flow', 4, '{\"width\":\"col-md-12\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(23, 3, 3, 'App\\Widgets\\IncomeByCategory', 'Income By Category', 5, '{\"width\":\"col-md-6\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(24, 3, 3, 'App\\Widgets\\ExpensesByCategory', 'Expenses By Category', 6, '{\"width\":\"col-md-6\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(25, 3, 3, 'App\\Widgets\\AccountBalance', 'Account Balance', 7, '{\"width\":\"col-md-4\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(26, 3, 3, 'App\\Widgets\\LatestIncome', 'Latest Income', 8, '{\"width\":\"col-md-4\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL),
(27, 3, 3, 'App\\Widgets\\LatestExpenses', 'Latest Expenses', 9, '{\"width\":\"col-md-4\"}', '2020-06-10 11:42:38', '2020-06-10 11:42:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `x1z_accounts`
--
ALTER TABLE `x1z_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_accounts_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_bills`
--
ALTER TABLE `x1z_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `x1z_bills_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_bill_histories`
--
ALTER TABLE `x1z_bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_bill_histories_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_bill_items`
--
ALTER TABLE `x1z_bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_bill_items_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_bill_item_taxes`
--
ALTER TABLE `x1z_bill_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_bill_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_bill_totals`
--
ALTER TABLE `x1z_bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_bill_totals_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_categories`
--
ALTER TABLE `x1z_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_categories_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_companies`
--
ALTER TABLE `x1z_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `x1z_contacts`
--
ALTER TABLE `x1z_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_contacts_company_id_type_email_deleted_at_unique` (`company_id`,`type`,`email`,`deleted_at`),
  ADD KEY `x1z_contacts_company_id_type_index` (`company_id`,`type`);

--
-- Indexes for table `x1z_currencies`
--
ALTER TABLE `x1z_currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `x1z_currencies_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_dashboards`
--
ALTER TABLE `x1z_dashboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_dashboards_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_email_templates`
--
ALTER TABLE `x1z_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_email_templates_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `x1z_email_templates_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_failed_jobs`
--
ALTER TABLE `x1z_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `x1z_firewall_ips`
--
ALTER TABLE `x1z_firewall_ips`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_firewall_ips_ip_deleted_at_unique` (`ip`,`deleted_at`),
  ADD KEY `x1z_firewall_ips_ip_index` (`ip`);

--
-- Indexes for table `x1z_firewall_logs`
--
ALTER TABLE `x1z_firewall_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_firewall_logs_ip_index` (`ip`);

--
-- Indexes for table `x1z_invoices`
--
ALTER TABLE `x1z_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `x1z_invoices_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_invoice_histories`
--
ALTER TABLE `x1z_invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_invoice_histories_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_invoice_items`
--
ALTER TABLE `x1z_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_invoice_items_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_invoice_item_taxes`
--
ALTER TABLE `x1z_invoice_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_invoice_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_invoice_totals`
--
ALTER TABLE `x1z_invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_invoice_totals_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_items`
--
ALTER TABLE `x1z_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_items_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_jobs`
--
ALTER TABLE `x1z_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `x1z_media`
--
ALTER TABLE `x1z_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  ADD KEY `x1z_media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `x1z_media_aggregate_type_index` (`aggregate_type`);

--
-- Indexes for table `x1z_mediables`
--
ALTER TABLE `x1z_mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `x1z_mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `x1z_mediables_tag_index` (`tag`),
  ADD KEY `x1z_mediables_order_index` (`order`);

--
-- Indexes for table `x1z_migrations`
--
ALTER TABLE `x1z_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `x1z_modules`
--
ALTER TABLE `x1z_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `x1z_modules_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_module_histories`
--
ALTER TABLE `x1z_module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `x1z_notifications`
--
ALTER TABLE `x1z_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `x1z_password_resets`
--
ALTER TABLE `x1z_password_resets`
  ADD KEY `x1z_password_resets_email_index` (`email`);

--
-- Indexes for table `x1z_permissions`
--
ALTER TABLE `x1z_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_permissions_name_unique` (`name`);

--
-- Indexes for table `x1z_reconciliations`
--
ALTER TABLE `x1z_reconciliations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_reconciliations_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_recurring`
--
ALTER TABLE `x1z_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_recurring_recurable_type_recurable_id_index` (`recurable_type`,`recurable_id`),
  ADD KEY `x1z_recurring_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_reports`
--
ALTER TABLE `x1z_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_reports_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_roles`
--
ALTER TABLE `x1z_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_roles_name_unique` (`name`);

--
-- Indexes for table `x1z_role_permissions`
--
ALTER TABLE `x1z_role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `x1z_role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `x1z_sessions`
--
ALTER TABLE `x1z_sessions`
  ADD UNIQUE KEY `x1z_sessions_id_unique` (`id`);

--
-- Indexes for table `x1z_settings`
--
ALTER TABLE `x1z_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `x1z_settings_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_taxes`
--
ALTER TABLE `x1z_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_transactions`
--
ALTER TABLE `x1z_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_transactions_company_id_type_index` (`company_id`,`type`);

--
-- Indexes for table `x1z_transfers`
--
ALTER TABLE `x1z_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_transfers_company_id_index` (`company_id`);

--
-- Indexes for table `x1z_users`
--
ALTER TABLE `x1z_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `x1z_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `x1z_user_companies`
--
ALTER TABLE `x1z_user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `x1z_user_dashboards`
--
ALTER TABLE `x1z_user_dashboards`
  ADD PRIMARY KEY (`user_id`,`dashboard_id`,`user_type`);

--
-- Indexes for table `x1z_user_permissions`
--
ALTER TABLE `x1z_user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `x1z_user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `x1z_user_roles`
--
ALTER TABLE `x1z_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `x1z_user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `x1z_widgets`
--
ALTER TABLE `x1z_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `x1z_widgets_company_id_dashboard_id_index` (`company_id`,`dashboard_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `x1z_accounts`
--
ALTER TABLE `x1z_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `x1z_bills`
--
ALTER TABLE `x1z_bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_bill_histories`
--
ALTER TABLE `x1z_bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_bill_items`
--
ALTER TABLE `x1z_bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_bill_item_taxes`
--
ALTER TABLE `x1z_bill_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_bill_totals`
--
ALTER TABLE `x1z_bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_categories`
--
ALTER TABLE `x1z_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `x1z_companies`
--
ALTER TABLE `x1z_companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `x1z_contacts`
--
ALTER TABLE `x1z_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_currencies`
--
ALTER TABLE `x1z_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `x1z_dashboards`
--
ALTER TABLE `x1z_dashboards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `x1z_email_templates`
--
ALTER TABLE `x1z_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `x1z_failed_jobs`
--
ALTER TABLE `x1z_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_firewall_ips`
--
ALTER TABLE `x1z_firewall_ips`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_firewall_logs`
--
ALTER TABLE `x1z_firewall_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_invoices`
--
ALTER TABLE `x1z_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_invoice_histories`
--
ALTER TABLE `x1z_invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_invoice_items`
--
ALTER TABLE `x1z_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_invoice_item_taxes`
--
ALTER TABLE `x1z_invoice_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_invoice_totals`
--
ALTER TABLE `x1z_invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_items`
--
ALTER TABLE `x1z_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_jobs`
--
ALTER TABLE `x1z_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_media`
--
ALTER TABLE `x1z_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `x1z_migrations`
--
ALTER TABLE `x1z_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `x1z_modules`
--
ALTER TABLE `x1z_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `x1z_module_histories`
--
ALTER TABLE `x1z_module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `x1z_permissions`
--
ALTER TABLE `x1z_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `x1z_reconciliations`
--
ALTER TABLE `x1z_reconciliations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_recurring`
--
ALTER TABLE `x1z_recurring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_reports`
--
ALTER TABLE `x1z_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `x1z_roles`
--
ALTER TABLE `x1z_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `x1z_settings`
--
ALTER TABLE `x1z_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `x1z_taxes`
--
ALTER TABLE `x1z_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_transactions`
--
ALTER TABLE `x1z_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_transfers`
--
ALTER TABLE `x1z_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `x1z_users`
--
ALTER TABLE `x1z_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `x1z_widgets`
--
ALTER TABLE `x1z_widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `x1z_mediables`
--
ALTER TABLE `x1z_mediables`
  ADD CONSTRAINT `x1z_mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `x1z_media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `x1z_role_permissions`
--
ALTER TABLE `x1z_role_permissions`
  ADD CONSTRAINT `x1z_role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `x1z_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `x1z_role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `x1z_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `x1z_user_permissions`
--
ALTER TABLE `x1z_user_permissions`
  ADD CONSTRAINT `x1z_user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `x1z_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `x1z_user_roles`
--
ALTER TABLE `x1z_user_roles`
  ADD CONSTRAINT `x1z_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `x1z_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
