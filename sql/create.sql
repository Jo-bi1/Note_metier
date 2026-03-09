CREATE DATABASE Note_metier;
\c Note_metier;
-- Table des correcteurs
CREATE TABLE Correcteur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) UNIQUE NOT NULL
);

-- Table des matières
CREATE TABLE Matiere (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) UNIQUE NOT NULL
);

-- Table des candidats
CREATE TABLE Candidat (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) UNIQUE NOT NULL,
    prenom VARCHAR(255) UNIQUE NOT NULL,
    matricule VARCHAR(255) UNIQUE NOT NULL 
);

-- Table des résolutions
CREATE TABLE Resolution (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table des opérateurs
CREATE TABLE Operateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Table des paramètres
CREATE TABLE Parametres (
    id SERIAL PRIMARY KEY,
    id_matiere INT NOT NULL REFERENCES Matiere(id),
    seuil NUMERIC NOT NULL,
    id_operateur INT NOT NULL REFERENCES Operateur(id),
    id_resolution INT NOT NULL REFERENCES Resolution(id)
);

-- Table des notes
CREATE TABLE Note (
    id SERIAL PRIMARY KEY,
    id_candidat INT NOT NULL REFERENCES Candidat(id),
    id_matiere INT NOT NULL REFERENCES Matiere(id),
    id_correcteur INT NOT NULL REFERENCES Correcteur(id),
    note FLOAT NOT NULL 
);

ALTER TABLE Note
ADD CONSTRAINT unique_note
UNIQUE(id_candidat, id_matiere, id_correcteur);