/*
Navicat MySQL Data Transfer

Source Server         : 10.1.11.167
Source Server Version : 50710
Source Host           : 10.1.11.167:3306
Source Database       : huntblog

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2018-05-30 20:39:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hb_commentmeta
-- ----------------------------
DROP TABLE IF EXISTS `hb_commentmeta`;
CREATE TABLE `hb_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_commentmeta
-- ----------------------------

-- ----------------------------
-- Table structure for hb_comments
-- ----------------------------
DROP TABLE IF EXISTS `hb_comments`;
CREATE TABLE `hb_comments` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_ip` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `comment_post_ID` (`comment_post_id`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_comments
-- ----------------------------
INSERT INTO `hb_comments` VALUES ('1', '1', '一位WordPress评论者', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-01-23 07:10:27', '2018-01-23 07:10:27', '嗨，这是一条评论。\n要开始审核、编辑及删除评论，请访问仪表盘的“评论”页面。\n评论者头像来自<a href=\"https://gravatar.com\">Gravatar</a>。', '0', '1', '', '', '0', '0');
INSERT INTO `hb_comments` VALUES ('3', '1', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0', '1', '', '', '0', '0');

-- ----------------------------
-- Table structure for hb_links
-- ----------------------------
DROP TABLE IF EXISTS `hb_links`;
CREATE TABLE `hb_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_links
-- ----------------------------

-- ----------------------------
-- Table structure for hb_options
-- ----------------------------
DROP TABLE IF EXISTS `hb_options`;
CREATE TABLE `hb_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_options
-- ----------------------------
INSERT INTO `hb_options` VALUES ('1', 'siteurl', 'http://localhost/wordpress', 'yes');
INSERT INTO `hb_options` VALUES ('2', 'home', 'http://localhost/wordpress', 'yes');
INSERT INTO `hb_options` VALUES ('3', 'blogname', 'HuntBlog', 'yes');
INSERT INTO `hb_options` VALUES ('4', 'blogdescription', '又一个WordPress站点', 'yes');
INSERT INTO `hb_options` VALUES ('5', 'users_can_register', '0', 'yes');
INSERT INTO `hb_options` VALUES ('6', 'admin_email', 'demo@huntframework.com', 'yes');
INSERT INTO `hb_options` VALUES ('7', 'start_of_week', '1', 'yes');
INSERT INTO `hb_options` VALUES ('8', 'use_balanceTags', '0', 'yes');
INSERT INTO `hb_options` VALUES ('9', 'use_smilies', '1', 'yes');
INSERT INTO `hb_options` VALUES ('10', 'require_name_email', '1', 'yes');
INSERT INTO `hb_options` VALUES ('11', 'comments_notify', '1', 'yes');
INSERT INTO `hb_options` VALUES ('12', 'posts_per_rss', '10', 'yes');
INSERT INTO `hb_options` VALUES ('13', 'rss_use_excerpt', '0', 'yes');
INSERT INTO `hb_options` VALUES ('14', 'mailserver_url', 'mail.example.com', 'yes');
INSERT INTO `hb_options` VALUES ('15', 'mailserver_login', 'login@example.com', 'yes');
INSERT INTO `hb_options` VALUES ('16', 'mailserver_pass', 'password', 'yes');
INSERT INTO `hb_options` VALUES ('17', 'mailserver_port', '110', 'yes');
INSERT INTO `hb_options` VALUES ('18', 'default_category', '1', 'yes');
INSERT INTO `hb_options` VALUES ('19', 'default_comment_status', 'open', 'yes');
INSERT INTO `hb_options` VALUES ('20', 'default_ping_status', 'open', 'yes');
INSERT INTO `hb_options` VALUES ('21', 'default_pingback_flag', '1', 'yes');
INSERT INTO `hb_options` VALUES ('22', 'posts_per_page', '10', 'yes');
INSERT INTO `hb_options` VALUES ('23', 'date_format', 'Y年n月j日', 'yes');
INSERT INTO `hb_options` VALUES ('24', 'time_format', 'ag:i', 'yes');
INSERT INTO `hb_options` VALUES ('25', 'links_updated_date_format', 'Y年n月j日ag:i', 'yes');
INSERT INTO `hb_options` VALUES ('26', 'comment_moderation', '0', 'yes');
INSERT INTO `hb_options` VALUES ('27', 'moderation_notify', '1', 'yes');
INSERT INTO `hb_options` VALUES ('28', 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes');
INSERT INTO `hb_options` VALUES ('29', 'rewrite_rules', 'a:74:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes');
INSERT INTO `hb_options` VALUES ('30', 'hack_file', '0', 'yes');
INSERT INTO `hb_options` VALUES ('31', 'blog_charset', 'UTF-8', 'yes');
INSERT INTO `hb_options` VALUES ('32', 'moderation_keys', '', 'no');
INSERT INTO `hb_options` VALUES ('33', 'active_plugins', 'a:0:{}', 'yes');
INSERT INTO `hb_options` VALUES ('34', 'category_base', '', 'yes');
INSERT INTO `hb_options` VALUES ('35', 'ping_sites', 'http://rpc.pingomatic.com/', 'yes');
INSERT INTO `hb_options` VALUES ('36', 'comment_max_links', '2', 'yes');
INSERT INTO `hb_options` VALUES ('37', 'gmt_offset', '0', 'yes');
INSERT INTO `hb_options` VALUES ('38', 'default_email_category', '1', 'yes');
INSERT INTO `hb_options` VALUES ('39', 'recently_edited', '', 'no');
INSERT INTO `hb_options` VALUES ('40', 'template', 'twentyseventeen', 'yes');
INSERT INTO `hb_options` VALUES ('41', 'stylesheet', 'twentyseventeen', 'yes');
INSERT INTO `hb_options` VALUES ('42', 'comment_whitelist', '1', 'yes');
INSERT INTO `hb_options` VALUES ('43', 'blacklist_keys', '', 'no');
INSERT INTO `hb_options` VALUES ('44', 'comment_registration', '0', 'yes');
INSERT INTO `hb_options` VALUES ('45', 'html_type', 'text/html', 'yes');
INSERT INTO `hb_options` VALUES ('46', 'use_trackback', '0', 'yes');
INSERT INTO `hb_options` VALUES ('47', 'default_role', 'subscriber', 'yes');
INSERT INTO `hb_options` VALUES ('48', 'db_version', '38590', 'yes');
INSERT INTO `hb_options` VALUES ('49', 'uploads_use_yearmonth_folders', '1', 'yes');
INSERT INTO `hb_options` VALUES ('50', 'upload_path', '', 'yes');
INSERT INTO `hb_options` VALUES ('51', 'blog_public', '1', 'yes');
INSERT INTO `hb_options` VALUES ('52', 'default_link_category', '2', 'yes');
INSERT INTO `hb_options` VALUES ('53', 'show_on_front', 'posts', 'yes');
INSERT INTO `hb_options` VALUES ('54', 'tag_base', '', 'yes');
INSERT INTO `hb_options` VALUES ('55', 'show_avatars', '1', 'yes');
INSERT INTO `hb_options` VALUES ('56', 'avatar_rating', 'G', 'yes');
INSERT INTO `hb_options` VALUES ('57', 'upload_url_path', '', 'yes');
INSERT INTO `hb_options` VALUES ('58', 'thumbnail_size_w', '150', 'yes');
INSERT INTO `hb_options` VALUES ('59', 'thumbnail_size_h', '150', 'yes');
INSERT INTO `hb_options` VALUES ('60', 'thumbnail_crop', '1', 'yes');
INSERT INTO `hb_options` VALUES ('61', 'medium_size_w', '300', 'yes');
INSERT INTO `hb_options` VALUES ('62', 'medium_size_h', '300', 'yes');
INSERT INTO `hb_options` VALUES ('63', 'avatar_default', 'mystery', 'yes');
INSERT INTO `hb_options` VALUES ('64', 'large_size_w', '1024', 'yes');
INSERT INTO `hb_options` VALUES ('65', 'large_size_h', '1024', 'yes');
INSERT INTO `hb_options` VALUES ('66', 'image_default_link_type', 'none', 'yes');
INSERT INTO `hb_options` VALUES ('67', 'image_default_size', '', 'yes');
INSERT INTO `hb_options` VALUES ('68', 'image_default_align', '', 'yes');
INSERT INTO `hb_options` VALUES ('69', 'close_comments_for_old_posts', '0', 'yes');
INSERT INTO `hb_options` VALUES ('70', 'close_comments_days_old', '14', 'yes');
INSERT INTO `hb_options` VALUES ('71', 'thread_comments', '1', 'yes');
INSERT INTO `hb_options` VALUES ('72', 'thread_comments_depth', '5', 'yes');
INSERT INTO `hb_options` VALUES ('73', 'page_comments', '0', 'yes');
INSERT INTO `hb_options` VALUES ('74', 'comments_per_page', '50', 'yes');
INSERT INTO `hb_options` VALUES ('75', 'default_comments_page', 'newest', 'yes');
INSERT INTO `hb_options` VALUES ('76', 'comment_order', 'asc', 'yes');
INSERT INTO `hb_options` VALUES ('77', 'sticky_posts', 'a:0:{}', 'yes');
INSERT INTO `hb_options` VALUES ('78', 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('79', 'widget_text', 'a:0:{}', 'yes');
INSERT INTO `hb_options` VALUES ('80', 'widget_rss', 'a:0:{}', 'yes');
INSERT INTO `hb_options` VALUES ('81', 'uninstall_plugins', 'a:0:{}', 'no');
INSERT INTO `hb_options` VALUES ('82', 'timezone_string', 'Asia/Shanghai', 'yes');
INSERT INTO `hb_options` VALUES ('83', 'page_for_posts', '0', 'yes');
INSERT INTO `hb_options` VALUES ('84', 'page_on_front', '0', 'yes');
INSERT INTO `hb_options` VALUES ('85', 'default_post_format', '0', 'yes');
INSERT INTO `hb_options` VALUES ('86', 'link_manager_enabled', '0', 'yes');
INSERT INTO `hb_options` VALUES ('87', 'finished_splitting_shared_terms', '1', 'yes');
INSERT INTO `hb_options` VALUES ('88', 'site_icon', '0', 'yes');
INSERT INTO `hb_options` VALUES ('89', 'medium_large_size_w', '768', 'yes');
INSERT INTO `hb_options` VALUES ('90', 'medium_large_size_h', '0', 'yes');
INSERT INTO `hb_options` VALUES ('91', 'initial_db_version', '38590', 'yes');
INSERT INTO `hb_options` VALUES ('92', 'hb_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes');
INSERT INTO `hb_options` VALUES ('93', 'fresh_site', '1', 'yes');
INSERT INTO `hb_options` VALUES ('94', 'WPLANG', 'zh_CN', 'yes');
INSERT INTO `hb_options` VALUES ('95', 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('96', 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('97', 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('98', 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('99', 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('100', 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes');
INSERT INTO `hb_options` VALUES ('101', 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('102', 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('103', 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('104', 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('105', 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('106', 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('107', 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('108', 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('109', 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes');
INSERT INTO `hb_options` VALUES ('110', 'cron', 'a:2:{i:1516734628;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}s:7:\"version\";i:2;}', 'yes');
INSERT INTO `hb_options` VALUES ('111', 'theme_mods_twentyseventeen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes');
INSERT INTO `hb_options` VALUES ('112', '_transient_is_multi_author', '0', 'yes');
INSERT INTO `hb_options` VALUES ('113', '_transient_twentyseventeen_categories', '1', 'yes');
INSERT INTO `hb_options` VALUES ('124', '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.2.zip\";s:6:\"locale\";s:5:\"zh_CN\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.2\";s:7:\"version\";s:5:\"4.9.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1516691484;s:15:\"version_checked\";s:5:\"4.9.2\";s:12:\"translations\";a:0:{}}', 'no');
INSERT INTO `hb_options` VALUES ('125', '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1516691490;s:7:\"checked\";a:3:{s:13:\"twentyfifteen\";s:3:\"1.9\";s:15:\"twentyseventeen\";s:3:\"1.4\";s:13:\"twentysixteen\";s:3:\"1.4\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no');
INSERT INTO `hb_options` VALUES ('126', '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1516691488;s:8:\"response\";a:1:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":11:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.2.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:7:\"default\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";s:7:\"default\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.1\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:3:{s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:7:\"default\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";}s:7:\"banners\";a:2:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";s:7:\"default\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');
INSERT INTO `hb_options` VALUES ('118', '_site_transient_timeout_theme_roots', '1516693237', 'no');
INSERT INTO `hb_options` VALUES ('119', '_site_transient_theme_roots', 'a:3:{s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no');
INSERT INTO `hb_options` VALUES ('127', 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:22:\"demo@huntframework.com\";s:7:\"version\";s:5:\"4.9.2\";s:9:\"timestamp\";i:1516691487;}', 'no');

-- ----------------------------
-- Table structure for hb_postmeta
-- ----------------------------
DROP TABLE IF EXISTS `hb_postmeta`;
CREATE TABLE `hb_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_postmeta
-- ----------------------------
INSERT INTO `hb_postmeta` VALUES ('1', '2', '_wp_page_template', 'default');

-- ----------------------------
-- Table structure for hb_posts
-- ----------------------------
DROP TABLE IF EXISTS `hb_posts`;
CREATE TABLE `hb_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_posts
-- ----------------------------
INSERT INTO `hb_posts` VALUES ('1', '1', '2018-01-23 15:10:27', '2018-01-23 07:10:27', '欢迎使用WordPress。这是您的第一篇文章。编辑或删除它，然后开始写作吧！', '世界，您好！', '我是简介', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-01-23 15:10:27', '2018-01-23 07:10:27', '', '0', 'http://localhost/wordpress/?p=1', '0', 'post', '', '1');
INSERT INTO `hb_posts` VALUES ('2', '1', '2018-01-23 15:10:27', '2018-01-23 07:10:27', '这是示范页面。页面和博客文章不同，它的位置是固定的，通常会在站点导航栏显示。很多用户都创建一个“关于”页面，向访客介绍自己。例如：\n\n<blockquote>欢迎！我白天是个邮递员，晚上就是个有抱负的演员。这是我的博客。我住在天朝的帝都，有条叫做Jack的狗。</blockquote>\n\n……或这个：\n\n<blockquote>XYZ Doohickey公司成立于1971年，自从建立以来，我们一直向社会贡献着优秀doohickies。我们的公司总部位于天朝魔都，有着超过两千名员工，对魔都政府税收有着巨大贡献。</blockquote>\n\n而您，作为一个WordPress用户，我们建议您访问<a href=\"http://localhost/wordpress/wp-admin/\">控制板</a>，删除本页面，然后添加您自己的页面。祝您使用愉快！', '示例页面', '我是简介', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-01-23 15:10:27', '2018-01-23 07:10:27', '', '0', 'http://localhost/wordpress/?page_id=2', '0', 'page', '', '0');

-- ----------------------------
-- Table structure for hb_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `hb_term_relationships`;
CREATE TABLE `hb_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_term_relationships
-- ----------------------------
INSERT INTO `hb_term_relationships` VALUES ('1', '1', '0');

-- ----------------------------
-- Table structure for hb_term_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `hb_term_taxonomy`;
CREATE TABLE `hb_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_term_taxonomy
-- ----------------------------
INSERT INTO `hb_term_taxonomy` VALUES ('1', '1', 'category', '', '0', '1');

-- ----------------------------
-- Table structure for hb_termmeta
-- ----------------------------
DROP TABLE IF EXISTS `hb_termmeta`;
CREATE TABLE `hb_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_termmeta
-- ----------------------------

-- ----------------------------
-- Table structure for hb_terms
-- ----------------------------
DROP TABLE IF EXISTS `hb_terms`;
CREATE TABLE `hb_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_terms
-- ----------------------------
INSERT INTO `hb_terms` VALUES ('1', '未分类', 'uncategorized', '0');

-- ----------------------------
-- Table structure for hb_usermeta
-- ----------------------------
DROP TABLE IF EXISTS `hb_usermeta`;
CREATE TABLE `hb_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_usermeta
-- ----------------------------
INSERT INTO `hb_usermeta` VALUES ('1', '1', 'nickname', 'demo');
INSERT INTO `hb_usermeta` VALUES ('2', '1', 'first_name', '');
INSERT INTO `hb_usermeta` VALUES ('3', '1', 'last_name', '');
INSERT INTO `hb_usermeta` VALUES ('4', '1', 'description', '');
INSERT INTO `hb_usermeta` VALUES ('5', '1', 'rich_editing', 'true');
INSERT INTO `hb_usermeta` VALUES ('6', '1', 'syntax_highlighting', 'true');
INSERT INTO `hb_usermeta` VALUES ('7', '1', 'comment_shortcuts', 'false');
INSERT INTO `hb_usermeta` VALUES ('8', '1', 'admin_color', 'fresh');
INSERT INTO `hb_usermeta` VALUES ('9', '1', 'use_ssl', '0');
INSERT INTO `hb_usermeta` VALUES ('10', '1', 'show_admin_bar_front', 'true');
INSERT INTO `hb_usermeta` VALUES ('11', '1', 'locale', '');
INSERT INTO `hb_usermeta` VALUES ('12', '1', 'hb_capabilities', 'a:1:{s:13:\"administrator\";b:1;}');
INSERT INTO `hb_usermeta` VALUES ('13', '1', 'hb_user_level', '10');
INSERT INTO `hb_usermeta` VALUES ('14', '1', 'dismissed_wp_pointers', '');
INSERT INTO `hb_usermeta` VALUES ('15', '1', 'show_welcome_panel', '1');

-- ----------------------------
-- Table structure for hb_users
-- ----------------------------
DROP TABLE IF EXISTS `hb_users`;
CREATE TABLE `hb_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- ----------------------------
-- Records of hb_users
-- ----------------------------
INSERT INTO `hb_users` VALUES ('1', 'demo', '$P$B5RG4jKpnpKbRc7IaJ70580uktYbSn1', 'demo', 'demo@huntframework.com', '', '2018-01-23 07:10:27', '', '0', 'demo');
