-- Autrices :   Andréa Cohen, Mélissa Chavez-Campos, Julie Kurtness
-- Cours :      B42-INT - Langage de base de données
-- Date :       18 septembre 2019
-- TP1 :        Script de création de tables

SET ECHO OFF
CLEAR screen;
 
PROMPT =======================================================
PROMPT Destruction des tables
PROMPT =======================================================

DROP TABLE activites_joueurs; 
DROP TABLE avatar_habiletes;
DROP TABLE avatar_items;
DROP TABLE achat_items;
DROP TABLE achat_intervalles_jeu;
DROP TABLE achats;
DROP TABLE joueur_avatar;
DROP TABLE items;
DROP TABLE habiletes;
DROP TABLE types_achat;
DROP TABLE modes_paiement;
DROP TABLE jeux;
DROP TABLE joueurs;
DROP TABLE leitmotiv;
DROP TABLE avatars;


PROMPT =======================================================
PROMPT Creation des tables
PROMPT =======================================================

PROMPT creation de table avatars
CREATE TABLE avatars (
    id			    NUMBER,
	moX         	NUMBER,
	nom			    VARCHAR2(32)    NOT NULL,
	couleur1       	VARCHAR2(6)     NOT NULL,
	couleur2        VARCHAR2(6),
    couleur3        VARCHAR2(6),
    date_creation 	DATE            NOT NULL,
  CONSTRAINT pk_avatars           PRIMARY KEY (id),
  CONSTRAINT cc_avatars_moX         CHECK (moX >= -1000000000 AND moX <= 1000000000)
);

PROMPT creation de table leitmotiv
CREATE TABLE leitmotiv (
  id              NUMBER,
  id_avatar       NUMBER        NOT NULL,
  phrases         VARCHAR2(64),
  CONSTRAINT pk_leitmotiv PRIMARY KEY (id),
  CONSTRAINT fk_leitmotiv_avatar FOREIGN KEY (id_avatar) REFERENCES avatars(id)
);



PROMPT creation de table joueurs
CREATE TABLE joueurs (
  id                  NUMBER,
  alias               VARCHAR2(32)    NOT NULL,
  courriel            VARCHAR2(128)   NOT NULL,
  mot_passe           VARCHAR2(32)    NOT NULL,
  genre               CHAR(1)         NOT NULL,
  date_inscription    DATE            NOT NULL,
  date_naissance      DATE,
  CONSTRAINT pk_joueurs                 PRIMARY KEY (id),
  CONSTRAINT uc_joueurs_alias           UNIQUE (alias),
  CONSTRAINT uc_joueurs_courriel        UNIQUE (courriel),
  CONSTRAINT cc_joueurs_genre           CHECK (genre IN ('f','F','h','H','x','X')),
  CONSTRAINT cc_joueurs_dateinscrip     CHECK (date_inscription >= TO_DATE('01/07/2018', 'DD/MM/YYYY')),
  CONSTRAINT cc_joueurs_datenaissance   CHECK (date_naissance >= TO_DATE('01/01/1900', 'DD/MM/YYYY'))
);

PROMPT creation de table jeux
CREATE TABLE jeux (
    id          NUMBER(2),
    nom         VARCHAR2(16)    NOT NULL,
    sigle       VARCHAR(6)      NOT NULL,
    description VARCHAR(2048),  
    CONSTRAINT pk_jeux        PRIMARY KEY (id),
    CONSTRAINT uc_jeux_nom    UNIQUE (nom),
    CONSTRAINT uc_jeux_sigle  UNIQUE (sigle)
);

PROMPT creation de table modes_paiement
CREATE TABLE modes_paiement (
	id      NUMBER(2),
	nom     VARCHAR2(16)        NOT NULL,  
	CONSTRAINT modes_paiement PRIMARY KEY (id)
);

PROMPT creation de table types_achat
CREATE TABLE types_achat (
	id      NUMBER(1)     NOT NULL,
	nom     VARCHAR2(16)  NOT NULL,
    CONSTRAINT pk_types_achat   PRIMARY KEY (id)
);

