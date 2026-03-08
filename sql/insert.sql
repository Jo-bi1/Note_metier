-- Candidats
INSERT INTO Candidat (nom, prenom, matricule) VALUES
('Rakoto', 'Jean', 'MAT001'),
('Rabe', 'Marie', 'MAT002'),
('Andrianina', 'Paul', 'MAT003'),
('Razanaka', 'Luc', 'MAT004'),
('Rakotomalala', 'Sofia', 'MAT005');

-- Correcteurs
INSERT INTO Correcteur (nom) VALUES
('Rasoa Andry'),
('Rasoanaivo Hery'),
('Rajaonarison Lala'),
('Rakotondrazaka Mamy'),
('Ratsimbazafy Fidy');

-- Matières
INSERT INTO Matiere (nom) VALUES
('Mathematiques'),
('Physique'),
('Chimie'),
('Informatique'),
('Biologie');

-- Résolutions
INSERT INTO Resolution (nom) VALUES
('plus petit'),
('plus grand'),
('moyenne');

-- Opérateurs
INSERT INTO Operateur (nom) VALUES
('<'),
('>');

-- Paramètres
INSERT INTO Parametres (id_matiere, seuil, id_operateur, id_resolution) VALUES
(1, 10.0, 1, 1),
(2, 12.0, 2, 2),
(3, 8.0, 1, 3),
(4, 15.0, 2, 1),
(5, 5.0, 1, 2);

INSERT INTO Note (id_candidat, id_matiere, id_correcteur, note) VALUES

-- Candidat 1
(1,1,1,12.0),
(1,1,2,14.0),
(1,2,2,13.0),
(1,2,3,15.0),
(1,3,3,9.0),
(1,3,4,10.0),
(1,4,4,16.0),
(1,4,5,17.0),
(1,5,5,6.0),
(1,5,1,7.0),

-- Candidat 2
(2,1,1,8.0),
(2,1,2,9.0),
(2,2,2,10.0),
(2,2,3,11.0),
(2,3,3,7.0),
(2,3,4,8.0),
(2,4,4,14.0),
(2,4,5,13.0),
(2,5,5,4.0),
(2,5,1,5.0),

-- Candidat 3
(3,1,1,15.0),
(3,1,2,14.0),
(3,2,2,13.0),
(3,2,3,12.0),
(3,3,3,10.0),
(3,3,4,11.0),
(3,4,4,17.0),
(3,4,5,18.0),
(3,5,5,7.0),
(3,5,1,6.0),

-- Candidat 4
(4,1,1,9.0),
(4,1,2,10.0),
(4,2,2,11.0),
(4,2,3,10.0),
(4,3,3,6.0),
(4,3,4,7.0),
(4,4,4,13.0),
(4,4,5,12.0),
(4,5,5,5.0),
(4,5,1,6.0),

-- Candidat 5
(5,1,1,11.0),
(5,1,2,12.0),
(5,2,2,12.0),
(5,2,3,13.0),
(5,3,3,8.0),
(5,3,4,9.0),
(5,4,4,15.0),
(5,4,5,16.0),
(5,5,5,6.0),
(5,5,1,7.0);