CREATE DATABASE idm;
USE idm

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-db
-- Creato il: Apr 24, 2024 alle 02:18
-- Versione del server: 8.3.0
-- Versione PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `idm`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `authzforce`
--

CREATE TABLE `authzforce` (
  `az_domain` varchar(255) NOT NULL,
  `policy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `version` int DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `auth_token`
--

CREATE TABLE `auth_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `user_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `pep_proxy_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `auth_token`
--

INSERT INTO `auth_token` (`access_token`, `expires`, `valid`, `user_id`, `pep_proxy_id`) VALUES
('3f293fe3-b50b-439b-8285-84ac832174a5', '2024-04-24 01:59:47', 1, NULL, 'pep_proxy_00000000-0000-0000-0000-000000000000'),
('51f2e380-c959-4dee-a0af-380f730137c3', '2036-07-30 13:02:37', 1, 'admin', NULL),
('691404c9-c48c-4aa9-a818-6a3d5064dcb2', '2024-04-24 01:59:47', 1, NULL, 'pep_proxy_00000000-0000-0000-0000-000000000000'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2036-07-30 12:04:45', 1, 'aaaaaaaa-good-0000-0000-000000000000', NULL),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '2036-07-30 12:38:13', 1, 'bbbbbbbb-good-0000-0000-000000000000', NULL),
('cccccccc-cccc-cccc-cccc-cccccccccccc', '2036-07-31 09:36:13', 1, 'cccccccc-good-0000-0000-000000000000', NULL),
('xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx', '2099-12-31 23:59:59', 1, 'xxxxxxxx-good-0000-0000-000000000000', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `delegation_evidence`
--

CREATE TABLE `delegation_evidence` (
  `policy_issuer` varchar(255) NOT NULL,
  `access_subject` varchar(255) NOT NULL,
  `policy` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `eidas_credentials`
--

CREATE TABLE `eidas_credentials` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `support_contact_person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_contact_person_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_contact_person_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_contact_person_telephone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_contact_person_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_contact_person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_contact_person_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_contact_person_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_contact_person_telephone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_contact_person_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `organization_nif` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sp_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `iot`
--

CREATE TABLE `iot` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `iot`
--

INSERT INTO `iot` (`id`, `password`, `salt`, `oauth_client_id`) VALUES
('iot_sensor_00000000-0000-0000-0000-000000000000', 'e9f7c64ec2895eec281f8fd36e588d1bc762bcca', NULL, 'tutorial-dckr-site-0000-xpresswebapp');

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_access_token`
--

CREATE TABLE `oauth_access_token` (
  `access_token` text NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  `hash` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `oauth_access_token`
--

INSERT INTO `oauth_access_token` (`access_token`, `expires`, `scope`, `refresh_token`, `valid`, `extra`, `oauth_client_id`, `user_id`, `iot_id`, `authorization_code`, `hash`) VALUES
('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'alice', NULL, NULL, '12661599e24923dc17384a28644fbd2c0e30fa1cc7295772470d22729b054c8b'),
('d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1d1', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'd1d1d1d1-dddd-dddd-dddd-d1d1d1d1d1d1', 'detective1', NULL, NULL, '18a4605f12def28bbbbab7bbef23fe6e204d73432d9aee8514fc168037945221'),
('d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2d2', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'd2d2d2d2-dddd-dddd-dddd-d2d2d2d2d2d2', 'detective2', NULL, NULL, '1df5d6346470cc81d7a533f67a8399c052b5fc608b94972557138e10a335c5e1'),
('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx', 'zelda', NULL, NULL, '3382fdb63eade43fd82ca52b3d352d8475ad98d471ac48cc6e25b8203444e108'),
('m2m2m2m2m2m2m2m2m2m2m2m2m2m2m2m2m2m2m2m2', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'm2m2m2m2-mmmm-mmmm-mmmm-m2m2m2m2m2m2', 'manager2', NULL, NULL, '5603ade3a9d2303dbf3f28a35023a53c28297dc7db955784ac09b4c294ecae8b'),
('m1m1m1m1m1m1m1m1m1m1m1m1m1m1m1m1m1m1m1m1', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'm1m1m1m1-mmmm-mmmm-mmmm-m1m1m1m1m1m1', 'manager1', NULL, NULL, '853d6a374a92501e3e93d28184f9217941793ff646b636c04b35d20169c0d3b7'),
('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'bob', NULL, NULL, '8d94b35f8eea7e1577e30fc75646dfeb4dd0982a083635028998d53ef590c7ec'),
('cccccccccccccccccccccccccccccccccccccccc', '2036-07-30 12:14:21', NULL, NULL, NULL, NULL, 'cccccccc-cccc-cccc-cccc-cccccccccccc', 'charlie', NULL, NULL, 'f57858edab011913ac0a5d92f04987f4b34eab0d702c8198c1900871d7d87198'),
('271b15a38a39b99b643ee702c5b8f5ff484a67bb', '2024-04-24 03:09:11', 'bearer', '64fc14653af42502974d84771b1b6e63bd35d9df', 1, NULL, 'tutorial-dckr-site-0000-xpresswebapp', 'aaaaaaaa-good-0000-0000-000000000000', NULL, NULL, 'f9c0d52b6d6869c1ca4b3d6ee307e8d283d553634a8f1e0941857a461ed891f9');

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_authorization_code`
--

CREATE TABLE `oauth_authorization_code` (
  `authorization_code` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `nonce` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_client`
--

CREATE TABLE `oauth_client` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secret` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `url` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_sign_out_uri` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `grant_type` varchar(255) DEFAULT NULL,
  `response_type` varchar(255) DEFAULT NULL,
  `client_type` varchar(15) DEFAULT NULL,
  `scope` varchar(80) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `token_types` varchar(2000) DEFAULT 'bearer',
  `jwt_secret` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `oauth_client`
--

INSERT INTO `oauth_client` (`id`, `name`, `description`, `secret`, `url`, `redirect_uri`, `redirect_sign_out_uri`, `image`, `grant_type`, `response_type`, `client_type`, `scope`, `extra`, `token_types`, `jwt_secret`) VALUES
('trusted-dckr-app-0000-000000000000', 'Trusted Application', 'Second application protected by OAuth2 and Keyrock', 'trusted-dckr-app-0000-clientsecret', '', '', NULL, 'default', 'password', 'code', NULL, NULL, NULL, 'bearer', NULL),
('tutorial-dckr-site-0000-xpresswebapp', 'FIWARE Tutorial', 'FIWARE Application protected by OAuth2 and Keyrock', 'tutorial-dckr-site-0000-clientsecret', 'http://localhost:3000', 'http://localhost:3000/login', NULL, 'default', 'authorization_code,implicit,password,client_credentials,refresh_token', 'code', NULL, NULL, NULL, 'bearer,jwt,permanent', '51129f085f3e1a80');

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_refresh_token`
--

CREATE TABLE `oauth_refresh_token` (
  `refresh_token` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `oauth_refresh_token`
--

INSERT INTO `oauth_refresh_token` (`refresh_token`, `expires`, `scope`, `oauth_client_id`, `user_id`, `iot_id`, `valid`, `authorization_code`) VALUES
('4eb1f99f80f37c81a8ef85d92eae836919887e1e', '2018-08-13 11:14:21', NULL, '8ca60ce9-32f9-42d6-a013-a19b3af0c13d', 'admin', NULL, NULL, NULL),
('64fc14653af42502974d84771b1b6e63bd35d9df', '2024-05-08 02:09:11', 'bearer', 'tutorial-dckr-site-0000-xpresswebapp', 'aaaaaaaa-good-0000-0000-000000000000', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `oauth_scope`
--

CREATE TABLE `oauth_scope` (
  `id` int NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `organization`
--

CREATE TABLE `organization` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `website` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `organization`
--

INSERT INTO `organization` (`id`, `name`, `description`, `website`, `image`) VALUES
('managers-team-0000-0000-000000000000', 'Management', 'Management Group for Store Managers', NULL, 'default'),
('security-team-0000-0000-000000000000', 'Security', 'Security Group for Store Detectives', NULL, 'default');

-- --------------------------------------------------------

--
-- Struttura della tabella `pep_proxy`
--

CREATE TABLE `pep_proxy` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `pep_proxy`
--

INSERT INTO `pep_proxy` (`id`, `password`, `salt`, `oauth_client_id`) VALUES
('pep_proxy_00000000-0000-0000-0000-000000000000', 'e9f7c64ec2895eec281f8fd36e588d1bc762bcca', NULL, 'tutorial-dckr-site-0000-xpresswebapp');

-- --------------------------------------------------------

--
-- Struttura della tabella `permission`
--

CREATE TABLE `permission` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_internal` tinyint(1) DEFAULT '0',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xml` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `is_regex` tinyint(1) NOT NULL DEFAULT '0',
  `authorization_service_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_authorization_service_header` tinyint(1) NOT NULL DEFAULT '0',
  `regex_entity_ids` varchar(255) DEFAULT NULL,
  `regex_attributes` varchar(255) DEFAULT NULL,
  `regex_types` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `is_internal`, `action`, `resource`, `xml`, `oauth_client_id`, `is_regex`, `authorization_service_header`, `use_authorization_service_header`, `regex_entity_ids`, `regex_attributes`, `regex_types`) VALUES
('1', 'Get and assign all internal application roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0, NULL, 0, NULL, NULL, NULL),
('2', 'Manage the application', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0, NULL, 0, NULL, NULL, NULL),
('3', 'Manage roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0, NULL, 0, NULL, NULL, NULL),
('4', 'Manage authorizations', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0, NULL, 0, NULL, NULL, NULL),
('5', 'Get and assign all public application roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0, NULL, 0, NULL, NULL, NULL),
('6', 'Get and assign only public owned roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0, NULL, 0, NULL, NULL, NULL),
('alrmbell-ring-0000-0000-000000000000', 'Ring Alarm Bell', NULL, 0, 'POST', '/bell/ring', NULL, 'tutorial-dckr-site-0000-xpresswebapp', 0, NULL, 0, NULL, NULL, NULL),
('entrance-open-0000-0000-000000000000', 'Unlock', 'Unlock main entrance', 0, 'POST', '/door/unlock', NULL, 'tutorial-dckr-site-0000-xpresswebapp', 0, NULL, 0, NULL, NULL, NULL),
('increase-stck-0000-0000-000000000000', 'Order Stock', 'Increase Stock Count', 0, 'GET', '/app/order-stock', NULL, 'tutorial-dckr-site-0000-xpresswebapp', 0, NULL, 0, NULL, NULL, NULL),
('orion-context-0000-0000-000000000000', 'Access Context Broker', NULL, 0, 'GET', '/v2/entities(/|$).*', NULL, 'tutorial-dckr-site-0000-xpresswebapp', 1, NULL, 0, NULL, NULL, NULL),
('pricechg-stck-0000-0000-000000000000', 'Access Price Changes', NULL, 0, 'GET', '/app/price-change', NULL, 'tutorial-dckr-site-0000-xpresswebapp', 0, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `role`
--

CREATE TABLE `role` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT '0',
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `role`
--

INSERT INTO `role` (`id`, `name`, `is_internal`, `oauth_client_id`) VALUES
('managers-role-0000-0000-000000000000', 'Management', 0, 'tutorial-dckr-site-0000-xpresswebapp'),
('provider', 'Provider', 1, 'idm_admin_app'),
('purchaser', 'Purchaser', 1, 'idm_admin_app'),
('security-role-0000-0000-000000000000', 'Security Team', 0, 'tutorial-dckr-site-0000-xpresswebapp');

-- --------------------------------------------------------

--
-- Struttura della tabella `role_assignment`
--

CREATE TABLE `role_assignment` (
  `id` int NOT NULL,
  `role_organization` varchar(255) DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `role_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `organization_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `role_assignment`
--

INSERT INTO `role_assignment` (`id`, `role_organization`, `oauth_client_id`, `role_id`, `organization_id`, `user_id`) VALUES
(1, NULL, '8ca60ce9-32f9-42d6-a013-a19b3af0c13d', 'provider', NULL, '96154659-cb3b-4d2d-afef-18d6aec0518e'),
(2, 'member', '8ca60ce9-32f9-42d6-a013-a19b3af0c13d', 'provider', '74f5299e-3247-468c-affb-957cda03f0c4', NULL),
(3, NULL, '222eda27-958b-4f0c-a5cb-e4114fb170c3', 'provider', NULL, 'admin'),
(4, NULL, '222eda27-958b-4f0c-a5cb-e4114fb170c3', 'provider', NULL, '96154659-cb3b-4d2d-afef-18d6aec0518e'),
(5, NULL, 'tutorial-dckr-site-0000-xpresswebapp', 'provider', NULL, 'aaaaaaaa-good-0000-0000-000000000000'),
(6, NULL, 'trusted-dckr-app-0000-000000000000', 'provider', NULL, 'aaaaaaaa-good-0000-0000-000000000000'),
(10, NULL, 'tutorial-dckr-site-0000-xpresswebapp', 'security-role-0000-0000-000000000000', NULL, 'cccccccc-good-0000-0000-000000000000'),
(11, 'member', 'tutorial-dckr-site-0000-xpresswebapp', 'security-role-0000-0000-000000000000', 'security-team-0000-0000-000000000000', NULL),
(12, NULL, 'tutorial-dckr-site-0000-xpresswebapp', 'managers-role-0000-0000-000000000000', NULL, 'bbbbbbbb-good-0000-0000-000000000000'),
(13, 'member', 'tutorial-dckr-site-0000-xpresswebapp', 'managers-role-0000-0000-000000000000', 'managers-team-0000-0000-000000000000', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int NOT NULL,
  `role_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `permission_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES
(1, 'provider', '1'),
(2, 'provider', '2'),
(3, 'provider', '3'),
(4, 'provider', '4'),
(5, 'provider', '5'),
(6, 'provider', '6'),
(7, 'purchaser', '5'),
(8, 'security-role-0000-0000-000000000000', 'alrmbell-ring-0000-0000-000000000000'),
(9, 'security-role-0000-0000-000000000000', 'entrance-open-0000-0000-000000000000'),
(10, 'managers-role-0000-0000-000000000000', 'alrmbell-ring-0000-0000-000000000000'),
(11, 'managers-role-0000-0000-000000000000', 'increase-stck-0000-0000-000000000000'),
(12, 'managers-role-0000-0000-000000000000', 'pricechg-stck-0000-0000-000000000000'),
(13, 'security-role-0000-0000-000000000000', 'orion-context-0000-0000-000000000000'),
(14, 'managers-role-0000-0000-000000000000', 'orion-context-0000-0000-000000000000');

-- --------------------------------------------------------

--
-- Struttura della tabella `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dump dei dati per la tabella `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('201802190000-CreateUserTable.js'),
('201802190003-CreateUserRegistrationProfileTable.js'),
('201802190005-CreateOrganizationTable.js'),
('201802190008-CreateOAuthClientTable.js'),
('201802190009-CreateUserAuthorizedApplicationTable.js'),
('201802190010-CreateRoleTable.js'),
('201802190015-CreatePermissionTable.js'),
('201802190020-CreateRoleAssignmentTable.js'),
('201802190025-CreateRolePermissionTable.js'),
('201802190030-CreateUserOrganizationTable.js'),
('201802190035-CreateIotTable.js'),
('201802190040-CreatePepProxyTable.js'),
('201802190045-CreateAuthZForceTable.js'),
('201802190050-CreateAuthTokenTable.js'),
('201802190060-CreateOAuthAuthorizationCodeTable.js'),
('201802190065-CreateOAuthAccessTokenTable.js'),
('201802190070-CreateOAuthRefreshTokenTable.js'),
('201802190075-CreateOAuthScopeTable.js'),
('20180405125424-CreateUserTourAttribute.js'),
('20180612134640-CreateEidasTable.js');

-- --------------------------------------------------------

--
-- Struttura della tabella `trusted_application`
--

CREATE TABLE `trusted_application` (
  `id` int NOT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `trusted_oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `trusted_application`
--

INSERT INTO `trusted_application` (`id`, `oauth_client_id`, `trusted_oauth_client_id`) VALUES
(1, 'tutorial-dckr-site-0000-xpresswebapp', 'trusted-dckr-app-0000-000000000000');

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `id` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `website` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `gravatar` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `date_password` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `extra` json DEFAULT NULL,
  `scope` varchar(80) DEFAULT NULL,
  `starters_tour_ended` tinyint(1) DEFAULT '0',
  `eidas_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`id`, `username`, `description`, `website`, `image`, `gravatar`, `email`, `password`, `salt`, `date_password`, `enabled`, `admin`, `extra`, `scope`, `starters_tour_ended`, `eidas_id`) VALUES
('aaaaaaaa-good-0000-0000-000000000000', 'alice', 'Alice is the admin', NULL, 'default', 0, 'alice-the-admin@test.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 1, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('bbbbbbbb-good-0000-0000-000000000000', 'bob', 'Bob is the regional manager', NULL, 'default', 0, 'bob-the-manager@test.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('cccccccc-good-0000-0000-000000000000', 'charlie', 'Charlie is head of security', NULL, 'default', 0, 'charlie-security@test.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('detective1-good-0000-0000-0000000000', 'detective1', 'Detective works for Charlie', NULL, 'default', 0, 'detective1@test.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('detective2-good-0000-0000-0000000000', 'detective2', 'Detective works for Charlie', NULL, 'default', 0, 'detective2@test.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('eve-evil-0000-0000-000000000000', 'eve', 'Eve the Eavesdropper', NULL, 'default', 0, 'eve@example.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('mallory-evil-0000-0000-000000000000', 'mallory', 'Mallory the malicious attacker', NULL, 'default', 0, 'mallory@example.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('manager1-good-0000-0000-000000000000', 'manager1', 'Manager works for Bob', NULL, 'default', 0, 'manager1@test.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('manager2-good-0000-0000-000000000000', 'manager2', 'Manager works for Bob', NULL, 'default', 0, 'manager2@test.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('rob-evil-0000-0000-000000000000', 'rob', 'Rob the Robber', NULL, 'default', 0, 'rob@example.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2018-07-30 11:41:14', 1, 0, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL),
('xxxxxxxx-good-0000-0000-000000000000', 'zelda', 'Zelda is the admin', NULL, 'default', 0, 'zelda@hyrule.com', '89e48c55e4e4b3b86141fb15f5e6abf70f8c32c0', 'fbba54b6750b16e8', '2010-05-22 20:30:00', 1, 1, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `user_authorized_application`
--

CREATE TABLE `user_authorized_application` (
  `id` int NOT NULL,
  `user_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `oauth_client_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `shared_attributes` char(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `login_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user_authorized_application`
--

INSERT INTO `user_authorized_application` (`id`, `user_id`, `oauth_client_id`, `shared_attributes`, `login_date`) VALUES
(1, 'admin', '8ca60ce9-32f9-42d6-a013-a19b3af0c13d', NULL, NULL),
(2, 'aaaaaaaa-good-0000-0000-000000000000', 'tutorial-dckr-site-0000-xpresswebapp', 'username,email', '2024-04-24 02:09:11');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_organization`
--

CREATE TABLE `user_organization` (
  `id` int NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  `user_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `organization_id` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user_organization`
--

INSERT INTO `user_organization` (`id`, `role`, `user_id`, `organization_id`) VALUES
(2, 'owner', 'aaaaaaaa-good-0000-0000-000000000000', 'security-team-0000-0000-000000000000'),
(3, 'owner', 'aaaaaaaa-good-0000-0000-000000000000', 'managers-team-0000-0000-000000000000'),
(4, 'owner', 'bbbbbbbb-good-0000-0000-000000000000', 'managers-team-0000-0000-000000000000'),
(5, 'member', 'manager1-good-0000-0000-000000000000', 'managers-team-0000-0000-000000000000'),
(6, 'member', 'manager2-good-0000-0000-000000000000', 'managers-team-0000-0000-000000000000'),
(7, 'owner', 'cccccccc-good-0000-0000-000000000000', 'security-team-0000-0000-000000000000'),
(8, 'member', 'detective1-good-0000-0000-0000000000', 'security-team-0000-0000-000000000000'),
(9, 'member', 'detective2-good-0000-0000-0000000000', 'security-team-0000-0000-000000000000'),
(10, 'owner', 'xxxxxxxx-good-0000-0000-000000000000', 'managers-team-0000-0000-000000000000'),
(11, 'owner', 'xxxxxxxx-good-0000-0000-000000000000', 'security-team-0000-0000-000000000000');

-- --------------------------------------------------------

--
-- Struttura della tabella `user_registration_profile`
--

CREATE TABLE `user_registration_profile` (
  `id` int NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_expires` datetime DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `verification_key` varchar(255) DEFAULT NULL,
  `verification_expires` datetime DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `user_registration_profile`
--

INSERT INTO `user_registration_profile` (`id`, `activation_key`, `activation_expires`, `reset_key`, `reset_expires`, `verification_key`, `verification_expires`, `user_email`) VALUES
(1, 'b26roiin0r', '2018-07-31 10:03:53', NULL, NULL, NULL, NULL, 'eve@test.com');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `authzforce`
--
ALTER TABLE `authzforce`
  ADD PRIMARY KEY (`az_domain`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indici per le tabelle `auth_token`
--
ALTER TABLE `auth_token`
  ADD PRIMARY KEY (`access_token`),
  ADD UNIQUE KEY `access_token` (`access_token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pep_proxy_id` (`pep_proxy_id`);

--
-- Indici per le tabelle `delegation_evidence`
--
ALTER TABLE `delegation_evidence`
  ADD PRIMARY KEY (`policy_issuer`,`access_subject`),
  ADD UNIQUE KEY `policy_issuer_access_subject_unique` (`policy_issuer`,`access_subject`);

--
-- Indici per le tabelle `eidas_credentials`
--
ALTER TABLE `eidas_credentials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indici per le tabelle `iot`
--
ALTER TABLE `iot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indici per le tabelle `oauth_access_token`
--
ALTER TABLE `oauth_access_token`
  ADD PRIMARY KEY (`hash`),
  ADD UNIQUE KEY `oauth_access_token_hash_uk` (`hash`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `iot_id` (`iot_id`);

--
-- Indici per le tabelle `oauth_authorization_code`
--
ALTER TABLE `oauth_authorization_code`
  ADD PRIMARY KEY (`authorization_code`),
  ADD UNIQUE KEY `authorization_code` (`authorization_code`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `oauth_client`
--
ALTER TABLE `oauth_client`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `oauth_refresh_token`
--
ALTER TABLE `oauth_refresh_token`
  ADD PRIMARY KEY (`refresh_token`),
  ADD UNIQUE KEY `refresh_token` (`refresh_token`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `iot_id` (`iot_id`);

--
-- Indici per le tabelle `oauth_scope`
--
ALTER TABLE `oauth_scope`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indici per le tabelle `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `pep_proxy`
--
ALTER TABLE `pep_proxy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indici per le tabelle `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indici per le tabelle `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indici per le tabelle `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `organization_id` (`organization_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indici per le tabelle `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indici per le tabelle `trusted_application`
--
ALTER TABLE `trusted_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `trusted_oauth_client_id` (`trusted_oauth_client_id`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indici per le tabelle `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indici per le tabelle `user_organization`
--
ALTER TABLE `user_organization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indici per le tabelle `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `oauth_scope`
--
ALTER TABLE `oauth_scope`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `role_assignment`
--
ALTER TABLE `role_assignment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `trusted_application`
--
ALTER TABLE `trusted_application`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `user_organization`
--
ALTER TABLE `user_organization`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `authzforce`
--
ALTER TABLE `authzforce`
  ADD CONSTRAINT `authzforce_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `auth_token`
--
ALTER TABLE `auth_token`
  ADD CONSTRAINT `auth_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_token_ibfk_2` FOREIGN KEY (`pep_proxy_id`) REFERENCES `pep_proxy` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `eidas_credentials`
--
ALTER TABLE `eidas_credentials`
  ADD CONSTRAINT `eidas_credentials_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `iot`
--
ALTER TABLE `iot`
  ADD CONSTRAINT `iot_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `oauth_access_token`
--
ALTER TABLE `oauth_access_token`
  ADD CONSTRAINT `oauth_access_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `oauth_authorization_code`
--
ALTER TABLE `oauth_authorization_code`
  ADD CONSTRAINT `oauth_authorization_code_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_authorization_code_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `oauth_refresh_token`
--
ALTER TABLE `oauth_refresh_token`
  ADD CONSTRAINT `oauth_refresh_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `pep_proxy`
--
ALTER TABLE `pep_proxy`
  ADD CONSTRAINT `pep_proxy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD CONSTRAINT `role_assignment_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `trusted_application`
--
ALTER TABLE `trusted_application`
  ADD CONSTRAINT `trusted_application_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trusted_application_ibfk_2` FOREIGN KEY (`trusted_oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  ADD CONSTRAINT `user_authorized_application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_authorized_application_ibfk_2` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `user_organization`
--
ALTER TABLE `user_organization`
  ADD CONSTRAINT `user_organization_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  ADD CONSTRAINT `user_registration_profile_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
