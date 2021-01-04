-- Autrices :   Andréa Cohen, Mélissa Chavez-Campos, Julie Kurtness
-- Cours :      B42-INT - Langage de base de données
-- Date :       18 septembre 2019
-- TP1 :        Script d'insertion 

SET ECHO OFF
CLEAR screen;

PROMPT =======================================================
PROMPT Insertion joueur principal
PROMPT =============

INSERT INTO joueurs (
    id,
    alias,
    courriel,
    mot_passe,
    genre,
    date_inscription,
    date_naissance)
VALUES (
    seq_id_joueurs.nextval,
    'JulieKurtness*',
    'julie@cvm.com',
    'AAAaaa111',
    'F',
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    TO_DATE('01-01-1981', 'DD-MM-YYYY')
);

PROMPT =======================================================
PROMPT Insertion trois(3) autres joueurs
PROMPT =============

INSERT INTO joueurs (
    id,
    alias,
    courriel,
    mot_passe,
    genre,
    date_inscription,
    date_naissance)
VALUES (
    seq_id_joueurs.nextval,
    'Andrea Cohen',
    'andrea@cvm.com',
    'AAAaaa111',
    'F',
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    TO_DATE('01-01-1991', 'DD-MM-YYYY')
);

INSERT INTO joueurs (
    id,
    alias,
    courriel,
    mot_passe,
    genre,
    date_inscription,
    date_naissance)
VALUES (
    seq_id_joueurs.nextval,
    'Melissa Campos',
    'melissa@cvm.com',
    'AAAaaa111',
    'F',
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    TO_DATE('01-01-1995', 'DD-MM-YYYY')
);

INSERT INTO joueurs (
    id,
    alias,
    courriel,
    mot_passe,
    genre,
    date_inscription,
    date_naissance)
VALUES (
    seq_id_joueurs.nextval,
    'Mael Perreault',
    'mael@cvm.com',
    'AAAaaa111',
    'H',
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    TO_DATE('01-01-1998', 'DD-MM-YYYY')
);


PROMPT =======================================================
PROMPT Insertion deux (2) avatars joueur principal
PROMPT =============

INSERT INTO avatars (
    id,
    moX,
    nom,
    couleur1,
    couleur2,
    couleur3,
    date_creation)
VALUES (
    seq_id_avatars.nextval,
    3000,
    'avatarJuliePrincipal*',
    'vert',
    'bleu',
    'jaune',
    TO_DATE('20-09-2019', 'DD-MM-YYYY')
);

INSERT INTO avatars (
    id,
    moX,
    nom,
    couleur1,
    couleur2,
    couleur3,
    date_creation)
VALUES (
    seq_id_avatars.nextval,
    10000,
    'avatarJulie2',
    'brun',
    'beige',
    'marron',
    TO_DATE('20-09-2019', 'DD-MM-YYYY')
);

PROMPT =======================================================
PROMPT Insertion autres avatars
PROMPT =============

INSERT INTO avatars (
    id,
    moX,
    nom,
    couleur1,
    couleur2,
    couleur3,
    date_creation)
VALUES (
    seq_id_avatars.nextval,
    8000,
    'avatarAndrea',
    'bleu',
    'fushia',
    'mauve',
    TO_DATE('20-09-2019', 'DD-MM-YYYY')
);

INSERT INTO avatars (
    id,
    moX,
    nom,
    couleur1,
    couleur2,
    date_creation)
VALUES (
    seq_id_avatars.nextval,
    8000,
    'avatarMelissa',
    'rose',
    'blanc',
    TO_DATE('20-09-2019', 'DD-MM-YYYY')
);

INSERT INTO avatars (
    id,
    moX,
    nom,
    couleur1,
    date_creation)
VALUES (
    seq_id_avatars.nextval,
    8000,
    'avatarMael',
    'noir',
    TO_DATE('20-09-2019', 'DD-MM-YYYY')
);


PROMPT =======================================================
PROMPT Insertion joueur_avatar
PROMPT =============

INSERT INTO joueur_avatar (
    id_joueur,
    id_avatar)
VALUES (
    (SELECT id FROM joueurs WHERE alias = 'JulieKurtness*'),
    (SELECT id FROM avatars WHERE nom = 'avatarJuliePrincipal*')
);

INSERT INTO joueur_avatar (
    id_joueur,
    id_avatar)
