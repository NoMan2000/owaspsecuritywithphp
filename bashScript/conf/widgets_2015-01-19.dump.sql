----
-- phpLiteAdmin database dump (http://phpliteadmin.googlecode.com)
-- phpLiteAdmin version: 1.9.5
-- Exported: 10:40pm on January 19, 2015 (CST)
-- database file: ../security/DataBase/sqlite/widgets.sqlite
----
BEGIN TRANSACTION;

----
-- Drop table for changelog
----
DROP TABLE "changelog";

----
-- Table structure for changelog
----
CREATE TABLE 'changelog' (                                                                           
     `change_number` bigint(20) NOT NULL,'delta_set' TEXT NOT NULL, 
    `start_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,'applied_by' TEXT NOT NULL,'description' TEXT NOT   NULL, 'complete_dt'  DATETIME DEFAULT CURRENT_TIMESTAMP  , PRIMARY KEY (`change_number`,`delta_set`)
 );

----
-- Data dump for changelog, a total of 10 rows
----
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('1','Main','1421728273','dbdeploy','1-create-companies.sql','1421728273');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('2','Main','1421728273','dbdeploy','2-create-companyusers.sql','1421728273');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('3','Main','1421728273','dbdeploy','3-create-groups.sql','1421728273');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('4','Main','1421728273','dbdeploy','4-create-orders.sql','1421728273');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('5','Main','1421728273','dbdeploy','5-create-customers.sql','1421728273');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('6','Main','1421728332','dbdeploy','6-companySeeds.sql','1421728332');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('7','Main','1421728332','dbdeploy','7-companyUserSeeds.sql','1421728338');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('8','Main','1421728348','dbdeploy','8-companyGroupSeeds.sql','1421728350');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('9','Main','1421728350','dbdeploy','9-customerSeeds.sql','1421728351');
INSERT INTO "changelog" ("change_number","delta_set","start_dt","applied_by","description","complete_dt") VALUES ('10','Main','1421728400','dbdeploy','10-companyOrderSeeds.sql','1421728437');

----
-- Drop table for companies
----
DROP TABLE "companies";

----
-- Table structure for companies
----
CREATE TABLE `companies` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `website` VARCHAR(155) NULL,
  `address` VARCHAR(155) NULL,
  `city` VARCHAR(155) NULL,
  `state` VARCHAR(155) NULL,
  `phone` VARCHAR(45) NULL
);

----
-- Data dump for companies, a total of 10 rows
----
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('1','Harris-Herzog','Bernhard.com','675 Ledner Trafficway Suite 188
Freedahaven, OK 79275','South Reggie','South Dakota','0515734424');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('2','Ruecker and Sons','Ondricka.info','0925 Bernier Stravenue Apt. 086
North Scarlettton, FL 04976','Hermannbury','Kentucky','3702450679');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('3','Gutkowski LLC','Huels.com','440 Eugene Loop Apt. 160
Greenfurt, DC 00648','Port Meggie','Indiana','4337249878');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('4','Schmitt-Schroeder','Hermiston.org','83940 Smith Mill Suite 901
East Baronside, NC 21952','Idellahaven','Pennsylvania','1578550839');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('5','Brekke, Buckridge and Dicki','Grimes.com','4983 Baumbach Trafficway
New Loyfort, TX 75396-2603','Hilllmouth','Arizona','8251600203');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('6','Turcotte, Kohler and Bahringer','Lebsack.org','785 Homenick Trail Apt. 557
West Elvaberg, AR 24581','Vivianneside','Nebraska','3730485527');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('7','Schiller-Waelchi','Reichert.com','409 Brooks Overpass Apt. 945
Sylviashire, AK 93884-0513','Lillyfort','Oklahoma','2857975182');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('8','Mann, Cummings and Shields','Schmitt.com','6647 Lila Islands
Willport, NJ 20529-4860','Port Ewell','Missouri','8000895176');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('9','Koepp LLC','Connelly.info','660 Gorczany Oval
Jaceyside, MN 55038','Powlowskistad','Utah','4623943143');
INSERT INTO "companies" ("id","name","website","address","city","state","phone") VALUES ('10','Rice, Gleason and Kuhn','Bode.com','697 Bergstrom Meadows
Emelyland, KY 13003','Altenwerthport','Wyoming','1734102782');

----
-- Drop table for users
----
DROP TABLE "users";

----
-- Table structure for users
----
CREATE TABLE `users` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `company_id` VARCHAR(45) NULL,
  `is_locked` BINARY DEFAULT 0,
  `attempts` INT DEFAULT 0,
  `password` TEXT NOT NULL,
  `group_id` TEXT NULL,
  `plainpassword` TEXT NOT NULL,
  `is_admin` BINARY NULL DEFAULT 0,
    FOREIGN KEY (`company_id`)
    REFERENCES `companies` (`id`)
);

----
-- Data dump for users, a total of 150 rows
----
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('1','mike1','Pauline.Rutherford@example.com','1799082498','1','0','0','$2y$10$.2HvB34Gq18DtAaXv64ezepd.ID4BofNP4S1w7eNeabEsjt8i2S4e','40','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('2','mike2','Bernhard.Sim@example.org','1736196555','2','0','0','$2y$10$UQNCX0TqDWJKKVl9ZVnSou6kfiUJW9GX1Bc4kVLd3kKWzm4fKnBLe','7','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('3','mike3','Elisa05@example.org','7458786819','3','0','0','$2y$10$DdWnnmJpeE6B0nruKJ55puSreoFSI7mamO8f0UhrxO.oTjUC9P7N.','38','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('4','mike4','Eve.Huels@example.net','2271830859','4','0','0','$2y$10$kNeAAUvUHWs7o3sCI9Xzt.CsDiOp2S2zGGu1ZOl0beN1gQG7ba4W.','36','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('5','mike5','Effertz.Marcellus@example.net','3025720342','5','0','0','$2y$10$G/xVROwyUpKGg4syDFZIaeyLrdqcj2gDvV2OubCvg3F.CbU5QVEJu','24','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('6','mike6','Jamarcus.Bayer@example.net','5443640094','6','0','0','$2y$10$GaWWj29rhGM9rSQttjNSmuBwFMlHoaEDeCk1E.QQ.5qZNzz6UGb8u','28','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('7','mike7','Chyna51@example.net','6974408987','7','0','0','$2y$10$aDkzrMklWpe54QjVFIFaxeno32PlizzLmZpHj3bo3/bDss1oLAGpq','33','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('8','mike8','Brian.Marks@example.net','7694106457','8','0','0','$2y$10$LdUKjRmz2YGTI7d1dAnnUeaLtUSsWZzH7YiJ8q1zZOCuZeb67ueQW','26','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('9','mike9','Westley.Mayer@example.org','0729979467','9','0','0','$2y$10$Xvd0fQcosOJr5TOfSc1swuhzdQLfRQLXWEEtGHdnZNYzPpfiG6MCO','40','password1234','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('10','tWeissnat','DuBuque.Jennifer@example.com','4614965704','9','0','0','$2y$10$teVQf9ORGQfCe1o7FC0aWOiSXVmaTqF7TxWVZufyRebxNyhrydhZC','35','l{tQG`sY','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('11','fMurazik','Ora50@example.com','8342050110','3','0','0','$2y$10$HOZ0z4IOt/T91KIfVNj8p.ONzKcBW3SES7uaWOzNt6fgalpd5CbrK','4','nrnyrqrO~eBE`.t','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('12','Connor.Glover','Beer.Enoch@example.com','7153687534','1','0','0','$2y$10$WIL7pVoCAJwKaoElFJeQkOJcNCIoNsebFeJMHLz7DkXSPHzseVCA2','34','gpta+''''/P','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('13','Barrows.Bianka','Angelo00@example.net','1238308347','7','0','0','$2y$10$9VNSeJzqir0OZB90CCDuCus9fIeHpOozJon/31Sg2l6hRi7Cgts5a','1','1s7aC!','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('14','Queen44','Brielle.Lind@example.org','0459311929','5','0','0','$2y$10$xjzYcshvPhRjoBU0zJFQleqkhX1cxftRbXxWzi6ORUQdCVn5mkRkC','2','rEJe*`>HW;@7','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('15','Veum.Jaida','Gail23@example.com','5510241478','2','0','0','$2y$10$dyOO8vYY6XApo75ZRqiX5OiGuub1rqeTKC9xS3NyOBiXxNvGBPMXa','33','n%Q7Ms','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('16','Bo.Kuphal','xRunte@example.org','9902721930','4','0','0','$2y$10$ICVBn5/7ge2zI7xp5qQKL.1vPfAzeQPwI4XhJ1SFSYU2GDKU7yBr2','4','/$",B-V63&jQ','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('17','Clara.Prosacco','Bayer.Raheem@example.org','8547688165','10','0','0','$2y$10$XkCnOSxYnpmFOGZo.J9BUex8j.rEm.VR.hAmPxTihw.OhS.zuNsVG','35','-D|4~9','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('18','uCruickshank','sDibbert@example.net','8274677237','2','0','0','$2y$10$sMj9rWn9HwSRrIBYwpg87.EGHx97y0WzkRbBf5HpuVDDShSo79Szu','35','rDGH?=K[JeFwk','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('19','Nadia43','Krajcik.Caroline@example.net','0987055029','3','0','0','$2y$10$3d72x0PUeWkDuD2Sb3FY2e4RxvslT51xe5UNW9kQqTxqXWAHshhAa','27','N^DkLRUx','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('20','wDonnelly','Runolfsdottir.Elisabeth@example.org','6503313403','9','0','0','$2y$10$dRmgK7g2p29.wTpSwkmmd.j3U1JkFkdL0bf9W1t5kyMJGK7.bE7C2','35','q_V?pJq1``XCPPvq~p%T','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('21','Alisa88','Mayra.Zemlak@example.net','9163747177','9','0','0','$2y$10$Nx1HQsT.gjQL4lajqbEa8Oa8kgPW.J1u22Pg5UzZbJFvob//hmxHe','13','Y&M5Nlu','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('22','Robb.Carroll','Ova37@example.net','4064896328','2','0','0','$2y$10$OPin1vkRt2dLaCXVenCYne2WpksuzSTRwCWTpkukSFxjx..WXGYhq','36','fSJ@k*','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('23','Gutmann.Kira','Darrion.Flatley@example.org','7616204066','9','0','0','$2y$10$9YMYrOdUll9X7g3m7eMj5ep0aF5PaalW9rt1qigGYJWQXRo6jWpj6','38','$PglXVu1[~w{CmU1H1R','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('24','Ortiz.Alphonso','cSchimmel@example.org','0932366144','6','0','0','$2y$10$E.7LqjKOQmqYNPyN4nY2puzQH/IpR1e4c0ff3tAFN.8yit.iy6gq6','37','!I8ji+;','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('25','Maegan30','Lisette80@example.org','5008880756','8','0','0','$2y$10$14Rllc9MLhk2dzrWlmWLIeHCfhPBhCs43K3ONERr9M2/dGd0/A8h.','26','Q`@Fd1hQE%-','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('26','hHansen','cRatke@example.org','7263071333','8','0','0','$2y$10$y3EC9EFRbD2.i74KcA/ShedgRZzY8uerPoAFweRvRseXcEpBJ674W','11','77ti}/2mu-\\ee!g?','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('27','OConner.Rowland','Guadalupe.Bergstrom@example.com','0595879261','3','0','0','$2y$10$0A.3LZt54u0lkfmA5Nr1YugHXu57Gl4FK.mbLNpy51bSRFFTlkiK.','40','TQF^j%\I','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('28','Tomasa.Nolan','Arnoldo.Heller@example.net','5578453775','3','0','0','$2y$10$BcrWupzGVbkBqGTVFSxvzeksiTYspggt6r/yPAw/UPcl/BaxTECvG','25','EIWoxxju*qOWFNAfc_gU','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('29','Fay.Mallory','tCrona@example.com','5143725436','6','0','0','$2y$10$6n.piuwU6a6xDMhIQpc9veqi8KfofTyP1jV3J.S/JWjO8NGf0HiI6','27','X",YFY\4gq','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('30','Ernestine56','Sabrina.Legros@example.com','8490662286','3','0','0','$2y$10$f2BHo4BGBFaqp7zgueok4OeLwfhCiD.FqstA8CDJzD21TLla1mlie','27','(bj_Df','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('31','Glenda19','Murphy.Sabina@example.org','3576335554','4','0','0','$2y$10$y88f84YFEx/9DooQ4QCW7uQKgoBT3iokTDWHtp0.v6N.pwtr5Mmem','16','f4\6LWY`tSI{vuE','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('32','Tre16','Funk.Ana@example.net','9445251956','1','0','0','$2y$10$Gsj02tYV287jHi/w52ufiu7ugiUYewHuzIAD4kmfGWmwumLP.br16','20','t8"txPfD','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('33','Nyasia.Bailey','sBechtelar@example.org','8603705148','2','0','0','$2y$10$TiBMWBsQoBBUwSkq1QZUE.ZP9LJQgl4mU4U5ZeMmZhNtmQMgvMdN2','20',':2|oU!Y.&k','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('34','Rolfson.Alia','vGrant@example.com','7971769203','3','0','0','$2y$10$QpOo2bte8axcmzRsyZSo4O1QU109tJC36OKxK2drKJRgWFhe7Ejd.','16',',p5i%f]\zk[Z?+W','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('35','Emmalee06','Larson.Dandre@example.net','9091678985','6','0','0','$2y$10$67vjmIdaFU5yilY7WFvfPuguEIcHq.vKkcVG.0JDEPm/B/f2u5Osi','35','hm}?@sS//R#}YL5)=','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('36','yQuigley','pSchmitt@example.org','8356861810','10','0','0','$2y$10$7ocK5Nxj8tjKiP3eqUQJju6IbkkdMmTtupkgEcmQdSUGPUzTs.L8S','10','''s>+24F;','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('37','Herman.Torey','Dooley.Kendra@example.org','6921695092','2','0','0','$2y$10$6ft.cH1EF1Ca9.qMM4508.nIsBoCthhW6CsveD2TT/P9ng1Ls6F/u','28','"r6MeN`b%2aZl9','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('38','Eileen.Grant','iPowlowski@example.com','6032808425','8','0','0','$2y$10$6OOhg1KD7WiIFSvgKdt0AeNFd3wTMQXpPzB1Yh7p7wNr1cR8XoVw6','6','6-K-K&Ri!eN3uUxVZTa','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('39','sWatsica','Bernhard.Rae@example.org','9395540778','3','0','0','$2y$10$EyYVIxNl10TouULlivts0ur/KWGGsKCYJEhboOHwcMwW1KK3wz4.m','29','5wt:ASX','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('40','Ray.Hagenes','Jacobson.Geraldine@example.net','9044876606','7','0','0','$2y$10$y2QLpsfkyGlIviB9b5mbm.sLqxydoshKQL4YLNp8yOAE3LPiH9KqG','40','\SMMGNOs','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('41','Estell07','Dorris94@example.org','8185668660','9','0','0','$2y$10$4sQ88WwhjbMWefYERpHAh.EkvfD8mKbameyWoo5kQR6ydbu/K8wf.','22','QgX?GPHna9U','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('42','kMcKenzie','qWatsica@example.org','4810732366','7','0','0','$2y$10$dTSGExSIVP5ii9fkXSGDVOiH7I024H2Zi/GG7axYUJJM2Zib6gUtm','40','lL8WWJ7fzn[SSBy','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('43','Addison.Denesik','Dewitt20@example.net','1151373195','4','0','0','$2y$10$zTEtkWOWhs38jxYJfLUtpe32hnKo3/6T8Q2XQpg56EqqFjzACsi/6','40','k#%U3a0z/N`V-3d6yO','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('44','Casandra26','Alexys.Kozey@example.com','5062774729','6','0','0','$2y$10$..HagMBdFCWlH2lepj0e0Oa5jYGUSAuOByZ36ARtR2QJYi4u6Yx8a','36','cH~0";H+MYUz;','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('45','Hickle.Isai','Earnestine86@example.com','5117911496','8','0','0','$2y$10$LTNYZ1nHwaRpinQOGpQzr.TA9FGF3vENV8ZR8ZcdeFK73TZ2IPr3W','26','\SVO(''lgb%jOw#>NxgF','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('46','Tromp.Joshua','uWaters@example.com','1468397025','10','0','0','$2y$10$Sxn6xRNHg0bf8cnViYQurOEpsXTEQ1Kg7s8k.BU66UBrRQC.rY1Hu','32','XeG>$r1','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('47','Lucious.Cruickshank','bConsidine@example.net','9404937197','5','0','0','$2y$10$xtA1HFmTB4vQfy8pWYnrB.Wa7SaLG8wY50Tq9yvSNjk7Dhzj33MG6','14','R%%Ro8n(kX','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('48','Mikel.Goodwin','Hegmann.Maudie@example.net','0732673081','9','0','0','$2y$10$PSZ7lslz7sx29EVq3GQ0dO7iT2idBMBnPjkvY6Utp5uk0GxS9CFq.','20','Mv!;<Sn\32b[X','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('49','Esperanza.Barton','pOndricka@example.net','5835993571','2','0','0','$2y$10$HOHK.ze6b3.T0ZhAXDUY6O.BNWASIz.Ogpzc1zNE7kaAzC6s1jryC','15','/4tN%GY$$','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('50','Lue69','Mya.Hickle@example.org','0813719942','4','0','0','$2y$10$TVa.HHf1gTC2HTPtgrn1E.16NCl/YwMHlClGwTpe9yMpXxb4Q3P0m','22','NMne2S_g]*.<','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('51','Christine36','Sydni.Gislason@example.com','3967927251','5','0','0','$2y$10$aDh5G.oOrdcUtd/qpz2tk.DW7KVvixrhgSaBqSuW5QHVJb28mMSmq','26','{/xtTBOZ$E~:(<_+/*','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('52','Schowalter.Darby','Ken49@example.com','3148031527','8','0','0','$2y$10$kHt7EXqBWixAibtrRU/Qd.0x6W6Z8OJaCLYt.LMtQWhNAlHQbNsO2','31','mu]`Td<X8w','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('53','Araceli05','mReynolds@example.org','1282330020','1','0','0','$2y$10$98VuFRsYtg5xh/C/k522o.YLy.3wk/tCEkjSEzuNLKm.x/EHYpU56','35','0v6lJq0;![K','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('54','Donavon01','Lorna.Ebert@example.org','2049447330','1','0','0','$2y$10$02aZNiVCqnLWlUXCh3TXkOSuMipcCUiM4Krs5ZxWqNFTe.HTkLFqi','24','u;L2h#','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('55','Katlyn.Thompson','Rick56@example.org','7507840950','1','0','0','$2y$10$hCofWQ1T2LyVkZm23GQ5pelAvWn5lEh1X8nGO//y9LuUoZuoU.QlK','23','#iZ2`kJ|/7ZCn+&vY>','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('56','Connie80','Rowe.Modesto@example.com','8007789210','6','0','0','$2y$10$vI.igjofPotMacnA24XL4uVpOf/RzIPbc9PCUrg3AlJ8Afmn6RB1O','32','V[36fk','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('57','Kristofer61','Miller.Elfrieda@example.net','2479093956','4','0','0','$2y$10$AqDV.rcoZTmc05DRbGwmCux5y3vFjOtdM1hELxX7dSXi.XycVIrXO','34','Ov;m=G}1-!mYwlSy','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('58','Feeney.Julianne','Sunny25@example.com','4992415420','7','0','0','$2y$10$U7SqRp8RfVUs2h7mmUreh.S0JCPhvXi1039QLUv/.ItOqxy7cdFh6','39','Qyj*"_Y=','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('59','Ankunding.Kenyatta','hEbert@example.com','3516040544','10','0','0','$2y$10$xoV9DYKMPguGFfgKO3QVfeN2GY/3R2yOJeJcXWpf1Ywbec1t67tGe','12','tUH,Knl[a=0zx9','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('60','Clair.Weissnat','Ruth34@example.net','6327170377','4','0','0','$2y$10$edKl1soRxbzAD/tI.7EXg.VhI3K4SBtjgkJ.SRwvAOkTwvkyM4QSC','29','{\aP<t','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('61','Keshawn.Gleason','aProhaska@example.net','0976981149','5','0','0','$2y$10$z4gg26g2mOLyJMTtmrGBI.q9FZ7tPzmxWJE8cwUKJGUf185G3q1zG','20','+}4IQeLua&T;rW@','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('62','jStanton','iKilback@example.net','2613538818','3','0','0','$2y$10$0x0Xk7NU7E.EC5jlFejTke8T/QsFk99wXZGvmxd4ILsERZm8r357S','11','F3,BZx1;K~z','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('63','Raven.Davis','Reese.Mayert@example.net','7244634548','5','0','0','$2y$10$ZlTLOiJ151N3ZToMQjNaGOOPttzWR5Sa9RChsAMvIhCzJY5zYc.wW','37','#6U5?y''E~;QF','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('64','Everette.Shields','Klein.Blair@example.net','9189431122','7','0','0','$2y$10$Q0QyOE6B0jofPjiY8Skif.onQKUEGsOgZKe5MMtsTTHUdvOIsbUt2','4','^Urq3ks','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('65','Javonte.Haley','Gaylord.Maritza@example.org','5668431737','5','0','0','$2y$10$E0WZZ6nep5gOLZEfViJoveyt3HFsv0zN/A9dAwpJDHRxP5BtvXJaK','25','RG`hLdks,$&','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('66','Runolfsson.Quincy','Gorczany.Zelma@example.net','4244648809','7','0','0','$2y$10$Gt1Q9ThppjcagQX24nyAq.lLt0xcMStJGSuOeALZwkpcIhaBBCfky','1','D{w]6.HcM','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('67','dGrimes','Juston.Johnston@example.net','4507529009','4','0','0','$2y$10$qEuK96qzz9TlWm58cJx97eovaCUTo6zRxSnIa2ixjG7hgrDD84x/m','28','hV=\re~>SYIl^?ja4','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('68','Arthur.Maggio','Brandyn.Rath@example.org','3153580150','1','0','0','$2y$10$J9IWFFp.HTi84mKz4MVO2ucY5M6InQn.tCzV6TG6LDxi3iUdxtscO','35','Z<~[G4c;._~H&','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('69','Rohan.Demario','Itzel.Rippin@example.net','0942498050','6','0','0','$2y$10$b8hUXsU7gyOcKCrbag2HGeo79srIKpLyfzOZ/a595n2xxLpPdCYgm','24','[7${''"htm','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('70','Kihn.Evert','Jackie.Bashirian@example.net','3976794548','9','0','0','$2y$10$4fotrdch/b1tiWi47bRgQ.wjnl/iTlW3m3WcLwV932oeiqzTAR7mC','17','UNWF`:}${mpIJF','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('71','Nyah.Quitzon','Zita92@example.net','2372700551','6','0','0','$2y$10$fdtLvfsJ9VKTbJbPKzxIFuG3i.CJpRXwgtx5B1MKzODG8d0Gdh/NK','32',',baAyP72DW\ALqX','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('72','Alexandre.Welch','Boyd.OHara@example.net','8137708306','9','0','0','$2y$10$Fcjhba30HK.Wi.IeUK6e9eaWmodnv4TCqAAEYT21th8OxHhQwPIPe','14','taf8jJ:2H>&fm[','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('73','Schroeder.Horacio','Berge.Jarred@example.net','9261963886','8','0','0','$2y$10$ZLZlnrOytlj3naUZ1xrtPexWCKSTY0x9p6WRCMlFjE6XpXcNuH9RC','23','+_b]1P{6','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('74','Jovan24','Hosea.Johnson@example.net','1208307528','1','0','0','$2y$10$FHgrgOpkTR0hAnUA8kLkR.AvZwcEKpzw4/cAuFyU5BYGLP3H5E0tK','6','fs}n!W+g`hBFBy.eW','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('75','Aron53','Jenkins.Bennie@example.com','6759738922','3','0','0','$2y$10$RErwDB6/CALcL23xRph3lOimjNNGgs7gI9bUO4SJkDTTFKRE18Itq','5','Ah2R7a','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('76','Kaleb.Hyatt','Catalina.Reichert@example.org','9468116262','7','0','0','$2y$10$CS0fOGkWJvduCjizM/LCVOXFgk0j9APUjbrckckhjmd1VyG63R22q','18','jthvogAl5L]1j3g/=tsD','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('77','Kayleigh15','jWaelchi@example.net','3616749198','4','0','0','$2y$10$OOwad01MdEtdCMeoYi4ywemHZ5EG/c1nQZwzuueKbUVIeZhLHmhAe','23','[O&Yhx9''','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('78','Llewellyn.Lebsack','Elizabeth58@example.net','0559623383','6','0','0','$2y$10$GwHsAJTR13AOwxa0FxT3T.5K3OKVNVZuvvdxudyU.HXv/3HE.DyFS','24','TN8Uecjs8&`eGWi({','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('79','Greyson.Heidenreich','Leuschke.Ashlynn@example.org','1490183628','4','0','0','$2y$10$UB64cTtjBbOAvSljwkOC9O5UeINcHLNDusvSaCxFbyOajLdCwOOwK','40',';}RUMi2b<F\vtv+8SF{','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('80','Jacobs.Verner','Schowalter.Reilly@example.net','9361347515','2','0','0','$2y$10$YXMTxv//YpmgsfpvW2zCC.jXpM6uWHJ4Iwg/85atwPYiuaH5FiCWa','26','Z{o&TlJ:M5C2;"m','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('81','Wilma02','Feil.Hiram@example.org','6136377468','4','0','0','$2y$10$pwzkZ1vZ3/x376Zi5/RjTe0a3e8dlPbwfn7Yv529n7Zv3McUdP7zq','4','\v0k7GAA!U$','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('82','Aaliyah59','dKoch@example.net','4537617589','10','0','0','$2y$10$zOMI0RilNtFVb4L0HrztpOXIOa/cKS5SLt5d6WjoqoPyTsxl3Py/u','30','0@''mv0(8|ugHy_wv','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('83','Kareem44','Rosenbaum.Yazmin@example.org','5736210161','7','0','0','$2y$10$RCImcb21W77b9BkBW34fOu3YhfU1TDfF6x.CvtUuv7/GiWLbkFjxe','18','f}u~CyxI'':)Xha%3','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('84','Warren.Erdman','Jana80@example.org','9997955513','1','0','0','$2y$10$euwx4C7lM3zD9lF1/X9GiOjeK99z0bMHiXnCfU8Yo.UUT4nW.CEJm','33','Bt:Dvq(','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('85','Osinski.Art','Markus.Will@example.net','9928329596','9','0','0','$2y$10$XF9SJDzkoa7F10RbfNhTPO26ge5zfhfIFrPJMk9naWkwbOCPiPdzG','33','Zac?fxF%j.|O_twygg','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('86','Alberto.Dietrich','kAbbott@example.com','4603329955','3','0','0','$2y$10$aiXqZSJkG6PkFpAMzPRGPevMHgDOeeVUFaZ8v00mn/KdP94EG7tR6','25','2)lV@M$D','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('87','Tressie27','Elody.Marvin@example.com','7584458752','10','0','0','$2y$10$kO1lCcLIBkM6M4fiRmSRiuqKgVMIHuykNjEP0ZGgzERBDP41ZlagW','37','=K<Shx>','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('88','Kory.Hoppe','Pfeffer.Hollie@example.net','9539052582','6','0','0','$2y$10$xNzp9jhNuELZwjZzIqifne/gfHmoCrhw4XautbnuBVlmD62Rx3jBO','17','I6$8f?UVrJg#1CCMPmm','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('89','Amalia.Conn','dHansen@example.com','3969849984','2','0','0','$2y$10$cQlwKTg64PbeEmmSJZphSe9MkDISfcPbalqUqpRGJBa26vG1x3p5u','35','0"aKAULTsg6TjJ1','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('90','Myron.Marvin','OKon.Winifred@example.com','8289900264','2','0','0','$2y$10$SdtSbhoYVL7blAOzfOPiuOWbVKCNzJL3KuY6cMqJwJ7yRiAWw3vHK','1','9Zr|/q;foHK:E%SE','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('91','Marquardt.Margarette','Mina.Bradtke@example.org','3221936763','4','0','0','$2y$10$xA4iwurO8MiPM46OcVgE1O3K4Tfmj/Z9cqHJykc6zjQf2wQ2e6KIG','17','rBk#[!3','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('92','Jody79','Jacinto11@example.org','0468881308','6','0','0','$2y$10$mNH5VNb.QzNno6NQ58N2Su0.859bkHbFwAzx/7pzdSWs8M0p7tC5C','15','\XDPZw;#\&[','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('93','Dietrich.Tom','Enos.Wilderman@example.net','7659193406','5','0','0','$2y$10$fjFQylOFrZ6c1w9RMQduWez/IdpQssdGNLv5IQQePjH4K1PWPihBq','7','_(A0GqEW#Q\9J-#s','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('94','bMorissette','lWilkinson@example.net','6109317248','10','0','0','$2y$10$HOoZtTpPH0K2FcyYx5g8zeyx/d/WFlq4qyMwxzQOzd1hqvsxpwN6W','20','''!^&aXOglW','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('95','Green.Jordan','jQuigley@example.org','0421999838','5','0','0','$2y$10$IMGgXxOX0EC0J1FYfoH5Tu4fmYXcxX4CeQgBSynLNWjatNSgrvFJG','35','oX{B.#h#D','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('96','Verona48','Prudence97@example.net','7344378460','6','0','0','$2y$10$iPD5.VyIi9M8SV7jc/o5F.jk.cAWgsvXqxBI1tPuPs8u47HrTF1Xu','35','wKR%r1%''D','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('97','Earlene64','Schumm.Zachary@example.org','0166909744','6','0','0','$2y$10$2Z4HcTsweNy7UuAnMOjp..hBmao2ADve6T8w/T6FQEzsllPDwvVoy','25','tJShVWv@ga<','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('98','sHowell','Koby27@example.net','1048472475','7','0','0','$2y$10$1G52Px0fo/AJaDPGSuHIHuNcuO7YsIu7HiKrOOmAvehd6Og/7FPPi','12','^cthR#.z3d"','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('99','Farrell.Brock','gDibbert@example.org','7837196426','10','0','0','$2y$10$x7ndbj3YhtqHUvVPOFx2Nub0yYJsZrMRy6T7Bwmk6f3hfI0TSWTEO','4','_xIoz&H_%up','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('100','zBradtke','Callie.Marvin@example.com','4409852784','6','0','0','$2y$10$MkmTVCMcy6q.lpdYkF5qy.jx2EYe7XY3OaVtzlPLQQVgytKIKVEAG','10','\GqY/m*','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('101','Margarete16','Jany20@example.net','2634682593','6','0','0','$2y$10$640ZDr.8VC3Acmq735VqXOsS8XdVK82uEZU1h0x.ZCjUf5/ON9ooS','9','/NCq<rHvRD','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('102','Beer.Mercedes','Shanna25@example.org','6591475302','10','0','0','$2y$10$BaePmeqiOvdPcaQA8kORU.L/rbKbh9xUYGjw6fgc6Gl0qoHkA.pey','5','6UxgByPO2_','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('103','Yasmine75','Justine.Sipes@example.org','9719163829','10','0','0','$2y$10$LHojvMcGs7G.IqWLSQSCBOTo10qAebdBbUlfO004zr3n.uvF32b7W','14','<Ssc.2;xo','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('104','Karianne59','Batz.Madelynn@example.net','2400577231','2','0','0','$2y$10$yxSJRK597niFYTUpjH4s7O7Ofd5ccA94gkMpKRJgrF6unB7fFHKj.','40','QH+,S0cc>oH3O:UG<+H','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('105','Wanda.Bode','Talon.Ebert@example.com','9405931488','5','0','0','$2y$10$vUc1YJmZsKp8G4hkO1HyquW3/x79dBGaW3rEyhpTocZv1cr/kfyRa','4','tzOl$:#39nY6','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('106','nRobel','kCrona@example.net','1994566034','9','0','0','$2y$10$4CEJemx2S3i5wTh5iSwK3O.QiapZ93L1a.a3Z8P5dLbf6zeilyqLS','1','?BbB#H','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('107','bJacobson','Miracle.Mayert@example.net','9689123989','7','0','0','$2y$10$F5aDm.w.eMEOZU5ugr4SReyHcX6BoLNaIZx5LOBkHhrAP1trVox/y','22','J.C+Hqx(>$cli','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('108','hSchultz','Jaleel.Brekke@example.net','2188344415','2','0','0','$2y$10$TwWz0ub7U6zSdU5DQ8bg7OasLu8FsgYHsedbRZYxH4Jp0zyDKLJha','38','oGhs&E{3Ff6`buj^X','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('109','nLangosh','Polly08@example.com','6389852062','8','0','0','$2y$10$LRODoKTTeFIU6kwecj4JlutTlYEtJAQ2UTIBRTlntvUA1ZPNgWqDS','21','eR6f^C\Yx!/;l!oJV','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('110','Klein.Lonie','Elissa18@example.com','7378531586','9','0','0','$2y$10$hW7ImwbDzbkvmIkGtE6k1e8XDFgCcSdu6lQ1reZuqUByda4EGByg6','25','v9wFzTPDcF+GK','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('111','Neva95','Stan.Bogisich@example.com','2781481983','5','0','0','$2y$10$XjVU3J5j4CeKxZ4EVp09KezMzc/lnr59W1L.rJd/pyVM0zsQHYb.W','8','9&5uGo$Ow%s~`sguE!','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('112','Alvera.White','Rohan.Eryn@example.com','1459383482','10','0','0','$2y$10$4L9Qk8xSE6YrOWpmoSlDMOLqDWa7CjJGyCBq/RvuD3YZPI.8cvgyq','2','"ak8[+','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('113','pMann','Jones.Frederick@example.net','0436635529','7','0','0','$2y$10$0KpODk45f7faNMTPZQ1bledzz57IJYibOvZfMIpv8uspAr2vnlSx2','35','^aFix0ITDedIu','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('114','Xavier64','Simonis.Kasandra@example.net','1296431864','7','0','0','$2y$10$cTF6ick8liJPo/frMqVq8eM7XPKahgABnWjiVfszFxWLum0alBmHS','14','26RltH`}RF]`%xe"q@','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('115','iSchulist','Darrel.Goodwin@example.net','5137764159','6','0','0','$2y$10$nu.n3de/C5j9yQ5cOT.kgeiQlQXJE.s1V3AX.a9OKMraImHHk34iC','39','fVjF/vf%8;k;-UH','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('116','Ewell.Keeling','Kyra02@example.org','2900776219','3','0','0','$2y$10$madkL57HFXzV3B3fAaj7/eRuMOIXz1PlGHV6S50aiMtezm6r6RPYi','23','cdu]~mG','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('117','Lesch.Tracey','sDenesik@example.com','1814224425','7','0','0','$2y$10$ZIBPoTLdliyb131WM93tMubigyGusFvNXQR/uV98LcrCJOgDhIu6e','39','+uR"vYUb4yz','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('118','aBeier','wRobel@example.com','5337504066','7','0','0','$2y$10$BX0K1CKO5lA1yEsuSPYI2eds7tWLArZrIX6x2H11NBE.Y0liMhDUm','15','Pn"+q+[ty.G8','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('119','fWard','Bauch.Monica@example.org','2148265740','9','0','0','$2y$10$isY4PpJqn0lCcpxxa7rdqeJq3zyj0hL7jvNpBKwz.loWNVGMwbPWq','30','augG#at]B','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('120','Dedrick.Gerhold','Grady.Prosacco@example.org','1987478986','6','0','0','$2y$10$6Bi2CkLqSBf0jx9tAZ7iVuBQ15drWeIwmcXS4JSei85uwyrDUyE7y','38','kfDVp5]Mn','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('121','Carissa.Grimes','Alyce76@example.net','3806145206','1','0','0','$2y$10$cbUwtfEeGp5OBTheR01siOnINAmFVFzJYBQ2PmuRWIIk1HCkt4kPa','39','oRT=7#t[Ci8A[TtjY2;''','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('122','wPollich','Carlee36@example.com','4194917863','5','0','0','$2y$10$jyvij8ZThFfWCcnWwO0yDuXWcMCFWxS2tIPIEgMc4rIgOl2hZ9RVG','18','Z\"j9U!OG','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('123','vLind','Karli.Kohler@example.net','1836073779','5','0','0','$2y$10$HrjLjK7wYG5zFqL7tn4ykeSTY412Iows91D5LKPY2JfZ3pcbswV3C','22','xrlAf0>w=tB?','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('124','Thompson.Priscilla','Cleve.Cormier@example.net','9737072722','5','0','0','$2y$10$6KE3XTcCjZlJOI7mApVT4elc5npzce.P33sAU1XV8K6vElogrmGCm','8','^~4<$(npX','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('125','Eugenia51','Kimberly40@example.net','2307179077','5','0','0','$2y$10$UK6Nd.PXwFT5LKQtD/t0bujdXOLNgp4jD9HzDTYflge7BbABt2gjO','32','FE8O:am\:-=o+pGH','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('126','Alf.McCullough','Breitenberg.Joyce@example.org','8208357494','5','0','0','$2y$10$z5sY0CMCQyxImM3K0N1WTuzN7Oiemu6YYFH88mYZy2aU0FmGLUJC.','29','~mdOsY}G','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('127','Evan58','Kris.Yvette@example.org','0866381169','7','0','0','$2y$10$OpU.s1D6Tw3FZSZOgfjzx.uemsdU9qdLaqljGlurLXfzY15Z5WHz2','9','ETj1;~$w~%n4''rWV0TTb','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('128','Bogan.Talon','nDach@example.org','9414928068','4','0','0','$2y$10$RNdi1Cbt0yHf/FbV/5tPEOqRsZ2HQEn/vURbOp.U/t0lSsgzXBfam','35','e"+}#z1I[lj9?ly7','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('129','Christ.Wolf','Aniyah57@example.net','1538288175','6','0','0','$2y$10$USxa3mLFBwJtAHRjKkYUD./ZYNCL4haLb6Jp8YCHmfGkPZrf1Ng3S','36','u`uAYySW{e','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('130','Stacy.Hyatt','oKihn@example.org','9043345275','5','0','0','$2y$10$Kl3ErvZATtzzuarpEJxjW.z7Y5mg5AqifMwuevwrrzB/4FBZGUGKa','18','Z40~''OT','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('131','bMann','hHoeger@example.net','2915771072','1','0','0','$2y$10$AgZJyETU5Ej/cVhMzcuw0OAge2.KzyGejOV8H/k7thvOOH50Fnui6','1','Fi79h+m(RI!TQ]?','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('132','wBednar','Ryley62@example.net','9293729331','3','0','0','$2y$10$Kz0lEhBPxtnmM3rfp4hxgeDOyO85my2cR4iWLopWiXCcStnWWmcBq','26','a"F~dL6Ny8mP)','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('133','Feest.Maybell','iSchinner@example.org','7595986088','1','0','0','$2y$10$FeP2nghcs5CsVJ3W5dg/7unpzxeim2EzRTqijv8fA7ZjWu2gbSa1W','32','Dt#vcp%','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('134','kMiller','Medhurst.Margaret@example.org','7887444850','8','0','0','$2y$10$k6s.gxShRhzqkmbQyTgftOgFg04A3y6BjK.Xpoxs2CAAHI0OJa0aS','16','a.A-Q/NL(.S','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('135','Arnaldo34','vDibbert@example.net','1284494371','8','0','0','$2y$10$Uc4cLIN6RStZ/iBAd8eN6efLqqovSRpx6gCVtuuNaNuhpR4ytT3M6','40','"YNJ(yK!]A','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('136','Reginald43','gWitting@example.org','6371850264','6','0','0','$2y$10$GD9FsvkrCi3Rd8Kjh58rnuQ6ZVKLFDgHMunMqHcJ6yj.lCiUzOPRK','15','KxQ#E~)','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('137','Batz.Agustina','Corwin.Reyes@example.org','4014793878','10','0','0','$2y$10$5lQ9OoeTvHAiernyt9Mu1uvPKy0n4ylgXnyqzfwz1cD9Cb5gwsf46','19','3VIjopb{q','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('138','Kassandra67','Jordane55@example.org','1768670694','7','0','0','$2y$10$aWdwKrdUWwQBBbp8JgVIt.AzlfEJOKfJGEVcAvZFmHLXWs41lf26O','1','\Xu"eN','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('139','Frederick.Hintz','xBayer@example.org','9028532828','2','0','0','$2y$10$SoNXBq5z4q.QgqZ6a2BOIekylOHmEoQImcFRa2gkXejmXBqD4MkdS','18','wYzYCS','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('140','Jaquan73','zZboncak@example.org','2757730019','7','0','0','$2y$10$8FJF3hkZuGx1oDsasLzwueTqikyT0CVX5iPQew4I45IIe7nrP8g62','25','?7R?z''e','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('141','Nigel.Mueller','pBailey@example.net','8169681387','9','0','0','$2y$10$bAoiyfsUAQBt1YH.10Di1erJ3GGId5hWmRZgft83o.lCn01K7eeRq','16','0amZ0Gq@G55A','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('142','Angelina.Franecki','Beulah29@example.net','3062336730','5','0','0','$2y$10$DgC2GlkhmD1zAEWct//sUOkKa.oIr6VVobaRVIJ1drqCPbf3EJHlO','32','UrqH]6"pu+:','1');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('143','oFisher','Makayla.Marquardt@example.org','3723411392','8','0','0','$2y$10$3d3YY76ZZVgNmn5dFwyaOuIKCXqgprCiiJprn87byZsPnj8apeNsK','3','Ee9Q!^A?','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('144','Glover.Mittie','gCrooks@example.org','3901043835','6','0','0','$2y$10$vpBZCSSISj7dWic3tzMkQOHN965qeT0zplfpxGebO9r9lQM9JaoCq','36','yIZe;J<E_14aJ#*','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('145','Jadon39','Arielle92@example.com','9701624762','5','0','0','$2y$10$.iKOU9QVztloPafpSQt8le/BR4qGRCVGkOwPTQGnCCBh/pDWg.Rlu','31','%U)~7zK>Y=/{Ce}<0or','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('146','mZiemann','Fabiola12@example.com','9148438839','9','0','0','$2y$10$DGJl8iQd.NG2aB876bRtpOAI.rff.V5zIkjwXoUGCKObW9uDguMwK','36','g87Yr#F)]55{&_j','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('147','Margarete67','Hamill.Clotilde@example.org','3166544375','6','0','0','$2y$10$W8/9R9kRsChO9p41n8OZ3ObLOgBDAU.sspJu6R3lefITrsQyuF2h6','37','D.%rxY_t','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('148','Larson.Jaylon','Geovany.Huel@example.net','9647252912','3','0','0','$2y$10$Yuq7h454ntePX5udKLGofOmhoEsLIacR5gd.gIHRHzWfpAu0Z7CVe','38','.P;7#k2la)\rE','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('149','Rempel.Athena','oHilll@example.net','5642587548','6','0','0','$2y$10$bXG599f0sSBPvjuMH6o0P.b5bE1e57IKRxUl7d0pAW1hXsdj57bA6','26','h8rTYu72o=e"','0');
INSERT INTO "users" ("id","username","email","phone","company_id","is_locked","attempts","password","group_id","plainpassword","is_admin") VALUES ('150','Rutherford.Bradly','Shakira.Robel@example.com','5749115245','10','0','0','$2y$10$DS8g3eIc9RcKiQgr2vEIdeFdTFyiM/vsZUHlbxkyOq7htp5DGGTHG','21',',IMn<C\~2xk','1');

----
-- Drop table for groups
----
DROP TABLE "groups";

----
-- Table structure for groups
----
CREATE TABLE 'groups' (
'id' INTEGER PRIMARY KEY AUTOINCREMENT, 
'name' TEXT NOT NULL,
'companies_id' INTEGER NOT NULL, 
'users_id' TEXT NULL,
    FOREIGN KEY (`companies_id`)
    REFERENCES `companies` (`id`)
);

----
-- Data dump for groups, a total of 40 rows
----
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('1','Switchable dedicated website','5','24,2,14,26,20,37,25,7,35,4,8,18,22,8,32,29,18,32,31');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('2','Exclusive systemic application','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('3','Persevering zeroadministration hub','7','33,1,40,40,39,4,1,18,18,12,22,35,14,39,15,9,1,25');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('4','Multi-lateral incremental infrastructure','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('5','Realigned even-keeled middleware','9','40,35,35,13,38,22,20,17,14,33,1,25,30,16,36');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('6','Persevering local function','2','7,33,35,36,20,28,15,26,35,1,40,38,18');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('7','Integrated object-oriented software','10','35,10,32,12,30,37,20,4,5,14,2,19,21');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('8','Compatible transitional flexibility','10','35,10,32,12,30,37,20,4,5,14,2,19,21');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('9','Horizontal national internetsolution','5','24,2,14,26,20,37,25,7,35,4,8,18,22,8,32,29,18,32,31');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('10','Synchronised analyzing forecast','4','36,4,16,40,22,34,29,28,23,40,4,17,35');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('11','Adaptive web-enabled localareanetwork','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('12','Intuitive maximized GraphicalUserInterface','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('13','Multi-lateral coherent matrices','7','33,1,40,40,39,4,1,18,18,12,22,35,14,39,15,9,1,25');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('14','Organized systematic success','2','7,33,35,36,20,28,15,26,35,1,40,38,18');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('15','Monitored web-enabled hierarchy','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('16','Managed assymetric product','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('17','Visionary responsive matrices','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('18','Robust incremental support','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('19','Exclusive intermediate opensystem','5','24,2,14,26,20,37,25,7,35,4,8,18,22,8,32,29,18,32,31');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('20','Virtual bifurcated interface','5','24,2,14,26,20,37,25,7,35,4,8,18,22,8,32,29,18,32,31');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('21','Focused eco-centric paradigm','1','40,34,20,35,24,23,35,6,33,39,1,32');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('22','Distributed reciprocal project','3','38,4,27,40,25,27,16,29,11,5,25,23,26,38');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('23','Adaptive bottom-line customerloyalty','3','38,4,27,40,25,27,16,29,11,5,25,23,26,38');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('24','User-centric nextgeneration knowledgebase','8','26,26,11,6,26,31,23,21,16,40,3');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('25','Right-sized leadingedge GraphicInterface','4','36,4,16,40,22,34,29,28,23,40,4,17,35');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('26','Open-source analyzing product','9','40,35,35,13,38,22,20,17,14,33,1,25,30,16,36');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('27','Future-proofed reciprocal instructionset','1','40,34,20,35,24,23,35,6,33,39,1,32');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('28','Implemented needs-based analyzer','3','38,4,27,40,25,27,16,29,11,5,25,23,26,38');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('29','User-friendly exuding project','3','38,4,27,40,25,27,16,29,11,5,25,23,26,38');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('30','Open-architected upward-trending projection','2','7,33,35,36,20,28,15,26,35,1,40,38,18');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('31','Stand-alone responsive approach','6','28,37,27,35,36,32,24,32,24,17,15,35,25,10,9,39,38,36,15,36,37,26');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('32','Networked fresh-thinking customerloyalty','10','35,10,32,12,30,37,20,4,5,14,2,19,21');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('33','Down-sized intermediate application','6','28,37,27,35,36,32,24,32,24,17,15,35,25,10,9,39,38,36,15,36,37,26');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('34','Extended even-keeled array','5','24,2,14,26,20,37,25,7,35,4,8,18,22,8,32,29,18,32,31');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('35','Mandatory optimizing attitude','6','28,37,27,35,36,32,24,32,24,17,15,35,25,10,9,39,38,36,15,36,37,26');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('36','Stand-alone zerodefect analyzer','7','33,1,40,40,39,4,1,18,18,12,22,35,14,39,15,9,1,25');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('37','Switchable optimal paradigm','3','38,4,27,40,25,27,16,29,11,5,25,23,26,38');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('38','Diverse upward-trending localareanetwork','6','28,37,27,35,36,32,24,32,24,17,15,35,25,10,9,39,38,36,15,36,37,26');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('39','Phased user-facing framework','7','33,1,40,40,39,4,1,18,18,12,22,35,14,39,15,9,1,25');
INSERT INTO "groups" ("id","name","companies_id","users_id") VALUES ('40','Reverse-engineered responsive benchmark','2','7,33,35,36,20,28,15,26,35,1,40,38,18');

----
-- Drop table for orders
----
DROP TABLE "orders";

----
-- Table structure for orders
----
CREATE TABLE `orders` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `fulfilled` INTEGER NULL DEFAULT 0,
  `unfulfilled` VARCHAR(45) NULL,
  `groups_id` INTEGER NOT NULL,
  `customers_id` INTEGER NULL,
  `groups_users_companies_id` INTEGER NULL,
    FOREIGN KEY (`groups_id`)
    REFERENCES `groups` (`id`)
);

----
-- Data dump for orders, a total of 1000 rows
----
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('1','259','302','8','7','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('2','424','460','32','18','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('3','24','110','9','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('4','156','461','6','18','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('5','60','91','18','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('6','196','388','24','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('7','5','368','39','3','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('8','47','117','13','5','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('9','25','64','31','10','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('10','341','409','17','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('11','31','31','3','4','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('12','31','134','4','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('13','54','108','25','17','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('14','43','178','37','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('15','69','271','18','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('16','55','393','32','17','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('17','244','267','36','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('18','14','16','7','3','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('19','31','417','30','5','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('20','381','383','4','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('21','318','400','35','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('22','104','382','3','13','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('23','132','228','40','2','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('24','31','98','9','8','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('25','363','381','36','14','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('26','29','406','2','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('27','371','418','33','12','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('28','150','360','21','2','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('29','14','59','2','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('30','177','303','21','4','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('31','187','276','2','11','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('32','158','220','40','9','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('33','126','135','36','5','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('34','246','398','14','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('35','57','174','3','4','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('36','9','62','17','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('37','74','116','30','20','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('38','462','469','4','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('39','127','149','16','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('40','31','38','19','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('41','252','288','15','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('42','181','289','16','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('43','12','18','9','5','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('44','161','459','35','10','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('45','75','293','28','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('46','25','423','14','6','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('47','347','351','6','2','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('48','101','138','30','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('49','224','477','32','7','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('50','26','27','9','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('51','346','368','4','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('52','237','431','38','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('53','3','25','17','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('54','165','359','1','14','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('55','54','306','17','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('56','193','386','24','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('57','122','320','25','5','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('58','70','277','33','6','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('59','233','278','38','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('60','51','76','14','9','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('61','403','487','6','5','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('62','414','449','22','11','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('63','142','263','3','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('64','167','189','40','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('65','153','473','22','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('66','81','142','26','7','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('67','408','445','12','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('68','359','386','17','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('69','36','383','14','2','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('70','68','72','17','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('71','55','127','38','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('72','303','444','11','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('73','78','391','18','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('74','106','452','12','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('75','144','373','26','4','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('76','42','48','5','18','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('77','49','51','30','8','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('78','35','53','20','4','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('79','140','275','9','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('80','12','328','33','1','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('81','1','272','14','10','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('82','29','184','30','10','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('83','246','267','1','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('84','121','125','18','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('85','5','15','39','18','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('86','146','163','19','6','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('87','308','492','40','15','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('88','176','217','9','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('89','41','326','5','15','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('90','31','103','19','6','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('91','58','163','5','20','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('92','8','496','19','16','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('93','83','83','2','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('94','321','449','33','20','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('95','92','384','7','5','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('96','164','233','33','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('97','20','209','37','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('98','49','200','30','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('99','254','279','4','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('100','14','382','10','4','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('101','129','269','3','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('102','360','383','11','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('103','59','343','9','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('104','18','57','38','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('105','56','97','18','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('106','29','129','4','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('107','208','295','16','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('108','121','207','13','6','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('109','211','445','5','19','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('110','325','337','7','20','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('111','87','310','14','14','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('112','115','295','38','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('113','31','38','30','13','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('114','309','398','18','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('115','3','23','40','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('116','21','94','18','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('117','230','341','22','13','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('118','14','130','19','16','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('119','36','162','6','2','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('120','61','177','19','20','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('121','56','106','18','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('122','1','9','37','8','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('123','177','235','14','13','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('124','54','58','38','12','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('125','451','485','6','5','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('126','111','153','24','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('127','294','480','8','16','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('128','111','384','39','9','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('129','386','389','17','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('130','101','262','20','9','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('131','0','202','25','3','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('132','68','453','34','14','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('133','17','19','19','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('134','3','20','3','8','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('135','7','84','15','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('136','196','272','28','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('137','228','314','13','9','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('138','59','179','31','16','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('139','59','163','22','13','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('140','22','52','21','16','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('141','124','127','13','18','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('142','165','289','20','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('143','212','268','32','3','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('144','87','108','21','6','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('145','108','123','33','16','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('146','90','249','15','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('147','3','130','28','13','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('148','291','326','36','9','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('149','107','445','15','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('150','24','171','23','17','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('151','58','326','36','4','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('152','204','298','7','12','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('153','168','180','1','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('154','60','82','21','3','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('155','18','49','1','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('156','283','412','25','19','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('157','23','46','39','16','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('158','100','124','5','2','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('159','56','428','34','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('160','96','159','22','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('161','80','225','25','8','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('162','2','17','16','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('163','7','12','19','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('164','52','140','34','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('165','264','459','6','7','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('166','372','416','19','4','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('167','323','424','32','5','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('168','29','91','20','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('169','188','365','8','19','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('170','271','325','6','13','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('171','42','312','10','16','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('172','28','242','6','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('173','281','432','11','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('174','19','287','3','18','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('175','230','486','32','10','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('176','4','15','7','20','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('177','57','127','40','19','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('178','50','279','17','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('179','261','466','16','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('180','285','439','34','10','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('181','204','227','12','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('182','151','380','25','10','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('183','84','136','28','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('184','283','407','19','14','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('185','12','141','38','8','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('186','57','122','25','19','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('187','10','40','13','15','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('188','71','428','38','17','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('189','107','249','39','12','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('190','329','341','18','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('191','298','360','15','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('192','162','213','23','8','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('193','5','115','36','10','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('194','202','416','21','9','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('195','27','450','33','11','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('196','185','210','1','4','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('197','111','205','29','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('198','199','334','33','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('199','57','114','5','8','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('200','102','131','31','11','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('201','29','35','29','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('202','6','190','29','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('203','71','182','23','15','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('204','26','257','8','19','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('205','315','336','4','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('206','9','11','32','4','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('207','256','266','28','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('208','96','99','18','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('209','1','23','4','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('210','274','311','23','17','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('211','7','126','8','11','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('212','5','93','37','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('213','336','423','39','18','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('214','62','477','30','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('215','54','138','9','6','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('216','53','204','32','20','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('217','166','392','4','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('218','121','250','3','1','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('219','252','261','33','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('220','267','384','8','2','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('221','40','90','7','2','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('222','307','357','1','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('223','100','104','18','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('224','31','196','6','15','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('225','46','53','9','12','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('226','82','85','34','1','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('227','470','496','22','8','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('228','146','271','2','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('229','49','225','33','17','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('230','14','195','16','11','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('231','23','24','7','3','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('232','20','202','40','9','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('233','47','159','13','16','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('234','445','482','10','11','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('235','54','73','10','16','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('236','174','339','19','9','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('237','153','311','24','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('238','239','281','5','3','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('239','321','430','16','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('240','371','420','4','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('241','92','163','26','4','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('242','24','468','31','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('243','27','34','23','15','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('244','216','488','7','17','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('245','4','365','31','17','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('246','30','429','31','3','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('247','34','50','26','10','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('248','181','404','40','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('249','85','294','3','5','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('250','93','223','17','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('251','280','328','20','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('252','319','332','36','9','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('253','133','326','25','1','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('254','25','57','11','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('255','47','301','4','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('256','139','179','19','16','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('257','15','364','34','13','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('258','27','32','2','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('259','26','85','34','9','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('260','217','462','39','4','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('261','218','258','1','20','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('262','270','427','35','8','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('263','55','98','17','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('264','40','136','10','8','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('265','313','328','4','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('266','1','81','24','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('267','52','99','3','14','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('268','34','128','30','6','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('269','10','19','19','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('270','115','162','38','17','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('271','220','365','19','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('272','95','410','38','15','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('273','19','246','18','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('274','134','462','32','8','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('275','359','362','2','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('276','25','384','7','10','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('277','30','322','27','2','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('278','117','141','1','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('279','168','345','4','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('280','26','158','39','9','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('281','90','194','10','17','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('282','243','256','25','17','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('283','116','190','3','13','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('284','205','493','5','13','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('285','31','40','5','15','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('286','93','280','31','7','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('287','12','64','5','1','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('288','125','229','17','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('289','49','74','24','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('290','201','280','6','1','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('291','321','407','33','7','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('292','293','395','39','4','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('293','115','399','32','4','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('294','26','164','33','6','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('295','4','187','5','2','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('296','290','448','32','19','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('297','28','305','8','2','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('298','64','70','12','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('299','40','201','21','4','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('300','88','103','36','19','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('301','113','379','4','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('302','341','369','39','7','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('303','454','479','20','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('304','32','73','12','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('305','18','354','4','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('306','138','411','31','18','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('307','218','294','29','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('308','13','203','6','3','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('309','400','408','4','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('310','37','360','23','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('311','459','492','37','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('312','99','194','31','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('313','109','441','37','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('314','54','407','24','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('315','86','330','34','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('316','20','73','30','8','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('317','257','468','34','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('318','62','96','6','1','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('319','40','84','20','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('320','268','281','28','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('321','46','208','34','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('322','122','138','34','18','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('323','32','187','14','4','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('324','41','69','13','9','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('325','52','163','7','19','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('326','133','167','13','4','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('327','59','421','35','12','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('328','147','259','26','15','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('329','79','127','10','8','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('330','108','261','16','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('331','56','418','10','5','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('332','109','343','33','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('333','55','314','18','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('334','40','111','1','10','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('335','45','141','4','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('336','127','349','4','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('337','143','303','39','5','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('338','38','94','22','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('339','40','51','1','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('340','325','497','3','20','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('341','40','52','33','13','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('342','8','12','26','17','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('343','179','355','26','4','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('344','118','421','8','7','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('345','19','201','11','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('346','15','52','4','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('347','375','399','11','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('348','29','366','17','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('349','229','284','31','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('350','133','375','11','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('351','191','261','2','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('352','136','191','13','5','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('353','153','297','29','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('354','9','62','32','20','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('355','1','3','6','16','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('356','144','493','23','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('357','153','288','29','19','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('358','3','24','19','20','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('359','72','193','19','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('360','5','140','34','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('361','418','458','31','15','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('362','238','247','1','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('363','101','156','34','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('364','25','27','40','18','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('365','98','482','38','18','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('366','34','229','7','1','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('367','44','130','4','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('368','36','193','11','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('369','26','51','35','1','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('370','9','138','21','9','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('371','49','63','28','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('372','1','88','21','13','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('373','12','16','29','6','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('374','141','155','34','10','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('375','144','150','33','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('376','100','332','3','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('377','3','25','23','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('378','62','351','22','18','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('379','130','229','15','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('380','70','103','29','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('381','200','471','4','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('382','362','379','2','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('383','78','234','37','20','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('384','1','3','1','1','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('385','140','348','31','20','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('386','76','450','16','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('387','88','135','11','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('388','2','250','10','16','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('389','83','156','21','17','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('390','6','211','9','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('391','27','137','23','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('392','37','79','32','19','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('393','360','378','38','3','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('394','241','319','28','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('395','41','120','31','20','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('396','440','489','6','17','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('397','207','220','32','18','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('398','80','322','11','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('399','73','92','30','20','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('400','26','31','29','20','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('401','78','401','1','10','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('402','81','127','13','1','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('403','128','347','19','13','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('404','226','315','37','20','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('405','159','279','17','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('406','155','319','18','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('407','7','107','15','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('408','35','75','40','16','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('409','295','344','19','4','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('410','84','481','39','12','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('411','333','410','38','18','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('412','10','28','29','17','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('413','275','394','38','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('414','174','218','7','6','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('415','170','400','34','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('416','36','97','24','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('417','212','320','21','10','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('418','88','147','19','18','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('419','52','311','36','13','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('420','113','219','18','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('421','44','71','25','19','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('422','48','210','19','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('423','41','452','21','4','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('424','39','44','15','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('425','36','59','16','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('426','110','481','18','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('427','222','379','37','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('428','262','296','18','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('429','116','121','4','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('430','66','482','5','4','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('431','132','164','7','1','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('432','35','197','6','18','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('433','15','326','25','20','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('434','420','486','22','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('435','15','22','29','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('436','126','262','14','19','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('437','18','91','31','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('438','144','148','40','13','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('439','20','167','13','16','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('440','17','40','40','17','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('441','188','308','19','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('442','129','478','15','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('443','267','450','23','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('444','42','57','12','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('445','23','47','7','19','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('446','71','279','8','14','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('447','63','234','25','7','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('448','291','415','27','15','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('449','307','379','14','14','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('450','39','473','2','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('451','127','163','24','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('452','116','283','31','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('453','5','421','4','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('454','371','454','5','10','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('455','93','247','9','8','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('456','23','49','4','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('457','206','327','18','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('458','132','147','14','13','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('459','8','67','7','7','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('460','33','105','21','10','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('461','37','121','31','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('462','321','427','14','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('463','478','500','7','12','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('464','30','129','20','5','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('465','1','8','15','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('466','82','216','15','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('467','29','78','40','4','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('468','22','36','25','2','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('469','164','331','5','15','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('470','33','136','37','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('471','284','451','11','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('472','69','437','8','16','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('473','7','24','20','12','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('474','99','180','20','2','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('475','127','309','36','14','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('476','23','48','27','4','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('477','297','313','20','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('478','280','360','16','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('479','240','353','7','3','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('480','330','371','25','4','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('481','1','245','10','10','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('482','52','149','27','4','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('483','316','351','1','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('484','104','381','3','1','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('485','216','360','24','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('486','112','128','17','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('487','41','146','12','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('488','169','458','14','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('489','119','125','11','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('490','374','470','10','14','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('491','36','59','9','20','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('492','66','433','37','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('493','236','293','9','2','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('494','406','439','2','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('495','57','77','26','5','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('496','14','198','16','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('497','17','29','32','12','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('498','176','307','28','20','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('499','4','145','9','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('500','108','420','34','5','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('501','308','393','34','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('502','71','206','15','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('503','29','70','25','8','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('504','58','134','25','14','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('505','170','436','21','14','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('506','39','76','6','3','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('507','130','134','20','16','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('508','109','143','35','15','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('509','106','374','40','6','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('510','35','168','1','13','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('511','24','46','37','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('512','127','250','21','6','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('513','91','130','39','15','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('514','325','457','17','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('515','50','235','37','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('516','282','289','2','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('517','24','325','23','14','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('518','74','85','8','1','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('519','229','352','26','15','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('520','213','222','20','5','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('521','245','486','32','9','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('522','68','176','7','2','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('523','146','201','4','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('524','28','497','26','13','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('525','5','335','27','8','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('526','12','33','28','8','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('527','340','417','35','17','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('528','152','153','14','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('529','3','173','26','10','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('530','25','53','1','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('531','52','453','12','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('532','15','61','37','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('533','150','176','13','5','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('534','283','388','23','9','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('535','132','143','29','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('536','30','172','33','4','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('537','26','124','17','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('538','293','382','21','9','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('539','214','290','3','12','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('540','155','184','40','20','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('541','212','260','14','4','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('542','4','38','16','11','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('543','227','307','22','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('544','4','9','30','17','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('545','165','480','20','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('546','160','195','37','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('547','15','89','15','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('548','289','431','28','18','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('549','101','461','12','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('550','230','366','10','8','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('551','183','187','40','5','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('552','35','361','12','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('553','27','154','19','20','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('554','15','36','28','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('555','84','223','31','18','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('556','189','282','17','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('557','150','323','37','6','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('558','59','61','6','9','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('559','5','20','23','15','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('560','159','182','9','13','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('561','16','232','7','13','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('562','34','180','9','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('563','342','433','24','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('564','331','406','34','8','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('565','145','284','36','20','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('566','60','319','24','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('567','253','376','12','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('568','0','1','19','16','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('569','114','332','23','13','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('570','143','262','25','14','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('571','222','334','24','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('572','63','311','19','9','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('573','35','99','25','18','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('574','82','88','8','3','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('575','98','104','9','14','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('576','6','41','22','15','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('577','56','86','11','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('578','2','5','2','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('579','15','320','32','11','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('580','162','201','11','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('581','53','110','5','1','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('582','472','477','1','8','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('583','388','389','32','15','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('584','62','220','15','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('585','32','104','17','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('586','72','100','21','13','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('587','117','483','12','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('588','223','228','31','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('589','257','416','6','14','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('590','10','321','37','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('591','0','3','11','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('592','385','421','19','1','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('593','5','71','12','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('594','179','268','20','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('595','181','286','30','7','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('596','156','237','33','6','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('597','363','364','35','7','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('598','200','388','22','14','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('599','42','78','37','19','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('600','68','112','22','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('601','409','418','6','7','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('602','351','397','25','11','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('603','118','198','21','4','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('604','68','89','28','19','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('605','17','201','5','12','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('606','21','323','33','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('607','108','317','21','12','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('608','127','223','30','15','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('609','128','157','18','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('610','202','310','12','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('611','260','283','30','16','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('612','338','455','37','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('613','69','81','18','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('614','203','374','7','5','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('615','3','365','31','7','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('616','349','498','16','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('617','163','230','35','11','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('618','115','202','7','10','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('619','60','64','24','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('620','52','71','15','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('621','187','351','25','17','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('622','61','438','33','4','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('623','176','321','7','5','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('624','414','456','29','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('625','97','117','1','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('626','250','304','8','16','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('627','40','49','18','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('628','54','438','21','18','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('629','380','425','3','9','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('630','21','29','31','15','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('631','40','126','35','11','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('632','160','222','1','10','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('633','140','343','3','16','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('634','38','464','19','5','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('635','330','415','8','9','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('636','57','118','34','1','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('637','48','194','16','17','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('638','184','286','27','1','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('639','359','419','18','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('640','130','152','30','5','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('641','4','34','5','5','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('642','126','138','33','3','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('643','238','254','38','19','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('644','32','113','12','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('645','23','25','7','19','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('646','139','230','11','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('647','145','414','23','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('648','122','324','38','15','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('649','317','438','29','14','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('650','67','95','21','10','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('651','114','117','40','17','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('652','98','254','27','3','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('653','52','187','5','4','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('654','249','433','22','9','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('655','126','249','27','9','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('656','29','230','30','9','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('657','11','129','5','12','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('658','25','53','26','2','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('659','36','106','25','12','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('660','46','111','21','7','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('661','124','131','9','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('662','96','446','4','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('663','422','449','19','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('664','98','376','14','19','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('665','13','71','18','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('666','187','192','21','19','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('667','43','136','3','13','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('668','307','492','17','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('669','61','236','39','20','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('670','211','252','26','7','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('671','340','398','9','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('672','28','458','38','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('673','1','4','7','17','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('674','5','15','38','6','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('675','47','237','1','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('676','5','34','30','9','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('677','187','323','23','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('678','172','291','9','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('679','176','359','18','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('680','18','55','8','8','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('681','200','340','37','17','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('682','12','19','12','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('683','161','169','8','12','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('684','30','248','12','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('685','125','395','5','9','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('686','49','211','21','2','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('687','112','154','40','10','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('688','207','317','2','11','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('689','243','316','19','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('690','198','209','24','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('691','141','176','5','6','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('692','149','193','13','14','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('693','7','330','23','6','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('694','20','122','16','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('695','102','151','8','15','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('696','47','458','23','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('697','250','442','1','6','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('698','359','398','4','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('699','21','57','1','9','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('700','90','181','5','12','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('701','33','50','25','5','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('702','333','472','18','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('703','70','473','38','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('704','146','279','39','1','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('705','115','276','33','17','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('706','109','172','27','17','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('707','135','175','8','2','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('708','37','38','24','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('709','7','280','35','4','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('710','243','488','31','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('711','131','204','17','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('712','5','11','23','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('713','268','424','1','18','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('714','3','8','2','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('715','401','496','2','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('716','125','500','16','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('717','21','44','9','13','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('718','60','266','40','9','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('719','176','489','37','8','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('720','33','33','15','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('721','208','282','31','18','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('722','68','83','9','18','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('723','207','421','39','16','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('724','37','483','3','12','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('725','54','115','6','4','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('726','272','411','39','3','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('727','1','1','28','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('728','13','348','21','8','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('729','122','307','23','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('730','15','15','8','11','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('731','15','33','29','17','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('732','151','213','8','4','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('733','156','160','5','2','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('734','170','329','4','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('735','45','323','16','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('736','13','124','39','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('737','11','243','22','9','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('738','159','322','29','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('739','62','354','1','4','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('740','103','297','3','19','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('741','56','460','24','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('742','0','79','5','7','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('743','67','217','36','10','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('744','249','263','27','5','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('745','215','463','18','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('746','82','420','6','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('747','104','381','23','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('748','23','46','35','13','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('749','146','318','4','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('750','178','191','39','13','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('751','105','229','33','19','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('752','79','364','26','16','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('753','258','307','40','8','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('754','20','155','5','5','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('755','8','40','15','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('756','245','439','22','11','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('757','66','247','17','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('758','152','184','15','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('759','251','282','32','20','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('760','106','113','8','3','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('761','202','332','37','7','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('762','22','75','4','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('763','216','228','38','6','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('764','176','250','3','10','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('765','185','346','16','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('766','62','323','17','19','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('767','24','335','4','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('768','56','342','4','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('769','14','177','28','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('770','40','47','19','13','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('771','445','484','40','10','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('772','75','137','37','20','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('773','199','405','4','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('774','134','218','20','18','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('775','199','378','40','2','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('776','108','138','40','16','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('777','224','441','35','19','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('778','203','446','37','9','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('779','271','350','11','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('780','478','485','25','20','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('781','81','209','18','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('782','399','500','22','19','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('783','146','441','10','8','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('784','30','287','25','10','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('785','249','298','27','19','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('786','11','33','29','5','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('787','13','37','16','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('788','7','83','12','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('789','50','318','21','18','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('790','119','487','39','4','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('791','48','132','26','11','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('792','108','117','11','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('793','441','474','18','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('794','186','385','24','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('795','17','35','24','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('796','56','64','10','8','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('797','113','489','33','9','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('798','35','40','26','14','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('799','456','459','17','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('800','48','329','16','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('801','85','124','9','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('802','79','124','34','1','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('803','110','161','21','15','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('804','27','63','24','2','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('805','347','462','28','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('806','340','347','35','4','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('807','67','70','26','5','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('808','67','222','24','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('809','283','307','18','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('810','32','168','24','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('811','394','497','15','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('812','283','291','11','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('813','119','190','18','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('814','237','483','18','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('815','13','31','30','3','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('816','351','450','3','3','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('817','299','352','40','3','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('818','162','343','29','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('819','207','231','1','1','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('820','86','97','32','18','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('821','155','164','28','9','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('822','138','256','24','13','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('823','12','24','16','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('824','8','9','1','6','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('825','92','301','8','6','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('826','116','212','13','19','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('827','11','246','35','14','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('828','178','426','34','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('829','47','53','34','2','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('830','231','389','39','6','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('831','29','344','16','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('832','174','306','19','10','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('833','80','469','19','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('834','274','417','31','10','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('835','108','225','19','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('836','182','264','22','8','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('837','11','252','1','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('838','104','263','34','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('839','71','350','17','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('840','3','6','12','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('841','173','224','23','4','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('842','31','220','36','12','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('843','82','254','25','17','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('844','83','443','13','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('845','218','371','1','4','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('846','105','262','12','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('847','134','466','3','7','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('848','31','32','2','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('849','197','338','21','16','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('850','356','434','9','5','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('851','53','89','7','11','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('852','165','431','8','14','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('853','100','227','33','17','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('854','150','300','10','9','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('855','145','220','2','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('856','138','248','3','14','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('857','71','125','7','18','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('858','22','27','24','1','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('859','289','367','37','20','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('860','33','287','35','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('861','225','453','25','2','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('862','189','482','32','8','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('863','26','318','40','15','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('864','339','373','17','6','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('865','66','123','18','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('866','167','225','18','11','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('867','14','174','22','5','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('868','39','107','31','7','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('869','27','223','37','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('870','4','25','7','20','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('871','265','477','28','1','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('872','29','185','37','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('873','137','356','39','20','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('874','89','420','38','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('875','182','247','19','20','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('876','42','290','1','6','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('877','130','260','19','18','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('878','132','495','3','3','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('879','96','141','31','15','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('880','62','182','10','1','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('881','206','463','28','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('882','232','489','2','12','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('883','185','488','2','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('884','44','206','6','10','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('885','85','333','35','20','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('886','182','275','2','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('887','296','470','19','8','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('888','22','175','13','11','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('889','85','427','40','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('890','22','301','19','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('891','212','354','26','1','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('892','1','5','40','7','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('893','62','97','14','15','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('894','240','265','3','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('895','227','443','38','20','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('896','301','320','26','1','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('897','459','499','31','16','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('898','171','207','6','4','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('899','155','459','6','4','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('900','87','168','1','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('901','274','393','3','13','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('902','18','78','12','11','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('903','138','243','19','13','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('904','245','331','18','14','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('905','42','143','36','19','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('906','176','246','37','10','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('907','77','170','28','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('908','7','456','37','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('909','206','421','18','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('910','193','280','23','18','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('911','44','172','15','10','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('912','74','220','13','5','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('913','132','459','40','20','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('914','32','160','27','4','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('915','26','38','33','7','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('916','29','279','27','5','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('917','109','167','13','17','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('918','150','467','14','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('919','9','261','26','3','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('920','4','23','3','13','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('921','152','391','20','12','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('922','1','4','14','12','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('923','15','139','10','18','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('924','44','212','37','17','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('925','157','232','24','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('926','11','20','29','9','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('927','146','360','27','15','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('928','21','409','13','19','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('929','41','155','22','14','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('930','158','254','4','8','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('931','44','69','25','20','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('932','68','280','27','16','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('933','121','390','17','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('934','85','319','19','14','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('935','43','92','28','9','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('936','17','157','6','14','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('937','195','215','36','3','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('938','80','92','30','18','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('939','22','257','26','2','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('940','148','157','37','15','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('941','18','149','11','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('942','339','363','9','8','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('943','219','252','27','14','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('944','33','102','27','12','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('945','3','164','37','14','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('946','178','325','4','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('947','36','212','10','10','4');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('948','281','293','23','2','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('949','400','476','31','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('950','228','335','8','17','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('951','210','236','40','20','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('952','57','139','34','11','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('953','9','351','30','11','2');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('954','268','403','34','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('955','137','221','29','11','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('956','243','277','24','3','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('957','218','275','16','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('958','97','207','11','4','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('959','184','426','24','20','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('960','92','238','5','17','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('961','45','258','21','13','1');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('962','29','402','5','5','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('963','17','62','38','7','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('964','191','304','9','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('965','93','171','24','15','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('966','19','23','31','19','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('967','210','344','9','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('968','46','74','19','12','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('969','298','355','26','2','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('970','46','99','7','11','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('971','2','204','38','8','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('972','2','466','17','9','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('973','131','215','22','3','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('974','334','352','35','19','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('975','24','200','38','3','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('976','86','104','24','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('977','36','63','26','8','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('978','252','385','39','8','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('979','79','153','5','16','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('980','152','152','2','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('981','337','499','20','20','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('982','363','378','29','16','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('983','379','387','16','5','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('984','160','318','16','18','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('985','32','51','19','8','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('986','86','98','13','11','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('987','5','253','23','16','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('988','158','244','24','16','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('989','95','311','2','7','8');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('990','28','130','9','7','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('991','118','448','38','2','6');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('992','243','318','36','8','7');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('993','175','265','34','15','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('994','205','205','20','3','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('995','171','428','20','19','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('996','134','372','7','2','10');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('997','369','441','34','17','5');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('998','65','191','28','12','3');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('999','217','243','26','13','9');
INSERT INTO "orders" ("id","fulfilled","unfulfilled","groups_id","customers_id","groups_users_companies_id") VALUES ('1000','26','41','23','10','3');

----
-- Drop table for customers
----
DROP TABLE "customers";

----
-- Table structure for customers
----
CREATE TABLE `customers` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `plainpassword` VARCHAR(255) NOT NULL, 
  `email` VARCHAR(155) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `instructions` TEXT NULL,
  `phone` TEXT NOT NULL,
  `verified` INTEGER DEFAULT 0
);

----
-- Data dump for customers, a total of 20 rows
----
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('1','Gerhold.Brady','$2y$10$TZGY7XBzl0cD2XD/e5llz.9CsLpB/bVA.5cMyCdMwE8ULOJuFaGA6','c,uRD4tYZB@oO-9OlB#','Kieran.Haley@example.com','5339 Alessandro Trail Apt. 152
East Christopher, MT 24833-2975','','3447752355','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('2','Lynch.Rosina','$2y$10$jguDFGtVNWqWo/SW.jG6YuF0jcC0Qw3UEyp0jhzQKw9PsqL8yMQC6','PkEKEHLR.tawY<41','oKoepp@example.com','77259 Homenick Grove
Port Cassandreberg, DC 72757-1398','Accusantium soluta ducimus est sit qui quia nisi. Magnam eos voluptas est deserunt non non vero voluptatibus. Nulla accusantium eum autem sint eius. Labore amet voluptas eos molestiae et assumenda repudiandae.','7493369147','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('3','Judy.Schoen','$2y$10$SzXG8HbU9CTVL2Zmoxysb.R87EX9HJXvKtcczGlQCnXeZ2j3mBpG6','6[XM<.MLndoEPFW*9D7','yKautzer@example.net','71897 Schultz Mall
Port Karlie, TN 64098','','3930339289','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('4','Everett18','$2y$10$BmqhW3dEQT6/4C8/aF.vxeulS6f7Ep1iNzYj1nIm5pT7y8QL8n5z6','ab)*2,q3Y~SZ{!!R#R','Murazik.Erika@example.com','83558 Gaylord Loop
South Malika, NY 51800','Sunt eveniet voluptatem cum quos amet sed. Quibusdam alias non cupiditate rerum quae harum.','6909083240','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('5','oWalker','$2y$10$DC9aqpWLOPL45sr9uXi1.e35cP9L8CVeP9/JEy5U0yTi.6B8OJbiW','w3:~qiLLD','Bartell.Janelle@example.com','280 Towne Station Suite 976
North Hilma, ME 11023','Culpa et laudantium iusto non eaque error minus. Eveniet illum possimus repellendus voluptas natus ut. Commodi natus hic harum alias sit odit quam vel.','8611128292','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('6','oDare','$2y$10$lHhe7hg3Mz3.0JNCRm2n7e0Dpk/1hhSKI7YLMamXJtznbm0gGbWu.','f$c7''Y_U_JS){lu&CiOW','Gaston90@example.net','78216 Dominic Shoal Suite 929
Cummerataborough, IN 66853-6448','Fuga non ut tempora aspernatur quia dolores totam. At voluptates reiciendis quae reiciendis tenetur. Id magni quidem facilis. Perferendis aliquam ullam nam quidem velit dolor.','5788644842','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('7','Schulist.Shanel','$2y$10$JaVGkwB3/4E0wsb./KXbmu7WThiDM1efZAm4ijm6oEomdfQvMnSJS','bB&"39l)^|eS"DM&p9,Z','Reichel.Ashtyn@example.com','8472 Gerhold Station Suite 415
Jaylenberg, IL 36401-4347','Velit nesciunt eum tempore suscipit aut excepturi optio. Suscipit ipsum reiciendis exercitationem et cupiditate a laudantium. Nihil quisquam hic velit. Cum corporis aliquam totam soluta voluptatem. Ab quisquam et eum consectetur sunt non optio.','4944366006','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('8','Mary.Hand','$2y$10$H7kCdyDuVkRHSNVjV.pcVu4Gk5FqglMnycBGaXPoG9XRfO/LAZ6uu','>xi61tR|h^<mYxnv^Dro','Hertha.Rice@example.net','9307 Kris Mount Suite 505
West Lacyland, ND 63783-4080','Esse voluptas ab tempora ut illo numquam est consequatur. Natus et quidem nemo numquam nam nihil. Rerum officia ipsum ratione tempora magni laborum. Praesentium libero itaque qui.','7411849608','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('9','Hodkiewicz.Cordia','$2y$10$KAQ.G2C/pTX5Wio5nm8gd.X4HrCvegdqZ5Bhu5YNKnWyXAenqaP3m','<4F9:=_/g,/Gm@h&dqnq','zHirthe@example.org','482 Alyce Gardens
Diamondchester, WA 11137-9608','','2752082209','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('10','Idell.Torphy','$2y$10$uDtEMNpXqqlaMuwrrrv5d.t25V3wMt/X0jCeZSYjTcZN9ocMQX/Nm','PiYGiGWWZdGp6','Charlene.Kunde@example.org','3730 Treutel Forest
McGlynnmouth, AK 14211-1356','','7285872939','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('11','Garrick.Schuppe','$2y$10$bdKgrgOLhztXCq2C/NflFutMUQwLaMBXs6QO4j.7swu7Y.rk5kkVy','Z`TQt+S1fd"INu.','fCarter@example.net','84434 Candida Creek Apt. 040
South Aylinton, NV 88505','','82819536','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('12','Francesca.Balistreri','$2y$10$a3PxRGWCOCnmV2m6OVah3O5XjuBht4g9CTSHYRH5MrPx/.8ItElg.','c]8##S@b)E}7)iEKOR14','sSimonis@example.net','74249 Robel Canyon
Lake Erika, NY 70051-9658','Quaerat nobis consequatur aut enim illum consequatur alias inventore. Reiciendis in suscipit nihil qui rerum. Ut magni dolor soluta nesciunt explicabo corrupti sed.','8862509371','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('13','jStracke','$2y$10$E.ZlNN.4wCxlQRkKLPReYeLYYiUFZGiOka/qoF8B/KQQXabC00M4u','&)\p-_q@g_','Kennith34@example.org','929 Krajcik Green Apt. 875
New Laurence, IN 22667','','2723662663','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('14','Stacy.Olson','$2y$10$xp3E33Deh.ZHuVBuMp0DzO7EpObTPPTPNDFbpEffQjtloGncndEgq','z&s$8s.^}:>{?.R5','qSmith@example.org','86679 Aniyah View
Marianaside, VT 46132-7066','Temporibus qui dicta quo optio.','501703058','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('15','vSchneider','$2y$10$gFkvjE76LwNofP7R.0J7.e7D0Rtms9AlHQk7S1fUtRu2iGDLBOE8O','VqTX(*$c!G.,qmu;&xD','hLindgren@example.com','0748 Mann Center Suite 960
Hellerstad, ND 72394-2870','Esse rerum eveniet in quia. Est magnam earum rerum dolores molestiae ipsa illum. Cumque assumenda culpa labore quia architecto nam vitae.','9320420252','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('16','Maynard59','$2y$10$v49N.kNbuZa29xH7lfo5a.Vgm6mLg7/jAwkO.lhN9Bd5P83VguVr6','Y}_N[k','Odie.Reichel@example.com','722 Corkery Rapids Suite 333
New Julienview, TX 41117','Nihil sunt ab ea quasi est ab perferendis. Ratione qui ea fugiat ad maiores dicta.','9661018655','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('17','Tyrese.Kertzmann','$2y$10$XrmALFsQ6N3Ak9P4iqdTVeyXTImu2d2PhChf4Aj0Jx5jbCvVpz0ZC','v[Vh}g.','Thompson.Alexandro@example.org','1741 Bianka Ways Apt. 772
New Emilytown, MI 69581-7905','Dolores quia eum consequatur blanditiis. Suscipit aut rerum deserunt omnis nam quo magni corporis. Dicta cum consectetur dolorem quod qui quaerat cumque recusandae.','4874327381','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('18','Susan60','$2y$10$nMY79LFNFG4IpZPOwuhxO.U2qQavl.Yf2E0hx.QqDJ0evdBc.jSb2','vC7mktRS&p$GRN5@r;}','Schoen.Peggie@example.org','4813 Immanuel Flat Suite 802
Hoppeport, GA 43465','','7941865892','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('19','dRath','$2y$10$QO5DnBEmE9x7vpvdxzNTiex4dKe4m3gOApRiekOqHMEpymvscVgmu','usWM>R"e@#{aj','Monahan.Rashawn@example.org','3770 Ebony Club
South Jimmyberg, AZ 63775-1200','','5776317743','1');
INSERT INTO "customers" ("id","username","password","plainpassword","email","address","instructions","phone","verified") VALUES ('20','Nicolas.Kovacek','$2y$10$AE1bSfnftGUR6IM8Ye1QZukgXSkbK8rPOWZDGWhIiek9ovlQCwnY.','aAis#QK/d|q<w','Lind.Keaton@example.org','20783 Sabina Valley
Pamelabury, CA 91611','Consectetur consequatur sapiente voluptatum. Soluta sit dolores reprehenderit et expedita dolores voluptatem nulla. Possimus accusamus tenetur et nulla iure et.','9159801032','1');

----
-- Drop index for sqlite_autoindex_changelog_1
----
DROP INDEX "sqlite_autoindex_changelog_1";

----
-- structure for index sqlite_autoindex_changelog_1 on table changelog
----
;

----
-- Drop index for fk_users_companies_idx
----
DROP INDEX "fk_users_companies_idx";

----
-- structure for index fk_users_companies_idx on table users
----
CREATE INDEX 'fk_users_companies_idx' ON "users" ("company_id" ASC);

----
-- Drop index for username_UNIQUE
----
DROP INDEX "username_UNIQUE";

----
-- structure for index username_UNIQUE on table users
----
CREATE UNIQUE INDEX 'username_UNIQUE' ON "users" ("username" ASC);

----
-- Drop index for email_UNIQUE
----
DROP INDEX "email_UNIQUE";

----
-- structure for index email_UNIQUE on table users
----
CREATE UNIQUE INDEX 'email_UNIQUE' ON "users" ("email" ASC);

----
-- Drop index for phone_UNIQUE
----
DROP INDEX "phone_UNIQUE";

----
-- structure for index phone_UNIQUE on table users
----
CREATE UNIQUE INDEX 'phone_UNIQUE' ON "users" ("phone" ASC);

----
-- Drop index for fk_groups_companies1_idx
----
DROP INDEX "fk_groups_companies1_idx";

----
-- structure for index fk_groups_companies1_idx on table groups
----
CREATE INDEX `fk_groups_companies1_idx` ON "groups" (`companies_id` ASC);

----
-- Drop index for fk_orders_groups1_idx
----
DROP INDEX "fk_orders_groups1_idx";

----
-- structure for index fk_orders_groups1_idx on table orders
----
CREATE INDEX `fk_orders_groups1_idx` ON "orders" (`groups_id` ASC, `groups_users_companies_id` ASC);

----
-- Drop index for customer_username_UNIQUE
----
DROP INDEX "customer_username_UNIQUE";

----
-- structure for index customer_username_UNIQUE on table customers
----
CREATE UNIQUE INDEX `customer_username_UNIQUE` ON `customers` (`username` ASC);

----
-- Drop index for customer_email_UNIQUE
----
DROP INDEX "customer_email_UNIQUE";

----
-- structure for index customer_email_UNIQUE on table customers
----
CREATE UNIQUE INDEX `customer_email_UNIQUE` ON `customers` (`email` ASC);
COMMIT;
