
   
CREATE TABLE
    clients (
        id_client INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nom VARCHAR(50) NOT NULL,
        prenom VARCHAR(25) NOT NULL,
        adresse VARCHAR(25) NOT NULL,
        pays VARCHAR(25) NOT NULL,
        telephone INT(25) NOT NULL
    );

    
INSERT INTO
    clients (nom,prenom,adresse,pays,telephone)
VALUES ('DILLA','TRESOR','Secteur 19','B.F','78562248'), 
       ('KABORE','ABDOUL','Secteur 17','B.F','77522260'),
       ('NDOKOBE','RODRIGUE','Secteur 19','B.F','78822648'),
       ('CISSE','MARIAM','Secteur 1','MLI','54582246'), 
       ('KINI','JEAN','Secteur 40','C.I','54584358'),
       ('MAIGA','ABOUL-WAHAB','Secteur 19','FR','1054582248');


CREATE TABLE
    fournisseurs(
        id_fournisseur INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        prenom VARCHAR(25) NOT NULL,
        adresse VARCHAR(20) NOT NULL,
        telephone INT(25) NOT NULL,
        email VARCHAR(50) NOT NULL
    );

    INSERT INTO
    fournisseurs (nom,prenom,adresse,telephone,email)
VALUES ('OUEDRAO','AZIZ','Secteur 19','54582249','aziz45@gmail.com'),
       ('DINGO','ALAIN','Secteur 17','77522261','dingoma@gmail.com'), 
       ('BEOROFEI','CHRIST','Secteur 92','76585240','christ@gmail.com'), 
       ('NIKIEMA','ILA','Secteur 1','94582148','ila@gmail.com'), 
       ('KITELA','MARIE','Secteur 22','54533249','kitela@gmail.com');


CREATE TABLE
    categories(
        id_categorie INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        libelle VARCHAR(50) NOT NULL
    );
    INSERT INTO
    categories (libelle)
VALUES ('informatique'), ('electronique'), ('electro-menager');


CREATE TABLE
    articles (
        id_article INT NOT NULL AUTO_INCREMENT,
        designation VARCHAR(25) NOT NULL,
        id_categorie INT NOT NULL,
        marque VARCHAR(20) NOT NULL,
        quantite INT(20) NOT NULL,
        PRIMARY KEY (id_article),
        FOREIGN KEY (id_categorie) REFERENCES categories (id_categorie)
    );

    INSERT INTO
    articles(id_categorie,designation,marque,quantite)
VALUES ('1','ordinateur','HP probook','50'),
       ('2','télé','panasonic ecran"50"','10'), 
       ('3', 'Fourre', 'LG', '100'), 
       ('2', 'Tondeuse', 'Azur', '100'), 
       ('1', 'Souris', 'samsung', '10'),
       ('3', 'Gaz', 'Sodigaz', '100');



CREATE TABLE
    IF NOT EXISTS achats(
        id_achat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        id_fournisseur INT NOT NULL,
        id_article INT NOT NULL,
        quantite INT(100) NOT NULL,
        prix_unitaire INT(100) NOT NULL,
        FOREIGN KEY (id_fournisseur) REFERENCES fournisseurs (id_fournisseur),
        FOREIGN KEY (id_article) REFERENCES articles (id_article)
    );

    
INSERT INTO
    achats(id_fournisseur,id_article,quantite,prix_unitaire)
VALUES ('3', '1', '100', '86000'), 
       ('1', '2', '25', '5500'), 
       ('4', '2', '100', '5300'), 
       ('2', '4', '9', '8300'),
       ('3', '3', '40', '3650');



CREATE TABLE
    IF NOT EXISTS ventes(
        id_ventes INT NOT NULL AUTO_INCREMENT,
        id_client INT NOT NULL,
        id_article INT NOT NULL,
        quantite int(100) NOT NULL,
        prix_unitaire INT(100) NOT NULL,
        PRIMARY KEY(id_ventes),
        FOREIGN KEY (id_client) REFERENCES clients (id_client),
        FOREIGN KEY (id_article) REFERENCES articles (id_article)
    );


INSERT INTO
    ventes(id_client,id_article,quantite,prix_unitaire)
VALUES ('3', '1', '100', '1578'), 
       ('1', '2', '25', '7400'), 
       ('4', '2', '100', '1000'), 
       ('2', '4', '9', '9400'), 
       ('3', '3', '50', '4700');