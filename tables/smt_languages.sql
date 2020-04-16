DROP TABLE IF EXISTS smt_languages;

CREATE TABLE IF NOT EXISTS smt_languages
(
	language_id					SMALLINT		NOT NULL,
	language					VARCHAR (50)    NOT NULL,
	lc_language					VARCHAR (50)    NOT NULL,
	country						VARCHAR(50)		NOT NULL,
	PRIMARY KEY ( language_id )
);

CREATE UNIQUE INDEX smt_language_lang ON smt_languages ( lc_language);

INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 1,'Algerian Arabic',			'algerian arabic',			'Algeria');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 2,'Amharic',					'amharic',					'Ethiopia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 3,'Assamese',				'assamese',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 4,'Bavarian',				'bavarian',					'Austria');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 5,'Bengali',					'bengali',					'Bangladesh');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 6,'Bhojpuri',				'bhojpuri',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 7,'Burmese',					'burmese',					'Myanmar');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 8,'Cebuano',					'cebuano',					'Philippines');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 9,'Chhattisgarhi',			'chhattisgarhi',			'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 10,'Chittagonian',			'chittagonian',				'Bangladesh');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 11,'Czech',					'czech',					'Czech Republic');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 12,'Deccan',					'deccan',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 13,'Dutch',					'dutch',					'Netherlands');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 14,'Eastern Punjabi',		'eastern punjabi',			'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 15,'Egyptian Arabic',		'egyptian arabic',			'Egypt');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 16,'English',				'english',					'United Kingdom');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 17,'French',					'french',					'France');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 18,'Gan',					'gan',						'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 19,'German',					'german',					'Germany');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 20,'Greek',					'greek',					'Greece');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 21,'Gujarati',				'gujarati',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 22,'Hakka',					'hakka',					'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 23,'Hausa',					'hausa',					'Nigeria');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 24,'Hejazi Arabic',			'hejazi arabic',			'Saudi Arabia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 25,'Hindi',					'hindi',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 26,'Hungarian',				'hungarian',				'Hungary');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 27,'Igbo',					'igbo',						'Nigeria');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 28,'Indonesian Malay',		'indonesian malay',			'Indonesia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 29,'Iranian Persian',		'iranian persian',			'Iran');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 30,'Italian',				'italian',					'Italy');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 31,'Japanese',				'japanese',					'Japan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 32,'Javanese',				'javanese',					'Indonesia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 33,'Jinyu',					'jinyu',					'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 34,'Kannada',				'kannada',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 35,'Kazakh',					'kazakh',					'Kazakhstan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 36,'Khmer',					'khmer',					'Cambodia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 37,'Kinyarwanda',			'kinyarwanda',				'Rwanda');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 38,'Korean',					'korean',					'South Korea');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 39,'Magahi',					'magahi',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 40,'Maithili',				'maithili',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 41,'Malayalam',				'malayalam',				'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 42,'Malaysian Malay',		'malaysian malay',			'Malaysia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 43,'Mandarin',				'mandarin',					'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 44,'Marathi',				'marathi',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 45,'Mesopotamian Arabic',	'mesopotamian arabic',		'Iraq');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 46,'Min Bei Chinese',		'min bei chinese',			'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 47,'Min Dong Chinese',		'min dong chinese',			'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 48,'Min Nan',				'min nan',					'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 49,'Moroccan Arabic',		'moroccan arabic',			'Morocco');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 50,'Nepali',					'nepali',					'Nepal');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 51,'Nigerian Fulfulde',		'nigerian fulfulde',		'Nigeria');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 52,'North Levantine Arabic',	'north levantine arabic',	'Syria');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 53,'Northern Kurdish',		'northern kurdish',			'Turkey');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 54,'Northern Pashto',		'northern pashto',			'Pakistan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 55,'Northern Uzbek',			'northern uzbek',			'Uzbekistan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 56,'Odia',					'odia',						'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 57,'Polish',					'polish',					'Poland');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 58,'Portuguese',				'portuguese',				'Portugal');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 59,'Romanian',				'romanian',					'Romania');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 60,'Rundi',					'rundi',					'Burundi');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 61,'Russian',				'russian',					'Russian Federation');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 62,'Saʽidi Arabic',			'saʽidi arabic',			'Egypt');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 63,'Sanaani Spoken Arabic',	'sanaani spoken arabic',	'Yemen');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 64,'Saraiki',				'saraiki',					'Pakistan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 65,'Sindhi',					'sindhi',					'Pakistan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 66,'Sinhala',				'sinhala',					'Sri Lanka');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 67,'Somali',					'somali',					'Somalia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 68,'South Azerbaijani',		'south azerbaijani',		'Iran');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 69,'South Levantine Arabic',	'south levantine arabic',	'Jordan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 70,'Southern Pashto',		'southern pashto',			'Afghanistan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 71,'Spanish',				'spanish',					'Spain');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 72,'Sudanese Arabic',		'sudanese arabic',			'Sudan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 73,'Sunda',					'sunda',					'Indonesia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 74,'Sylheti',				'sylheti',					'Bangladesh');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 75,'Tagalog',				'tagalog',					'Philippines');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 76,'Taʽizzi-Adeni Arabic',	'taʽizzi-adeni arabic',		'Yemen');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 77,'Tamil',					'tamil',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 78,'Telugu',					'telugu',					'India');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 79,'Thai',					'thai',						'Thailand');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 80,'Tunisian Arabic',		'tunisian arabic',			'Tunisia');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 81,'Turkish',				'turkish',					'Turkey');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 82,'Ukrainian',				'ukrainian',				'Ukraine');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 83,'Urdu',					'urdu',						'Pakistan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 84,'Uyghur',					'uyghur',					'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 85,'Vietnamese',				'vietnamese',				'Viet Nam');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 86,'Western Punjabi',		'western punjabi',			'Pakistan');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 87,'Wu',						'wu',						'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 88,'Xiang Chinese',			'xiang chinese',			'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 89,'Yoruba',					'yoruba',					'Nigeria');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 90,'Yue',					'yue',						'China');
INSERT INTO smt_languages ( language_id, language, lc_language, country ) VALUES ( 91,'Zulu',					'zulu',						'South Africa');
