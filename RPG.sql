CREATE DATABASE RPG;

CREATE TABLE Personagem(
    personagem_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL,
    raca INT NOT NULL,
    genero CHAR NOT NULL,
    Classe INT NOT NULL,
    Bencao INT NOT NULL,
    FOREIGN KEY (raca) REFERENCES Racas(racas_id),
    FOREIGN KEY (classe) REFERENCES Classes(classe_id),
    FOREIGN KEY (bencao) REFERENCES Bencaos(bencao_id)
);

CREATE TABLE Racas(
    racas_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    forca INT NOT NULL,
    inteligencia INT NOT NULL,
    vida CHAR NOT NULL,
    sorte INT NOT NULL,
    magia INT NOT NULL,
    furtividade INT NOT NULL,
    regiao INT NOT NULL,
    FOREIGN KEY (regiao) REFERENCES Regioes(regiao_id)
);

CREATE TABLE Classes(
    classe_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
   	habilidades VARCHAR(300) NOT NULL,
    vantagem VARCHAR(30) NOT NULL,
    desvantagem VARCHAR(30) NOT NULL,
    arma_inicial INT NOT NULL
);

CREATE TABLE Bencaos(
    bencao_id INT PRIMARY KEY AUTO_INCREMENT,
    deus VARCHAR(15) NOT NULL,
   	constelacao VARCHAR(20) NOT NULL,
    beneficios VARCHAR(100) NOT NULL,
    bencaos VARCHAR(50) NOT NULL
);

CREATE TABLE Conta(
    conta_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(15) NOT NULL,
   	senha VARCHAR(15) NOT NULL,
    Regiao_ID INT NOT NULL,
    status_conta INT NOT NULL,
    FOREIGN KEY (Regiao_ID) REFERENCES Regioes(Regiao_ID),
    FOREIGN KEY (Status_conta) REFERENCES Status_geral(Status_geral_ID) 
);

CREATE TABLE Equipamentos(
    equipamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
   	type_id INT NOT NULL,
    Raridade INT NOT NULL,
    nivel_requerido INT NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    FOREIGN KEY (type_id) REFERENCES Tipo(Tipo_ID) 
);

CREATE TABLE Tipo(
    tipo_id INT PRIMARY KEY AUTO_INCREMENT,
    classe_item VARCHAR(15) NOT NULL,
   	dano INT NOT NULL,
    armadura INT NOT NULL,
    mana INT NOT NULL,
    sorte INT NOT NULL,
    magia INT NOT NULL,
    velocidade INT NOT NULL
);

CREATE TABLE Mundo(
    mundo_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
   	descricao VARCHAR(300) NOT NULL,
    dificuldade INT NOT NULL,
    recursos_ID INT NOT NULL,
    biomas_id INT NOT NULL,
    --FOREIGN KEY (recursos_ID) REFERENCES Recursos(Recursos_ID) 
);

CREATE TABLE Recursos(
    recursos_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
   	descricao VARCHAR(300) NOT NULL,
    tipo INT NOT NULL,
    raridade INT NOT NULL,
);
CREATE TABLE Biomas(
    biomas_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
   	descricao VARCHAR(300) NOT NULL,
    tipo INT NOT NULL,
    clima VARCHAR(100) NOT NULL,
    vegetacao VARCHAR(300) NOT NULL,
    fauna VARCHAR(300) NOT NULL,
    Recursos_BIO INT NOT NULL,
);

CREATE TABLE Regioes(
    Regiao_id INT PRIMARY KEY AUTO_INCREMENT,
    regiao VARCHAR(15) NOT NULL,
    cidade VARCHAR(15) NOT NULL,
    status INT NOT NULL,
   	Bioma_REG VARCHAR(15) NOT NULL,
    FOREIGN KEY (Bioma_REG) REFERENCES Biomas(Biomas_ID) 
);

CREATE TABLE Status_geral(
    Status_geral_id INT PRIMARY KEY AUTO_INCREMENT,
    status INT NOT NULL,
   	informacoes VARCHAR(15) NOT NULL,
);

CREATE TABLE Atributos(
    Atributos_id INT PRIMARY KEY AUTO_INCREMENT,
    Vida INT NOT NULL,
    Mana INT NOT NULL,
    Ataque INT NOT NULL,
    Defesa INT NOT NULL,
    Experiencia INT NOT NULL,
    Drops INT NOT NULL
);

CREATE TABLE Criaturas(
    Criaturas_id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(300) NOT NULL,
    Tipo INT NOT NULL,
    Nivel INT NOT NULL,
    Atributos_ID INT NOT NULL,
    Biomas_ID INT NOT NULL,
    FOREIGN KEY (Atributos_ID) REFERENCES Atributos(Atributos_ID),
    FOREIGN KEY (biomas_ID) REFERENCES Biomas(Biomas_ID) 
    );

CREATE TABLE Magias(
    Magias_id INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(300) NOT NULL,
    Tipo INT NOT NULL,
    Nivel INT NOT NULL,
    Elemento VARCHAR(30) NOT NULL,
    Materiais VARCHAR(30) NOT NULL,
    );