PROMPT creation de table achats
CREATE TABLE achats (
	id                  NUMBER,
	id_joueur           NUMBER      NOT NULL,
	date_paiement       DATE        NOT NULL,
	id_mode_paiement    NUMBER(2)   NOT NULL,
	montant             NUMBER(6,2) NOT NULL,
	id_type_achat       NUMBER(1)   NOT NULL, 
	CONSTRAINT pk_achats                    PRIMARY KEY (id),
    CONSTRAINT fk_achats_id_joueur          FOREIGN KEY (id_joueur) REFERENCES joueurs(id),
    CONSTRAINT fk_achats_id_mode_paiement   FOREIGN KEY (id_mode_paiement) REFERENCES modes_paiement(id),
    CONSTRAINT fk_achats_id_type_achat      FOREIGN KEY (id_type_achat) REFERENCES types_achat(id),
    CONSTRAINT cc_achats_montant            CHECK (montant BETWEEN 0.01 AND 2500.00)
);

PROMPT creation de table activites_joueurs
CREATE TABLE activites_joueurs (
    id              NUMBER,
    id_joueur       NUMBER          NOT NULL,
    debut           DATE            NOT NULL,
    fin             DATE            NOT NULL,
    id_avatar       NUMBER          NOT NULL,
    id_jeu          NUMBER(2)       NOT NULL,
    CONSTRAINT pk_activites_joueurs PRIMARY KEY (id),
    CONSTRAINT fk_activjoueurs_joueurs FOREIGN KEY (id_joueur) REFERENCES joueurs(id),
    CONSTRAINT fk_activjoueurs_avatars FOREIGN KEY (id_avatar) REFERENCES avatars(id),
    CONSTRAINT fk_activjoueurs_jeux FOREIGN KEY (id_jeu) REFERENCES jeux(id)
);

PROMPT creation de table habiletes
CREATE TABLE habiletes (
    id                  NUMBER(4,0),
    nom                 VARCHAR2(32)  NOT NULL,
    id_jeu              NUMBER(2,0)   NOT NULL,
    sigle               VARCHAR2(3)   NOT NULL,
    energie_acquisition NUMBER(5,2)   NOT NULL,
    energie_utilisation NUMBER(6,3)   NOT NULL,
    description         VARCHAR2(512),
    CONSTRAINT pk_habiletes     PRIMARY KEY (id),
	CONSTRAINT fk_hab_jeu       FOREIGN KEY (id_jeu) REFERENCES jeux(id),
    CONSTRAINT uc_hab_nom       UNIQUE (nom),
	CONSTRAINT uc_hab_sigle     UNIQUE (sigle),
    CONSTRAINT cc_hab_sigle     CHECK (sigle LIKE 'F%'),
    CONSTRAINT cc_hab_energie_acquis    CHECK (energie_acquisition BETWEEN 25.00 AND 250.00 ),
    CONSTRAINT cc_hab_energie_util      CHECK (energie_utilisation BETWEEN -999.999 AND 999.999 )
);

PROMPT creation de table items
CREATE TABLE items (
    id              NUMBER(4, 0),
    nom             VARCHAR2(32)    NOT NULL,
    id_jeu          NUMBER(2, 0)    NOT NULL,
    sigle           VARCHAR2(4)     NOT NULL,
    probabilite     NUMBER          NOT NULL,
    cout            NUMBER          NOT NULL,
    description     VARCHAR2(512),
    CONSTRAINT pk_items         PRIMARY KEY (id),
  	CONSTRAINT fk_items_jeu     FOREIGN KEY (id_jeu) REFERENCES jeux(id),
	CONSTRAINT uc_items_sigle   UNIQUE (sigle),
    CONSTRAINT cc_items_sigle   CHECK (sigle LIKE 'I%'),
    CONSTRAINT cc_items_prob    CHECK (probabilite BETWEEN 0.000 AND 1.000 ),
    CONSTRAINT cc_items_cout    CHECK (cout BETWEEN 0.00 AND 1000000000.00 )
);

PROMPT creation de table avatar_habiletes
CREATE TABLE avatar_habiletes (
    id_avatar       NUMBER,
    id_habilete     NUMBER(4, 0),
    date_obtention  DATE            NOT NULL,
    niveau          NUMBER(3, 0)    DEFAULT 0   NOT NULL,
    CONSTRAINT pk_avatar_habiletes              PRIMARY KEY (id_avatar, id_habilete),
    CONSTRAINT fk_avatar_habiletes_id_avatar    FOREIGN KEY (id_avatar)     REFERENCES avatars(id),
	CONSTRAINT fk_avatar_habiletes_id_hab       FOREIGN KEY (id_habilete)   REFERENCES habiletes(id)
);

