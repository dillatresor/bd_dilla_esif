
CREATE database bd_dilla_esif



CREATE TABLE `clients` (
  num_client int(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom_client varchar(100) NOT NULL,
  prenoms_client varchar(50) NOT NULL,
  civilite_client varchar(50) NOT NULL
) 



INSERT INTO clients (nom_client, prenoms_client, civilite_client) VALUES
(NAREMADJI, Martine,Madame),
(DILLA, Tresor,Monsieur),
(DERA, Yvon,Monsieur),
(OUEDRAOGO, Cedric,Monsieur);



CREATE TABLE fournisseur (
  code_fournisseur int(12) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom_fournisseur varchar(100) NOT NULL,
  prenoms_fournisseur varchar(50) NOT NULL,
  civilite_fournisseur varchar(50) NOT NULL,
) 




INSERT INTO fournisseur (nom_fournisseur, prenoms_fournisseur, civilite_fournisseur) VALUES
(BILLA, Arlette,Madame),
(ZONGO, Bertrand,Monsieur),
(DIGOL, Sergr,Monsieur),
(SANKARA, Yannick,Monsieur);



CREATE TABLE categorie (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(100)
);

INSERT INTO categorie (nom_categorie)
VALUES (Electromenage),
       (Equipement Informatique);




CREATE TABLE articles (
  num_article int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  designation_article varchar(100) NOT NULL,
  Prix_article float NOT NULL,
  Qte_article int(11) NOT NULL,
  id_categorie int(12),
  FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
);



INSERT INTO articles (designation_article, Prix_article, Qte_article, id_categorie) VALUES
('CAISSON PLUS 2 ARMOIRES 2 PORTES', 250.55, 51, 1),
('BUREAU MDF' , 325.15, 38, 1),
('TABLE POUR ORDINATEUR', 175.25, 61, 2),
('CLAVIER LUMINEUX', 290.15, 15, 2),
('SOURIS HP', 445, 9, 1);






CREATE TABLE achat (
  num_achat int NOT NULL PRIMARY KEY,
  client_achat int NOT NULL,
  date_achat date NOT NULL,
  montant_achat float NOT NULL,
  code_article int,
  code_fournisseur int,
  FOREIGN KEY (code_article) REFERENCES articles(num_article),
  FOREIGN KEY (code_fournisseur) REFERENCES fournisseur(code_fournisseur)
);


INSERT INTO achat (num_achat, client_achat, date_achat, montant_Achat) VALUES
(1, 1, 12/03/2019, 1295.95),
(2, 2, 16/03/2019, 1488.8);





CREATE TABLE vente (
  num_vente int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  client_vente varchar(100) NOT NULL,
  date_vente varchar(10) NOT NULL,
  montant_vente float NOT NULL,
  num_client int,
  code_article int,
  FOREIGN KEY (num_client) REFERENCES clients(num_client),
  FOREIGN KEY (code_article) REFERENCES articles(num_article)
) ;


INSERT INTO vente (client_vente, date_vente, montant_vente, num_client, code_article) VALUES
('Robert', '2019-06-25', 1295.95 , 1, 2),
('Jean', '2019-06-20', 1576.95 , 1, 1)
;




