CREATE TABLE TipoEvento (
    idTipoEvento SERIAL PRIMARY KEY
);

CREATE TABLE Localizacao (
    idLocalizacao SERIAL PRIMARY KEY
);

CREATE TABLE Usuario (
    idUsuario SERIAL PRIMARY KEY
);

CREATE TABLE Evento (
    idEvento SERIAL PRIMARY KEY,
    idTipoEvento INTEGER NOT NULL,
    idLocalizacao INTEGER NOT NULL,
    FOREIGN KEY (idTipoEvento) REFERENCES TipoEvento(idTipoEvento) ON DELETE CASCADE,
    FOREIGN KEY (idLocalizacao) REFERENCES Localizacao(idLocalizacao) ON DELETE CASCADE
);

CREATE TABLE Relato (
    idRelato SERIAL PRIMARY KEY,
    idEvento INTEGER NOT NULL,
    idUsuario INTEGER NOT NULL,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento) ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Alerta (
    idAlerta SERIAL PRIMARY KEY,
    idEvento INTEGER NOT NULL,
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento) ON DELETE CASCADE
);