VALUES (
    (SELECT id FROM joueurs WHERE alias = 'JulieKurtness*'),
    (SELECT id FROM avatars WHERE nom = 'avatarJulie2')
);


INSERT INTO joueur_avatar (
    id_joueur,
    id_avatar)
VALUES (
    (SELECT id FROM joueurs WHERE alias = 'Andrea Cohen'),
    (SELECT id FROM avatars WHERE nom = 'avatarAndrea')
);

INSERT INTO joueur_avatar (
    id_joueur,
    id_avatar)
VALUES (
    (SELECT id FROM joueurs WHERE alias = 'Melissa Campos'),
    (SELECT id FROM avatars WHERE nom = 'avatarMelissa')
);

INSERT INTO joueur_avatar (
    id_joueur,
    id_avatar)
VALUES (
    (SELECT id FROM joueurs WHERE alias = 'Mael Perreault'),
    (SELECT id FROM avatars WHERE nom = 'avatarMael')
);

PROMPT =======================================================
PROMPT Insertion des leitmotiv
PROMPT =============

INSERT INTO leitmotiv (
    id,
    id_avatar,
    phrases)
VALUES (
    seq_id_leitmotiv.nextval,
    (SELECT id FROM avatars WHERE nom = 'avatarJuliePrincipal*'),
    'Mieux vaut tard que jamais'
);

INSERT INTO leitmotiv (
    id,
    id_avatar,
    phrases)
VALUES (
    seq_id_leitmotiv.nextval,
    (SELECT id FROM avatars WHERE nom = 'avatarJuliePrincipal*'),
    'Le temps c est de l argent'
);

INSERT INTO leitmotiv (
    id,
    id_avatar,
    phrases)
VALUES (
    seq_id_leitmotiv.nextval,
    (SELECT id FROM avatars WHERE nom = 'avatarJulie2'),
    'Show me the money'
);

INSERT INTO leitmotiv (
    id,
    id_avatar,
    phrases)
VALUES (
    seq_id_leitmotiv.nextval,
    (SELECT id FROM avatars WHERE nom = 'avatarAndrea'),
    'Les absents ont toujours tort'
);

PROMPT =======================================================
PROMPT Insertion des différents jeux (mondes)
PROMPT =============

INSERT INTO jeux (
    id,
    nom,
    sigle,
    description)
VALUES (
    seq_id_jeux.nextval,
    'SpaceX',
    'SPA123',
    'Monde steampunk dans l''espace'
);

INSERT INTO jeux (
    id,
    nom,
    sigle,
    description)
VALUES (
    seq_id_jeux.nextval,
    'DeepHorizonX',
    'DEE456',
    'Monde désertique apocalytique'
);

INSERT INTO jeux (
    id,
    nom,
    sigle,
    description)
VALUES (
    seq_id_jeux.nextval,
    'FreeZoneX',
    'FRE789',
    'Monde free for all, battle royal'
);

PROMPT =======================================================
PROMPT Insertion des différentes habiletés selon leur monde
PROMPT =============

PROMPT 1er monde
INSERT INTO habiletes (
    id,
    nom,
    id_jeu,
    sigle,
    energie_acquisition,
    energie_utilisation,
    description)
VALUES (
    seq_id_habiletes.nextval,
    'ralentir le temps',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'FS1',
    199.25,
    100.625,
    'Permet de ralentir le temps.'
);

INSERT INTO habiletes (
    id,
    nom,
    id_jeu,
    sigle,
    energie_acquisition,
    energie_utilisation,
    description)
VALUES (
    seq_id_habiletes.nextval,
    'bouclier de proximité',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'FS2',
    224.00,
    -64.025,
    'Permet de se protéger en bataille de proximité.'
);

PROMPT 2e monde
INSERT INTO habiletes (
    id,
    nom,
    id_jeu,
    sigle,
    energie_acquisition,
    energie_utilisation,
    description)
VALUES (
    seq_id_habiletes.nextval,
    'auto guérison',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'FD1',
    25.10,
    -995.500,
    'Permet de s''auto-guérir.'
);

INSERT INTO habiletes (
    id,
    nom,
    id_jeu,
    sigle,
    energie_acquisition,
    energie_utilisation,
    description)
