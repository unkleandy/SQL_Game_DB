-- Autrices :   Andréa Cohen, Mélissa Chavez-Campos, Julie Kurtness
-- Cours :      B42-INT - Langage de base de données
-- Date :       18 septembre 2019
-- TP1 :        Script de requêtes 

SET ECHO OFF
CLEAR screen;
SET PAGESIZE 5000;

PROMPT =======================================================
PROMPT 1. Donnez la liste des joueurs
PROMPT =============

SELECT j.alias AS "Alias joueurs", j.date_inscription AS "Date inscription joueurs"
FROM joueurs j;

PROMPT =======================================================
PROMPT 2. Donnez la liste des avatars d'un joueur (principal)
PROMPT =============

SELECT a.nom AS "Nom avatar", a.couleur1 AS "Coul. preferee", TO_CHAR(a.date_creation, 'YYYY-MM-DD') AS "Date creation"
FROM avatars a
    JOIN joueur_avatar ja
        ON ja.id_avatar = a.id
    JOIN joueurs j
        ON j.id = ja.id_joueur
WHERE j.alias = 'JulieKurtness*';
 

PROMPT =======================================================
PROMPT 3. Donnez la liste des habiletes d'un avatar (principal)
PROMPT =============

SELECT h.nom AS "Noms habiletes", ah.date_obtention AS "Dates obtention", ah.niveau AS "Niveau"
FROM avatars a
	JOIN avatar_habiletes ah
		ON ah.id_avatar = a.id
	JOIN habiletes h
		ON ah.id_habilete = h.id
WHERE a.nom = 'avatarJuliePrincipal*';

PROMPT =======================================================
PROMPT 4. Donnez la valeur totale de tous les items que possede l'avatar principal
PROMPT =============

SELECT TO_CHAR(SUM(i.cout * ai.quantite),'999,999,999.99') AS "Valeur totale" 
FROM avatars a
    JOIN avatar_items ai
        ON ai.id_avatar = a.id
    JOIN items i
        ON ai.id_item = i.id
WHERE a.nom = 'avatarJuliePrincipal*';

PROMPT =======================================================
PROMPT 5 Le nombre total de temps passé dans chaque session du joueur principal
PROMPT =============
BREAK ON j.alias
SELECT j.alias AS "joueur", a.nom AS "avatar", jeux.nom AS "monde", (fin-debut)*24*60*60 AS "duree de session en secondes"
    FROM activites_joueurs aj
    LEFT JOIN joueurs j ON aj.id_joueur=j.id
    LEFT JOIN avatars a ON a.id=aj.id_avatar
    LEFT JOIN jeux ON jeux.id=aj.id_jeu
    WHERE j.alias LIKE '%*'
    ORDER BY aj.debut;
CLEAR BREAKS;

PROMPT =======================================================
PROMPT 6. Liste des joueurs et du montant depense
PROMPT =============

SELECT j.alias AS "nom Joueur", TO_CHAR(SUM(a1.montant), '999,999.99') AS "total"
FROM achats a1
    JOIN joueurs j
        ON j.id = a1.id_joueur
GROUP BY j.alias;

PROMPT =======================================================
PROMPT 7. Liste de tous les avatars qui possède plus d'un item
PROMPT =============
SELECT  a.nom AS "nom avatar", j.alias AS "Joueur alias", SUM(ai.quantite) AS "qte"
FROM avatars a
    JOIN avatar_items ai
        ON ai.id_avatar = a.id
    JOIN joueur_avatar ja
        ON ja.id_avatar = a.id
    JOIN Joueurs j
        ON j.id = ja.id_joueur
GROUP BY a.nom, j.alias
HAVING SUM(ai.quantite) > 1;
 
PROMPT =======================================================
PROMPT 8.a La liste d'avatar ayant joue dans chaque monde
PROMPT =============

BREAK ON j.nom
SELECT DISTINCT j.nom as "univers", a.nom AS "avatar dans ce monde"
    FROM jeux j
    LEFT JOIN ACTIVITES_JOUEURS aj ON j.id = aj.id_jeu
    LEFT JOIN avatars a ON aj.id_avatar = a.id
    ORDER BY  j.nom, a.nom;
CLEAR BREAKS;

PROMPT =======================================================
PROMPT 8.b Liste des 3 dernieres factures
PROMPT =============

COLUMN montant FORMAT  $9990.90
SELECT *
    FROM(SELECT a.id AS "# facture", j.id AS "nom", montant AS "montant", mp.nom AS "mode de paiment"
        FROM  achats a
        LEFT JOIN joueurs j on j.id=a.id_joueur
        LEFT JOIN MODES_PAIEMENT mp ON a.id_mode_paiement = mp.id
        LEFT JOIN TYPES_ACHAT ta ON a.id_type_achat = ta.id
        ORDER BY a.date_paiement)
WHERE rownum<=3;

PROMPT =======================================================
PROMPT 8.c Temps total de chaque avatar
PROMPT =============

SELECT a.nom AS "avatar", SUM((fin-debut)*24*60*60) AS "duree d'util en secondes"
    FROM activites_joueurs aj
    LEFT JOIN avatars a ON a.id=aj.id_avatar
    GROUP BY a.nom;


SET ECHO ON
