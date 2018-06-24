-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: recipes_db
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$zZ2d7nRV6xpY$9TmH2RwZ04puOkRQhqzxIr6mkSX/VZ+Insi1H3eEgwQ=','2018-06-20 02:26:10.794892',1,'admin','','','jonwes2@gmail.com',1,1,'2018-06-20 02:24:16.843218');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookmarks_user_ibfk_1_idx` (`user_id`),
  CONSTRAINT `bookmarks_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
INSERT INTO `bookmarks` VALUES (1,'Paleo Leap','http://paleoleap.com/paleo-diet-recipes/','2016-08-11 03:21:54','2016-08-14 22:24:46',1),(2,'Budget Bytes','http://www.budgetbytes.com','2016-08-11 03:22:52','2016-08-14 22:24:46',1),(3,'Living Chirpy','http://www.livingchirpy.com/','2016-08-11 03:23:27','2016-08-14 22:24:46',1);
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-06-20 02:32:35.110216','1','{1: Greek Yogurt Chicken}',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(2,'2018-06-20 03:18:34.609339','1','{1: Greek Yogurt Chicken}',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'recipes','recipe');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-20 01:05:25.767958'),(2,'auth','0001_initial','2018-06-20 01:05:26.433511'),(3,'admin','0001_initial','2018-06-20 01:05:26.637041'),(4,'admin','0002_logentry_remove_auto_add','2018-06-20 01:05:26.655985'),(5,'contenttypes','0002_remove_content_type_name','2018-06-20 01:05:26.781651'),(6,'auth','0002_alter_permission_name_max_length','2018-06-20 01:05:26.830613'),(7,'auth','0003_alter_user_email_max_length','2018-06-20 01:05:26.872725'),(8,'auth','0004_alter_user_username_opts','2018-06-20 01:05:26.886939'),(9,'auth','0005_alter_user_last_login_null','2018-06-20 01:05:26.919060'),(10,'auth','0006_require_contenttypes_0002','2018-06-20 01:05:26.921857'),(11,'auth','0007_alter_validators_add_error_messages','2018-06-20 01:05:26.936247'),(12,'auth','0008_alter_user_username_max_length','2018-06-20 01:05:26.972343'),(13,'auth','0009_alter_user_last_name_max_length','2018-06-20 01:05:27.005430'),(14,'sessions','0001_initial','2018-06-20 01:05:27.051904'),(15,'recipes','0001_initial','2018-06-20 01:46:43.509569');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('nf8i81xnt23zl7vaxcu2fpvjykuq5l19','MDQxZDg2ZjAyZTk4ZGE2YzE5ZTllMzlhMThmYTc3ZTUwNWQ4ZWFhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiMzkyMjc0OTMyODMwMDQ2YzM4ODU3ODgyZmIyMjJkNDBhYzRiZDgzIn0=','2018-07-04 02:26:10.796843');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `ingredients` text NOT NULL,
  `instructions` text,
  `imagePath` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `recipes_user_fk_1_idx` (`user_id`),
  CONSTRAINT `recipes_user_fk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Greek Yogurt Chicken','chicken thighs\r\ngreek yogurt\r\nlemon\r\nrosemary\r\nsalt\r\npepper','Combine all ingredients into a plastic storage bag and mix well. After it has been marinating for 30 minutes, place in a baking dish and cook for 25-30 minutes on 420 degree.',NULL,'2016-06-30 01:19:09','2016-07-14 00:52:39',1),(2,'Oatmeal Banana Chews','2 cups of oats\r\n3 bananas\r\n1/3 applesauce\r\n1/4 cup almond milk\r\n1 tp of vanilla\r\n1 tp cinnamon','Preheat oven to 350 degrees.\r\n\r\nFirst mash the bananas them, mix the rest of the ingredients together real well. Drop spoonfuls onto a baking sheet and bake for 15-20 minutes.',NULL,'2016-07-01 22:11:48','2016-07-01 22:11:48',1),(3,'Beef Enchiladas with Zucchini','2lbs of ground beef\r\n1/2 an onion\r\n5-6 garlic cloves\r\n3 zucchini\r\n4 cups of grated cheese\r\n20oz of enchilada sauce','Preheat oven to 350 degrees.\r\n\r\nChop onion and garlic and cook together with ground beef. Use a vegetable peeler to peel the zucchini into strips. In a baking dish create layers of ingredients in this order: zucchini strips, beef mixture, little bit of enchilada sauce, little bit of cheese. The top layer should be covered with zucchini strips pretty well, now add the rest of the enchilada sauce and spread evenly. Bake for 30 minutes, take it out of the oven add the rest of the cheese and let set for 5 -10 minutes or until cheese is melted.',NULL,'2016-07-08 00:42:57','2016-07-08 00:42:57',1),(4,'Chili','2 lbs ground beef\r\n1/2 of an onion\r\n7-8 garlic gloves\r\n1 tomato\r\nsalt\r\npepper\r\n1/4 cup of chili powder\r\n1/8 cup of cumin\r\n2 tbs onion powder\r\n2 tbs garlic powder\r\n4 cups of water\r\n1/2 cup of cornstarch','Chop onion and garlic and cook with ground beef. Chop tomatoes and add to beef mixture when it is cooked. Add water and all the seasonings and bring to boil. Mix cornstarch with cold water then add it to the chili and mix it in. Let the chili reduce for 30 minutes. ',NULL,'2016-07-08 00:54:40','2016-07-08 00:54:40',1),(5,'Vegetable Medley','1/2 cup of carrots\r\n1/2 of a red onion\r\n1 yellow squash\r\n1 Zucchini\r\n4 garlic gloves\r\n2 baby mushrooms\r\n9 mini sweet peppers (or 3 regular bell peppers - red, orange, yellow)\r\n1/2 cup of green beans\r\n1 tomato\r\n3/4 cup sherry\r\n2 tbs of butter','Chop veggies how you like. First cook carrots with sherry in a pot. When carrots soften add green beans. When green beans soften add peppers, garlic, onion, and mushrooms. Let cook for about 10 minutes on medium-low. Then add squash, zucchini, and tomato and butter. Mix together at cook for additional 5-10 minutes.',NULL,'2016-07-08 03:59:20','2016-07-08 03:59:20',1),(6,'Healthy Potato Salad','3 Potatoes\r\n1/2 can of black beans\r\n1 red bell pepper\r\n1 green bell pepper\r\n12 oz of hummus\r\n1 lime\r\npaprika\r\nsalt','Cook the potatoes until the are soft and let them cool. Then mix in all the ingredients and refrigerate.  ',NULL,'2016-07-19 02:22:38','2016-07-19 02:33:48',1),(9,'Corned Beef Hash','4-5 lb brisket\r\n2 white potatoes\r\n1 carrot\r\n1/2 white onion\r\n\r\nBrine:\r\n2 quarts water\r\n1 cup kosher salt\r\n1/2 cup brown sugar\r\npickling spice','Start the brine process:\r\nCombine water, salt, and brown sugar in a pot and heat until salt and sugar is dissolved. Let the brine cool to refrigerator temperature. Transfer the brine and the brisket into a large enough container to store them, add some pickling spice, and keep in the refrigerator for 10 days. The brisket must be completely submerged.\r\n\r\nCooking the brisket:\r\nRinse the brisket off when you take it out of the brine. Place the brisket in a crock pot and submerge in clean water. Add some pickling spice and cook on low for 8 hours.\r\n\r\nWhen the corned beef is ready, take it out of the crock pot and let it cool. Cut up the potatoes, onion, and carrot and cook them until they are tender. Chop up the corned beef and add it to the vegetables and mix. Let it cook for just a few more minutes and it is all done.\r\n\r\nAdd some fried eggs on top of the corned beef hash if you like.',NULL,'2016-07-20 23:52:51','2016-07-24 14:28:04',1),(10,'Tuscan Pot Roast','1 1/2 lb chuck roast\r\n1 cup carrots\r\n14oz. mushrooms\r\n1 onion\r\n1 jar of orti di calabria\r\n\r\nArrabiatta Sauce:\r\n1 cup beef broth\r\n1/2 tb italian seasonings\r\n1 tb olive oil\r\nsalt\r\npepper','Heat a large skillet or Dutch oven over medium?high heat. Add in oil and swirl to coat pan. Season chuck roast with salt and pepper and sear on all sides (approximately 4 to 5 minutes per side). You may need to adjust the flame as not to burn the roast.\r\nSauté carrot, mushrooms and onion together until veggies begin to brown (approximately 4 to 5 minutes). Return roast to the pan and add in beef stock and sauce. Bring to a gentle simmer. Place entire Dutch oven or oven safe skillet in the oven at 300°F. Let cook until meat is fork?tender.',NULL,'2016-07-21 00:20:27','2016-07-24 14:27:27',1),(11,'Salmon with Cucumber Melon Salsa','Salmon\r\n\r\nMelon salsa:\r\n1 cup cucumber, seeded & diced\r\n1 cup cantaloupe, seeded & diced\r\n1/4 cup cilantro\r\n1 jalapeno\r\n1/2 lime\r\nsalt\r\npepper\r\n','Cook salmon to your fancy. Mix ingredients for melon salsa and top onto cooked salmon.',NULL,'2016-07-21 00:41:29','2016-07-24 13:53:53',1),(12,'Mango and Yogurt Chicken Breast','1 cup(s) Greek yogurt, plain\r\n1 cup(s) mango, peeled and chopped\r\n1 jalapeno pepper, chopped\r\n1/2 Tsp salt\r\n2 garlic, chopped \r\n1/2 Tsp paprika\r\n1 Lb chicken breast boneless, skinless','Combine yogurt, mango, jalapeño, salt, garlic and paprika in a blender and blend until completely smooth. Place chicken breast and yogurt mixture in a zip?close bag, seal and turn to coat chicken. Chill 1?3 hours. Preheat grill to medium?high, 375°F. Remove chicken from marinade and lightly pat to remove excess then place on hot grill. Grill 4?5 minutes on each side or until chicken reaches an internal temperature of 165°F. Remove from grill and allow to cool 3 minutes before slicing.',NULL,'2016-07-21 00:50:33','2016-07-24 13:53:24',1),(13,'Chicken Chili','1 lb chicken breast\r\n1/2 onion, chopped\r\n2 garlic cloves, chopped\r\n1 can diced green chilies\r\n32oz chicken broth\r\n2 cans white beans\r\n1/2 cup monterey jack cheese\r\n2 tb olive oil\r\n1 tp cumin','Place a large pan on medium?high heat and add oil, then chicken. Cook several minutes. Add garlic, onions, cumin and green chilies. Cook 4?5 minutes or until onions begin to brown. Add chicken broth and beans. Bring to a simmer for 3 minutes then reduce heat to low. Cook chili an additional 30 minutes. Serve with a sprinkle of cheese.',NULL,'2016-07-21 01:00:08','2016-08-13 16:16:08',1),(14,'Fancy Tomato Soup','1 Tbsp olive oil\r\n1 medium onion, chopped\r\n28 Oz fire roasted diced tomatoes\r\n16 Oz low sodium vegetable broth\r\n2 bay leaves\r\n1 cup(s) basil, chopped\r\n2 garlic cloves, chopped\r\n2 cup(s) spinach, chopped\r\n1/2 cup(s) heavy cream','In a large pot, heat olive oil on medium?high.\r\nOnce pan is hot add onions and then cook several minutes, stirring occasionally, until onions are completely cooked.\r\nAdd in the tomatoes and juice. Gently crush with a spoon as they cook then add bay leaves, basil and garlic.\r\nSimmer several minutes until tomatoes fall apart.\r\nRemove from heat and remove the bay leaves.\r\nLadle half of the soup into a blender and puree until smooth.\r\nReturn the puree to the pot, add in the chopped spinach and heavy cream. Serve immediately.',NULL,'2016-07-21 01:06:24','2016-08-13 16:15:50',1),(15,'Toasted Sesame Ginger Salmon','Salmon\r\n\r\nMarinade:\r\n2 tb sesame oil\r\n2 tb rice vinegar\r\n2 tb brown sugar\r\n2 tb soy sauce\r\n2 garlic cloves, minced\r\n1 tb grated ginger\r\n1-2 tb sesame seeds\r\n4 green onions, sliced\r\n\r\nGlaze:\r\n1/4 cup honey\r\n1 tp sesame oil\r\n1 tp soy sauce\r\n1/2 tp grated ginger\r\n1/2 tp sesame seeds','Combine ingredients for marinate and place in a ziplock bag with salmon and marinate for 30 minutes in refrigerator. Bake in oven at 420 degrees until salmon is cooked. Combine ingredients for glaze and mix well; then pour over salmon.',NULL,'2016-07-21 01:17:03','2016-07-23 22:47:33',1),(16,'Moroccan Chicken','1 Tbsp H?E?B Red Cayenne Pepper\r\n1 Tbsp McCormick Cinnamon\r\n1 Tbsp H?E?B Ground Cumin\r\n4 Hill Country Fare Bone?In Chicken Breasts, trim excess fat & skin\r\n1/2 Tsp kosher salt\r\n1 Tsp pepper\r\n2 Tbsp H?E?B 100% Pure olive oil\r\n2 large carrots, peeled and cut into 2?inch diagonal slices\r\n2 large zucchini, cut into 1?inch chunks\r\n1 lemon, zested\r\n1 lemon, juiced\r\n2 Tbsp fresh mint leaves, thin sliced','Heat oven to 400°F.\r\n\r\nLine roasting pan with foil and set aside. Combine the cayenne pepper, cinnamon and ground cumin in small bowl. Rub chicken breasts with 3/4 of spice rub under and over skin, and arrange on prepared roasting pan. Season with salt and pepper. Combine remaining rub, olive oil, carrots, zucchini, lemon zest, lemon juice, and mint in bowl and toss to coat. Arrange vegetables around chicken breasts and roast for 35 minutes or until meat juices run clear. Place chicken and vegetables in serving platter and serve. *For optimal results sear your chicken breasts in a hot pan for 2min per side before roasting. This will ensure some great added color and flavor in the overall dish.',NULL,'2016-07-21 01:22:25','2016-07-23 22:47:12',1),(17,'Mediterranean Vegetable Tart','1 9in. pie crust\r\nhummus\r\n\r\nSome or all of the vegetables:\r\ntomatoes\r\neggplant\r\ncarrot\r\nred onion\r\nbell peppers (maybe roasted)\r\nzucchini\r\nartichoke hearts\r\ngarlic mushrooms\r\nolives','Bake the pie crust if it isn\'t already. Add a layer of hummus in the pie crust. Then add desired veggies and eat. Maybe drizzle a little salt, pepper, lemon, and olive oil on top.',NULL,'2016-07-21 01:38:59','2016-07-23 22:46:41',1),(18,'Sweet Potato Chili','2 Tsp extra virgin olive oil\r\n1 small yellow onion, diced fine\r\n2 large sweet potatoes, peeled and diced\r\n2 garlic, minced\r\n1 Tbsp canola oil\r\n2 Tsp ground cumin\r\n1/2 Tsp salt\r\n1 cup(s) water\r\n15 Oz black beans, rinsed and drained\r\n28 Oz diced tomatoes\r\n2 Tsp lime, juiced\r\n2 Tbsp cilantro, chopped','Heat extra virgin oil in a large saucepan over medium?high heat. Add onion, potatoes, garlic, canola oil, cumin and salt. Sauté and stir often, about every 4 minutes. Add water, bring to a boil, cover and reduce heat. Maintain a gentle simmer and cook until potatoes are tender, about 10 minutes. Stir in beans, tomatoes and lime juice and return to a boil. Reduce heat and simmer 5 minutes. Remove from heat and garnish with cilantro.',NULL,'2016-07-21 01:43:03','2016-08-13 16:15:31',1),(19,'Stuffed Sweet Potatoes','4 medium sweet potatoes\r\n2 Lb ground beef\r\nonion\r\ngarlic\r\n1/2 cup(s) green onions, chopped\r\n1/3 cup(s) shredded cheese\r\nchili powder\r\npaprika\r\ncumin\r\nsalt\r\npepper\r\n','Poke holes in sweet potatoes with a knife or fork. Bake in oven at 400 degrees for an hour. Chop onion and garlic and cook with ground beef. Add in chili powder, cumin, paprika, salt, and pepper. When sweet potatoes are done, open up one side of the sweet potatoes. Add ground beef mixture in the opened side of the sweet potatoes. Garnish with green onions and shredded cheese.\r\n\r\nAdd a fried egg before adding ground beef mixture for extra goodness.',NULL,'2016-07-21 01:51:35','2016-07-23 22:45:59',1),(20,'Tostadas','Tostada Shells\r\n1 can refried beans\r\n1 lb chicken, beef, or pork\r\nlarge tomato, chopped\r\nlettuce, chopped\r\nshredded cheese\r\n1 avocado, sliced','Preheat oven to 400 degrees.\r\n\r\nCook your meat. Spread some refried beans onto tostada shells and bake in oven for 5 minutes. Remove from oven and add meat, lettuce, tomato, cheese, and avocado slices.',NULL,'2016-07-21 01:59:15','2016-07-23 22:45:37',1),(24,'Golden Rice Bowls','Rice:\r\n2 Tbsp butter\r\n1 small yellow onion\r\n2 cloves garlic\r\n2 cups uncooked jasmine rice\r\n1 tsp turmeric\r\n½ tsp ground cumin\r\n? tsp cinnamon\r\n1 whole bay leaf\r\n3 cups chicken broth\r\n\r\nSauteed Spinach:\r\n2 Tbsp olive oil\r\n2 cloves garlic\r\n1 (16 oz.) bag spinach\r\nto taste salt & pepper\r\n\r\n6 large eggs','    Begin the rice first because it will take the longest to cook. Dice the onion and mince the garlic. Saute onion and garlic with butter in a medium pot over medium-low heat until the onions are soft and transparent (3-5 minutes). Add the dry rice, turmeric, cumin, and cinnamon. Stir and cook these ingredients for about 3 minutes more to toast the dry rice and spices. You should hear it crackling a little as it cooks. Make sure to stir often so that the rice does not stick to the bottom of the pot.\r\n\r\n    Add the chicken broth and bay leaf to the pot. Place a lid on top and turn the heat up to high. Let the pot come up to a full rolling boil and then turn the heat down to low. Let the pot simmer over low heat for 20 minutes. After 20 minutes, turn the heat off and let the pot sit for an additional 20 minutes without removing the lid or stirring the pot. After the final 20 minutes, fluff the rice with a fork.\r\n\r\n    When the rice is close to being done, prepare the sauteed spinach. Mince a clove of garlic and add it to a very large pot along with the olive oil. Saute the garlic for 1-2 minutes over medium heat, or just until becomes soft and fragrant. Add the fresh spinach and saute for about 3 minutes, or just until the spinach has wilted. Season the spinach with salt and pepper to taste. Fry six eggs.\r\n\r\n    To serve, add about one cup of warm rice to a bowl, add ½ cup of the sauteed spinach, and then top it off with a fried egg. Hot sauce adds a nice kick to this dish, too.\r\n',NULL,'2016-07-21 03:02:44','2016-07-21 03:10:34',1),(25,'Greek Chicken Stew','2 lb. (5 pieces) chicken thighs $3.23\r\n1 med yellow onion $0.89\r\n4 cloves garlic $0.09\r\n2 Tbsp olive oil $0.10\r\nto taste salt & pepper $0.05\r\n1 can (14.5 oz.) diced tomatoes $1.08\r\n1 can (8 oz.) tomato sauce $0.32\r\n2 whole bay leaves $0.05\r\n½ tsp dried oregano $0.05\r\n¼ tsp dried thyme $0.05\r\n½ cup (1/2 bunch) chopped fresh parsley $0.25\r\n1 can (15 oz.) chickpeas $0.66\r\n2½ oz. feta cheese $1.67\r\n2 cups long grain rice $0.60\r\n3 tsp (3 cubes) bullion $0.29\r\n','    Rinse the chicken thighs and pat dry. Sprinkle both sides with salt and pepper. Heat a large, deep skillet over medium/high heat with 2 Tbsp. of olive oil. The oil is ready when it has a wavy appearance. Cook the chicken pieces on each side until golden brown and crispy (5 min. each side).\r\n\r\n    While the chicken is browning, dice the onion and garlic. Once the chicken has browned, remove it to a plate and add the onion and garlic to the pan. Cook the onion and garlic until they are soft and transparent (there should be enough oil left plus rendered chicken fat to keep the vegetables from browning).\r\n\r\n    (If you have some left over wine, add ¼ to ½ cup to the pot with the onions and garlic. Stir and let simmer for one minute to “deglaze” the pan. The wine is optional, the juice from the canned tomatoes will also deglaze the pan in the absence of wine.) Add the canned tomatoes, tomato sauce, bay leaves, oregano, thyme and half of the chopped parsley to the pan. Stir well to combine then add the chicken pieces back to the pot. Reduce the heat to low, place a lid on the pan and simmer for 20 minutes.\r\n\r\n    While the stew simmers, prepare the chicken flavored rice. In a medium pot combine 2 cups of dry long grain rice with 3.5 cups of water and 3 tsp (or 3 cubes) of chicken bullion. Stir slightly. With a lid in place, bring the rice up to a rolling boil. As soon as it hits a full boil, reduce the heat to warm and let sit (without removing the lid) for 30 minutes.\r\n\r\n    After the stew simmers for 20 minutes, remove the lid, drain the chickpeas and add them to the pot. Continue to simmer for 15 minutes without a lid. Taste test to see if you prefer more salt or pepper.\r\n\r\n    To plate the stew, place ¾ cup of rice on a plate and top with the stewed vegetables, some of the liquid and one piece of chicken. Sprinkle with some of the remaining chopped parsley and about ½ oz. of crumbled feta cheese.\r\n',NULL,'2016-07-23 03:36:33','2016-07-23 22:44:51',1),(26,'Szechuan Pork & Green Beans','2 Tbsp. peanut or vegetable oil $0.07\r\n1 inch fresh ginger $0.11\r\n3 cloves garlic $0.07\r\n1 lb. green beans $0.86\r\n1 lb. pork roast $2.36\r\n2 Tbsp garlic chili paste $0.30\r\n2 Tbsp soy sauce $0.12\r\n1 Tbsp brown sugar $0.03\r\n2 Tbsp rice vinegar $0.09\r\n1 tsp sesame oil $0.16\r\n','    Make the Szechuan sauce by combining the garlic chili paste, soy sauce, brown sugar, rice vinegar and sesame oil in a bowl (if you like a thick gooey sauce, add 1 Tbsp of corn starch to this mixture, it will thicken upon cooking). Set aside for later use.\r\n\r\n    Wash the green beans and snap the stem end off of each. I also like to snap each bean in half so that each piece is about two inches long. Peel and mince the fresh ginger and garlic.\r\n\r\n    Open the pork roast and cut off a one pound portion (mine was two pounds total so I just cut it in half). Tightly wrap the unused portion in plastic wrap then place in a heavy freezer bag. Label and freeze for later use. Slice the one pound portion of pork roast against the grain into thin strips. It is very important to cut 90 degrees against the grain so that the strips of pork will not be tough and hard to chew.\r\n\r\n    Heat 2 Tbsp of oil in a wok or large skillet over high heat. When the oil looks wavy but is not smoking (turn it down if it begins to smoke), toss in the chopped garlic and ginger. Stir and cook (“stir fry”) for about one minute. Add the pork slices and stir fry until they are cooked through and no more pink juices are coming out (about 5 minutes).\r\n\r\n    Remove the pork to a plate and add the green beans. Stir fry the green beans until they are slightly tender (about five minutes). The fat and juices from the pork will begin to brown on the bottom of the pan during this step. When the sauce is added next, it will deglaze the pan and bring up all of the flavor from the caramelized juices on the bottom of the pan.\r\n\r\n    Return the pork strips to the pan with the green beans and add the Szechuan sauce. Continue to stir and cook until most of the moisture has evaporated from the sauce (about 1-2 minutes). Serve over a bed of hot rice! (Garnish with sesame seeds and sliced green onions if desired)\r\n',NULL,'2016-07-23 03:46:39','2016-07-23 22:44:30',1),(28,'Jamaican Jerk Chicken Bowl','1½ cups long grain jasmine rice $1.31\r\n1 can (1.5 cups) light coconut milk $1.49\r\n3 cloves garlic $0.18\r\n½ tsp salt $0.05\r\n2 (about 1 lb. total) chicken breasts $2.49\r\n½ bottle jerk marinade $0.99\r\n1 fresh jalapeno $0.06\r\n1 can black beans $0.62\r\n1 large plantain $0.54\r\n2 Tbsp vegetable oil $0.08\r\n1 (20 oz.) can pineapple chunks $0.92\r\n1 handful green onion or cliantro (garnish, optional) $0.15\r\n','Marinate the chicken in the jerk seasoning in the refrigerator for at least 4 hours. Do this either the night before or in the morning before you leave for work.\r\n\r\n    Begin cooking your rice by placing 1.5 cups of long grain jasmine rice in a pot with 2 cloves minced garlic, ½ tsp of salt, one can of light coconut milk and 1.5 cups (or one can full) of water. Stir once to combine ingredients. Cover the pot and bring it up to a boil over high heat. Once it reaches a full boil, reduce the heat to warm/low and let simmer for 30 minutes. Turn the heat off after 30 minutes and let it rest until you are ready to serve. Fluff with a fork just before serving.\r\n\r\n    Preheat a countertop grill for 5 minutes. Once warm, grill your first chicken breast for 6 minutes. Transfer to a cutting board and grill the second breast. Slice the breasts diagonally into strips.\r\n\r\n    While the chicken is cooking, mince another clove of garlic. Deseed and mince one jalapeno. Place the jalapeno and garlic in a small pot with ½ Tbsp of olive oil. Saute them for about 2 minutes over medium/high heat or just until soft. Add the can of black beans (undrained), reduce the heat to low and let until you are finished preparing the rest of the ingredients.\r\n\r\n    To make the plantains, heat 2 Tbsp of vegetable oil in a heavy skillet. Peel and slice the plantain into diagonal medallions. Fry the medallions on each side until they are caramelized and brown (3-4 min on each side). Transfer the plantains to a plate with paper towels to absorb the excess oil.\r\n\r\n    To assemble the bowls, begin with 1 cup of coconut rice. Top the rice with ½ of a chicken breast (about 4 oz.), ? cup of black beans, ? cup of pineapple chunks (with some juice) and ¼ of the plantain medallions. Garnish with chopped green onions or cliantro.\r\n',NULL,'2016-07-23 04:00:28','2016-07-23 22:42:35',1),(29,'Swiss Steak','6 medium beef blade steaks*\r\n8 oz fresh mushrooms, thinly sliced\r\n1 medium onion, sliced\r\n1 tbs fresh thyme, minced\r\n1½ tsp sweet paprika\r\n¾ cup chicken stock\r\n¼ cup dry sherry\r\n¼ cup flour\r\n4 tbs oil\r\nsalt & pepper to taste\r\n2 tbs fresh parsley, chopped\r\n½ cup heavy cream\r\n','Heat a heavy skillet or saute pan over medium heat. Add 1 tbs of the oil. Add the mushrooms; cover and cook for 5 minutes. Remove cover and continue cooking until mushrooms begin to brown. Remove from pan and place in the slow cooker.\r\nReturn the pan to the heat. Season the steaks with salt & pepper. Add 1 tbs of oil and brown the blade steaks nicely. Remove to a plate and set aside.\r\n\r\nReturn the pan to the heat and add 2 tbs of the oil. Add the sliced onions, the thyme and the paprika. Stir and cook for about 1 minute. Add the flour and stir well, cooking for about 1 minute. Whisk in the sherry and chicken stock, scraping up all the browned bits at the bottom of the pan. Add the entire contents of the pan to the slow cooker.\r\n\r\nPlace browned steaks on top of the mushroom/onion mixture. Cover and cook on LOW for 6-8 hours, HI for 4-5 hours.\r\nRemove steaks to a serving plate and cover with aluminum foil to keep them warm. Stir the cream and parsley into the liquid. Heat for another 10 minutes.',NULL,'2016-07-23 04:17:28','2016-07-23 22:05:06',1),(30,'Chipotle Sweet Potato Burgers','1 medium (1 lb.) sweet potato ..... $1.00\r\n½ cup frozen corn kernels ..... $0.31\r\n1 (15 oz.) can black beans ..... $1.19\r\n1 whole chipotle pepper in adobo sauce ..... $0.33\r\n½ cup (divided) cornmeal ..... $0.12\r\n¼ tsp garlic powder ..... $0.02\r\n½ tsp cumin ..... $0.03\r\n½ tsp salt ...... $0.03\r\n¼ bunch cilantro (optional) ..... $0.19\r\n1 Tbsp vegetable oil (for frying, optional) ..... $0.02\r\n4 medium wheat rolls ..... $1.42\r\n1 medium avocado ..... $1.19','Wash the sweet potato well and then poke it several times with a fork so that steam can escape while it cooks.\r\nTo cook it in the microwave: wrap it loosely with a paper towel, set it on a microwave safe plate, and microwave on high for five minutes. Carefully squeeze the potato to make sure it is soft all the way through. If it is not, microwave longer, in one minute increments, until it is soft all the way through (mine took 8 minutes).\r\n\r\nTook cook it in the oven: heat the oven to 400 degrees and then bake the potato for 45-60 minutes, or until it is soft all the way through (either directly on the oven rack or on a baking sheet).\r\n\r\nWhile the sweet potato is cooling, prepare the rest of the ingredients. Place the frozen corn in a large bowl. Drain and rinse the black beans. Allow as much excess water to drain away as possible, and then add them to the bowl with the corn. Roughly chop the cilantro leaves and then add them to the bowl, along with half of the cornmeal (1/4 cup), garlic powder, cumin, and salt. Take one chipotle pepper out of the can, mince it, and then add it to the bowl along with about one teaspoon of the adobo sauce from the can.\r\n\r\nOnce the sweet potato is cool enough to handle, scoop out the flesh and add it to the bowl with the rest of the ingredients. Stir everything together and then either use a potato masher or the back of a fork to slightly mash the beans. Cover and chill the mixture for 30 minutes to allow the cornmeal to absorb some of the moisture.\r\n\r\nDivide the sweet potato mixture into four (or six) portions and shape each into a patty, approximately ¾ inch thick. Use the remaining ¼ cup of cornmeal to coat the outside of the patties. This will provide a nice crunch to the burger.\r\n\r\nTo cook the patties in a skillet, heat ½ tablespoon of vegetable oil in a heavy bottomed skillet over a medium flame. When the oil is hot (it should look wavy on the surface), add two of the patties. Cook for about 5 minutes on each side or until the patties are golden brown. Add more oil and cook the remaining two patties. Remember to turn the patties carefully as they are quite soft and can fall apart.\r\n\r\nOR...\r\n\r\nTo cook the patties in the oven, Preheat the oven to 400 degrees. Line a baking sheet with foil and then coat lightly with non-stick spray. Place the patties on the foil and then spritz the top of the patties lightly with non-stick spray (this will help it crisp up). Bake for 25 minutes, or until the patties are heated through and the bottoms are golden brown.',NULL,'2016-07-23 04:20:54','2016-07-23 22:42:08',1),(34,'Chimichurri','1 cup (packed) fresh Italian parsley\r\n1/2 cup olive oil\r\n1/3 cup red wine vinegar\r\n1/4 cup (packed) fresh cilantro\r\n2 garlic cloves, peeled\r\n3/4 teaspoon dried crushed red pepper\r\n1/2 teaspoon ground cumin\r\n1/2 teaspoon salt','Add ingredients to food processor and blend.',NULL,'2016-08-05 02:18:43','2016-08-05 02:26:30',1),(35,'Red Pepper Steak Sauce','2 large red bell peppers, roasted\r\n1 small garlic clove, chopped\r\n1 small shallot, finely chopped\r\n2 tbsp cider vinegar\r\n2 tbsp worcestershire sauce\r\n1 tbsp honey or molasses\r\n1/2 tsp red-peper flakes\r\n2 tbsp olive oil','Puree the peppers in a blender with the garlic, shallot, vinegar, Worcestershire, honey, and red-pepper flakes; add salt and pepper to taste. Heat the olive oil in a medium saucepan on medium. Pour in the sauce and bring it to a boil on high, stirring often. Lower the heat to medium; simmer until the sauce is slightly thickened, about 6 minutes.',NULL,'2016-08-05 02:40:09','2016-08-05 02:40:26',1),(36,'Chile Verde','2.5 lb pork shoulder roast, cut into ½ inch cubes\r\n2 lbs tomatillos\r\n2 cups chicken stock\r\n2 tablespoons coconut oil\r\n1 yellow onion, diced\r\n4 garlic cloves, minced\r\n1 bunch cilantro\r\nJuice from 1 lime\r\n1 jalapeno\r\n1 tablespoon cumin\r\n½ teaspoon smoked paprika\r\n½ teaspoon black pepper\r\nSea salt to taste','Heat the coconut oil over medium high in a large soup pot and add the pork once the oil is hot enough that it sizzles when you add a piece of meat.  Brown the pork pieces for 4-5 minutes and remove the pork from the pan with a slotted spoon and set aside.  Add the onions and garlic to the oil and pork drippings and sauté for 7-10 min or until the onions start to brown.  Turn the heat down a bit and add the cumin, paprika and black pepper to the onions and garlic and mix well (it will be kind of pasty).  Add the chicken broth to the onion mixture and mix well, making sure to scrape all the goodness off the bottom of the pan.  Add the pork back to the soup pot into the liquid and bring to a boil.  Turn down to low. While the meat simmers, peel and wash the tomatillos.  Dry them well and in a large skillet over medium heat char them along with the jalapeno turning often, until the skins start to blacken (about 10 minutes).  Place the charred tomatillos, jalapeno, cilantro, and lime juice into a food processer or blender and blend until smooth.  Add to the pork in the soup pot and simmer for 2 to 2 ½ hours or until the pork is fall apart tender.  The sauce will reduce down and become thicker over the course of the cooking process. Serve with sliced avocado and cilantro for garnish.',NULL,'2016-08-05 02:48:04','2016-08-05 02:48:04',1),(37,'Low Carb Breakfast Burrito','2 eggs\r\nto taste salt\r\nto taste pepper\r\n2 tsp butter\r\n1 cup romaine lettuce [chopped]\r\n1 roma tomato [sliced]\r\n4 bacon strips [cooked crisp]\r\n1/2 avocado [sliced]','Mix the eggs well with the heavy cream, salt and pepper. Heat up a non-stick pan to a medium heat. Melt half the butter and add half the egg mixture. Tilt the pan back and forth to ensure it covers the entire base. Cover the pan and cook for about a minute.\r\n\r\nWhen you are able to move the entire crepe when shaking the pan back and forth, flip it over with a spatula. When it\'s fully cooked, transfer to a paper towel to remove excess oiliness. Repeat with the other half of the egg mix. Add the lettuce, tomato, bacon and avocado. Season with salt and pepper. ',NULL,'2016-08-05 02:55:37','2016-08-06 15:38:36',1),(38,'African Peanut Butter Stew','1 lb chicken\r\n1/2 onion, chopped\r\n3/4 cup white rice\r\n3/4 cup broth\r\n1 red bell pepper, chopped\r\n2/3 cup milk\r\n2-4 garlic cloves, minced\r\n3 tb peanut butter\r\n2 tomatoes, chopped\r\n1 small sweet potato,chopped\r\nhandful of spinach\r\ncayenne pepper\r\nsalt','Preheat of to 450 degrees.\r\n\r\nPut chopped onion in crockpot. Rinse rice and add to pot along with broth. Place chicken on top of rice; then add bell pepper. Mix milk, garlic, cayenne pepper, salt, peanut butter together until peanut butter dissolves then pour over chicken. Add the tomatoes, sweet potato, and spinach.\r\n\r\nBake for 45 minutes.',NULL,'2016-08-06 17:21:31','2016-08-11 02:51:51',1),(39,'Red Lentil Curry',' ¾ cup red lentils (masoor dal) - these are split lentils (red/pink)\r\n¼ tsp Fenugreek Seeds\r\n? tsp black peppercorns\r\n? tsp cayenne or to taste or 1-2 dried red chilies (California red for mild, cayenne or bird eye red chilies for hot)\r\n¼ tsp turmeric\r\n1 tsp oil\r\n½ tsp mustard seeds\r\n6 to 8 curry leaves, fresh or frozen or dried\r\n½ small red onion, chopped\r\n2 inch Cinnamon Stick\r\n1½ cups water\r\n¾ tsp salt or to taste\r\n¼ to ? cup or more coconut milk or other non dairy milk\r\n1 tomato, finely chopped\r\n½ to 1 tsp lemon juice\r\n','    Wash and soak the red lentils. Grind the fenugreek, black pepper, cayenne/red chilies, turmeric into a powder and keep aside. In a saucepan, heat oil over medium heat. When hot, add the mustard seeds and let them start to pop. Add curry leaves carefully and mix in. Add the fenugreek seed powder, stir and cook for 5 to 10 seconds. Add onions, cinnamon stick and a pinch of salt. Mix to coat with spices. Cook for about 3 minutes.\r\n    Drain and add the lentils to the saucepan. Add water, salt and coconut milk. Mix in. Partially cover and cook for 12 to 14 minutes. Add in the tomatoes, lemon juice, taste and adjust salt and spice. Lower the heat to low. Cover and cook for 12 to 15 minutes. Stir once in between. Garnish with shredded coconut and pepper flakes (optional). Serve as a soup with crackers or as dal with rice or flatbread.\r\n',NULL,'2016-09-21 00:18:56','2016-09-21 00:18:56',1),(40,'Healthy Sweet Potato Brownies','1 cup mashed sweet potato\r\n1/2 cup smooth nut butter of choice (I used cashew butter and almond butter)\r\n2 T pure maple syrup\r\n1/4 cup cocoa powder (I used half dark cocoa powder, half standard cocoa powder)\r\nHandful of chocolate chips (optional)\r\n','    Preheat the oven the 350 degrees, grease a small cake pan or loaf pan and set aside. In a small microwave-safe bowl or stovetop, melt your nut butter with your pure maple syrup. In a large mixing bowl, add the mashed sweet potato, nut butter, maple syrup and cocoa powder and mix very well. If using chocolate chips, stir them through.\r\n    Pour the mixture into the greased pan and bake for around 20 minutes or until cooked through. Remove from the oven and allow to cool completely before slicing into pieces.\r\n',NULL,'2016-09-21 00:28:10','2016-09-21 00:34:08',1),(41,'Turkey Burrito','Filing Part One (Turkey):\r\n1 tablespoons oil\r\n½ onion, minced\r\n3 lbs. ground turkey\r\n2 tablespoon EACH chili powder and cumin\r\n3-5 individual chipotle peppers (canned in adobo sauce), minced Coupons \r\n2 teaspoons salt\r\n\r\nFilling Part Two (Vegetables):\r\n1 tablespoon oil\r\n½ onion, minced\r\n1 tablespoon EACH chili powder and cumin\r\n4-5 cups chopped veggies like carrots, zucchini, sweet potatoes, bell peppers, etc. (see notes for specifics)\r\n1 cup chicken broth (more as needed)\r\n1 14-ounce can pinto or black beans\r\n2 cups shredded Mexican blend cheese\r\n1½ cups plain Greek yogurt\r\n\r\nFor Serving:\r\n15 10-inch tortillas\r\navocado, hot sauce, cilantro, etc. for serving','Filling Part One: Heat the tablespoon oil in a large Dutch oven or stock pot. Add the onion and the turkey; as the turkey cooks, add the spices, chipotle peppers, and salt. Cook until the turkey is browned and fully cooked. When the meat is saucy and delicious-looking, transfer to a large bowl and set aside.\r\nFilling Part Two: In the same pot, add the oil, onion, veggies, and spices. Saute for a few minutes until the vegetables are mostly soft. Add enough broth to barely cover the vegetables and simmer for 10 minutes or so, until the vegetables are soft and the mixture has thickened. Add the beans, meat, cheese, and yogurt. Stir until creamy. Also at this point it\'s a good idea to taste and add salt or more seasoning to make sure you\'re all good on flavor.\r\nFill each tortilla with about ½ cup of the filling, fold up (I spread a little goat cheese or avocado on the sides to help them stick together), and wrap with plastic or foil. Store in the freezer for quick, grab-and-go lunches and dinners!\r\nTo heat and eat, either pop in the microwave (takes about 5 minutes for a semi-thawed burrito) or in the oven (I\'ve never been patient enough to do it this way so I don\'t have a good time guideline here) or a combo with the microwave and then on a skillet if you\'re at home so you can get that golden brown exterior. That\'s the best way.',NULL,'2016-10-25 04:07:02','2016-10-25 04:07:02',1),(42,'Chicken with Avocado Sauce','4 (4-ounce) boneless, skinless chicken breasts \r\n2 tablespoons blackened seasoning \r\nAvocado Cream Sauce: \r\n½ cup plain, 0% Greek yogurt \r\n½ avocado \r\n1 teaspoon lemon juice \r\n½ teaspoon garlic powder \r\n? teaspoon salt \r\nFor Serving: \r\n2 tablespoons green onions, thinly sliced','Place the chicken breasts and blackened seasoning in a large resealable bag. Seal and shake a few times to evenly coat the chicken. \r\nLightly coat a large skillet with nonstick cooking spray and heat over medium-high heat. Add the chicken and cook until cooked through, 4 to 6 minutes per side. \r\nMeanwhile, in a food processor, combine the yogurt, avocado, lemon juice, garlic powder, and salt and pulse until smooth and creamy. \r\nTo serve, top each chicken breast with 2 tablespoons of the creamy avocado sauce and garnish with ½ tablespoon green onions.',NULL,'2016-10-25 04:12:02','2016-10-25 04:12:02',1),(43,'Vietnamese Beef','1 lb / 453 gr beef (flank steak), sliced into ½-inch bite-size stripes\r\n2 teaspoons freshly grated ginger\r\n2 garlic cloves, minced\r\n2 tablespoons fish sauce (I used Red Boat)\r\n1 tablespoon vegetable oil\r\n¼ teaspoon ground black pepper\r\n½ cup sesame seeds (I used black and white sesame seeds)','In a large bowl combine ginger, garlic, fish sauce, oil, and ground black pepper.\r\nAdd beef and toss to coat. \r\nLet marinate for at least 20 minutes (one hour best).\r\nPlace sesame seeds in a large Ziploc bag (or other resealable bag) add beef slices and gently shake to coat evenly.\r\nHeat a large heavy-bottomed skillet over medium-high heat.\r\nWhen it’s very hot, add the beef in batches and grill on both sides very quickly until it’s just cooked.',NULL,'2016-10-25 04:15:10','2016-10-25 04:17:04',1);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_tags`
--

DROP TABLE IF EXISTS `recipes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_tags` (
  `recipe_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`recipe_id`,`tag_id`),
  KEY `tag_key` (`tag_id`),
  CONSTRAINT `recipes_tags_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recipes_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_tags`
