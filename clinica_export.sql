-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.23 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para clinica
CREATE DATABASE IF NOT EXISTS `clinica` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `clinica`;

-- Copiando estrutura para tabela clinica.agenda
DROP TABLE IF EXISTS `agenda`;
CREATE TABLE IF NOT EXISTS `agenda` (
  `CODAGENDA` int(11) NOT NULL AUTO_INCREMENT,
  `CODCLINICA` int(11) DEFAULT NULL,
  `DATA` datetime DEFAULT NULL,
  PRIMARY KEY (`CODAGENDA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.agenda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.atende
DROP TABLE IF EXISTS `atende`;
CREATE TABLE IF NOT EXISTS `atende` (
  `CODATENDE` int(11) NOT NULL AUTO_INCREMENT,
  `DATA` datetime DEFAULT NULL,
  `CODCLINICA` int(11) DEFAULT NULL,
  `NUMEROATENDIMENTO` int(11) DEFAULT NULL,
  `CODPACIENTE` int(11) DEFAULT NULL,
  `CODPLANO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODATENDE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.atende: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `atende` DISABLE KEYS */;
/*!40000 ALTER TABLE `atende` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.clinica
DROP TABLE IF EXISTS `clinica`;
CREATE TABLE IF NOT EXISTS `clinica` (
  `CODCLINICA` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `ENDERECO` varchar(255) DEFAULT NULL,
  `CNPJ` varchar(50) DEFAULT NULL,
  `TELEFONE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODCLINICA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.clinica: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `clinica` DISABLE KEYS */;
INSERT INTO `clinica` (`CODCLINICA`, `NOME`, `ENDERECO`, `CNPJ`, `TELEFONE`) VALUES
	(1, 'CLINICA 001', 'RUA 001 BAIRRO DAS CLINICAS ', '76589479187', '6231100010'),
	(2, 'clinica 002', 'rua 002 bairro das clinicas', '23014390000154', '62 3110 0010'),
	(3, 'Clinica Teste', 'Avenida Primeira Avenida', '41.866.941/0001-90', '6298885554444');
/*!40000 ALTER TABLE `clinica` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.paciente
DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `CODPACIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `ENDERECO` varchar(255) DEFAULT NULL,
  `TELEFONE` varchar(50) DEFAULT NULL,
  `CPF` varchar(50) DEFAULT NULL,
  `PLANO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODPACIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.paciente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`CODPACIENTE`, `NOME`, `ENDERECO`, `TELEFONE`, `CPF`, `PLANO`) VALUES
	(1, 'Renato Leandro', 'Rua 15 n° 111', '31100010', '76089479184', NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.plano
DROP TABLE IF EXISTS `plano`;
CREATE TABLE IF NOT EXISTS `plano` (
  `CODPLANO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `NUMEROPLANO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODPLANO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.plano: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
INSERT INTO `plano` (`CODPLANO`, `NOME`, `DESCRICAO`, `NUMEROPLANO`) VALUES
	(1, 'IPASGO', 'PLANO DE SAUDE DO ESTADO', '123456');
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
