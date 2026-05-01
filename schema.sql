-- 1. Attiva l'estensione geografica
CREATE EXTENSION IF NOT EXISTS postgis;

-- 2. Tabella Utenti (Requisito RF1)
CREATE TABLE utenti (
    id_utente SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- 3. Tabella Libri (Requisito RF2, RF3)
CREATE TABLE libri (
    id_libro SERIAL PRIMARY KEY,
    titolo VARCHAR(255) NOT NULL,
    autore VARCHAR(100),
    categoria VARCHAR(50),
    -- CAMPO TECNICO: Coordinate geospaziali reali (SRID 4326 = GPS)
    posizione GEOMETRY(Point, 4326), 
    url_copertina TEXT,
    url_miniatura TEXT, -- Per il requisito delle thumbnails
    id_proprietario INTEGER REFERENCES utenti(id_utente)
);

-- 4. Indice spaziale per le performance (Requisito Non Funzionale)
CREATE INDEX idx_libri_posizione ON libri USING GIST (posizione);
