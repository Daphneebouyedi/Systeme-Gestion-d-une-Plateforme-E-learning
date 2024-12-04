USE elearn_db;

-- Sélectionner tous les cours d'un professeur spécifique avec le nombre d'étudiants inscrits

SELECT 
    C.titre AS titre_cours,
    COUNT(I.id_utilisateur) AS nombre_etudiants
FROM 
    Cours C
LEFT JOIN 
    Inscriptions I ON C.id_cours = I.id_cours
WHERE 
    C.professeur_id = 8
GROUP BY 
    C.id_cours, C.titre;  

-- Afficher la progression moyenne des étudiants par cours

SELECT 
    c.id_cours,
    c.titre,
    AVG(CASE 
        WHEN p.statut = 'Non commencé' THEN 0
        WHEN p.statut = 'En cours' THEN 50
        WHEN p.statut = 'Terminé' THEN 100
        ELSE NULL 
    END) AS progression_moyenne
FROM 
    Cours c
JOIN 
    Modules m ON c.id_cours = m.id_cours
JOIN 
    Progression p ON m.id_module = p.id_module
GROUP BY 
    c.id_cours, c.titre;
    
-- Lister les étudiants n'ayant pas commencé leurs cours depuis plus d'un mois
 
SELECT 
    u.id_utilisateur,
    u.nom,
    u.prenom,
    u.email,
    p.id_module,
    p.statut,
    p.date_mise_a_jour
FROM 
    Progression p
JOIN 
    Utilisateurs u ON p.id_utilisateur = u.id_utilisateur
WHERE 
    p.statut = 'Non commencé' 
    AND p.date_mise_a_jour <= CURDATE() - INTERVAL 1 MONTH;

  

