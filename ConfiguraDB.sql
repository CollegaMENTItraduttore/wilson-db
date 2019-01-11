#------------------------------------        RSA        ------------------------------------#
#RSA
insert into env_cm_5bd5e0f96ba9aa7645372db3.rsa (name, id_dm7) values ("Casa del Benessere - A.P.S.P.",'env_cm_5bd5e0f96ba9aa7645372db3');
#------------------------------------        FINE RSA        ------------------------------------#

#------------------------------------        FIGURE PROFESSIONALI        ------------------------------------#
#FIGURE PROFESSIONALI
#tabella: staff_role
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Medico');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Infermiere');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('O.S.A. / Personale Assistenziale');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Fisioterapista');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Assistente Sociale');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Coordinatore Sanitario');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Coordinatore Assistenziale');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Animatore');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Educatore Professionale');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Psicologo');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Logopedista');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Obiettore');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Altro');
insert into env_cm_5bd5e0f96ba9aa7645372db3.staff_role(name) values('Ass Diurna-Animazione');
#------------------------------------        FINE FIGURE PROFESSIONALI        ------------------------------------#

#------------------------------------        ANZIANI RESIDENTI        ------------------------------------#
#ANZIANI
#tabella: resident
insert into env_cm_5bd5e0f96ba9aa7645372db3.resident (id,first_name,last_name,gender,birthday,id_rsa,cod_utente,picture) values (727,"Alessandro","Milani",'male','1920/08/13',1,727,'https://collegamenti.conserva.cloud/foto_demo/male1.jpg');
insert into env_cm_5bd5e0f96ba9aa7645372db3.resident (id,first_name,last_name,gender,birthday,id_rsa,cod_utente,picture) values (791,"Alessia","Coppola",'female','1930/06/21',1,791,'https://collegamenti.conserva.cloud/foto_demo/female1.jpg');
insert into env_cm_5bd5e0f96ba9aa7645372db3.resident (id,first_name,last_name,gender,birthday,id_rsa,cod_utente,picture) values (851,"Agata","Alfieri",'female','1938/02/28',1,851,'https://collegamenti.conserva.cloud/foto_demo/female2.jpg');
insert into env_cm_5bd5e0f96ba9aa7645372db3.resident (id,first_name,last_name,gender,birthday,id_rsa,cod_utente,picture) values (978,"Alessandro","Martinelli",'male','1922/07/24',1,978,'https://collegamenti.conserva.cloud/foto_demo/male2.jpg');
insert into env_cm_5bd5e0f96ba9aa7645372db3.resident (id,first_name,last_name,gender,birthday,id_rsa,cod_utente,picture) values (1041,"Alberto","Santoro",'male','1925/10/24',1,1041,'https://collegamenti.conserva.cloud/foto_demo/male3.jpg');
#------------------------------------        FINE ANZIANI RESIDENTI        ------------------------------------#

#------------------------------------        GRADI DI PARENTELA        ------------------------------------#
#GRADI DI PARENTELA
#tabella: kinship
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Altro parente');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Amministratore di sostegno');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Assistente sociale');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Cognato/a');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Coniuge');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Conoscente');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Consuocero/a');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Cugino/a');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Figliastro/a');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Figlio/a');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Fratellastro/sorellastra');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Fratello/sorella');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Genero/nuora');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Genitore');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Nipote');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Procuratore/Procuratrice');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Pronipote');
insert into env_cm_5bd5e0f96ba9aa7645372db3.kinship (description) values ('Tutore');


#------------------------------------        CATEGORIE BISOGNI PRIMARI        ------------------------------------#
#CATEGORIE BISOGNI PRIMARI
#tabella: event_category
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_category (id, name) values (1,'Sonno');
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_category (id, name) values (2,'Toilette');
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_category (id, name) values (3,'Pasti');
#------------------------------------        FIGURE CATEGORIE BISOGNI PRIMARI        ------------------------------------#

#------------------------------------        TIPI DI BISOGNI PRIMARI        ------------------------------------#
#TIPI DI BISOGNI PRIMARI
#tabella: event_type
#SONNO
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (1,'Riposo notturno',1);
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (2,'Riposino pomeridiano',1);
#TOILETTE
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (3,'Alvo',2);
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (4,'Diuresi',2);
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (5,'Igiene personale',2);
#PASTI
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (6,'Colazione',3);
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (7,'Pranzo',3);
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (8,'Merenda',3);
insert into env_cm_5bd5e0f96ba9aa7645372db3.event_type (id, name, id_category) values (9,'Cena',3);
#------------------------------------        FINE TIPI DI BISOGNI PRIMARI        ------------------------------------#