VALUES (
    seq_id_habiletes.nextval,
    'implant d''un zoom oculaire',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'FD2',
    68.23,
    456.132,
    'Permet de posséder des yeux bionique avec zoom.'
);

PROMPT 3e monde
INSERT INTO habiletes (
    id,
    nom,
    id_jeu,
    sigle,
    energie_acquisition,
    energie_utilisation,
    description)
VALUES (
    seq_id_habiletes.nextval,
    'visée automatique',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'FF1',
    249.01,
    -49.224,
    'Permet de d''atteindre la cible sans viser.'
);

INSERT INTO habiletes (
    id,
    nom,
    id_jeu,
    sigle,
    energie_acquisition,
    energie_utilisation,
    description)
VALUES (
    seq_id_habiletes.nextval,
    'ubicuité',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'FF2',
    201.01,
    998.998,
    'Permet l''ubicuité.'
);

PROMPT =======================================================
PROMPT Insertion des items
PROMPT =============

PROMPT 1er monde : SpaceX
INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'faucille',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS01',
    0.42,
    249.1,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'grand bouclier',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS02',
    0.53,
    221,
    'protection'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'hache de gueule',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS03',
    0.11,
    24369,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'arc de chasse',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS04',
    0.62,
    191,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'lame de guerre',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS05',
    0.17,
    19311,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'bouclier mystère',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS06',
    0.11,
    24369,
    'protection'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'machette',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS07',
    0.86,
    100,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'regain d''énergie partielle',
    (SELECT id FROM jeux WHERE nom = 'SpaceX'),
    'IS08',
    0.13,
    45600,
    'vie'
);

PROMPT 2e monde : DeepHorizonX
INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'désentrailleur',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID01',
    0.42,
    249.1,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'lame rageuse',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID02',
    0.53,
    221,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'hache de massacre',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID03',
    0.11,
    24369,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'arc de revenant',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID04',
    0.22,
    10191,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'bouclier d''or',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID05',
    0.05,
    9992231,
    'protection'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'marteau géant',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID06',
    0.11,
    24369,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'grand ecu',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID07',
    0.86,
    100,
    'protection'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'regain d''énergie partielle',
    (SELECT id FROM jeux WHERE nom = 'DeepHorizonX'),
    'ID08',
    0.13,
    45600,
    'vie'
);

PROMPT 3e monde : FreeZoneX
INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'fendoir géant',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF01',
    0.312,
    2569,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'épée de colosse',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF02',
    0.33,
    49221,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'arc de gardien',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF03',
    0.11,
    1024369.5,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'bouclier gothique',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF04',
    0.22,
    990196,
    'protection'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'tranchoir',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF05',
    0.54,
    99231,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'glaive divin',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF06',
    0.04,
    86074598,
    'arme'
);

INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'arcs jumelés',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF07',
    0.46,
    54307.23,
    'arme'
);


INSERT INTO items (
    id,
    nom,
    id_jeu,
    sigle,
    probabilite,
    cout,
    description)
VALUES (
    seq_id_items.nextval,
    'regain d''énergie TOTALE',
    (SELECT id FROM jeux WHERE nom = 'FreeZoneX'),
    'IF08',
    0.03,
    999999999.99,
    'vie'
);


PROMPT =======================================================
PROMPT Insertion des ACTIVITES DU JOUEUR PRINCIPAL ET AVATAR PRINCIPAL
PROMPT =============
-- insertion 1
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-10-11:14:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-10-11:18:24:12', 'YYYY-MM-DD:HH24:MI:SS')
);
    
-- insertion 2    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-11-01:04:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-11-01:18:24:12', 'YYYY-MM-DD:HH24:MI:SS'));

-- insertion 3    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-11-02:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-11-03:06:05:15', 'YYYY-MM-DD:HH24:MI:SS'));
    
-- insertion 4    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-11-02:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-11-03:06:05:15', 'YYYY-MM-DD:HH24:MI:SS'));
    
-- insertion 5    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-11-02:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-11-03:06:05:15', 'YYYY-MM-DD:HH24:MI:SS'));
    
-- insertion 6    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-12-05:04:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-12-05:14:05:15', 'YYYY-MM-DD:HH24:MI:SS'));
    
-- insertion 7   
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-12-08:03:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-12-08:06:05:15', 'YYYY-MM-DD:HH24:MI:SS'));
    
