USE final;

insert into school values	
("Aristoteleio Panepisthmio Thessalonikkis","Polutexnikh Sxolh","Tmhma Mhxanologwn Mhxanikwn",100100),
("Aristoteleio Panepisthmio Thessalonikkis","Polutexnikh Sxolh","Tmhma Hlektrologwn Mhxanikwn kai Mhxanikwn Ypolohistwn",100101),
("Aristoteleio Panepisthmio Thessalonikkis","Sxolh Thetikwn Epistmwn","Tmhma Plhroforikhs",101100),

("Dhmokriteio Panepisthmio Thrakis","Polutexnikh Sxolh","Tmhma Hlektrologwn Mhxanikwn kai Mhxanikwn Ypolohistwn",200100),

("Ethniko Metsobio Polutexneio","Polutexnikh Sxolh","Tmhma Hlektrologwn Mhxanikwn kai Mhxanikwn Ypolohistwn",300100),

("Ethniko Kapodistriako Panepisthmio Athinwn","Sxolh Thetikwn Epistmwn","Tmhma Plhroforikhs kai Thlepikoinwniwn",400100),

("Oikonomiko Panepisthmio Athinwn","Sxolh Epistmwn kai Texnologias ths Plhroforias","Tmhma Plhroforikhs",500100),

("Panepisthmio Peiraios","Sxolh Plhroforikhs kai Epikoinwniwn","Tmhma Plhroforikhs",600100),

("Tei of Athens","STEF","Mhxanikoi Plhroforikhs",700100),
("Tei of Crete","STEF","Mhxanikoi Plhroforikhs",800100);


INSERT INTO student VALUES(151036,"123456789","Sfyridaki","Angela","computer's engineer student good knowledge  of c,c++,java,jsp,html,MySQL",'1996/07/05',700100);
INSERT INTO student VALUES(1,"admin","administrator","administrator","",'01/1/1',700100),
						  (151037,"458212412","Anastasaki","Maria","",'1997/02/15',800100);

insert into photos values (151036,1,"./picture/151036.jpg"),
											(151036,2,"https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/14925745_10209355587025064_2290967300569153326_n.jpg?oh=f84b51ef9a5f3b88b607125a012a518e&oe=59BC9EA5");

insert into videos values (151036,1,"https://www.youtube.com/embed/-h4D99s10wI"),
											(151036,2,"https://www.youtube.com/embed/NMNgbISmF4I"),
											(151036,3,"https://www.youtube.com/embed/TR3Vdo5etCQ"),
											(151036,4,"https://www.youtube.com/embed/BdR_VYdDJsA");

insert into quotes values	(1,151036,"i don't wanna be the girl that has to fill the silence. The quiet scares me 'cause it screams the truth.",'2017/4/24'),
							(2,151036,"There's just no back to the start",'2017/5/5'),
							(3,151036,"Tonight we are young so let's set the world on fire, we can burn brighter than the sun",'2017/5/5'),
							(4,151036,"Like a small boat on the ocean sending big waves into motion I might only have one match but I can make an explosion",'2017/5/5'),
							(5,151036,"O kosmos omoios me erhmo ki egw o pio mikros o kokos, gigantiaio pou'xw stoxo, proorismo mou na'xw t'astra kai barka ta oneira mou.  Sunodoiporo mou exw th siwph ki auth kako diko mou 8elei.  H barka mou mia spi8amh ki o aeras thn tarattei.  Pws thn xtupoun ta kummata, se skoteina nera diabainei, gia makrina limania exei balei plwrh.  To ta3idi problepetai makru ki oi staseis mou polles. Poloi pou'nai oi planhtes, megalh gnwsh pou' xoune ki egw mikro pou 'mai mprosta tous.  Ki as ta megala mou oneira ki as antikrizoune bouna pelwria, s' ane3ereunhtes 8alasses ki an ta3ideuoun pali st' asteria 8a koitazoun!!!",'2017/5/5');


insert into languages values(151036,"English","proficient"),
							(151036,"Greek","proficient");

insert into interest values	(1,"Database"),
							(2,"Web programming"),
							(3,"Human Computer Interaction"),
							(4,"Data Mining"),
							(5,"Software Engineering"),
							(6,"Information Retrieval"),
							(7,"Software Quality"),
							(8,"e-commerce"),
							(9,"Management Information Systems"),
							(10,"Information Systems");


insert into interests values(151036,1),
							(151036,3),
							(151036,5),
							(151036,10),
							(151037,5),
							(151037,10),
							(1,4),
							(1,6),
							(1,5);

insert into hobby values	(1,"Football"),
							(2,"Swimming"),
							(3,"Tennis"),
							(4,"Basketball"),
							(5,"Fishing"),
							(6,"Photography"),
							(7,"Piano"),
							(8,"Violin"),
							(9,"Guitar"),
							(10,"Drams"),
							(11,"Reading Books"),
							(12,"Drawing");

insert into hobbies values	(151036,11),
							(151036,12);

