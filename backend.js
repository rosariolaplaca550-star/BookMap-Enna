// Esempio di logica per la ricerca spaziale (Requisito RF4)
const getLibriVicinanza = async (lat, lon, raggioMetri = 5000) => {
    const query = `
        SELECT titolo, autore, 
               ST_X(posizione::geometry) as lon, 
               ST_Y(posizione::geometry) as lat
        FROM libri
        WHERE ST_DWithin(
            posizione, 
            ST_SetSRID(ST_MakePoint($1, $2), 4326)::geography, 
            $3
        );
    `;
    // Esecuzione query su PostgreSQL
    return await db.query(query, [lon, lat, raggioMetri]);
};
