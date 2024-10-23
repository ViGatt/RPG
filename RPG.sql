-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/10/2024 às 19:03
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rpg`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atributos`
--

CREATE TABLE `atributos` (
  `Atributos_id` int(11) NOT NULL UNIQUE,
  `Vida` int(11) NOT NULL,
  `Mana` int(11) NOT NULL,
  `Ataque` int(11) NOT NULL,
  `Defesa` int(11) NOT NULL,
  `Experiencia` int(11) NOT NULL,
  `Drops` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atributos`
--

INSERT INTO `atributos` (`Atributos_id`, `Vida`, `Mana`, `Ataque`, `Defesa`, `Experiencia`, `Drops`) VALUES
(1, 10, 8, 7, 5, 3, 'Moedas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bencaos`
--

CREATE TABLE `bencaos` (
  `bencao_id` int(11) NOT NULL UNIQUE,
  `deus` varchar(15) NOT NULL,
  `constelacao` varchar(20) NOT NULL,
  `beneficios` varchar(100) NOT NULL,
  `bencaos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `bencaos`
--

INSERT INTO `bencaos` (`bencao_id`, `deus`, `constelacao`, `beneficios`, `bencaos`) VALUES
(1, 'Zeus', 'Delta', 'Atributos de sorte e força ', 'Cura e resistencia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `biomas`
--

CREATE TABLE `biomas` (
  `biomas_id` int(11) NOT NULL UNIQUE,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `tipo` int(11) NOT NULL,
  `clima` varchar(100) NOT NULL,
  `vegetacao` varchar(300) NOT NULL,
  `fauna` varchar(300) NOT NULL,
  `Recursos_BIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `classes`
--

CREATE TABLE `classes` (
  `classe_id` int(11) NOT NULL UNIQUE,
  `nome` varchar(30) NOT NULL,
  `habilidades` varchar(300) NOT NULL,
  `vantagem` varchar(30) NOT NULL,
  `desvantagem` varchar(30) NOT NULL,
  `arma_inicial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta`
--

CREATE TABLE `conta` (
  `conta_id` int(11) NOT NULL UNIQUE,
  `usuario` varchar(15) NOT NULL UNIQUE,
  `senha` varchar(15) NOT NULL,
  `Regiao_ID` int(11) NOT NULL,
  `status_conta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `criaturas`
--

CREATE TABLE `criaturas` (
  `Criaturas_id` int(11) NOT NULL UNIQUE,
  `Nome` varchar(100) NOT NULL,
  `Descricao` varchar(300) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Atributos_ID` int(11) NOT NULL,
  `Biomas_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamentos`
--

CREATE TABLE `equipamentos` (
  `equipamento_id` int(11) NOT NULL UNIQUE,
  `nome` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  `Raridade` int(11) NOT NULL,
  `nivel_requerido` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `magias`
--

CREATE TABLE `magias` (
  `Magias_id` int(11) NOT NULL UNIQUE,
  `Nome` varchar(100) NOT NULL,
  `Descricao` varchar(300) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `Nivel` int(11) NOT NULL,
  `Elemento` varchar(30) NOT NULL,
  `Materiais` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `magias`
--

INSERT INTO `magias` (`Magias_id`, `Nome`, `Descricao`, `Tipo`, `Nivel`, `Elemento`, `Materiais`) VALUES
(1, 'Bola de fogo', 'Solta uma bola cintilante de fogo', 1, 5, 'Fogo', 'Pólvora');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mundo`
--

CREATE TABLE `mundo` (
  `mundo_id` int(11) NOT NULL UNIQUE,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `dificuldade` int(11) NOT NULL,
  `recursos_ID` int(11) NOT NULL,
  `biomas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagem`
--

CREATE TABLE `personagem` (
  `personagem_id` int(11) NOT NULL UNIQUE,
  `nome` varchar(255) NOT NULL,
  `nacionalidade` varchar(100) NOT NULL,
  `raca` int(11) NOT NULL,
  `genero` char(1) NOT NULL,
  `Classe` int(11) NOT NULL,
  `Bencao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `racas`
--

CREATE TABLE `racas` (
  `racas_id` int(11) NOT NULL UNIQUE,
  `nome` varchar(30) NOT NULL,
  `forca` int(11) NOT NULL,
  `inteligencia` int(11) NOT NULL,
  `vida` char(1) NOT NULL,
  `sorte` int(11) NOT NULL,
  `magia` int(11) NOT NULL,
  `furtividade` int(11) NOT NULL,
  `regiao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `recursos`
--

CREATE TABLE `recursos` (
  `recursos_id` int(11) NOT NULL UNIQUE,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `tipo` int(11) NOT NULL,
  `raridade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recursos`
--

INSERT INTO `recursos` (`recursos_id`, `nome`, `descricao`, `tipo`, `raridade`) VALUES
(1, 'Madeira, pedra, rochas, minérios, animais, vilas', 'Uma região rica de materiais', 1, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `regioes`
--

CREATE TABLE `regioes` (
  `Regiao_id` int(11) NOT NULL UNIQUE,
  `regiao` varchar(15) NOT NULL,
  `cidade` varchar(15) NOT NULL,
  `status` int(11) NOT NULL,
  `Bioma_REG` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_geral`
--

CREATE TABLE `status_geral` (
  `Status_geral_id` int(11) NOT NULL UNIQUE,
  `status` int(11) NOT NULL,
  `informacoes` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `status_geral`
--

INSERT INTO `status_geral` (`Status_geral_id`, `status`, `informacoes`) VALUES
(1, 1, 'Ativo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo`
--

CREATE TABLE `tipo` (
  `tipo_id` int(11) NOT NULL UNIQUE,
  `classe_item` varchar(15) NOT NULL,
  `dano` int(11) NOT NULL,
  `armadura` int(11) NOT NULL,
  `mana` int(11) NOT NULL,
  `sorte` int(11) NOT NULL,
  `magia` int(11) NOT NULL,
  `velocidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo`
--

INSERT INTO `tipo` (`tipo_id`, `classe_item`, `dano`, `armadura`, `mana`, `sorte`, `magia`, `velocidade`) VALUES
(1, 'Mago', 2, 2, 7, 4, 5, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atributos`
--
ALTER TABLE `atributos`
  ADD PRIMARY KEY (`Atributos_id`);

--
-- Índices de tabela `bencaos`
--
ALTER TABLE `bencaos`
  ADD PRIMARY KEY (`bencao_id`);

--
-- Índices de tabela `biomas`
--
ALTER TABLE `biomas`
  ADD PRIMARY KEY (`biomas_id`);

--
-- Índices de tabela `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`classe_id`);

--
-- Índices de tabela `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`conta_id`),
  ADD KEY `Regiao_ID` (`Regiao_ID`),
  ADD KEY `Status_conta` (`status_conta`);

--
-- Índices de tabela `criaturas`
--
ALTER TABLE `criaturas`
  ADD PRIMARY KEY (`Criaturas_id`),
  ADD KEY `Atributos_ID` (`Atributos_ID`),
  ADD KEY `biomas_ID` (`Biomas_ID`);

--
-- Índices de tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD PRIMARY KEY (`equipamento_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Índices de tabela `magias`
--
ALTER TABLE `magias`
  ADD PRIMARY KEY (`Magias_id`);

--
-- Índices de tabela `mundo`
--
ALTER TABLE `mundo`
  ADD PRIMARY KEY (`mundo_id`),
  ADD KEY `recursos_ID` (`recursos_ID`);

--
-- Índices de tabela `personagem`
--
ALTER TABLE `personagem`
  ADD PRIMARY KEY (`personagem_id`),
  ADD KEY `raca` (`raca`),
  ADD KEY `classe` (`Classe`),
  ADD KEY `bencao` (`Bencao`);

--
-- Índices de tabela `racas`
--
ALTER TABLE `racas`
  ADD PRIMARY KEY (`racas_id`),
  ADD KEY `regiao` (`regiao`);

--
-- Índices de tabela `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`recursos_id`);

--
-- Índices de tabela `regioes`
--
ALTER TABLE `regioes`
  ADD PRIMARY KEY (`Regiao_id`);

--
-- Índices de tabela `status_geral`
--
ALTER TABLE `status_geral`
  ADD PRIMARY KEY (`Status_geral_id`);

--
-- Índices de tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`tipo_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atributos`
--
ALTER TABLE `atributos`
  MODIFY `Atributos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `bencaos`
--
ALTER TABLE `bencaos`
  MODIFY `bencao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `biomas`
--
ALTER TABLE `biomas`
  MODIFY `biomas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `classes`
--
ALTER TABLE `classes`
  MODIFY `classe_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `conta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `criaturas`
--
ALTER TABLE `criaturas`
  MODIFY `Criaturas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  MODIFY `equipamento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `magias`
--
ALTER TABLE `magias`
  MODIFY `Magias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `mundo`
--
ALTER TABLE `mundo`
  MODIFY `mundo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personagem`
--
ALTER TABLE `personagem`
  MODIFY `personagem_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `racas`
--
ALTER TABLE `racas`
  MODIFY `racas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `recursos`
--
ALTER TABLE `recursos`
  MODIFY `recursos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `regioes`
--
ALTER TABLE `regioes`
  MODIFY `Regiao_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status_geral`
--
ALTER TABLE `status_geral`
  MODIFY `Status_geral_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `tipo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `conta`
--
ALTER TABLE `conta`
  ADD CONSTRAINT `Regiao_ID` FOREIGN KEY (`Regiao_ID`) REFERENCES `regioes` (`Regiao_id`),
  ADD CONSTRAINT `Status_conta` FOREIGN KEY (`status_conta`) REFERENCES `status_geral` (`Status_geral_id`);

--
-- Restrições para tabelas `criaturas`
--
ALTER TABLE `criaturas`
  ADD CONSTRAINT `Atributos_ID` FOREIGN KEY (`Atributos_ID`) REFERENCES `atributos` (`Atributos_id`),
  ADD CONSTRAINT `biomas_ID` FOREIGN KEY (`Biomas_ID`) REFERENCES `biomas` (`biomas_id`);

--
-- Restrições para tabelas `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD CONSTRAINT `equipamentos_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `tipo` (`tipo_id`);

--
-- Restrições para tabelas `mundo`
--
ALTER TABLE `mundo`
  ADD CONSTRAINT `recursos_ID` FOREIGN KEY (`recursos_ID`) REFERENCES `recursos` (`recursos_id`);

--
-- Restrições para tabelas `personagem`
--
ALTER TABLE `personagem`
  ADD CONSTRAINT `bencao` FOREIGN KEY (`Bencao`) REFERENCES `bencaos` (`bencao_id`),
  ADD CONSTRAINT `classe` FOREIGN KEY (`Classe`) REFERENCES `classes` (`classe_id`),
  ADD CONSTRAINT `raca` FOREIGN KEY (`raca`) REFERENCES `racas` (`racas_id`);

--
-- Restrições para tabelas `racas`
--
ALTER TABLE `racas`
  ADD CONSTRAINT `regiao` FOREIGN KEY (`regiao`) REFERENCES `regioes` (`Regiao_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
