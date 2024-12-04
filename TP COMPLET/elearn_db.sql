/**************************************************************************/
/*                          CREATION DE LA BASE DE DONNEES                */
/**************************************************************************/

CREATE DATABASE elearn_db;
USE elearn_db;


/**************************************************************************/
/*                          CREATION DES TABLES                           */
/**************************************************************************/


CREATE TABLE Utilisateurs (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,  
    nom VARCHAR(100) NOT NULL,  
    prenom VARCHAR(100) NOT NULL,  
    type VARCHAR(50) NOT NULL,  
    mot_de_passe VARCHAR(255) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL,  
    CONSTRAINT chk_type CHECK (type IN ('Administrateur', 'Professeur', 'Étudiant')),  -- Contrainte pour limiter les valeurs
    CONSTRAINT chk_nom_prenom CHECK (nom <> '' AND prenom <> ''),  -- Contrainte pour m'assurer que les champs nom et prénom ne sont pas vides
    
    -- Index pour optimiser les recherches sur le type d'utilisateur et l'email
    INDEX idx_type (type),                        -- Index sur le type d'utilisateur
    INDEX idx_email (email)                       -- Index sur l'email pour les recherches rapides
);

CREATE TABLE Cours (
    id_cours INT PRIMARY KEY AUTO_INCREMENT,  
    titre VARCHAR(255) NOT NULL,  
    description TEXT,  
    professeur_id INT NOT NULL,                     
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    CONSTRAINT fk_professeur FOREIGN KEY (professeur_id) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,  
    CONSTRAINT chk_titre CHECK (titre <> ''),      -- Contrainte pour s'assurer que le titre n'est pas vide
    
    -- Index pour optimiser les recherches sur le titre et le professeur
    INDEX idx_titre (titre),                     -- Index sur le titre du cours
    -- Choix de l'index B-tree : j'ai utilisé cet index pour optimiser les recherches sur les titres des cours. 
    
    INDEX idx_professeur (professeur_id)         -- Index sur l'ID du professeur pour les recherches rapides
    -- Choix de l'index B-tree : j'ai utilisé cet index améliorer la performance afin de permettre un accès rapide aux cours associés à un professeur spécifique
);

CREATE TABLE Modules (
    id_module INT PRIMARY KEY AUTO_INCREMENT,  
    titre VARCHAR(255) NOT NULL,  
    id_cours INT NOT NULL,  
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    CONSTRAINT fk_cours FOREIGN KEY (id_cours) REFERENCES Cours(id_cours) ON DELETE CASCADE, 
    CONSTRAINT chk_titre CHECK (titre <> ''),  -- Contrainte pour s'assurer que le titre n'est pas vide
    
    -- Index pour optimiser les recherches sur le titre et le cours
    INDEX idx_titre (titre),                   -- Index sur le titre du module
    INDEX idx_cours (id_cours)                 -- Index sur l'ID du cours pour les recherches rapides
    -- Choix de l'index B-tree : optimise les jointures entre Modules et Cours, et donc permet un accès rapide aux modules associés à un cours spécifique.
);


CREATE TABLE Inscriptions (
    id_inscription INT PRIMARY KEY AUTO_INCREMENT,  
    id_utilisateur INT NOT NULL,  
    id_cours INT NOT NULL, 
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    CONSTRAINT fk_inscription_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    CONSTRAINT fk_inscription_cours FOREIGN KEY (id_cours) REFERENCES Cours(id_cours) ON DELETE CASCADE,
    
    -- Index pour optimiser les recherches sur l'utilisateur et le cours
    INDEX idx_utilisateur (id_utilisateur),   -- Choix de l'index B-tree : permet des recherches rapides sur les utilisateurs, vérificaton des inscriptions d'un utilisateur spécifique.
    INDEX idx_cours (id_cours)                -- Choix de l'index B-tree : optimise les jointures entre Inscriptions et Cours, permettant un accès rapide aux inscriptions associées à un cours spécifique.
    
);

