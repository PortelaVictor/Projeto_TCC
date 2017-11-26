-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Nov-2017 às 01:56
-- Versão do servidor: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `producao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `descricao`) VALUES
(11, 'Medicamentos', 'Medicamentos'),
(10, 'Alimentos', 'Alimentos'),
(9, 'Bebidas', 'Bebidas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cpfcnpj` varchar(30) DEFAULT NULL,
  `dnascimento` date NOT NULL,
  `contato` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` int(10) NOT NULL,
  `complemento` varchar(60) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `cidade` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpfcnpj`, `dnascimento`, `contato`, `email`, `cep`, `endereco`, `numero`, `complemento`, `estado`, `cidade`) VALUES
(34, 'Victor Portela Chagas', '101.291.334-84', '2017-11-25', '81996732612', 'portelavictor@hotmail.com', '50680-090', 'Rua Jose Felipe Santiago', 12, 'apt 202', 'Pernambuco', 'Recife');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientejuridico`
--

CREATE TABLE `clientejuridico` (
  `id` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `cnpj` varchar(30) DEFAULT NULL,
  `ie` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientejuridico`
--

INSERT INTO `clientejuridico` (`id`, `idcliente`, `cnpj`, `ie`) VALUES
(17, 34, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `dcompra` date NOT NULL,
  `contato` varchar(60) NOT NULL,
  `numero` varchar(14) NOT NULL,
  `totalcompra` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `compra`
--

INSERT INTO `compra` (`id`, `fornecedor`, `dcompra`, `contato`, `numero`, `totalcompra`, `status`) VALUES
(62, 5, '2017-11-25', 'Alex', '81996732613', 30, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cpfcnpj` varchar(20) NOT NULL,
  `dnascimento` date NOT NULL,
  `contato` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `numero` int(5) NOT NULL,
  `complemento` varchar(60) NOT NULL,
  `estado` varchar(60) NOT NULL,
  `cidade` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id`, `nome`, `cpfcnpj`, `dnascimento`, `contato`, `email`, `cep`, `endereco`, `numero`, `complemento`, `estado`, `cidade`) VALUES
(5, 'Alex Lima', '101.691.834-84', '1988-04-08', '81996732613', 'aaa@hotmail.com', '50610-120', 'Rua DemÃ³crito de Souza Filho', 105, 'Ao lado da MV2', 'Pernambuco', 'Recife');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedorjuridico`
--

CREATE TABLE `fornecedorjuridico` (
  `id` int(11) NOT NULL,
  `idfornecedor` int(11) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `ie` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemcompra`
--

CREATE TABLE `itemcompra` (
  `id` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valorunitario` int(11) NOT NULL,
  `valortotal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itemcompra`
--

INSERT INTO `itemcompra` (`id`, `idcompra`, `idproduto`, `quantidade`, `valorunitario`, `valortotal`) VALUES
(56, 62, 9, 10, 3, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemvenda`
--

CREATE TABLE `itemvenda` (
  `id` int(11) NOT NULL,
  `idvenda` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valorunitario` int(11) NOT NULL,
  `valortotal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itemvenda`
--

INSERT INTO `itemvenda` (`id`, `idvenda`, `idproduto`, `quantidade`, `valorunitario`, `valortotal`) VALUES
(14, 14, 9, 2, 7, 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `dvencimento` date NOT NULL,
  `categoria` int(60) NOT NULL,
  `unidade` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `descricao`, `dvencimento`, `categoria`, `unidade`, `quantidade`) VALUES
(9, 'Coca-Cola', 'Refrigerante ', '2020-06-24', 9, 'Lt', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `login` varchar(60) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `perfil` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `login`, `senha`, `perfil`) VALUES
(2, 'Victor Portela Chagas', 'portelavictor@hotmail.com', 'vportela', '5416d7cd6ef195a0f7622a9c56b55e84', 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `dvenda` date NOT NULL,
  `contato` varchar(60) NOT NULL,
  `numero` varchar(14) NOT NULL,
  `totalvenda` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `cliente`, `dvenda`, `contato`, `numero`, `totalvenda`) VALUES
(14, 34, '2017-11-25', 'Alex', '81996732613', 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientejuridico`
--
ALTER TABLE `clientejuridico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemcompra`
--
ALTER TABLE `itemcompra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `clientejuridico`
--
ALTER TABLE `clientejuridico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `itemcompra`
--
ALTER TABLE `itemcompra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `itemvenda`
--
ALTER TABLE `itemvenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
