-- SCHEMA DEL DATABASE PER BOOKMAP
-- Questo file definisce la struttura tecnica dei dati richiesta dal bando

CREATE TABLE utenti (
    id_utente INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password_hash VARCHAR(255) -- Criterio di sicurezza
);

CREATE TABLE libri (
    id_libro INT PRIMARY KEY,
    titolo VARCHAR(200),
    autore VARCHAR(100),
    categoria VARCHAR(50),
    latitudine DECIMAL(10, 8), -- Requisito: Campo geospaziale
    longitudine DECIMAL(11, 8), -- Requisito: Campo geospaziale
    url_copertina TEXT,
    url_miniatura TEXT,        -- Requisito: Generazione miniature
    id_proprietario INT,
    FOREIGN KEY (id_proprietario) REFERENCES utenti(id_utente)
);