CREATE TABLE Evaluations (
    id_evaluation INT PRIMARY KEY AUTO_INCREMENT,  
    id_module INT NOT NULL,  
    note DECIMAL(5,2) CHECK (note >= 0 AND note <= 20),   -- Note avec contrainte CHECK pour s'assurer qu'elle est entre 0 et 20
    date_evaluation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Date de l'évaluation avec valeur par défaut
    CONSTRAINT fk_module FOREIGN KEY (id_module) REFERENCES Modules(id_module) ON DELETE CASCADE,  
    
    -- Index pour optimiser les recherches sur le module
    INDEX idx_module (id_module)  -- Choix de l'index B-tree : améliore la performance des requêtes qui récupèrent toutes les évaluations associées à un module spécifique.

);

CREATE TABLE Progression (
    id_progression INT PRIMARY KEY AUTO_INCREMENT,  
    id_utilisateur INT NOT NULL,                                          -- cet ID concerne l'étudiant et ne peut pas être nul
    id_module INT NOT NULL, 
    statut ENUM('Non commencé', 'En cours', 'Terminé') NOT NULL,          -- Statut de progression de l'étudiant
    date_mise_a_jour TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
    CONSTRAINT fk_progression_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,  
    CONSTRAINT fk_progression_module FOREIGN KEY (id_module) REFERENCES Modules(id_module) ON DELETE CASCADE,  
    
    -- Index pour optimiser les recherches sur l'utilisateur et le module
    INDEX idx_utilisateur (id_utilisateur),       -- Choix de l'index B-tree : permet des recherches rapides sur les utilisateurs, pour vérifier la progression d'un étudiant spécifique.
    INDEX idx_module (id_module)                  -- Choix de l'index B-tree : optimise les jointures entre Progression et Modules, permet un accès rapide aux progrès associés à un module spécifique.
);

/*********************************************************************************/
/*                          CREATION DES VUES                                   */
/********************************************************************************/


-- Création de la vue pour le suivi des progressions des étudiants
CREATE VIEW suivi_des_progressions AS
SELECT 
    u.id_utilisateur AS id_utilisateur,             -- Je sélectionne l'identifiant unique de l'utilisateur (étudiant)
    u.nom AS nom_utilisateur,  
    u.prenom AS prenom_utilisateur,  
    m.id_module AS id_module,  
    m.titre AS titre_module,  
    p.statut AS statut_progression,  
    p.date_mise_a_jour AS date_derniere_mise_a_jour  -- Je sélectionne la date de la dernière mise à jour du statut de progression
FROM 
    Utilisateurs u                                  -- Je commence par la table Utilisateurs pour obtenir les informations sur les étudiants
JOIN 
    Progression p ON u.id_utilisateur = p.id_utilisateur  -- Je fais une jointure avec la table Progression pour relier les étudiants à leur progression respective
JOIN 
    Modules m ON p.id_module = m.id_module        -- J'ajoute une jointure avec la table Modules pour obtenir les détails du module
WHERE 
    u.type = 'Étudiant';                          -- Je filtre uniquement les utilisateurs qui sont des étudiants pour me concentrer sur leurs progressions



-- Création de la vue pour le récapitulatif des cours par professeur
CREATE VIEW recapitulatif_des_cours_par_professeur AS
SELECT 
    u.id_utilisateur AS id_professeur,  
    u.nom AS nom_professeur,  
    u.prenom AS prenom_professeur,  
    c.id_cours AS id_cours, 
    c.titre AS titre_cours, 
    COUNT(i.id_utilisateur) AS nb_etudiants_inscrits    -- Nombre d'étudiants inscrits au cours
FROM 
    Utilisateurs u                                        -- Table Utilisateurs pour obtenir les informations sur les professeurs
JOIN 
    Cours c ON u.id_utilisateur = c.professeur_id        -- Je fais une jointure avec la table Cours pour relier les professeurs à leurs cours
LEFT JOIN 
    Inscriptions i ON c.id_cours = i.id_cours           -- Je fais une jointure gauche avec la table Inscriptions pour compter le nombre d'étudiants inscrits à chaque cours
GROUP BY 
    u.id_utilisateur, c.id_cours;                        -- Je regroupe les résultats par professeur et par cours pour obtenir le compte correct des étudiants inscrits



/**************************************************************************/
/*                          PROCEDURE STOCKEE                            */
/**************************************************************************/


-- Création d'une procédure stockée pour l'inscription d'un étudiant à un cours

DELIMITER //

