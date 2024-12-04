CREATE DATABASE elearning_platform;
USE elearning_platform;

-- Table des utilisateurs
CREATE TABLE users (
 id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 email VARCHAR(100) UNIQUE,
 password_hash VARCHAR(255),
 role ENUM('student', 'teacher', 'admin'),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des cours
CREATE TABLE courses (
 id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(100),
 description TEXT,
 teacher_id INT,
 price DECIMAL(10,2),
 status ENUM('draft', 'published', 'archived'),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (teacher_id) REFERENCES users(id)
);

-- Table des inscriptions
CREATE TABLE enrollments (
 id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT,
 course_id INT,
 enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 progress INT DEFAULT 0,
 last_accessed TIMESTAMP,
 FOREIGN KEY (student_id) REFERENCES users(id),
 FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Table des leçons
CREATE TABLE lessons (
 id INT PRIMARY KEY AUTO_INCREMENT,
 course_id INT,
 title VARCHAR(100),
 content TEXT,
 duration INT, -- en minutes
 order_num INT,
 FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Table de progression
CREATE TABLE progress_tracking (
 id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT,
 lesson_id INT,
 status ENUM('not_started', 'in_progress', 'completed'),
 completion_date TIMESTAMP,
 FOREIGN KEY (student_id) REFERENCES users(id),
 FOREIGN KEY (lesson_id) REFERENCES lessons(id)
);

-- Table d'historique des prix
CREATE TABLE price_history (
 id INT PRIMARY KEY AUTO_INCREMENT,
 course_id INT,
 old_price DECIMAL(10,2),
 new_price DECIMAL(10,2),
 changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (course_id) REFERENCES courses(id)
);


insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (1, 'Netta', 'Oppie', 'noppie0@wikimedia.org', '$2a$04$WZJVT48zeZlmNn/tk1DUVuQ6CIdoXDIJ2Jf3eNfN9q.Gs14aTgrhe', 'student', '2024-02-12');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (2, 'Austen', 'Dedam', 'adedam1@newsvine.com', '$2a$04$QfCupa2Z65qI/PC/P2bA4eNXE0dWErIyMrVRkRhU91VS3M1D0yFyq', 'admin', '2024-05-16');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (3, 'Forbes', 'Caso', 'fcaso2@geocities.com', '$2a$04$3IpfUVgIoBSMmrLTqJCGCuPb48oLhsMCJAEGKvD8vxqkIAkrYcrXq', 'teacher', '2024-01-18');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (4, 'Winn', 'Entwisle', 'wentwisle3@chron.com', '$2a$04$hyi2JyqeX9kXSUR/BZIR1utnrvZjc7h0qCv1Z0BycB1h.JVs8QnjW', 'student', '2024-06-17');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (5, 'Bowie', 'Middle', 'bmiddle4@woothemes.com', '$2a$04$iaAogWENXxO87gAjxp07r.7ENVf33EU.B5vywykJsQeqRHXiav9Sq', 'admin', '2024-10-02');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (6, 'Haley', 'Mitchelhill', 'hmitchelhill5@tuttocitta.it', '$2a$04$h1TOM7KizAiXxZh8bMOumeSvzjT1vrCDKvHCD7R0VeFJmNUSJYh46', 'teacher', '2024-08-07');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (7, 'Bradney', 'Sarton', 'bsarton6@si.edu', '$2a$04$C40aD9QNOMzg2a/G3akTmOzSSuC0JfM14kmNplOudEXBaboA0Vvlm', 'admin', '2024-07-12');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (8, 'Lavina', 'Stockau', 'lstockau7@meetup.com', '$2a$04$/M0JJjO0tOzx2ygcYJ3/ueVm7u7WPfgey2JJIx3GNjaXYI.eVeh22', 'student', '2024-08-03');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (9, 'Veronica', 'Wignall', 'vwignall8@cisco.com', '$2a$04$AIPPtNihSwy3k1cRI63c..IyxCuBWzfPeIc1gFhHZupgEUHJkJbiO', 'teacher', '2024-08-02');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (10, 'Elise', 'Cordall', 'ecordall9@dion.ne.jp', '$2a$04$x7JkZk6gh8SV3XGsLiZXiuFlLeW53/tjLzggyCzEbhuG73161fuZS', 'teacher', '2024-06-10');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (11, 'Caryl', 'Frise', 'cfrisea@mysql.com', '$2a$04$CRSnfOfmizI5EjB.2uBDruXFqF6Rld2rMzEM0.vgahYq9jEtAovbe', 'teacher', '2024-06-24');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (12, 'Danna', 'Jacquest', 'djacquestb@vistaprint.com', '$2a$04$OR2N1pAq.AB6LAWGAYfThOE8DVi7HQ5yxq.WEkDjn9UI7y1JLgrAG', 'student', '2024-02-08');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (13, 'Meridith', 'Conyers', 'mconyersc@fda.gov', '$2a$04$DB.3CzGin4gj7nrGgbWSkeejTOe1JTUWpByrdi4xMwwNU005WMT32', 'student', '2024-12-01');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (14, 'Creight', 'Petyt', 'cpetytd@people.com.cn', '$2a$04$wsFil8Dpm/GJKOUspJWt3eXoj/6YKcAQYjrFCHkuepdaawAxgNTCO', 'teacher', '2024-04-19');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (15, 'Arlan', 'Muck', 'amucke@twitpic.com', '$2a$04$jP1sEKFasCeLuElD4MKZ0.Z0SnP9gIsUvB7xj9gY0L1b5K9r6c.x6', 'student', '2024-08-26');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (16, 'Klara', 'Comini', 'kcominif@zimbio.com', '$2a$04$pK2hSIeD9kHLcfUFGT29besPhyI/juHqZDSwfR76E0s7MwM2Y/awK', 'teacher', '2024-03-12');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (17, 'Tilda', 'Munden', 'tmundeng@opensource.org', '$2a$04$tWq7vZeduZwznLUW33oude28xabEZlG5wNe.qHhPoU9wyIrFbKIKK', 'admin', '2024-10-22');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (18, 'Cristina', 'Flay', 'cflayh@sun.com', '$2a$04$WFP2GOq.OcYTPfW1qlBOSO5SMFJa5qm.RGNiRpX5EyB3n4FbCkYo6', 'teacher', '2024-03-18');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (19, 'Violet', 'Cubuzzi', 'vcubuzzii@com.com', '$2a$04$Ehxg0JnLKdB71Hd5g6UvJOmcc3oyi6k6M93oZbq6PDqzKT9pq.ObK', 'student', '2024-11-06');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (20, 'Dotty', 'Ast', 'dastj@nationalgeographic.com', '$2a$04$Z.TFbLK9HZDLkkhHIpzN5efJGcAe21JVu0Ihzx4UEwPOHuQ3pEA0.', 'admin', '2024-06-18');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (21, 'Maury', 'Pendleberry', 'mpendleberryk@barnesandnoble.com', '$2a$04$TmgRzgAykDegzRBP410aIugBTusAW5dJzIdXpHuIYhcpVLsLTpKwW', 'teacher', '2024-12-08');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (22, 'Wendie', 'Crutcher', 'wcrutcherl@privacy.gov.au', '$2a$04$XRokdU3qn7CKN5WvYlR.leYzx.Byrh9O/VlCh22YRwphe3dfLphcq', 'student', '2024-08-09');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (23, 'Allys', 'Antonijevic', 'aantonijevicm@webnode.com', '$2a$04$JDz2DleQWj8Pb3xXHGsFwOsLSQXAfnu3BsmxZAfGqZ26z06MDCduG', 'admin', '2024-05-26');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (24, 'Upton', 'Idiens', 'uidiensn@wired.com', '$2a$04$knsXHV.nSnchRcGJ1PdAl.ll0LFjagIFMVOvFZ3vDth5HkwWWjO.C', 'student', '2024-03-09');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (25, 'Halsy', 'Stickley', 'hstickleyo@ask.com', '$2a$04$6nPX373DNxZdlEgTVgnoteUgvnKSOsoti8JtcTFRxP/BbKjZPQKOq', 'admin', '2024-12-27');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (26, 'Ryun', 'Dadge', 'rdadgep@si.edu', '$2a$04$FB.WYJyyM06BbySW5zGcdO2QZDnmSVgitvRKDTTgZG56TnMM79OJ.', 'teacher', '2024-01-23');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (27, 'Germana', 'Maffini', 'gmaffiniq@diigo.com', '$2a$04$U02lpWB7gi8EMd7lFRJNd.Zd6q/c/1Inrwp/I4K588WthfZo./dG.', 'student', '2024-10-17');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (28, 'Nyssa', 'Pinock', 'npinockr@vimeo.com', '$2a$04$dOa62U6sDuSmCODnLU2Qv.6Q/EOobBmbX.EBJ95xdLpVY/YSEJI.e', 'teacher', '2024-01-08');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (29, 'Geri', 'Hatherley', 'ghatherleys@npr.org', '$2a$04$L7A.Jfjno0/0kGv4FNJn1elLhr.p/L4iMPVHC8pyDnObUE1uEnta6', 'teacher', '2024-03-30');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (30, 'Aliza', 'Paddon', 'apaddont@who.int', '$2a$04$VpsLXY9pAiRyMrHOsNBtb.BzZrLV3XP/J22LUomImpeMYGaCf1Tnu', 'student', '2024-12-09');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (31, 'Catlee', 'Catt', 'ccattu@bigcartel.com', '$2a$04$7qvzXt2SXYNKh4qZHpCPQuZgVKYEflrWhDGIQdSZuDhKwjQupPMGW', 'teacher', '2024-12-04');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (32, 'Gib', 'Habble', 'ghabblev@over-blog.com', '$2a$04$fm1ZhVxpyOLF0MC8zOfwEeAZPjGqxZDZiuQFt/u36D1YhJPjx8hHm', 'teacher', '2024-11-13');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (33, 'Kamilah', 'Vasiltsov', 'kvasiltsovw@ucla.edu', '$2a$04$BtueIx13K5diktJLuebwqufhqe5ZfkGOqG2rUfE/N9EtXcHWz2Jue', 'student', '2024-12-01');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (34, 'Annis', 'Ahearne', 'aahearnex@tinyurl.com', '$2a$04$yblvYwb0X8yxOY5oaDI4PuPjvIINAkOrqAFixM7hSvYi2cHdy0ydC', 'teacher', '2024-12-19');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (35, 'Stearn', 'Winsom', 'swinsomy@163.com', '$2a$04$MNXsx.novpdTiCtWlmHumOlO0voOYrYGYxEtmN/HfRRJhZE0k0rgG', 'student', '2024-10-31');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (36, 'Chancey', 'Coolbear', 'ccoolbearz@reddit.com', '$2a$04$GLmT/LP/iTPVggzdbtfmveKx9LFImmIaEKksbqBeQUBk/ntZWuMTm', 'teacher', '2024-12-05');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (37, 'Genni', 'Durbyn', 'gdurbyn10@prweb.com', '$2a$04$NriePXSSk8iXvD3CeUU5MOKPDZWH/AdoWXgQJb7DaiRVhhakFUEvy', 'student', '2024-06-17');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (38, 'Benedikt', 'Ferrarello', 'bferrarello11@moonfruit.com', '$2a$04$mUwb.wbqk6tGWgGR0.Q8Zub8pdR9RhG7UdvaWIa1mYyiQwaMXtzcO', 'teacher', '2024-10-04');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (39, 'Torry', 'Rene', 'trene12@csmonitor.com', '$2a$04$jtGaWa8qm5/vTzlb9FOkRuAFUZiA.Jjesm0bznGgrkkgJ1TaCpwey', 'student', '2024-03-16');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (40, 'Gwendolyn', 'Askwith', 'gaskwith13@cyberchimps.com', '$2a$04$VBGx8mTKOpnWbVmhG2JYfeSfQxbpW5KAI.Z4c3gFqPFvKw739wUm2', 'student', '2024-10-30');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (41, 'Willabella', 'Memmory', 'wmemmory14@accuweather.com', '$2a$04$vaX8F1JJLC7tAc7YiI1OFu7kipWFVvI33CKWwpqF6C12LE/zIZrGy', 'admin', '2024-04-07');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (42, 'Elsa', 'Iuorio', 'eiuorio15@foxnews.com', '$2a$04$iwW6aF/yA9HYc.jkauZfxefCiKC3Jbvm7a2ktEQbo0VB6oTTiFy2O', 'student', '2024-01-06');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (43, 'Erasmus', 'Foxen', 'efoxen16@umich.edu', '$2a$04$OnaLPfEG0iNbhQRmTzp47uaQsYxyU1LAWAoZ.D//vPtH3T7tT2a1u', 'student', '2024-08-15');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (44, 'Daisi', 'Udy', 'dudy17@timesonline.co.uk', '$2a$04$7Kot6xPJ1oPXdyFMgLcSuuep9gWFKkVpFiS7/lVM.0UaR2tDI6bG.', 'student', '2024-08-25');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (45, 'Tish', 'Lesor', 'tlesor18@sbwire.com', '$2a$04$K5w5mttCZBsNlsH6uNPW0egs8mA6GJnaoO3xWgOReevMXk7ih8SEy', 'student', '2024-03-03');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (46, 'Teressa', 'Cowle', 'tcowle19@feedburner.com', '$2a$04$yQo9f7gANzh6BoLxXrTn4ehKQCybyXJt5PhIVbVZsx8pY0AK4K//e', 'admin', '2024-05-09');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (47, 'Selene', 'MacMychem', 'smacmychem1a@youku.com', '$2a$04$0EybrMBJMOcpzmUKIr2TtuLuJwO4zwdx3oUNWicHP4sFRjKAahkNG', 'admin', '2024-02-08');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (48, 'Hugh', 'Kurtis', 'hkurtis1b@loc.gov', '$2a$04$mu1utx7WGk8eH7QxVYAVyuKqhG6fBEm8k7px3SKqEXAnTk.4oHp3i', 'teacher', '2024-03-25');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (49, 'Layne', 'Craighead', 'lcraighead1c@google.co.jp', '$2a$04$sz5kGzZ97roq2YIayhWvCun0mePjF8aYSG.8CB4VRaCRTZaLLe3gm', 'student', '2024-07-11');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (50, 'Bertie', 'Yegoshin', 'byegoshin1d@edublogs.org', '$2a$04$.noSm9y3QVQmXhzt1slrG.shS7eZyLQIkAzMqTiPjHQ15ykWJl6rW', 'student', '2024-10-18');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (51, 'Kori', 'Leehane', 'kleehane1e@japanpost.jp', '$2a$04$Q00RjRtL.ERaij75OFWOB.JhgXFXttB9z5ezfLWAH1aY1dxi543iq', 'student', '2024-05-22');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (52, 'Mitchael', 'Bertlin', 'mbertlin1f@e-recht24.de', '$2a$04$/LrGHXv0gMqjv0jpFqy19uuDd3zuTh3SkxCWMTjNUxSce04dMm4x.', 'admin', '2024-12-02');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (53, 'Franzen', 'Yashanov', 'fyashanov1g@slideshare.net', '$2a$04$XmDQ4MERFEH.NEHLtJXrN..Ia78ZdmiSUTw73VJ6fb28NMxq./Jca', 'admin', '2024-04-04');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (54, 'Mart', 'Eddow', 'meddow1h@columbia.edu', '$2a$04$3Mo0OMNvSNY9fwyzxAO2EufFJZ.9B9qSv6y5.WW6N5riaPpKNXUVK', 'admin', '2024-07-26');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (55, 'Dimitri', 'Shalcros', 'dshalcros1i@boston.com', '$2a$04$NCPo/PpBsHb1XwNio2ANi.BHdfIGdgmfk8GjppVQkm0G6pEcldp8G', 'admin', '2024-05-22');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (56, 'Sibby', 'Meates', 'smeates1j@webmd.com', '$2a$04$1nqlIoMmn4utAFKS.oBlIOBKFT4ri.yYLy6UUslV0Q5A7ZdQtxJaC', 'admin', '2024-07-22');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (57, 'Ellynn', 'Bowlas', 'ebowlas1k@xing.com', '$2a$04$rWnUsGj.Vg2UMXBbhS1aSe4Cu9Ub3zkQPxIphQ6v2FkM3gcAl5F0e', 'admin', '2024-12-08');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (58, 'Glen', 'Marciskewski', 'gmarciskewski1l@wufoo.com', '$2a$04$6QTqro1d9rBQv507RdW47.NzkrDu89L2rzFSaBklIORj0I6SZofN.', 'admin', '2024-04-22');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (59, 'Aundrea', 'Jarrette', 'ajarrette1m@blogs.com', '$2a$04$LQFgTJIkMXC7TBcVSItqv.B5bSx6uDpZgWkXurGxsJMh01exCwb0.', 'teacher', '2024-07-20');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (60, 'Sophi', 'Shawel', 'sshawel1n@squarespace.com', '$2a$04$YeRMEpWNtl8v35VHxtvIVuuC5Cx0xe4CC7ZGoaqlllCCC9xLEoDW.', 'student', '2024-09-20');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (61, 'Sela', 'Grafton-Herbert', 'sgraftonherbert1o@about.me', '$2a$04$kXQTg/kOP2Gzq/lijSj27.vPz.yB4xJXFhjIq.bKZDLj9Lthlpr/e', 'admin', '2024-08-17');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (62, 'Brynne', 'Ball', 'bball1p@pinterest.com', '$2a$04$bC6iZcOIr3pj5N17/WBNfOI6LveHVsZd4inDMW6qPqcTdy1qc9Lt2', 'admin', '2024-03-07');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (63, 'Simmonds', 'Hawkwood', 'shawkwood1q@umn.edu', '$2a$04$ENIC955IlwRM1PQPvb0M7eWrr/SP325RYt8X/ttI.OpXWtJ4bqGMC', 'student', '2024-01-11');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (64, 'Innis', 'Onions', 'ionions1r@nasa.gov', '$2a$04$sq4EoveE/lkZyHtIiIE1zudKe8QhxKOWV4IbuQt5g6A/0XtDcYuDe', 'student', '2024-02-14');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (65, 'Keelia', 'Gooke', 'kgooke1s@last.fm', '$2a$04$HvS3VCMSk5dB06sJeRJO/ef8k5KHUdTdNz7jcIt969ZuNbAvQbtyS', 'student', '2024-08-23');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (66, 'Dora', 'Pitchford', 'dpitchford1t@photobucket.com', '$2a$04$yct.a5kpCHwDdPgMBzY/COpdo/Cqoux7eLRP3GFiwNGmBEh5GAIMO', 'student', '2024-02-17');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (67, 'Cece', 'Moret', 'cmoret1u@ebay.co.uk', '$2a$04$7kizoGSMmnrdKA/Pu.fInuXn2mbE3.TiPPP33I45Wo.4nj9CtpZRa', 'admin', '2024-08-03');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (68, 'Jorie', 'Frankum', 'jfrankum1v@biblegateway.com', '$2a$04$36EiJ3u0DE7c2su10ryJIuBV.K40qlOCimZRqzQnQR8n7Q56F9gXm', 'student', '2024-06-20');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (69, 'Jareb', 'Deetlefs', 'jdeetlefs1w@state.tx.us', '$2a$04$i1gRk6gA2miSlIkjDYWY6.osC9SdxQg2h/6vn.49.MRQ4oEnPUmKu', 'admin', '2024-12-25');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (70, 'Gunilla', 'Fadell', 'gfadell1x@fda.gov', '$2a$04$6jnIELkiPWMhT5ePycoQEOl4wWbQqC5SDq1k1GhHiLdxKiR1Ysswe', 'teacher', '2024-08-07');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (71, 'Tybie', 'Showen', 'tshowen1y@arstechnica.com', '$2a$04$FeHpTL1qj3HAQQefW2MMU.SFUKUjoj5/UiuWojeRJ3HxaV37NB68G', 'student', '2024-04-25');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (72, 'Merline', 'Ancketill', 'mancketill1z@redcross.org', '$2a$04$iax0SDi4hNexWyEK3YsiIe4vrcD9PW2JgX0pE6xQtfqrTZOHctb8y', 'admin', '2024-12-21');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (73, 'Jaye', 'Duckinfield', 'jduckinfield20@hexun.com', '$2a$04$8wRPu/.jP8MjKypMdcnfNO9dqn1yLDl2mNjurih.HvceAWpR/eFTy', 'teacher', '2024-03-14');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (74, 'Britta', 'Flamank', 'bflamank21@gov.uk', '$2a$04$vFfkf0Lt7xGjgFMVRCnQ5uQTKH8TuTn66LO5ctcmgMJBfHv5DEK.W', 'student', '2024-01-23');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (75, 'Rebekah', 'Gallaher', 'rgallaher22@cpanel.net', '$2a$04$EFyWfDR9kOXtiYVKrWpDdu4klj4UcFI3FuRTP2KblK8mlzDhNMNqu', 'teacher', '2024-04-12');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (76, 'Mae', 'Lindup', 'mlindup23@creativecommons.org', '$2a$04$t.FzVt0yY41sXi4rtgUPIOdueiZ7HNeKdJKLRNOayvJwaaof9lm5q', 'teacher', '2024-10-23');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (77, 'Julina', 'Pietersen', 'jpietersen24@sourceforge.net', '$2a$04$1.sYeL/wOCabR/M7aPanXe/aBKOA0vsSYFerDLiGmB9AHG0UygziC', 'student', '2024-07-17');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (78, 'Filippa', 'Sisselot', 'fsisselot25@usda.gov', '$2a$04$W6S4MMYmVYRVTfe8A8Lwju39B3IBXqZb8qgSuDPLd48Zqp2eMhVHe', 'teacher', '2024-11-24');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (79, 'Carline', 'Collman', 'ccollman26@topsy.com', '$2a$04$9zvAzGePXIlApIQInIKglu5ISBUEPYIXgTsRR/0m4Zyt.TdgIq/.S', 'student', '2024-06-10');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (80, 'Jamaal', 'Oglesbee', 'joglesbee27@mail.ru', '$2a$04$YQAOaOBdUcUKyguIYQhnBejgfItleFEIeOBOxOWcPXi71VvSt//RG', 'admin', '2024-07-28');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (81, 'Donetta', 'Milch', 'dmilch28@gravatar.com', '$2a$04$JP4TTcIKhBRiC2wOMYmadOr8IvBkR2GLiyxXl0FKUjDrETQFjHaAa', 'teacher', '2024-11-06');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (82, 'Tatiana', 'Balderston', 'tbalderston29@google.ru', '$2a$04$j9EeQoZw0i8sliCzQequHeCfBDFXMYkFoQQ209pNRH8PxMQOevi0W', 'teacher', '2024-01-30');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (83, 'Damita', 'Rigler', 'drigler2a@springer.com', '$2a$04$xioRuqgwl.z9z4iecO3fq.uH9UF06PWkJlKc08nwRPy8W70FDn5k6', 'admin', '2024-07-23');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (84, 'Friedrick', 'Siene', 'fsiene2b@taobao.com', '$2a$04$ir99ARBXgJ.jlqNg2aw7V..uv/PJN7huQa9J9dAO28aaSkNtsRP2i', 'admin', '2024-12-07');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (85, 'Kiley', 'Petrak', 'kpetrak2c@bravesites.com', '$2a$04$qxeB3NtysJ/2E0mLL1Ivyest9LOo8jwF5N03Fp9mpbfpZfHcQ/nm.', 'student', '2024-04-09');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (86, 'Joel', 'Travers', 'jtravers2d@xinhuanet.com', '$2a$04$hXpBQT2CttdSV2sE8jRoBOHVRR.NDS4rViR3XHIKVp9W0LP5rFYNe', 'student', '2024-08-28');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (87, 'Glennis', 'Antoshin', 'gantoshin2e@scientificamerican.com', '$2a$04$D/OSHf7vr2DWRisMZun0h.Sqziv0ORhKaSY7zntkNFpQozBVsctHC', 'teacher', '2024-01-17');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (88, 'Dania', 'Ruller', 'druller2f@kickstarter.com', '$2a$04$mTaqQMz0wgMl3hBOXKfcAeofFuaUmODExn.CIwtJxDCmtd7/hx7rm', 'admin', '2024-07-03');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (89, 'Flint', 'Hauger', 'fhauger2g@marketwatch.com', '$2a$04$Hdiq2tvZOH.fqtmZeOpqieVXjosjgdO9Y77E.amsOh5NzXB3efc2S', 'admin', '2024-04-12');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (90, 'Pablo', 'Spanton', 'pspanton2h@weebly.com', '$2a$04$eHD6rRjOMqlb680JM.vswOnIwFxh22Voc1Y5SqCZdqoOZd6zko/G.', 'student', '2024-10-23');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (91, 'Mersey', 'Lingfoot', 'mlingfoot2i@ebay.co.uk', '$2a$04$w7nvHhkGRvWEI/bObO3Sd..ae73VuTfM2tAW7.VvkmFl4LLq3jCg6', 'teacher', '2024-08-04');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (92, 'Bordy', 'Molder', 'bmolder2j@hp.com', '$2a$04$Xw3Skm3FM44XvPXjqPFuqu1zNrEQBBz8feo/.jlIwDiATvEXcsV/6', 'teacher', '2024-03-04');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (93, 'Amata', 'Filippo', 'afilippo2k@mayoclinic.com', '$2a$04$mcnt2srm/3VhhpHKbqdLvu6Fl30VFr/latn/7yP.vcmVearati7s2', 'teacher', '2024-08-16');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (94, 'Ofelia', 'Dubble', 'odubble2l@goodreads.com', '$2a$04$WGxKgnE9jouON5IRA/aaRemtnp4KzUAyBKxEOTXwFFBOgsmQq/ueS', 'teacher', '2024-03-01');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (95, 'Laraine', 'Bagguley', 'lbagguley2m@oracle.com', '$2a$04$k1.LeqOGHCl2X6qntj925e1X6jSDZWpT5wsoHgmQWd8ibgsga6EzW', 'admin', '2024-12-29');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (96, 'Wendel', 'Lemmen', 'wlemmen2n@usa.gov', '$2a$04$ju9vfa5Bi7sDM.qsKeE28.B8QGMxyADhbozIRo6fKB5rBr4CyDS1m', 'teacher', '2024-03-30');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (97, 'Jenny', 'Enderby', 'jenderby2o@histats.com', '$2a$04$a2AGNYDCPAcbQ08p2M74.OF.SQzMs45/zfIv6urMuQtVrBaU14fTu', 'teacher', '2024-02-24');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (98, 'Ofelia', 'Keemer', 'okeemer2p@reference.com', '$2a$04$rLB9N/qmiIx3Es0zErL3LeUxHaiKdgBfU7AKTOuj2RLTKaeA/WUWi', 'student', '2024-05-13');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (99, 'Delcine', 'Linde', 'dlinde2q@sbwire.com', '$2a$04$auRjWKH/YQWe0sEv0aKKc.TONdw.e3DmSj5kyQzmJSz8XDk0J4aGe', 'admin', '2024-05-12');
insert into users (id, first_name, last_name, email, password_hash, role, created_at) values (100, 'Bernetta', 'Mistry', 'bmistry2r@geocities.com', '$2a$04$hTikGXk1.77F/VZrKi7HC.5LFtd18gO6CC8dj8wVfARe.Gfl5H9ra', 'teacher', '2024-12-06');


insert into courses (id, title, description, teacher_id, price, status, created_at) values (1, 'Windows', 'Explorez les outils et techniques pour analyser des données complexes et en extraire des informations utiles à la prise de décisions.', 87, 92.78, 'draft', '2024-03-08');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (2, 'Windows', 'Protégez vos applications web des attaques courantes comme les injections SQL et les failles XSS avec des pratiques de sécurité éprouvées.', 94, 24.7, 'draft', '2024-09-30');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (3, 'Windows', 'Maîtrisez les bases des réseaux et apprenez à connecter efficacement différents appareils tout en garantissant une sécurité optimale.', 32, 97.37, 'published', '2024-09-02');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (4, 'DevOps', 'Explorez les outils et techniques pour analyser des données complexes et en extraire des informations utiles à la prise de décisions.', 76, 36.49, 'archived', '2024-05-29');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (5, 'Machine Learning', 'Apprenez à combiner le développement et les opérations pour améliorer l''efficacité et la collaboration des équipes de travail.', 87, 13.11, 'archived', '2024-05-05');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (6, 'Réseau', 'créer des applications web et explorer la science des données.', 76, 27.6, 'published', '2024-07-27');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (7, 'Réseau', 'Plongez dans l''intelligence artificielle et découvrez comment enseigner à vos machines à apprendre et à prédire à partir des données.', 87, 87.33, 'draft', '2024-06-30');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (8, 'Sécurité Web', 'Protégez vos applications web des attaques courantes comme les injections SQL et les failles XSS avec des pratiques de sécurité éprouvées.', 91, 95.76, 'archived', '2024-07-16');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (9, 'Data Science', 'Apprenez à créer des applications puissantes et évolutives avec Java. Un langage essentiel pour les développeurs modernes.', 93, 28.77, 'draft', '2024-10-09');
insert into courses (id, title, description, teacher_id, price, status, created_at) values (10, 'Pentesting', 'Apprenez à détecter et exploiter les failles de sécurité dans les systèmes pour renforcer la cybersécurité de vos infrastructures.', 87, 73.21, 'draft', '2024-04-04');


insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (1, 18, 4, '2024-02-13', 85, '2024-10-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (2, 94, 5, '2024-09-21', 71, '2024-11-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (3, 85, 6, '2024-08-23', 52, '2024-02-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (4, 8, 9, '2024-12-01', 33, '2024-09-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (5, 50, 2, '2024-05-11', 60, '2024-09-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (6, 16, 1, '2024-03-16', 96, '2024-06-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (7, 22, 4, '2024-08-02', 47, '2024-09-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (8, 13, 2, '2024-10-07', 1, '2024-10-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (9, 63, 9, '2024-01-07', 60, '2024-01-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (10, 66, 10, '2024-06-04', 88, '2024-12-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (11, 54, 9, '2024-08-19', 51, '2024-05-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (12, 50, 4, '2024-08-13', 36, '2024-08-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (13, 30, 4, '2024-10-01', 58, '2024-12-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (14, 78, 10, '2024-04-10', 3, '2024-06-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (15, 29, 3, '2024-02-10', 95, '2024-05-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (16, 44, 10, '2024-06-01', 44, '2024-05-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (17, 35, 6, '2024-08-01', 62, '2024-11-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (18, 88, 3, '2024-03-30', 17, '2024-08-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (19, 88, 7, '2024-07-19', 37, '2024-04-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (20, 56, 7, '2024-06-11', 55, '2024-09-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (21, 32, 10, '2024-02-28', 77, '2024-08-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (22, 35, 3, '2024-02-07', 57, '2024-12-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (23, 51, 2, '2024-05-01', 40, '2024-11-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (24, 44, 10, '2024-09-09', 49, '2024-03-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (25, 46, 1, '2024-11-13', 95, '2024-09-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (26, 70, 3, '2024-09-21', 75, '2024-02-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (27, 87, 10, '2024-12-16', 63, '2024-10-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (28, 56, 5, '2024-04-13', 77, '2024-11-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (29, 83, 7, '2024-10-21', 76, '2024-03-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (30, 66, 3, '2024-06-29', 8, '2024-10-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (31, 78, 10, '2024-07-11', 45, '2024-05-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (32, 81, 6, '2024-07-22', 2, '2024-04-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (33, 6, 10, '2024-05-24', 45, '2024-02-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (34, 34, 8, '2024-07-01', 36, '2024-09-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (35, 32, 6, '2024-05-21', 11, '2024-09-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (36, 81, 9, '2024-04-23', 37, '2024-03-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (37, 24, 5, '2024-01-15', 7, '2024-08-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (38, 68, 3, '2024-10-12', 18, '2024-07-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (39, 21, 9, '2024-06-01', 41, '2024-09-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (40, 46, 7, '2024-11-30', 17, '2024-06-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (41, 73, 7, '2024-05-10', 88, '2024-03-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (42, 75, 8, '2024-04-23', 74, '2024-08-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (43, 42, 5, '2024-06-21', 3, '2024-04-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (44, 33, 1, '2024-11-28', 100, '2024-06-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (45, 11, 10, '2024-10-21', 9, '2024-10-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (46, 34, 1, '2024-10-20', 40, '2024-12-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (47, 60, 4, '2024-01-11', 22, '2024-04-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (48, 20, 3, '2024-06-15', 37, '2024-01-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (49, 47, 10, '2024-08-13', 71, '2024-06-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (50, 78, 7, '2024-02-16', 58, '2024-06-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (51, 63, 8, '2024-11-25', 20, '2024-09-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (52, 4, 2, '2024-09-21', 35, '2024-03-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (53, 34, 5, '2024-07-10', 41, '2024-01-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (54, 62, 5, '2024-10-15', 28, '2024-12-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (55, 94, 5, '2024-03-06', 29, '2024-07-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (56, 32, 10, '2024-11-16', 14, '2024-07-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (57, 90, 9, '2024-10-09', 40, '2024-05-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (58, 81, 3, '2024-08-07', 85, '2024-03-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (59, 89, 5, '2024-09-05', 42, '2024-08-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (60, 71, 4, '2024-03-23', 41, '2024-02-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (61, 84, 5, '2024-10-03', 72, '2024-07-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (62, 79, 5, '2024-10-31', 9, '2024-06-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (63, 34, 5, '2024-05-03', 51, '2024-06-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (64, 78, 6, '2024-01-14', 68, '2024-05-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (65, 16, 7, '2024-06-22', 28, '2024-02-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (66, 49, 8, '2024-11-15', 9, '2024-02-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (67, 38, 4, '2024-09-04', 75, '2024-05-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (68, 76, 9, '2024-06-04', 95, '2024-12-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (69, 47, 5, '2024-09-22', 31, '2024-09-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (70, 83, 8, '2024-10-10', 32, '2024-05-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (71, 18, 2, '2024-06-07', 33, '2024-09-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (72, 82, 6, '2024-09-20', 3, '2024-01-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (73, 60, 4, '2024-06-05', 5, '2024-10-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (74, 70, 5, '2024-01-08', 5, '2024-07-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (75, 90, 6, '2024-04-20', 15, '2024-10-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (76, 42, 7, '2024-07-13', 29, '2024-01-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (77, 37, 4, '2024-12-18', 74, '2024-06-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (78, 50, 2, '2024-03-08', 55, '2024-08-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (79, 31, 1, '2024-07-21', 76, '2024-10-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (80, 87, 3, '2024-09-10', 72, '2024-08-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (81, 82, 9, '2024-11-04', 62, '2024-08-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (82, 93, 7, '2024-04-30', 75, '2024-12-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (83, 19, 5, '2024-03-30', 71, '2024-08-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (84, 2, 7, '2024-12-24', 67, '2024-01-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (85, 28, 1, '2024-01-15', 55, '2024-01-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (86, 87, 10, '2024-11-15', 17, '2024-08-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (87, 76, 8, '2024-08-01', 91, '2024-06-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (88, 28, 9, '2024-11-15', 65, '2024-02-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (89, 13, 6, '2024-08-16', 57, '2024-09-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (90, 73, 9, '2024-01-02', 46, '2024-03-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (91, 78, 6, '2024-05-10', 94, '2024-11-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (92, 89, 7, '2024-02-08', 26, '2024-02-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (93, 53, 1, '2024-07-17', 85, '2024-08-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (94, 9, 5, '2024-05-05', 29, '2024-05-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (95, 17, 1, '2024-12-08', 29, '2024-07-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (96, 45, 6, '2024-12-26', 36, '2024-09-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (97, 3, 3, '2024-01-04', 36, '2024-05-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (98, 16, 6, '2024-01-26', 76, '2024-10-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (99, 61, 3, '2024-12-12', 44, '2024-08-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (100, 43, 10, '2024-08-13', 53, '2024-10-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (101, 98, 9, '2024-10-23', 8, '2024-10-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (102, 34, 4, '2024-04-12', 73, '2024-09-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (103, 48, 10, '2024-11-14', 90, '2024-04-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (104, 32, 9, '2024-09-01', 91, '2024-09-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (105, 68, 3, '2024-04-22', 59, '2024-10-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (106, 26, 9, '2024-06-30', 0, '2024-07-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (107, 33, 7, '2024-05-16', 64, '2024-11-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (108, 84, 3, '2024-02-02', 50, '2024-01-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (109, 25, 2, '2024-09-25', 76, '2024-05-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (110, 98, 4, '2024-07-17', 53, '2024-03-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (111, 78, 1, '2024-08-09', 42, '2024-04-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (112, 72, 9, '2024-10-23', 4, '2024-02-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (113, 34, 7, '2024-12-14', 74, '2024-12-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (114, 87, 6, '2024-04-30', 2, '2024-07-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (115, 75, 7, '2024-01-14', 89, '2024-07-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (116, 49, 9, '2024-04-29', 36, '2024-02-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (117, 80, 1, '2024-06-18', 66, '2024-11-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (118, 5, 8, '2024-05-08', 97, '2024-02-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (119, 34, 3, '2024-09-29', 59, '2024-09-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (120, 85, 3, '2024-10-08', 37, '2024-01-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (121, 28, 2, '2024-09-08', 66, '2024-07-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (122, 19, 3, '2024-10-20', 30, '2024-12-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (123, 89, 6, '2024-01-12', 79, '2024-12-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (124, 65, 5, '2024-11-14', 67, '2024-10-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (125, 5, 9, '2024-09-18', 60, '2024-01-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (126, 9, 5, '2024-12-08', 9, '2024-02-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (127, 36, 4, '2024-08-31', 48, '2024-01-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (128, 86, 5, '2024-08-13', 62, '2024-02-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (129, 75, 1, '2024-08-09', 27, '2024-04-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (130, 42, 9, '2024-12-25', 10, '2024-08-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (131, 26, 1, '2024-01-23', 24, '2024-11-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (132, 22, 5, '2024-06-19', 34, '2024-10-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (133, 75, 2, '2024-03-19', 40, '2024-05-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (134, 80, 4, '2024-07-20', 28, '2024-12-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (135, 64, 10, '2024-08-21', 56, '2024-07-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (136, 77, 9, '2024-07-06', 52, '2024-07-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (137, 35, 10, '2024-08-18', 58, '2024-07-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (138, 20, 4, '2024-04-06', 19, '2024-06-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (139, 4, 2, '2024-04-29', 95, '2024-08-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (140, 3, 3, '2024-09-18', 19, '2024-03-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (141, 42, 7, '2024-01-17', 33, '2024-09-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (142, 96, 8, '2024-08-06', 86, '2024-06-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (143, 7, 1, '2024-07-16', 35, '2024-12-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (144, 92, 4, '2024-10-31', 78, '2024-09-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (145, 100, 3, '2024-08-21', 96, '2024-10-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (146, 15, 1, '2024-01-28', 19, '2024-04-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (147, 62, 9, '2024-10-13', 21, '2024-09-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (148, 7, 1, '2024-12-14', 26, '2024-03-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (149, 45, 1, '2024-04-02', 83, '2024-05-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (150, 80, 8, '2024-07-03', 27, '2024-01-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (151, 70, 2, '2024-02-20', 35, '2024-10-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (152, 99, 3, '2024-02-19', 78, '2024-12-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (153, 47, 8, '2024-05-05', 21, '2024-06-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (154, 63, 8, '2024-10-23', 70, '2024-02-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (155, 68, 2, '2024-02-04', 78, '2024-05-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (156, 60, 7, '2024-09-18', 38, '2024-02-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (157, 41, 9, '2024-10-10', 89, '2024-09-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (158, 70, 8, '2024-03-09', 10, '2024-04-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (159, 58, 8, '2024-02-01', 17, '2024-11-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (160, 55, 10, '2024-04-07', 5, '2024-03-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (161, 71, 9, '2024-12-22', 55, '2024-01-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (162, 92, 2, '2024-07-25', 70, '2024-05-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (163, 5, 5, '2024-05-18', 59, '2024-09-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (164, 51, 7, '2024-11-07', 5, '2024-10-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (165, 63, 1, '2024-02-06', 4, '2024-05-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (166, 8, 3, '2024-04-20', 15, '2024-04-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (167, 83, 7, '2024-09-20', 18, '2024-12-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (168, 91, 8, '2024-04-08', 96, '2024-12-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (169, 38, 2, '2024-08-21', 33, '2024-03-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (170, 63, 5, '2024-09-13', 3, '2024-08-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (171, 92, 10, '2024-05-15', 57, '2024-07-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (172, 89, 8, '2024-10-21', 74, '2024-09-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (173, 83, 8, '2024-08-22', 88, '2024-06-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (174, 80, 10, '2024-10-09', 74, '2024-02-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (175, 56, 6, '2024-10-29', 5, '2024-01-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (176, 72, 10, '2024-05-19', 93, '2024-04-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (177, 88, 10, '2024-09-06', 8, '2024-01-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (178, 28, 9, '2024-01-30', 58, '2024-01-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (179, 6, 9, '2024-03-26', 22, '2024-04-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (180, 75, 8, '2024-10-22', 72, '2024-07-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (181, 72, 6, '2024-09-22', 40, '2024-01-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (182, 24, 1, '2024-01-28', 17, '2024-06-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (183, 6, 3, '2024-02-05', 79, '2024-06-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (184, 77, 4, '2024-01-03', 68, '2024-09-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (185, 11, 5, '2024-12-26', 32, '2024-10-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (186, 8, 3, '2024-07-02', 0, '2024-01-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (187, 61, 7, '2024-07-06', 71, '2024-09-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (188, 12, 10, '2024-08-06', 96, '2024-04-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (189, 26, 6, '2024-09-06', 33, '2024-07-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (190, 91, 4, '2024-08-25', 23, '2024-04-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (191, 4, 3, '2024-12-04', 16, '2024-04-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (192, 21, 3, '2024-05-02', 55, '2024-06-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (193, 23, 2, '2024-01-13', 99, '2024-11-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (194, 11, 4, '2024-12-21', 55, '2024-06-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (195, 63, 6, '2024-01-20', 22, '2024-10-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (196, 52, 1, '2024-02-29', 23, '2024-06-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (197, 41, 2, '2024-11-20', 26, '2024-06-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (198, 92, 6, '2024-01-02', 12, '2024-07-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (199, 20, 9, '2024-01-23', 5, '2024-07-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (200, 2, 1, '2024-04-05', 69, '2024-12-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (201, 51, 7, '2024-06-15', 34, '2024-06-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (202, 15, 8, '2024-09-15', 40, '2024-01-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (203, 70, 10, '2024-11-06', 56, '2024-02-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (204, 64, 1, '2024-07-01', 19, '2024-08-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (205, 38, 8, '2024-01-18', 83, '2024-05-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (206, 7, 2, '2024-04-05', 69, '2024-03-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (207, 21, 9, '2024-01-15', 47, '2024-02-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (208, 13, 6, '2024-03-29', 27, '2024-09-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (209, 79, 5, '2024-04-01', 75, '2024-05-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (210, 92, 1, '2024-03-06', 35, '2024-07-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (211, 22, 6, '2024-01-01', 35, '2024-02-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (212, 4, 9, '2024-06-25', 10, '2024-06-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (213, 15, 9, '2024-03-01', 46, '2024-08-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (214, 85, 9, '2024-09-09', 40, '2024-07-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (215, 37, 3, '2024-07-14', 47, '2024-02-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (216, 78, 3, '2024-01-30', 77, '2024-12-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (217, 27, 8, '2024-11-23', 47, '2024-01-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (218, 19, 7, '2024-10-11', 59, '2024-01-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (219, 14, 1, '2024-08-11', 80, '2024-04-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (220, 31, 9, '2024-02-03', 92, '2024-05-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (221, 25, 2, '2024-07-16', 46, '2024-08-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (222, 47, 3, '2024-09-17', 51, '2024-06-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (223, 48, 7, '2024-10-24', 16, '2024-06-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (224, 77, 8, '2024-09-01', 29, '2024-01-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (225, 20, 4, '2024-05-20', 80, '2024-10-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (226, 78, 2, '2024-09-26', 100, '2024-07-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (227, 84, 7, '2024-03-29', 95, '2024-06-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (228, 70, 5, '2024-07-15', 90, '2024-01-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (229, 36, 10, '2024-03-08', 29, '2024-05-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (230, 13, 7, '2024-01-05', 14, '2024-02-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (231, 76, 2, '2024-02-05', 1, '2024-07-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (232, 82, 8, '2024-09-30', 54, '2024-02-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (233, 18, 5, '2024-09-27', 37, '2024-01-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (234, 64, 1, '2024-08-12', 21, '2024-03-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (235, 44, 2, '2024-04-26', 93, '2024-10-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (236, 34, 9, '2024-05-12', 86, '2024-12-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (237, 53, 9, '2024-12-07', 14, '2024-08-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (238, 22, 6, '2024-12-03', 88, '2024-11-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (239, 89, 3, '2024-12-15', 14, '2024-06-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (240, 86, 1, '2024-12-19', 18, '2024-06-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (241, 50, 3, '2024-06-20', 59, '2024-01-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (242, 24, 8, '2024-10-10', 71, '2024-08-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (243, 94, 6, '2024-08-01', 59, '2024-04-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (244, 70, 8, '2024-12-08', 71, '2024-07-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (245, 8, 4, '2024-07-16', 79, '2024-04-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (246, 94, 5, '2024-09-12', 12, '2024-10-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (247, 55, 10, '2024-07-02', 41, '2024-09-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (248, 90, 10, '2024-11-19', 83, '2024-04-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (249, 79, 1, '2024-11-22', 30, '2024-03-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (250, 39, 2, '2024-02-19', 46, '2024-01-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (251, 100, 4, '2024-07-27', 15, '2024-06-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (252, 62, 2, '2024-11-08', 24, '2024-07-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (253, 77, 10, '2024-10-05', 11, '2024-11-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (254, 56, 7, '2024-10-20', 24, '2024-08-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (255, 53, 3, '2024-07-04', 80, '2024-10-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (256, 49, 5, '2024-12-14', 69, '2024-09-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (257, 89, 1, '2024-07-30', 56, '2024-09-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (258, 59, 1, '2024-12-17', 7, '2024-11-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (259, 85, 1, '2024-06-09', 56, '2024-08-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (260, 39, 7, '2024-09-14', 22, '2024-04-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (261, 51, 5, '2024-10-26', 56, '2024-09-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (262, 6, 1, '2024-01-11', 97, '2024-04-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (263, 66, 5, '2024-10-19', 99, '2024-01-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (264, 70, 8, '2024-05-19', 26, '2024-12-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (265, 75, 1, '2024-10-09', 78, '2024-08-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (266, 67, 3, '2024-10-29', 12, '2024-03-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (267, 92, 5, '2024-05-06', 78, '2024-03-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (268, 35, 9, '2024-11-25', 59, '2024-06-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (269, 24, 8, '2024-01-14', 94, '2024-07-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (270, 58, 7, '2024-06-06', 27, '2024-08-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (271, 81, 10, '2024-09-24', 40, '2024-03-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (272, 32, 1, '2024-04-14', 10, '2024-08-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (273, 70, 6, '2024-08-15', 26, '2024-10-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (274, 29, 9, '2024-01-18', 64, '2024-12-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (275, 71, 8, '2024-12-14', 85, '2024-02-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (276, 56, 10, '2024-10-12', 100, '2024-12-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (277, 7, 9, '2024-08-01', 30, '2024-10-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (278, 17, 3, '2024-02-03', 61, '2024-08-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (279, 52, 2, '2024-04-30', 93, '2024-10-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (280, 82, 10, '2024-06-08', 80, '2024-06-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (281, 75, 9, '2024-03-09', 69, '2024-11-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (282, 99, 2, '2024-04-21', 38, '2024-09-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (283, 93, 2, '2024-06-25', 36, '2024-01-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (284, 90, 10, '2024-10-10', 47, '2024-08-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (285, 4, 1, '2024-06-04', 24, '2024-01-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (286, 36, 10, '2024-09-12', 16, '2024-01-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (287, 62, 9, '2024-07-29', 87, '2024-10-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (288, 97, 10, '2024-10-03', 24, '2024-07-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (289, 1, 7, '2024-08-21', 80, '2024-09-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (290, 35, 9, '2024-01-07', 95, '2024-08-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (291, 57, 9, '2024-01-25', 60, '2024-04-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (292, 61, 8, '2024-06-10', 97, '2024-02-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (293, 25, 10, '2024-02-09', 58, '2024-06-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (294, 32, 2, '2024-10-25', 6, '2024-09-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (295, 77, 4, '2024-12-27', 71, '2024-01-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (296, 50, 8, '2024-12-07', 53, '2024-04-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (297, 32, 9, '2024-04-11', 14, '2024-06-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (298, 88, 10, '2024-01-24', 50, '2024-03-28');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (299, 60, 6, '2024-07-24', 91, '2024-10-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (300, 13, 2, '2024-11-05', 75, '2024-08-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (301, 100, 2, '2024-08-23', 82, '2024-05-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (302, 31, 6, '2024-11-07', 3, '2024-11-02');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (303, 42, 2, '2024-11-24', 63, '2024-09-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (304, 96, 4, '2024-11-12', 5, '2024-04-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (305, 78, 7, '2024-09-26', 53, '2024-05-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (306, 65, 5, '2024-07-14', 85, '2024-07-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (307, 8, 3, '2024-10-24', 8, '2024-10-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (308, 93, 10, '2024-05-03', 55, '2024-05-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (309, 23, 4, '2024-12-17', 70, '2024-07-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (310, 45, 5, '2024-01-03', 17, '2024-09-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (311, 27, 2, '2024-08-06', 57, '2024-02-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (312, 10, 10, '2024-05-07', 46, '2024-08-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (313, 89, 1, '2024-06-16', 72, '2024-06-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (314, 19, 3, '2024-12-11', 50, '2024-01-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (315, 71, 1, '2024-01-10', 35, '2024-04-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (316, 44, 2, '2024-10-09', 66, '2024-10-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (317, 95, 9, '2024-10-28', 42, '2024-09-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (318, 8, 7, '2024-06-08', 62, '2024-08-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (319, 83, 9, '2024-10-27', 44, '2024-10-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (320, 24, 4, '2024-08-08', 14, '2024-07-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (321, 34, 7, '2024-12-24', 59, '2024-05-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (322, 31, 6, '2024-05-12', 8, '2024-07-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (323, 18, 3, '2024-01-14', 33, '2024-07-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (324, 32, 9, '2024-06-28', 44, '2024-12-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (325, 8, 3, '2024-11-02', 45, '2024-05-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (326, 93, 4, '2024-02-20', 56, '2024-12-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (327, 43, 8, '2024-09-11', 83, '2024-12-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (328, 54, 1, '2024-05-20', 90, '2024-10-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (329, 52, 3, '2024-11-13', 86, '2024-06-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (330, 35, 9, '2024-04-22', 36, '2024-08-07');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (331, 57, 4, '2024-12-28', 1, '2024-08-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (332, 44, 4, '2024-06-15', 14, '2024-11-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (333, 98, 5, '2024-10-03', 24, '2024-05-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (334, 83, 3, '2024-02-24', 83, '2024-06-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (335, 15, 10, '2024-10-31', 14, '2024-09-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (336, 36, 4, '2024-02-05', 77, '2024-05-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (337, 32, 7, '2024-03-04', 97, '2024-08-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (338, 81, 5, '2024-06-26', 81, '2024-03-03');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (339, 44, 9, '2024-05-08', 13, '2024-02-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (340, 59, 5, '2024-11-10', 48, '2024-05-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (341, 88, 6, '2024-08-04', 67, '2024-08-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (342, 53, 9, '2024-01-23', 97, '2024-06-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (343, 32, 8, '2024-07-27', 41, '2024-02-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (344, 63, 8, '2024-04-28', 82, '2024-01-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (345, 98, 9, '2024-11-23', 27, '2024-07-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (346, 55, 4, '2024-09-14', 6, '2024-12-25');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (347, 25, 2, '2024-01-27', 28, '2024-11-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (348, 100, 8, '2024-05-16', 49, '2024-12-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (349, 61, 6, '2024-03-15', 69, '2024-09-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (350, 9, 6, '2024-07-08', 81, '2024-07-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (351, 57, 3, '2024-01-01', 82, '2024-01-04');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (352, 66, 5, '2024-10-03', 22, '2024-05-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (353, 71, 6, '2024-08-06', 39, '2024-05-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (354, 66, 9, '2024-07-30', 7, '2024-12-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (355, 3, 10, '2024-04-02', 76, '2024-09-20');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (356, 77, 3, '2024-07-25', 55, '2024-12-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (357, 64, 10, '2024-01-06', 97, '2024-03-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (358, 100, 8, '2024-05-10', 97, '2024-12-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (359, 8, 1, '2024-08-22', 47, '2024-03-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (360, 82, 5, '2024-01-14', 76, '2024-01-24');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (361, 30, 9, '2024-03-11', 20, '2024-07-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (362, 45, 7, '2024-11-17', 99, '2024-06-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (363, 47, 10, '2024-06-25', 82, '2024-08-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (364, 44, 2, '2024-08-27', 33, '2024-04-11');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (365, 75, 1, '2024-02-03', 60, '2024-12-18');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (366, 40, 4, '2024-08-19', 34, '2024-01-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (367, 8, 8, '2024-07-28', 82, '2024-01-13');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (368, 17, 4, '2024-10-16', 8, '2024-09-15');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (369, 5, 9, '2024-11-27', 66, '2024-05-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (370, 21, 8, '2024-01-28', 37, '2024-03-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (371, 4, 6, '2024-08-29', 70, '2024-02-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (372, 88, 9, '2024-04-14', 30, '2024-03-31');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (373, 35, 9, '2024-07-17', 47, '2024-04-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (374, 91, 4, '2024-11-01', 86, '2024-05-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (375, 42, 10, '2024-11-23', 98, '2024-10-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (376, 74, 6, '2024-08-23', 5, '2024-06-23');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (377, 95, 7, '2024-12-12', 64, '2024-03-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (378, 6, 9, '2024-06-05', 23, '2024-05-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (379, 34, 8, '2024-11-11', 34, '2024-03-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (380, 72, 6, '2024-06-17', 82, '2024-06-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (381, 63, 3, '2024-11-02', 61, '2024-09-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (382, 17, 5, '2024-12-29', 40, '2024-12-01');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (383, 79, 6, '2024-08-11', 22, '2024-08-17');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (384, 8, 10, '2024-08-13', 50, '2024-01-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (385, 39, 1, '2024-10-03', 75, '2024-05-08');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (386, 69, 1, '2024-08-22', 76, '2024-12-05');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (387, 39, 10, '2024-03-25', 28, '2024-05-09');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (388, 58, 10, '2024-03-26', 61, '2024-03-06');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (389, 63, 7, '2024-05-16', 50, '2024-11-22');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (390, 26, 7, '2024-09-05', 33, '2024-04-12');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (391, 84, 2, '2024-12-11', 7, '2024-10-10');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (392, 43, 10, '2024-11-03', 33, '2024-01-14');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (393, 37, 3, '2024-09-01', 55, '2024-02-26');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (394, 84, 5, '2024-04-17', 15, '2024-06-16');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (395, 44, 4, '2024-05-05', 67, '2024-10-19');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (396, 99, 1, '2024-03-20', 50, '2024-02-29');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (397, 27, 1, '2024-04-23', 19, '2024-10-30');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (398, 18, 2, '2024-04-11', 5, '2024-04-21');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (399, 7, 9, '2024-11-02', 5, '2024-03-27');
insert into  enrollments (id, student_id, course_id, enrollment_date, progress, last_accessed) values (400, 8, 9, '2024-09-09', 26, '2024-07-30');


insert into  lessons (course_id, title, content, duration, order_num) values (3, 'Rev', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 55, 2);
insert into  lessons (course_id, title, content, duration, order_num) values (8, 'Honorable', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 159, 3);
insert into  lessons (course_id, title, content, duration, order_num) values (1, 'Mr', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 87, 2);
insert into  lessons (course_id, title, content, duration, order_num) values (1, 'Ms', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 115, 5);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Honorable', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 71, 4);
insert into  lessons (course_id, title, content, duration, order_num) values (7, 'Mr', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 79, 5);
insert into  lessons (course_id, title, content, duration, order_num) values (3, 'Mr', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 59, 5);
insert into  lessons (course_id, title, content, duration, order_num) values (1, 'Mr', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 137, 1);
insert into  lessons (course_id, title, content, duration, order_num) values (2, 'Ms', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 171, 3);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Dr', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 40, 2);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Dr', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 75, 3);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Ms', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 141, 3);
insert into  lessons (course_id, title, content, duration, order_num) values (6, 'Mr', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 60, 1);
insert into  lessons (course_id, title, content, duration, order_num) values (1, 'Ms', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 72, 8);
insert into  lessons (course_id, title, content, duration, order_num) values (4, 'Mrs', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 135, 9);
insert into  lessons (course_id, title, content, duration, order_num) values (1, 'Mr', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 44, 2);
insert into  lessons (course_id, title, content, duration, order_num) values (10, 'Rev', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 60, 6);
insert into  lessons (course_id, title, content, duration, order_num) values (2, 'Rev', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 96, 8);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Dr', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 91, 9);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Mrs', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 129, 7);
insert into  lessons (course_id, title, content, duration, order_num) values (4, 'Honorable', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 59, 9);
insert into  lessons (course_id, title, content, duration, order_num) values (4, 'Rev', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 174, 1);
insert into  lessons (course_id, title, content, duration, order_num) values (3, 'Ms', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 60, 7);
insert into  lessons (course_id, title, content, duration, order_num) values (1, 'Rev', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 45, 7);
insert into  lessons (course_id, title, content, duration, order_num) values (7, 'Mr', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 139, 10);
insert into  lessons (course_id, title, content, duration, order_num) values (7, 'Mr', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 46, 8);
insert into  lessons (course_id, title, content, duration, order_num) values (7, 'Mr', 'In congue. Etiam justo. Etiam pretium iaculis justo.', 63, 7);
insert into  lessons (course_id, title, content, duration, order_num) values (10, 'Dr', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 116, 8);
insert into  lessons (course_id, title, content, duration, order_num) values (4, 'Dr', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 30, 7);
insert into  lessons (course_id, title, content, duration, order_num) values (7, 'Rev', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 108, 2);
insert into  lessons (course_id, title, content, duration, order_num) values (3, 'Ms', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 47, 7);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Dr', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 127, 9);
insert into  lessons (course_id, title, content, duration, order_num) values (6, 'Honorable', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 145, 8);
insert into  lessons (course_id, title, content, duration, order_num) values (10, 'Mr', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 118, 2);
insert into  lessons (course_id, title, content, duration, order_num) values (4, 'Ms', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 121, 1);
insert into  lessons (course_id, title, content, duration, order_num) values (1, 'Mrs', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 37, 7);
insert into  lessons (course_id, title, content, duration, order_num) values (9, 'Rev', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 44, 3);
insert into  lessons (course_id, title, content, duration, order_num) values (7, 'Rev', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 75, 9);
insert into  lessons (course_id, title, content, duration, order_num) values (6, 'Mrs', 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 52, 5);
insert into  lessons (course_id, title, content, duration, order_num) values (2, 'Dr', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 116, 10);


insert into progress_tracking (student_id, lesson_id, status, completion_date) values (39, 42, 'completed', '2024-03-11');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (63, 29, 'completed', '2024-11-06');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (36, 36, 'not_started', '2024-06-11');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (83, 44, 'completed', '2024-01-12');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (7, 19, 'in_progress', '2024-05-25');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (32, 14, 'in_progress', '2024-07-21');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (78, 25, 'completed', '2024-06-14');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (87, 16, 'completed', '2024-10-22');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (37, 29, 'completed', '2024-10-18');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (13, 42, 'not_started', '2024-04-10');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (93, 12, 'not_started', '2024-11-14');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (26, 29, 'not_started', '2024-11-11');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (60, 9, 'completed', '2024-10-28');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (22, 28, 'in_progress', '2024-05-22');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (65, 40, 'completed', '2024-09-11');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (30, 40, 'not_started', '2024-07-13');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (12, 16, 'completed', '2024-01-01');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (3, 20, 'in_progress', '2024-09-14');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (88, 39, 'not_started', '2024-04-21');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (60, 34, 'not_started', '2024-11-21');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (95, 8, 'completed', '2024-07-18');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (86, 42, 'in_progress', '2024-07-06');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (62, 30, 'completed', '2024-07-06');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (38, 12, 'completed', '2024-10-14');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (50, 33, 'not_started', '2024-03-12');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (68, 21, 'completed', '2024-06-15');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (43, 41, 'not_started', '2024-06-09');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (70, 39, 'not_started', '2024-12-24');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (4, 39, 'completed', '2024-08-06');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (44, 38, 'not_started', '2024-03-04');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (80, 32, 'completed', '2024-10-18');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (100, 34, 'in_progress', '2024-06-05');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (67, 9, 'not_started', '2024-11-12');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (33, 17, 'in_progress', '2024-03-04');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (17, 34, 'in_progress', '2024-08-05');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (65, 22, 'in_progress', '2024-02-01');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (43, 16, 'not_started', '2024-08-06');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (53, 16, 'not_started', '2024-12-15');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (62, 7, 'not_started', '2024-07-31');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (48, 25, 'in_progress', '2024-01-14');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (58, 22, 'in_progress', '2024-11-19');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (64, 30, 'completed', '2024-03-13');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (60, 31, 'not_started', '2024-04-20');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (35, 20, 'completed', '2024-10-11');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (48, 43, 'completed', '2024-02-15');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (20, 21, 'completed', '2024-09-01');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (34, 44, 'completed', '2024-08-01');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (71, 16, 'in_progress', '2024-11-21');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (41, 23, 'completed', '2024-10-24');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (77, 25, 'not_started', '2024-06-07');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (30, 18, 'in_progress', '2024-12-30');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (29, 37, 'not_started', '2024-03-01');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (73, 7, 'not_started', '2024-03-04');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (5, 25, 'completed', '2024-01-01');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (37, 19, 'not_started', '2024-11-09');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (14, 13, 'not_started', '2024-10-25');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (40, 9, 'in_progress', '2024-05-10');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (40, 28, 'not_started', '2024-05-12');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (6, 22, 'not_started', '2024-09-29');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (92, 34, 'in_progress', '2024-05-05');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (79, 13, 'not_started', '2024-03-21');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (58, 8, 'not_started', '2024-07-30');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (67, 13, 'not_started', '2024-04-09');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (99, 43, 'in_progress', '2024-06-18');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (44, 12, 'not_started', '2024-01-27');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (67, 14, 'in_progress', '2024-06-20');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (72, 20, 'in_progress', '2024-04-11');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (7, 13, 'in_progress', '2024-05-27');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (89, 21, 'not_started', '2024-08-16');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (85, 38, 'not_started', '2024-12-25');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (61, 5, 'in_progress', '2024-07-23');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (95, 22, 'in_progress', '2024-03-21');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (99, 23, 'not_started', '2024-05-05');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (89, 39, 'completed', '2024-03-27');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (20, 33, 'not_started', '2024-07-22');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (89, 33, 'in_progress', '2024-07-27');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (20, 20, 'in_progress', '2024-07-15');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (42, 6, 'in_progress', '2024-02-04');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (17, 25, 'completed', '2024-09-09');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (22, 13, 'not_started', '2024-11-12');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (67, 18, 'completed', '2024-07-19');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (55, 30, 'not_started', '2024-10-27');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (15, 27, 'not_started', '2024-07-07');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (46, 25, 'not_started', '2024-11-01');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (27, 6, 'completed', '2024-10-17');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (50, 8, 'not_started', '2024-11-09');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (18, 34, 'not_started', '2024-04-09');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (17, 19, 'completed', '2024-09-30');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (92, 21, 'not_started', '2024-09-14');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (20, 11, 'completed', '2024-08-04');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (61, 27, 'not_started', '2024-10-02');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (72, 17, 'not_started', '2024-08-31');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (52, 16, 'completed', '2024-11-20');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (48, 29, 'completed', '2024-08-04');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (34, 5, 'completed', '2024-07-09');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (81, 41, 'completed', '2024-05-31');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (82, 38, 'in_progress', '2024-06-15');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (74, 13, 'completed', '2024-01-14');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (35, 42, 'not_started', '2024-06-18');
insert into progress_tracking (student_id, lesson_id, status, completion_date) values (93, 28, 'not_started', '2024-11-24');


insert into price_history (course_id, old_price, new_price, changed_at) values (3, 29.75, 52.67, '2025-05-08');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 0.01, 54.23, '2024-06-26');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 49.82, 88.85, '2025-03-21');
insert into price_history (course_id, old_price, new_price, changed_at) values (1, 78.67, 73.52, '2024-11-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 61.32, 54.01, '2024-10-01');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 92.41, 26.77, '2024-06-11');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 29.64, 81.89, '2024-03-23');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 93.37, 52.18, '2024-01-09');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 40.48, 52.86, '2025-07-10');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 76.39, 40.87, '2025-07-21');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 45.39, 12.99, '2025-04-10');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 59.25, 43.79, '2024-04-12');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 49.05, 84.24, '2024-10-05');
insert into price_history (course_id, old_price, new_price, changed_at) values (10, 39.04, 80.91, '2025-01-27');
insert into price_history (course_id, old_price, new_price, changed_at) values (4, 88.21, 54.94, '2024-03-05');
insert into price_history (course_id, old_price, new_price, changed_at) values (1, 76.17, 94.82, '2024-01-23');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 61.19, 65.28, '2024-09-11');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 90.77, 15.32, '2024-05-27');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 94.23, 52.9, '2025-04-27');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 90.34, 46.71, '2024-05-16');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 52.27, 83.21, '2025-06-22');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 63.81, 35.22, '2025-12-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 70.38, 15.15, '2024-08-12');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 38.36, 63.05, '2024-06-18');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 91.71, 44.99, '2024-02-22');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 25.47, 32.81, '2024-08-29');
insert into price_history (course_id, old_price, new_price, changed_at) values (10, 3.03, 91.9, '2025-07-15');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 43.02, 17.32, '2025-07-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (10, 69.34, 67.31, '2024-04-23');
insert into price_history (course_id, old_price, new_price, changed_at) values (10, 65.28, 13.42, '2025-02-12');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 97.24, 85.15, '2024-08-06');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 29.13, 96.32, '2024-03-04');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 55.11, 40.43, '2024-02-21');
insert into price_history (course_id, old_price, new_price, changed_at) values (4, 43.72, 61.98, '2024-08-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (4, 99.77, 27.94, '2024-12-13');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 99.1, 73.55, '2025-04-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 81.57, 71.25, '2024-07-20');
insert into price_history (course_id, old_price, new_price, changed_at) values (10, 79.62, 85.66, '2024-06-17');
insert into price_history (course_id, old_price, new_price, changed_at) values (4, 89.58, 85.76, '2025-02-20');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 16.35, 66.17, '2024-08-19');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 15.31, 84.58, '2025-07-15');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 61.29, 85.07, '2025-08-04');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 84.79, 39.48, '2025-07-16');
insert into price_history (course_id, old_price, new_price, changed_at) values (1, 42.9, 27.44, '2025-05-08');
insert into price_history (course_id, old_price, new_price, changed_at) values (1, 35.4, 5.96, '2024-02-23');
insert into price_history (course_id, old_price, new_price, changed_at) values (4, 51.08, 71.74, '2024-11-09');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 45.04, 95.88, '2024-04-10');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 46.24, 83.57, '2024-09-13');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 90.38, 63.48, '2024-09-04');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 65.3, 21.42, '2024-03-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 74.21, 99.17, '2025-05-10');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 96.4, 40.31, '2025-05-21');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 41.3, 56.82, '2025-04-26');
insert into price_history (course_id, old_price, new_price, changed_at) values (10, 6.08, 75.67, '2025-11-12');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 67.87, 16.49, '2025-04-30');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 15.62, 94.53, '2024-05-06');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 99.56, 34.45, '2025-12-11');
insert into price_history (course_id, old_price, new_price, changed_at) values (4, 75.81, 38.87, '2024-11-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 96.41, 73.1, '2024-11-02');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 70.19, 84.84, '2025-10-13');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 2.67, 89.46, '2024-04-18');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 39.22, 3.98, '2024-11-03');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 92.03, 48.87, '2025-04-09');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 92.87, 16.63, '2025-03-16');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 2.92, 79.29, '2025-12-27');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 12.03, 61.73, '2025-03-11');
insert into price_history (course_id, old_price, new_price, changed_at) values (1, 22.37, 20.03, '2025-06-20');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 60.1, 7.88, '2025-02-05');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 37.92, 59.47, '2025-08-26');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 43.27, 56.9, '2024-12-08');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 15.7, 45.95, '2025-12-07');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 26.8, 45.8, '2024-07-13');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 66.41, 85.62, '2024-10-24');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 54.48, 36.64, '2024-03-26');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 48.48, 12.45, '2025-01-17');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 43.03, 60.38, '2024-07-28');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 69.21, 27.98, '2025-06-10');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 82.41, 6.18, '2024-01-07');
insert into price_history (course_id, old_price, new_price, changed_at) values (1, 93.73, 80.92, '2025-08-27');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 41.98, 78.16, '2024-03-05');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 96.64, 97.95, '2024-06-20');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 82.21, 75.24, '2024-03-26');
insert into price_history (course_id, old_price, new_price, changed_at) values (1, 62.77, 87.65, '2025-03-18');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 87.75, 30.28, '2024-05-29');
insert into price_history (course_id, old_price, new_price, changed_at) values (10, 85.87, 88.79, '2024-04-28');
insert into price_history (course_id, old_price, new_price, changed_at) values (4, 77.68, 23.17, '2025-08-21');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 36.08, 16.89, '2025-03-19');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 73.74, 25.24, '2024-01-08');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 24.74, 14.31, '2024-03-10');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 82.88, 25.59, '2025-07-27');
insert into price_history (course_id, old_price, new_price, changed_at) values (2, 75.55, 1.44, '2025-05-21');
insert into price_history (course_id, old_price, new_price, changed_at) values (3, 10.24, 26.99, '2024-09-19');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 27.39, 22.59, '2025-08-01');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 64.68, 87.02, '2025-08-30');
insert into price_history (course_id, old_price, new_price, changed_at) values (6, 86.94, 97.56, '2024-07-02');
insert into price_history (course_id, old_price, new_price, changed_at) values (8, 9.02, 12.0, '2025-05-12');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 63.25, 37.88, '2025-06-06');
insert into price_history (course_id, old_price, new_price, changed_at) values (9, 56.67, 7.6, '2024-02-04');
insert into price_history (course_id, old_price, new_price, changed_at) values (5, 28.91, 82.55, '2025-12-13');
insert into price_history (course_id, old_price, new_price, changed_at) values (7, 88.92, 54.84, '2024-05-01');

CREATE INDEX idx_courses_title_status ON courses (title, status);
SHOW INDEX FROM courses;

CREATE INDEX idx_progress_tracking_student_status ON progress_tracking (student_id, status);
SHOW INDEX FROM progress_tracking;

CREATE INDEX idx_enrollments_student_course_date ON enrollments (student_id, course_id, enrollment_date);
SHOW INDEX FROM enrollments;
SHOW INDEXES FROM enrollments;

CREATE INDEX index_users_email_role ON users (email, role);
SHOW INDEX FROM users;

DELIMITER //
CREATE TRIGGER trigger_progress_update
AFTER UPDATE ON progress_tracking
FOR EACH ROW
BEGIN
    IF NEW.status = 'not_started' AND OLD.status != 'not_started' THEN
        UPDATE progress_tracking
        SET completion_date = NULL
        WHERE id = NEW.id;
    
    ELSEIF NEW.status = 'in_progress' AND OLD.status != 'in_progress' THEN
        UPDATE progress_tracking
        SET completion_date = NULL
        WHERE id = NEW.id;

    ELSEIF NEW.status = 'completed' AND OLD.status != 'completed' THEN
        UPDATE progress_tracking
        SET completion_date = NOW()
        WHERE id = NEW.id;
    END IF;
END //
DELIMITER ;

SHOW TRIGGERS;

DELIMITER //

CREATE TRIGGER trigger_price_history
AFTER UPDATE ON courses
FOR EACH ROW
BEGIN
    IF OLD.price != NEW.price THEN
        INSERT INTO price_history (course_id, old_price, new_price)
        VALUES (NEW.id, OLD.price, NEW.price);
    END IF;
END //

DELIMITER ;






