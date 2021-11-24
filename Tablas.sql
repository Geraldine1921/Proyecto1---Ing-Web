DROP TABLE product;
DROP TABLE inventory;
DROP TABLE profile;

CREATE TABLE profile (
    id VARCHAR(50) PRIMARY KEY,
    userName VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    creationDate DATE NOT NULL DEFAULT NOW(),
    modificationDate DATE NOT NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE product (
    id VARCHAR(50) PRIMARY KEY,
    profile VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    price BIGINT NOT NULL DEFAULT 0,
    creationDate DATE NOT NULL DEFAULT NOW(),
    modificationDate DATE NOT NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (profile) REFERENCES profile(Id)
);

CREATE TABLE inventory (
    id VARCHAR(50) PRIMARY KEY,
    product VARCHAR(50) NOT NULL,
    quantity BIGINT NOT NULL DEFAULT 0,
    creationDate DATE NOT NULL DEFAULT NOW(),
    modificationDate DATE NOT NULL DEFAULT NOW(),
    active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (product) REFERENCES product(Id)
);

CREATE TABLE post (
    id VARCHAR(50) PRIMARY KEY,
    creationDate DATE DEFAULT NOW(),
    modificationDate DATE DEFAULT NOW(),
    message VARCHAR(300) NOT NULL,
    product VARCHAR(50) NOT NULL,
    profile VARCHAR(50) NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (product) REFERENCES product(id),
    FOREIGN KEY (profile) REFERENCES profile(id)
);