--

LOCK TABLES `recipes_tags` WRITE;
/*!40000 ALTER TABLE `recipes_tags` DISABLE KEYS */;
INSERT INTO `recipes_tags` VALUES (3,1),(4,1),(9,1),(10,1),(19,1),(20,1),(29,1),(43,1),(1,2),(12,2),(13,2),(16,2),(20,2),(25,2),(28,2),(38,2),(42,2),(2,3),(5,3),(6,3),(14,3),(17,3),(18,3),(20,3),(30,3),(39,3),(2,4),(20,6),(26,6),(36,6),(11,7),(15,7),(20,7),(40,9),(34,10),(35,10),(36,11),(37,11),(38,12),(13,13),(14,13),(18,13);
/*!40000 ALTER TABLE `recipes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes_users`
--

DROP TABLE IF EXISTS `recipes_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes_users` (
  `recipes_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`recipes_id`,`users_id`),
  KEY `recipes_users_ibfk_2_idx` (`users_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes_users`
--

LOCK TABLES `recipes_users` WRITE;
/*!40000 ALTER TABLE `recipes_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipes_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'beef','2016-07-01 03:18:58','2016-07-24 14:14:24'),(2,'chicken','2016-07-01 03:19:12','2016-07-24 14:18:02'),(3,'vegetarian','2016-07-01 03:19:31','2016-07-01 03:19:31'),(4,'dessert','2016-07-07 00:00:00','2016-07-07 00:00:00'),(6,'pork','2016-07-23 22:43:00','2016-07-23 22:43:00'),(7,'fish','2016-07-23 22:43:18','2016-07-23 22:43:18'),(8,'shellfish','2016-07-23 22:47:50','2016-07-23 22:47:50'),(9,'vegan','2016-07-23 22:49:54','2016-07-23 22:49:54'),(10,'sauce','2016-08-05 02:26:15','2016-08-05 02:26:15'),(11,'paleo','2016-08-05 02:45:32','2016-08-05 02:48:25'),(12,'crockpot meals','2016-08-06 17:06:31','2016-08-06 17:06:31'),(13,'soup','2016-08-13 16:14:54','2016-08-13 16:14:54'),(14,'turkey','2016-10-25 04:20:30','2016-10-25 04:20:30'),(15,'asian','2016-10-25 04:20:47','2016-10-25 04:20:47'),(16,'indian','2016-10-25 04:20:58','2016-10-25 04:20:58'),(17,'mexican','2016-10-25 04:21:09','2016-10-25 04:21:09');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-23 23:11:36