-- insertion 8    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2019-01-03:03:33:00', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2019-01-03:07:06:00', 'YYYY-MM-DD:HH24:MI:SS'));
    
-- insertion 9    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2019-01-07:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2019-01-08:06:05:15', 'YYYY-MM-DD:HH24:MI:SS'));
    
-- insertion 10    
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs    WHERE alias LIKE '%*'),
    (SELECT id  FROM avatars    WHERE nom LIKE '%*'),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2019-01-06:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2019-01-07:01:03:56', 'YYYY-MM-DD:HH24:MI:SS'));
    
PROMPT =======================================================
PROMPT Insertion dans activites_joueurs du joueur principal avec un autre avatar
PROMPT =============   
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs WHERE alias LIKE '%*'),
    (SELECT *
        FROM (SELECT id_avatar  
            FROM joueur_avatar 
            WHERE id_joueur=(SELECT id  FROM joueurs WHERE alias LIKE '%*') 
                AND id_avatar !=(SELECT id  FROM avatars WHERE nom LIKE '%*')
            ORDER BY dbms_random.value)
        WHERE rownum = 1),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-12-06:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-12-07:01:03:56', 'YYYY-MM-DD:HH24:MI:SS'));

PROMPT =======================================================
PROMPT Insertion dans activites_joueurs ddes autres joueurs avec un avatar
PROMPT =============   

--insertion activité joueur andréa, avatar random, jeu random
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs WHERE alias = 'Andrea Cohen'),
    (SELECT *
        FROM (SELECT id_avatar  
            FROM joueur_avatar 
            WHERE id_joueur=(SELECT id  FROM joueurs WHERE alias = 'Andrea Cohen')
            ORDER BY dbms_random.value)
        WHERE rownum = 1),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-11-9:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-11-10:04:34:06', 'YYYY-MM-DD:HH24:MI:SS'));

