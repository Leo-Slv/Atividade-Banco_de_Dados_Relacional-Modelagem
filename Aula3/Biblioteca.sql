CREATE TABLE Autor (
    idAutor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

CREATE TABLE Livro (
    idLivro SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    anoPublicacao INTEGER,
    isbn VARCHAR(20) UNIQUE
);

CREATE TABLE Cliente (
    idCliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE Emprestimo (
    idEmprestimo SERIAL PRIMARY KEY,
    dataEmprestimo DATE NOT NULL DEFAULT CURRENT_DATE,
    dataDevolucao DATE,
    idCliente INTEGER NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE LivroAutor (
    idLivro INTEGER NOT NULL,
    idAutor INTEGER NOT NULL,
    PRIMARY KEY (idLivro, idAutor),
    FOREIGN KEY (idLivro) REFERENCES Livro(idLivro) ON DELETE CASCADE,
    FOREIGN KEY (idAutor) REFERENCES Autor(idAutor) ON DELETE CASCADE
);

CREATE TABLE EmprestimoLivro (
    idEmprestimo INTEGER NOT NULL,
    idLivro INTEGER NOT NULL,
    PRIMARY KEY (idEmprestimo, idLivro),
    FOREIGN KEY (idEmprestimo) REFERENCES Emprestimo(idEmprestimo) ON DELETE CASCADE,
    FOREIGN KEY (idLivro) REFERENCES Livro(idLivro) ON DELETE CASCADE
);