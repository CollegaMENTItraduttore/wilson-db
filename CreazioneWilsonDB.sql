CREATE SCHEMA wilson_db ;

CREATE TABLE wilson_db.rsa (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  description VARCHAR(1000) NULL,
  id_dm7 VARCHAR(100) NOT NULL UNIQUE,
  PRIMARY KEY (id)
);

CREATE TABLE wilson_db.staff_role (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  description VARCHAR(1000) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE wilson_db.resident (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NULL,
  last_name VARCHAR(100) NULL,
  picture VARCHAR(100) NULL,
  birthday DATE NULL,
  birthplace VARCHAR(100) NULL,
  gender ENUM('male', 'female') NULL,
  biography VARCHAR(10000) NULL,
  habits VARCHAR(10000) NULL,
  extra_info VARCHAR(10000) NULL,
  id_rsa INT UNSIGNED NULL,
  cod_utente INT UNSIGNED NULL UNIQUE,
  PRIMARY KEY (id),
  INDEX FK_resident_rsa_idx (id_rsa ASC),
  CONSTRAINT FK_resident_rsa FOREIGN KEY (id_rsa) REFERENCES wilson_db.rsa (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.staff (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NULL,
  last_name VARCHAR(100) NULL,
  picture VARCHAR(100) NULL,
  mail VARCHAR(100) NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NULL,
  id_role INT UNSIGNED NULL,
  id_rsa INT UNSIGNED NULL,
  id_teanapers INT UNSIGNED NULL UNIQUE,
  PRIMARY KEY (id),
  INDEX FK_staff_role_idx (id_role ASC),
  INDEX FK_staff_rsa_idx (id_rsa ASC),
  CONSTRAINT FK_staff_role FOREIGN KEY (id_role) REFERENCES wilson_db.staff_role (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_staff_rsa FOREIGN KEY (id_rsa) REFERENCES wilson_db.rsa (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.kinship (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  description VARCHAR(100) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE wilson_db.relative (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NULL,
  last_name VARCHAR(100) NULL,
  picture VARCHAR(100) NULL,
  mail VARCHAR(100) NULL,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NULL,
  id_kinship INT UNSIGNED NULL,
  is_primary TINYINT(1) NULL,
  id_resident INT UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX FK_relative_resident_idx (id_resident ASC),
  CONSTRAINT FK_relative_resident FOREIGN KEY (id_resident) REFERENCES wilson_db.resident (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  INDEX FK_relative_kinship_idx (id_kinship ASC),
  CONSTRAINT FK_relative_kinship FOREIGN KEY (id_kinship) REFERENCES wilson_db.kinship (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.contact_info (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  type ENUM('phone', 'fax', 'mail', 'pec') NULL,
  first_name VARCHAR(100) NULL,
  value VARCHAR(100) NULL,
  id_relative INT UNSIGNED NULL,
  id_staff INT UNSIGNED NULL,
  id_rsa INT UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX FK_contact_relative_idx (id_relative ASC),
  INDEX FK_contact_staff_idx (id_staff ASC),
  INDEX FK_contact_rsa_idx (id_rsa ASC),
  CONSTRAINT FK_contact_relative FOREIGN KEY (id_relative) REFERENCES wilson_db.relative (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_contact_staff FOREIGN KEY (id_staff) REFERENCES wilson_db.staff (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_contact_rsa FOREIGN KEY (id_rsa) REFERENCES wilson_db.rsa (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.comment(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_by INT UNSIGNED NOT NULL,
  created_on TIMESTAMP NULL COMMENT "Datetime the comment was created",
  comment VARCHAR(100) NOT NULL COMMENT "The content of the comment",
  PRIMARY KEY (id),
  INDEX FK_comment_staff_idx (created_by ASC),
  CONSTRAINT FK_comment_staff FOREIGN KEY (created_by) REFERENCES wilson_db.staff (id) ON DELETE NO ACTION ON UPDATE CASCADE  
);

CREATE TABLE wilson_db.activity_category (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  description VARCHAR(1000) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE wilson_db.activity_info (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  description VARCHAR(1000) NULL,
  benefits VARCHAR(1000) NULL,
  id_activity_category INT UNSIGNED NOT NULL,
  id_activity_sipcar INT NOT NULL,
  PRIMARY KEY (id),
  INDEX FK_activity_category_idx (id_activity_category ASC),
  CONSTRAINT FK_activity_category FOREIGN KEY (id_activity_category) REFERENCES wilson_db.activity_category (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.activity (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_on TIMESTAMP NULL,
  duration INT NULL,
  id_activity_info INT UNSIGNED NOT NULL,
  repeats_every ENUM('daily', 'weekly', 'monthly', 'yearly') NULL,
  repeats_on VARCHAR(100) NULL,
  location VARCHAR(100) NULL,
  can_volunteer TINYINT(1) NULL,
  can_partecipate TINYINT(1) NULL,
  can_request_appointment TINYINT(1) NULL,
  organized_by INT UNSIGNED NULL,
  id_resident INT UNSIGNED NULL,
  id_plan_sipcar INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX FK_activity_info_idx (id_activity_info ASC),
  INDEX FK_activity_resident_idx (id_resident ASC),
  INDEX FK_activity_staff_idx (organized_by ASC),
  CONSTRAINT FK_activity_info FOREIGN KEY (id_activity_info) REFERENCES wilson_db.activity_info (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_activity_resident FOREIGN KEY (id_resident) REFERENCES wilson_db.resident (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_activity_staff FOREIGN KEY (organized_by) REFERENCES wilson_db.staff (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.activity_edition (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_activity INT UNSIGNED NULL,
  start_date TIMESTAMP NULL,
  end_date TIMESTAMP NULL,
  status ENUM('confirmed', 'finished', 'cancelled', 'postponed') NULL,
  location VARCHAR(100) NULL,
  can_volunteer TINYINT(1) NULL,
  can_partecipate TINYINT(1) NULL,
  can_request_appointment TINYINT(1) NULL,
  staff_comment INT UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX FK_edition_activity_idx (id_activity ASC),
  INDEX FK_edition_comment_idx (staff_comment ASC),
  CONSTRAINT FK_edition_activity FOREIGN KEY (id_activity) REFERENCES wilson_db.activity (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_edition_comment FOREIGN KEY (staff_comment) REFERENCES wilson_db.comment (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.feedback (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  subject VARCHAR(100) NULL COMMENT 'Subject of the feedback thread',
  created_on TIMESTAMP NULL COMMENT "Datetime the feedback was created",
  feedback_by INT UNSIGNED NULL,
  rating INT NULL COMMENT "Rating of the user associated with the feedback",
  comment VARCHAR(10000) NULL COMMENT "Comment thread associated with the feedback",
  PRIMARY KEY (id),
  INDEX FK_feedback_relative_idx (feedback_by ASC),
  CONSTRAINT FK_feedback_relative_idx FOREIGN KEY (feedback_by) REFERENCES wilson_db.relative (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.activity_partecipation (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  partecipant INT UNSIGNED NULL,
  id_edition INT UNSIGNED NULL,
  created_on TIMESTAMP NULL,
  partecipated_on TIMESTAMP NULL,
  status ENUM('confirmed', 'cancelled', 'planned') NULL,
  role ENUM('attendee', 'volunteer', 'organizer') NULL,
  feedback INT UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX FK_partecipation_relative_idx (partecipant ASC),
  INDEX FK_partecipation_edition_idx (id_edition ASC),
  INDEX FK_partecipation_feedback_idx (feedback ASC),
  CONSTRAINT FK_partecipation_relative FOREIGN KEY (partecipant) REFERENCES wilson_db.relative (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_partecipation_edition FOREIGN KEY (id_edition) REFERENCES wilson_db.activity_edition (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_partecipation_feedback FOREIGN KEY (feedback) REFERENCES wilson_db.feedback (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.multimedia_attachment (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  uploaded_by INT UNSIGNED NULL,
  uploaded_on TIMESTAMP NULL COMMENT "Datetime the attachment was uploaded",
  mimeType VARCHAR(50) NOT NULL COMMENT "Type of attached material in mime type",
  url VARCHAR(100) NOT NULL COMMENT "URL of the attachment",
  PRIMARY KEY (id),
  INDEX FK_attachment_staff_idx (uploaded_by ASC),
  CONSTRAINT FK_attachment_staff_idx FOREIGN KEY (uploaded_by) REFERENCES wilson_db.staff (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.consultation (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_activity INT UNSIGNED NULL,
  id_activity_edition INT UNSIGNED NULL,
  requested_on TIMESTAMP NULL,
  requested_for TIMESTAMP NULL,
  scheduled_for TIMESTAMP NULL,
  staff_comment INT UNSIGNED NULL,
  requested_by INT UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX FK_consultation_activity_idx (id_activity ASC),
  INDEX FK_consultation_activity_edition_idx (id_activity_edition ASC),
  INDEX FK_consultation_staff_comment_idx (staff_comment ASC),
  INDEX FK_consultation_requested_by_idx (requested_by ASC),
  CONSTRAINT FK_consultation_activity FOREIGN KEY (id_activity) REFERENCES wilson_db.activity (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_consultation_activity_edition FOREIGN KEY (id_activity_edition) REFERENCES wilson_db.activity_edition (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_consultation_staff_comment FOREIGN KEY (staff_comment) REFERENCES wilson_db.comment (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_consultation_requested_by FOREIGN KEY (requested_by) REFERENCES wilson_db.relative (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.event_category (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL,
  description VARCHAR(1000) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE wilson_db.event_type(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL COMMENT "Name of the event type",
  description VARCHAR(1000) NULL COMMENT "Description of the event type",
  explanation VARCHAR(1000) NULL COMMENT "Default explanation of the event type",
  id_category INT UNSIGNED NULL COMMENT "Category of the event type, used for grouping events",
  start_date TIMESTAMP NULL COMMENT "Date the event type started to be in effect",
  repeats_every ENUM ('daily','weekly','monthly','yearly') COMMENT "Frequency at which the event takes place",
  repeats_on VARCHAR(50) COMMENT "Days the event is repeated in a week. Verranno inseriti nel DB il numero del giorno separato da ;",
  PRIMARY KEY (id),
  INDEX FK_event_type_category_idx (id_category ASC),
  CONSTRAINT FK_event_type_category FOREIGN KEY (id_category) REFERENCES wilson_db.event_category (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.health_status(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_on TIMESTAMP NULL COMMENT "Datetime when the event was created",
  id_resident INT UNSIGNED NULL COMMENT "Resident the the health_status information is referred",
  id_type INT UNSIGNED NULL COMMENT "Type of health status event",
  current_severity VARCHAR(100) NULL COMMENT "Textual indication of the current severity of the event",
  PRIMARY KEY (id),
  INDEX FK_health_status_resident_idx (id_resident ASC),
  INDEX FK_health_status_type_idx (id_type ASC),
  CONSTRAINT FK_health_status_resident FOREIGN KEY (id_resident) REFERENCES wilson_db.resident (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_health_status_type FOREIGN KEY (id_type) REFERENCES wilson_db.event_type (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.event_update(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_on TIMESTAMP NULL COMMENT "Datetime when the event was created",
  staff_comment INT UNSIGNED NULL COMMENT "Comments of the RSA Staff on the event",
  severity VARCHAR(100) NULL COMMENT "Textual indication of the current severity of the event",
  id_health_status INT UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX FK_event_update_staff_comment_idx (staff_comment ASC),
  INDEX FK_event_update_health_status_idx (id_health_status ASC),
  CONSTRAINT FK_event_update_staff_comment FOREIGN KEY (staff_comment) REFERENCES wilson_db.comment (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_event_update_health_status FOREIGN KEY (id_health_status) REFERENCES wilson_db.health_status (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.primary_need(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_on TIMESTAMP NULL COMMENT "Datetime when the event was created",
  id_resident INT UNSIGNED NULL COMMENT "Resident that the primary need information is referred",
  id_type INT UNSIGNED NULL COMMENT "Type of primary need event",
  staff_comment INT UNSIGNED NULL COMMENT "Comments of the RSA Staff on the event",
  id_primary_need_sipcar INT UNSIGNED NULL COMMENT "Id del record sul DB Sipcar 1.0",
  PRIMARY KEY (id),
  INDEX FK_primary_need_resident_idx (id_resident ASC),
  INDEX FK_primary_need_type_idx (id_type ASC),
  INDEX FK_primary_need_staff_comment_idx (staff_comment ASC),
  CONSTRAINT FK_primary_need_resident FOREIGN KEY (id_resident) REFERENCES wilson_db.resident (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_primary_need_type FOREIGN KEY (id_type) REFERENCES wilson_db.event_type (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_primary_need_staff_comment FOREIGN KEY (staff_comment) REFERENCES wilson_db.comment (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.event_extra_param(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NULL COMMENT "Name of the event parameter (as displayed)",
  description VARCHAR(1000) NULL COMMENT "Description of the event parameter",
  value_text VARCHAR(100) NULL COMMENT "Value of the parameter if in textual form",
  value_num INT NULL COMMENT "Value of the parameter if in numeric form",
  created_by INT UNSIGNED NULL,
  id_primary_need INT UNSIGNED NULL,
  id_health_status INT UNSIGNED NULL,
  id_event_update INT UNSIGNED NULL,
  PRIMARY KEY (id),
  INDEX FK_event_extra_param_primary_need_idx (id_primary_need ASC),
  CONSTRAINT FK_event_extra_param_primary_need FOREIGN KEY (id_primary_need) REFERENCES wilson_db.primary_need (id) ON DELETE CASCADE ON UPDATE CASCADE,
  
  INDEX FK_event_extra_param_staff_idx (created_by ASC),
  CONSTRAINT FK_event_extra_param_staff FOREIGN KEY (created_by) REFERENCES wilson_db.staff (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  INDEX FK_event_extra_param_health_status_idx (id_health_status ASC),
  CONSTRAINT FK_event_extra_param_health_status FOREIGN KEY (id_health_status) REFERENCES wilson_db.health_status (id) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX FK_event_extra_param_update_idx (id_event_update ASC),
  CONSTRAINT FK_event_extra_param_update FOREIGN KEY (id_event_update) REFERENCES wilson_db.event_update (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE wilson_db.pai_resoconto(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_by INT UNSIGNED NULL,
  created_on TIMESTAMP NOT NULL COMMENT "Data di creazione del resoconto",
  id_resident INT UNSIGNED NULL COMMENT "Resident that the PAI information is referred",
  note VARCHAR(10000) NOT NULL COMMENT "The content of the comment",
  PRIMARY KEY (id),
  INDEX FK_pai_resoconto_resident_idx (id_resident ASC),
  INDEX FK_pai_resoconto_staff_idx (created_by ASC),
  CONSTRAINT FK_pai_resoconto_resident FOREIGN KEY (id_resident) REFERENCES wilson_db.resident (id) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT FK_pai_resoconto_staff FOREIGN KEY (created_by) REFERENCES wilson_db.staff (id) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE wilson_db.care_team (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nominativo VARCHAR(100) NULL COMMENT "Nome dell'operatore",
  figura_professionale VARCHAR(100) NULL COMMENT "Figura professionale dell'operatore",
  is_family_navigator TINYINT(1) NULL COMMENT "Check se l'operatore ha il ruolo di family navigator",
  id_teanapers INT UNSIGNED NULL COMMENT "Identificativo dell'operatore sul DB Sipcar",
  id_resident INT UNSIGNED NULL COMMENT "Residente a cui è collegato il team di cura",
  PRIMARY KEY (id)
);

CREATE TABLE wilson_db.sent_message (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_relative INT UNSIGNED NULL COMMENT "Familiare che ha inviato la richiesta di contatto",
  sent_on TIMESTAMP NULL COMMENT "Data di invio del messaggio",
  id_care_team INT UNSIGNED NULL COMMENT "Operatore a cui è stato mandato il messaggio",
  message VARCHAR(10000) NULL COMMENT "Testo del messaggio scritto dal familiare",
  shared_on TIMESTAMP NULL COMMENT "Data di condivisione interna alla struttura col destinatario",
  PRIMARY KEY (id),
  INDEX FK_sent_message_id_relative_idx (id_relative ASC),
  CONSTRAINT FK_sent_message_id_relative FOREIGN KEY (id_relative) REFERENCES wilson_db.relative (id) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX FK_sent_message_id_care_team_idx (id_care_team ASC),
  CONSTRAINT FK_sent_message_id_care_team FOREIGN KEY (id_care_team) REFERENCES wilson_db.care_team (id) ON DELETE CASCADE ON UPDATE CASCADE
);