PROMPT creation de table avatar_items
CREATE TABLE avatar_items (
    id_avatar       NUMBER,
    id_item         NUMBER(4, 0)    NOT NULL,
    date_obtention  DATE            NOT NULL,
    quantite        NUMBER(3, 0)    NOT NULL,
  
    CONSTRAINT pk_avatar_items              PRIMARY KEY (id_avatar, id_item),
    CONSTRAINT fk_avatar_items_id_avatar    FOREIGN KEY (id_avatar)     REFERENCES avatars(id),
	CONSTRAINT fk_avatar_items_id_items     FOREIGN KEY (id_item)      REFERENCES items(id)
);

PROMPT creation de table joueur_avatar
CREATE TABLE joueur_avatar (
	id_joueur   NUMBER,
	id_avatar   NUMBER,
	CONSTRAINT pk_joueur_avatar             PRIMARY KEY (id_joueur, id_avatar),
    CONSTRAINT fk_joueur_avatar_id_joueur   FOREIGN KEY (id_joueur)     REFERENCES joueurs(id),
    CONSTRAINT fk_joueur_avatar_id_avatar   FOREIGN KEY (id_avatar)     REFERENCES avatars(id)
);

PROMPT creation de table achat_intervalles_jeu
CREATE TABLE achat_intervalles_jeu (
	id_joueur       NUMBER      NOT NULL,
	id_achat        NUMBER      NOT NULL,
	date_debut      DATE        NOT NULL,
	date_fin        DATE        NOT NULL,
	CONSTRAINT pk_achat_interv_jeu                 PRIMARY KEY (id_joueur,id_achat),
    CONSTRAINT fk_achat_interv_jeu_id_joueur       FOREIGN KEY (id_joueur)     REFERENCES joueurs(id),
    CONSTRAINT fk_achat_interv_jeu_id_achat        FOREIGN KEY (id_achat)      REFERENCES achats(id),
    CONSTRAINT cc_achat_interv_jeu_date_ovrlp      CHECK (date_debut<date_fin)
);

PROMPT creation de table achat_items
CREATE TABLE achat_items (
	id_achat        NUMBER      NOT NULL,
	id_item         NUMBER      NOT NULL,
	CONSTRAINT pk_achat_items               PRIMARY KEY (id_achat, id_item),
    CONSTRAINT achat_items_achat_id         FOREIGN KEY (id_achat)      REFERENCES achats(id),
    CONSTRAINT achat_items_item_id          FOREIGN KEY (id_item)       REFERENCES items(id)
);

 
PROMPT =======================================================
PROMPT Creation des sequences
PROMPT =======================================================

DROP SEQUENCE seq_id_joueurs;
CREATE SEQUENCE seq_id_joueurs 
	INCREMENT BY 1
	START WITH 1;

DROP SEQUENCE seq_id_avatars;
CREATE SEQUENCE seq_id_avatars 
	INCREMENT BY 1
	START WITH 1;

DROP SEQUENCE seq_id_leitmotiv;
CREATE SEQUENCE seq_id_leitmotiv 
	INCREMENT BY 1
	START WITH 1;

DROP SEQUENCE seq_id_achats;
CREATE SEQUENCE seq_id_achats 
	INCREMENT BY 1
	START WITH 1;
    
DROP SEQUENCE seq_id_activites_joueurs;
CREATE SEQUENCE seq_id_activites_joueurs 
	INCREMENT BY 1
	START WITH 1;
    
DROP SEQUENCE seq_id_adresse;
CREATE SEQUENCE seq_id_adresse 
	INCREMENT BY 1
	START WITH 1;

DROP SEQUENCE seq_id_habiletes;
CREATE SEQUENCE seq_id_habiletes 
	INCREMENT BY 1
	START WITH 1;
    
DROP SEQUENCE seq_id_items;
CREATE SEQUENCE seq_id_items 
	INCREMENT BY 1
	START WITH 1;
    
DROP SEQUENCE seq_id_jeux;
CREATE SEQUENCE seq_id_jeux 
	INCREMENT BY 1
	START WITH 1;

DROP SEQUENCE seq_id_modes_paiement;
CREATE SEQUENCE seq_id_modes_paiement 
	INCREMENT BY 1
	START WITH 1;
    
DROP SEQUENCE seq_id_types_achat;
CREATE SEQUENCE seq_id_types_achat 
	INCREMENT BY 1
	START WITH 1;

SET ECHO ON
