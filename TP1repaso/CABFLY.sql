CREATE TABLE IF NOT EXISTS TipoDocumento(
	ID INT NOT NULL,
    TipoDocumento VARCHAR(100) NOT NULL,
    NumeroDocumento VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID)
)ENGINE=INNODB;

CREATE TABLE Pasajero (
    ID INT NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    IDTipoDocumento INT NOT NULL,
    PRIMARY KEY (ID),
	FOREIGN KEY (IDTipoDocumento) REFERENCES TipoDocumento(ID)
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS Aerolinea (
    ID INT NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    PRIMARY KEY (ID)
)ENGINE=INNODB;

CREATE TABLE Vuelo (
    ID INT NOT NULL,
    NumVuelo VARCHAR(50) NOT NULL,
    NumAvion VARCHAR(50) NOT NULL,
    Origen VARCHAR(255) NOT NULL,
    Destino VARCHAR(255) NOT NULL,
    FechaHora DATETIME NOT NULL,
    IDAerolinea INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (IDAerolinea) REFERENCES Aerolinea(ID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS DetalleEstadoReserva (
    ID INT NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    PRIMARY KEY (ID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS Reserva (
    ID INT NOT NULL,
    Codigo VARCHAR(50) NOT NULL,
    FechaHoraEmision DATETIME NOT NULL,
    IDVuelo INT NOT NULL,
    IDPasajero INT NOT NULL,
    IDDetalleEstadoReserva INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (IDVuelo) REFERENCES Vuelo(ID),
    FOREIGN KEY (IDPasajero) REFERENCES Pasajero(ID),
    FOREIGN KEY (IDDetalleEstadoReserva) REFERENCES DetalleEstadoReserva(ID)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS DetalleEstadoAsiento (
    ID INT NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Asiento (
    ID INT NOT NULL,
    Numero VARCHAR(50) NOT NULL,
    IDDetalleEstadoAsiento INT NOT NULL,
    IDReserva INT NOT NULL,
	PRIMARY KEY (ID),
    FOREIGN KEY (IDDetalleEstadoAsiento) REFERENCES DetalleEstadoAsiento(ID),
    FOREIGN KEY (IDReserva) REFERENCES Reserva(ID)
);


CREATE TABLE IF NOT EXISTS TarjetaEmbarque (
    ID INT NOT NULL,
    Puerta VARCHAR(50) NOT NULL,
    FechaHora DATETIME NOT NULL,
    FechaEmision DATETIME NOT NULL,
    NumTarjetaEmbarque VARCHAR(50) NOT NULL,
    IDReserva INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (IDReserva) REFERENCES Reserva(ID)
);