--insertion activité joueur mélissa, avatar random, jeu random
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs WHERE alias IN ('Melissa Campos')),
    (SELECT *
        FROM (SELECT id_avatar  
            FROM joueur_avatar 
            WHERE id_joueur=(SELECT id  FROM joueurs WHERE alias IN ('Melissa Campos'))
            ORDER BY dbms_random.value)
        WHERE rownum = 1),
    (SELECT * FROM (SELECT id  FROM jeux ORDER BY dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-11-12:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-11-13:18:22:33', 'YYYY-MM-DD:HH24:MI:SS')); 
    
--insertion activité joueur mael, avatar random, jeu random
INSERT INTO activites_joueurs(
    id,
    id_joueur,
    id_avatar,
    id_jeu,
    debut,
    fin)
VALUES (
    seq_id_activites_joueurs.nextval,
    (SELECT id  FROM joueurs WHERE alias IN ('Mael Perreault')),
    (SELECT *
        FROM 
        (SELECT id_avatar  
            FROM joueur_avatar 
            WHERE id_joueur= 
            (SELECT id  FROM joueurs WHERE alias IN ('Mael Perreault')) 
            ORDER BY dbms_random.value)
        WHERE rownum = 1),
    (SELECT * FROM (SELECT id  FROM jeux   order by dbms_random.value) WHERE rownum = 1),
    TO_DATE('2018-11-02:23:12:05', 'YYYY-MM-DD:HH24:MI:SS'),
    TO_DATE('2018-11-04:06:05:15', 'YYYY-MM-DD:HH24:MI:SS'));   

PROMPT =======================================================
PROMPT Insertion dans avatar_items
PROMPT =============   

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    1,
    1,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    2
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    1,
    7,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    1
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    1,
    8,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    6
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    1,
    14,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    2
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    2,
    18,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    1
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    2,
    24,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    3
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    3,
    12,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    3
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    3,
    15,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    50
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    4,
    19,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    2
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    4,
    20,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    1
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    5,
    1,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    3
);

INSERT INTO avatar_items (
    id_avatar,
    id_item,
    date_obtention,
    quantite)
VALUES (
    5,
    21,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    7
);

PROMPT =======================================================
PROMPT Insertion dans avatar_habiletes
PROMPT =============   

INSERT INTO avatar_habiletes (
    id_avatar,
    id_habilete,
    date_obtention,
    niveau)
VALUES (
    1,
    1,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    4
);

INSERT INTO avatar_habiletes (
    id_avatar,
    id_habilete,
    date_obtention,
    niveau)
VALUES (
    1,
    3,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    18
);

INSERT INTO avatar_habiletes (
    id_avatar,
    id_habilete,
    date_obtention,
    niveau)
VALUES (
    2,
    4,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    1
);

INSERT INTO avatar_habiletes (
    id_avatar,
    id_habilete,
    date_obtention,
    niveau)
VALUES (
    2,
    6,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    99
);

INSERT INTO avatar_habiletes (
    id_avatar,
    id_habilete,
    date_obtention,
    niveau)
VALUES (
    3,
    1,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    2
);

INSERT INTO avatar_habiletes (
    id_avatar,
    id_habilete,
    date_obtention,
    niveau)
VALUES (
    4,
    2,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    15
);

INSERT INTO avatar_habiletes (
    id_avatar,
    id_habilete,
    date_obtention,
    niveau)
VALUES (
    5,
    5,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    3
);

PROMPT =======================================================
PROMPT Insertion dans modes_paiement
PROMPT =============   

INSERT INTO modes_paiement (
    id,
    nom)
VALUES (
    seq_id_modes_paiement.nextval,
    'carte de crédit'
);

INSERT INTO modes_paiement (
    id,
    nom)
VALUES (
    seq_id_modes_paiement.nextval,
    'paypal'
);

INSERT INTO modes_paiement (
    id,
    nom)
VALUES (
    seq_id_modes_paiement.nextval,
    'interact'
);

PROMPT =======================================================
PROMPT Insertion dans types_achat
PROMPT =============   

INSERT INTO types_achat (
    id,
    nom)
VALUES (
    seq_id_types_achat.nextval,
    'temps de jeu'
);

INSERT INTO types_achat (
    id,
    nom)
VALUES (
    seq_id_types_achat.nextval,
    'item rare'
);

PROMPT =======================================================
PROMPT Insertion dans achats
PROMPT =============   

INSERT INTO achats (
    id,
    id_joueur,
    date_paiement,
    id_mode_paiement,
    montant,
    id_type_achat)
VALUES (
    seq_id_achats.nextval,
    1,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    1,
    40.00,
    1
);

INSERT INTO achats (
    id,
    id_joueur,
    date_paiement,
    id_mode_paiement,
    montant,
    id_type_achat)
VALUES (
    seq_id_achats.nextval,
    1,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    2,
    300.00,
    2
);

INSERT INTO achats (
    id,
    id_joueur,
    date_paiement,
    id_mode_paiement,
    montant,
    id_type_achat)
VALUES (
    seq_id_achats.nextval,
    2,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    3,
    10.00,
    1
);

INSERT INTO achats (
    id,
    id_joueur,
    date_paiement,
    id_mode_paiement,
    montant,
    id_type_achat)
VALUES (
    seq_id_achats.nextval,
    3,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    1,
    33.70,
    1
);

INSERT INTO achats (
    id,
    id_joueur,
    date_paiement,
    id_mode_paiement,
    montant,
    id_type_achat)
VALUES (
    seq_id_achats.nextval,
    4,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    1,
    8.99,
    2
);

PROMPT =======================================================
PROMPT Insertion dans achat_items
PROMPT =============   

INSERT INTO achat_items (
    id_achat,
    id_item)
VALUES (
    2,
    24
);

INSERT INTO achat_items (
    id_achat,
    id_item)
VALUES (
    5,
    22
);

PROMPT =======================================================
PROMPT Insertion dans achat_intervalles_jeu
PROMPT =============   

INSERT INTO achat_intervalles_jeu (
    id_joueur,
    id_achat,
    date_debut,
    date_fin)
VALUES (
    1,
    1,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    TO_DATE('18-01-2020', 'DD-MM-YYYY')
);

INSERT INTO achat_intervalles_jeu (
    id_joueur,
    id_achat,
    date_debut,
    date_fin)
VALUES (
    2,
    3,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    TO_DATE('18-10-2019', 'DD-MM-YYYY')
);

INSERT INTO achat_intervalles_jeu (
    id_joueur,
    id_achat,
    date_debut,
    date_fin)
VALUES (
    3,
    4,
    TO_DATE('18-09-2019', 'DD-MM-YYYY'),
    TO_DATE('31-12-2019', 'DD-MM-YYYY')
);

SET ECHO ON
