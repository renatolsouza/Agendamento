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
  `DATAAGENDA` datetime DEFAULT NULL,
  `CODCLINICA` int(11) DEFAULT NULL,
  `NUMEROATENDIMENTO` int(11) DEFAULT NULL,
  `CODPACIENTE` int(11) DEFAULT NULL,
  `CODPLANO` int(11) DEFAULT NULL,
  `SITUACAOAGENDA` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODAGENDA`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.agenda: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` (`CODAGENDA`, `DATAAGENDA`, `CODCLINICA`, `NUMEROATENDIMENTO`, `CODPACIENTE`, `CODPLANO`, `SITUACAOAGENDA`) VALUES
	(1, '2020-04-10 00:00:00', 1, 1, 4, 1, 2),
	(2, '2020-04-10 00:00:00', 1, 2, 3, 2, 5),
	(3, '2020-04-10 00:00:00', 1, 3, 5, 4, 4),
	(4, '2020-04-10 00:00:00', 2, 1, 6, 2, 2),
	(5, '2020-04-10 00:00:00', 2, 2, 9, 1, 1),
	(6, '2020-04-10 00:00:00', 2, 3, 14, 4, 1),
	(7, '2020-04-11 00:00:00', 1, 1, 5, 1, 2),
	(8, '2020-04-11 00:00:00', 1, 2, 6, 2, 1),
	(9, '2020-04-11 00:00:00', 1, 3, 7, 2, 1),
	(10, '2020-04-10 00:00:00', 2, 4, 22, 1, 1),
	(11, '2020-04-11 00:00:00', 1, 4, 20, 1, 1);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;

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
	(1, 'CLINICA 001', 'RUA 001 BAIRRO DAS CLINICAS', '23.014.390/0006-76', '(62)3110-0999'),
	(2, 'clinica 002', 'rua 002 bairro das clinicas', '23.014.390/0001-54', '(62)3110-0010'),
	(3, 'Clinica Teste', 'Avenida Primeira Avenida', '41.866.941/0001-90', '(62)8584-5372');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.paciente: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`CODPACIENTE`, `NOME`, `ENDERECO`, `TELEFONE`, `CPF`, `PLANO`) VALUES
	(1, 'Renato Leandro', 'Rua 15 n° 111', '(62)3110-0010', '760.894.791-84', NULL),
	(2, 'Pedro Leandro', 'Rua 15 n° 111', '(62)3110-0010', '760.894.791-83', NULL),
	(3, 'Antonio Leandro', 'Rua 15 n° 111', '(62)3110-0010', '856.369.559-87', NULL),
	(4, 'Felipe Leandro', 'Rua 15 n° 111', '(62)3110-0010', '760.894.791-81', NULL),
	(5, 'Paciente 01', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(6, 'Paciente 02', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(7, 'Paciente 03', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(8, 'Paciente 04', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(9, 'Paciente 05', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(10, 'Paciente 06', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(11, 'Paciente 07', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(12, 'Paciente 08', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(13, 'Paciente 09', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(14, 'Paciente 10', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(15, 'Paciente 11', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(16, 'Paciente 12', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(17, 'Paciente 13', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(18, 'Paciente 14', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(19, 'Paciente 15', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(20, 'Paciente 16', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(21, 'Paciente 17', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(22, 'Paciente 18', 'Rua', '(62)1111-1111', '111.111.111.11', NULL),
	(23, 'Paciente 19', 'Rua', '(62)1111-1111', '111.111.111.11', NULL);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.plano
DROP TABLE IF EXISTS `plano`;
CREATE TABLE IF NOT EXISTS `plano` (
  `CODPLANO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `DESCRICAO` varchar(255) DEFAULT NULL,
  `NUMEROPLANO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODPLANO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.plano: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
INSERT INTO `plano` (`CODPLANO`, `NOME`, `DESCRICAO`, `NUMEROPLANO`) VALUES
	(1, 'SEM PLANO', 'SEM PLANO', '00000'),
	(2, 'UNIMED', 'PLANO', '456666'),
	(3, 'PROMED', 'PLANO', '123333'),
	(4, 'SULAMERICA', 'PLANO', '789999'),
	(5, 'IPASGO', 'PLANO DE SAUDE DO ESTADO', '12345');
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;

-- Copiando estrutura para tabela clinica.situacao
DROP TABLE IF EXISTS `situacao`;
CREATE TABLE IF NOT EXISTS `situacao` (
  `CODSITUACAO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODSITUACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela clinica.situacao: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `situacao` DISABLE KEYS */;
INSERT INTO `situacao` (`CODSITUACAO`, `NOME`) VALUES
	(1, 'Aguardando atendimento'),
	(2, 'Atendido'),
	(3, 'Não compareceu'),
	(4, 'Cancelado pelo Usuário'),
	(5, 'Cancelado pela Clínica');
/*!40000 ALTER TABLE `situacao` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