CREATE PROCEDURE InscriptionEtudiant(
    IN p_id_utilisateur INT,  -- Identifiant de l'utilisateur (étudiant)
    IN p_id_cours INT         -- Identifiant du cours
)
BEGIN
    DECLARE v_nb_inscrits INT;

    -- Vérification si l'étudiant est déjà inscrit au cours
    IF EXISTS (SELECT 1 FROM Inscriptions WHERE id_utilisateur = p_id_utilisateur AND id_cours = p_id_cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'L étudiant est déjà inscrit à ce cours';
    END IF;

    -- Insertion de l'étudiant dans la table des Inscriptions
    INSERT INTO Inscriptions(id_utilisateur, id_cours, date_inscription)
    VALUES (p_id_utilisateur, p_id_cours, CURRENT_TIMESTAMP);

    -- Mise à jour du nombre d'inscrits dans la table des Cours
    SELECT COUNT(*) INTO v_nb_inscrits 
    FROM Inscriptions 
    WHERE id_cours = p_id_cours;

    UPDATE Cours 
    SET nombre_inscrits = v_nb_inscrits 
    WHERE id_cours = p_id_cours;

    -- Ajout d'une ligne dans la table Progression pour ce nouvel étudiant et ce module
    INSERT INTO Progression(id_utilisateur, id_module, statut)
    SELECT p_id_utilisateur, m.id_module, 'Non commencé'
    FROM Modules m
    WHERE m.id_cours = p_id_cours;

END //

DELIMITER ;



/**************************************************************************/
/*                          TRANSACTION                                   */
/**************************************************************************/

DELIMITER //

CREATE PROCEDURE transac_inscription_a_un_cours(
    IN p_id_utilisateur INT,    -- Identifiant de l'étudiant
    IN p_id_cours INT           -- Identifiant du cours
)
BEGIN
    -- Démarrer la transaction
    START TRANSACTION;

    -- Étape 1 : Inscrire l'étudiant au cours
    INSERT INTO Inscriptions (id_utilisateur, id_cours, date_inscription)
    VALUES (p_id_utilisateur, p_id_cours, CURRENT_TIMESTAMP);

    -- Étape 2 : Mettre à jour le nombre d'inscrits dans la table des Cours
    UPDATE Cours 
    SET nombre_inscrits = nombre_inscrits + 1 
    WHERE id_cours = p_id_cours;

    -- Étape 3 : Créer une entrée dans la table Progression pour chaque module du cours
    INSERT INTO Progression (id_utilisateur, id_module, statut)
    SELECT p_id_utilisateur, m.id_module, 'Non commencé'
    FROM Modules m
    WHERE m.id_cours = p_id_cours;

    -- Valider la transaction
    COMMIT;
END //

DELIMITER ;


/**************************************************************************/
/*                          TRIGGERS                                      */
/**************************************************************************/

-- Implémentation d'un trigger BEFORE INSERT sur la table des inscriptions pour vérifier la disponibilité du cours

DELIMITER //

CREATE TRIGGER verifier_disponibilite_du_cours
BEFORE INSERT ON Inscriptions
FOR EACH ROW
BEGIN
    DECLARE v_nb_inscrits INT;

    -- Compter le nombre d'inscrits au cours
    SELECT COUNT(*) INTO v_nb_inscrits 
    FROM Inscriptions 
    WHERE id_cours = NEW.id_cours;

    -- Vérifier si le nombre d'inscrits dépasse la capacité du cours
    IF v_nb_inscrits >= (SELECT capacite FROM Cours WHERE id_cours = NEW.id_cours) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le cours est complet, inscription impossible.';
    END IF;
END //

DELIMITER ;


-- Implémentation d'un Trigger AFTER UPDATE pour Mettre à Jour la Progression Générale

DELIMITER //

CREATE TRIGGER mettre_a_jour_la_progression_generale
AFTER UPDATE ON Evaluations
FOR EACH ROW
BEGIN
    DECLARE v_statut VARCHAR(50);
    DECLARE v_id_utilisateur INT;
    
    -- Récupérer l'id_utilisateur associé à l'évaluation
    SELECT id_utilisateur
    INTO v_id_utilisateur
    FROM Inscriptions
    WHERE id_cours = (SELECT id_cours FROM Evaluations WHERE id_evaluation = NEW.id_evaluation)
    LIMIT 1;  -- Assurez-vous qu'il n'y a qu'un seul utilisateur inscrit dans ce cours

    -- Calculer le statut de progression basé sur la note mise à jour
    IF NEW.note IS NOT NULL THEN
        IF NEW.note >= 10 THEN  -- Supposons que 10 soit la note de passage
            SET v_statut = 'Terminé';
        ELSE
            SET v_statut = 'En cours';
        END IF;
        
        -- Mettre à jour la progression dans la table Progression
        UPDATE Progression 
        SET statut = v_statut, date_mise_a_jour = CURRENT_TIMESTAMP 
        WHERE id_utilisateur = v_id_utilisateur 
          AND id_module = (SELECT id_module FROM Modules WHERE id_cours = (SELECT id_cours FROM Evaluations WHERE id_evaluation = NEW.id_evaluation));
    END IF;
END //

DELIMITER ;


/*************************************************************************************/
/*                        GESTION DES UTILISATEURS                                   */
/**************************************************************************************/

-- Création des rôles pour chaque type d'utilisateur
CREATE ROLE 'Administrateur';
CREATE ROLE 'Professeur';
CREATE ROLE 'Etudiant';

-- Attribution des privilèges à l'Administrateur
GRANT ALL PRIVILEGES ON elearn_db.* TO 'Administrateur';

-- Attribution des privilèges au Professeur
GRANT SELECT, INSERT, UPDATE ON Cours TO 'Professeur';
GRANT SELECT, INSERT, UPDATE ON Evaluations TO 'Professeur';
GRANT SELECT ON Progression TO 'Professeur';

-- Attribution des privilèges à l'Étudiant
GRANT SELECT ON Inscriptions TO 'Etudiant';
GRANT SELECT ON Evaluations TO 'Etudiant';
GRANT SELECT ON Progression TO 'Etudiant';

-- Création d'utilisateurs
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AzerTy34@-TponkscPi'; 
CREATE USER 'prof_user'@'localhost' IDENTIFIED BY 'QwertYNiv6@-489-MleSdg';   
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'Hojp-HGdre634Th3z'; 

-- Attribution des rôles aux utilisateurs
GRANT 'Administrateur' TO 'admin_user'@'localhost';
GRANT 'Professeur' TO 'prof_user'@'localhost';
GRANT 'Etudiant' TO 'student_user'@'localhost';

FLUSH PRIVILEGES;


/*************************************************************************************/
/*                                SECURITE                                           */
/**************************************************************************************/

DELIMITER //

CREATE PROCEDURE AuthentifierUtilisateur(
    IN p_email VARCHAR(100),        -- Email de l'utilisateur
    IN p_mot_de_passe VARCHAR(255)  -- Mot de passe en clair
)
BEGIN
    DECLARE v_mot_de_passe_chiffre VARBINARY(255);
    DECLARE v_id_utilisateur INT;
    DECLARE v_type_utilisateur VARCHAR(50);
    
    -- Chiffrement du mot de passe fourni par l'utilisateur
    SET v_mot_de_passe_chiffre = AES_ENCRYPT(p_mot_de_passe, 'ma_cle_secrete'); -- Remplacez par votre clé sécurisée

    -- Déclaration de la requête SELECT
    SET @sql = 'SELECT id_utilisateur, type FROM Utilisateurs WHERE email = ? AND mot_de_passe = ?';
    
    -- Préparation de la requête
    PREPARE stmt FROM @sql;
    
    -- Exécution de la requête avec les paramètres
    SET @email_param = p_email;
    SET @mot_de_passe_param = v_mot_de_passe_chiffre;
    
    EXECUTE stmt USING @email_param, @mot_de_passe_param;

    -- Récupération des résultats dans les variables
    SELECT id_utilisateur, type INTO v_id_utilisateur, v_type_utilisateur
    FROM Utilisateurs
    WHERE email = p_email AND mot_de_passe = v_mot_de_passe_chiffre
    LIMIT 1;

    -- Libération de la requête préparée
    DEALLOCATE PREPARE stmt;

    -- Vérification si l'utilisateur a été trouvé
    IF v_id_utilisateur IS NOT NULL THEN
        SELECT v_id_utilisateur AS id_utilisateur, v_type_utilisateur AS type_utilisateur;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Authentification échouée : email ou mot de passe incorrect.';
    END IF;
END //

DELIMITER ;




