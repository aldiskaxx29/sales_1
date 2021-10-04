-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2021 at 10:52 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `orderan`
--

CREATE TABLE `orderan` (
  `id_order` int(200) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tgl_order` date NOT NULL,
  `qty` varchar(11) NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderan`
--

INSERT INTO `orderan` (`id_order`, `produk_id`, `kategori_id`, `id_toko`, `user_id`, `tgl_order`, `qty`, `keterangan`, `status`) VALUES
(20, 1, 6, 2, 5, '2021-09-02', '2', 'ada', 1),
(21, 3, 3, 10, 5, '2021-09-03', '1', 'box untuk makanan', 1),
(22, 4, 8, 14, 5, '2021-09-03', '1', 'ada lah', 2),
(23, 13, 5, 10, 5, '2021-09-04', '1', 'mau alat - alat vicenza nya donk', 2),
(26, 14, 4, 13, 5, '2021-09-08', '1', 'a', 0),
(29, 14, 4, 11, 5, '2021-09-08', '4', 'ada', 0);

--
-- Triggers `orderan`
--
DELIMITER $$
CREATE TRIGGER `kurang_stok` AFTER INSERT ON `orderan` FOR EACH ROW BEGIN
	UPDATE produk SET stok = stok-NEW.qty 
    WHERE id_produk = NEW.produk_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `kode_produk` varchar(10) NOT NULL,
  `nama_produk` varchar(30) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(125) NOT NULL,
  `harga_produk` varchar(13) NOT NULL,
  `stok` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `kode_produk`, `nama_produk`, `kategori_id`, `deskripsi`, `gambar`, `harga_produk`, `stok`) VALUES
(1, 'BRG00001', 'Hampers Natal', 6, 'barang dengan kualiitas terbaik', 'Basic_Elements__28141_29.jpg', '100000', '87'),
(3, 'BRG00003', 'Box Custom', 3, 'terbaik', 'pa11.png', '55000', '96'),
(4, 'BRG00004', 'Box Natal', 2, 'Untuk kkeperluan natal', 'ttd.png', '95000', '100'),
(12, 'BRG00005', 'Kabel Anti Air', 4, 'anti air', 'wa.png', '550000', '100'),
(13, 'BRG00006', 'Vicenza', 3, 'hampers untukk teman', 'pa12.png', '125000', '4'),
(14, 'BRG00007', 'Tembaga', 4, 'bahan', 'Lambang_Polri1.png', '120000', '30'),
(15, 'BRG00008', 'adalah1', 1, 'ada', 'pa13.png', '95000', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `kategori`, `date`) VALUES
(1, 'Sepanduk', '2021-08-04 16:24:40'),
(2, 'X Banner', '2021-08-07 05:41:39'),
(3, 'Lampu', '2021-08-07 05:49:44'),
(4, 'Kabel', '2021-08-07 05:49:51'),
(5, 'Besi', '2021-08-10 08:47:32'),
(6, 'Hampers', '2021-08-12 14:24:41'),
(8, 'Box', '2021-08-23 23:40:15'),
(9, 'Mainan', '2021-09-09 15:34:24');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id` int(18) NOT NULL,
  `kode_toko` varchar(20) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `alamat` varchar(170) NOT NULL,
  `rayon` varchar(50) NOT NULL,
  `no_telpon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id`, `kode_toko`, `nama_toko`, `alamat`, `rayon`, `no_telpon`) VALUES
(2, 'FE00001', 'FCS ELEKTRIK', 'citra raya', 'jakarta', '2147483647'),
(7, 'FE00002', 'FC ELEKTRIK', 'FCS ELEKTRIK', 'jakarta', '2147483647'),
(10, 'FE00004', 'Pasar online', 'sepatan', 'jakarta', '2147483647'),
(11, 'FE00005', 'Pasar Lama', 'Pasar Lama', 'jakarta', '02147483647'),
(12, 'FE00006', 'Seblak mania', 'tanah merah', 'jakarta', '893663817'),
(13, 'FE00007', 'Seblak Enak', 'Seblak mania', 'jakarta', '0893663817'),
(14, 'FE00008', 'Seblak Kuy', 'Seblak mania', 'jakarta', '0893663817'),
(16, 'FE00009', 'Toko Rumah', 'Tanah Merah', 'jakarta', '0893663817'),
(17, 'FE00010', 'Putra solution', 'jatiuwung', 'tangerang', '09897920289');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(125) NOT NULL,
  `company` varchar(11) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `active` int(11) NOT NULL,
  `created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `company`, `phone`, `active`, `created`) VALUES
(2, 'admin', 'admin@gmail.com', '$2y$10$hA1VNKNfLG242RJu08N2FuUetcBDK56RuwzFeNOnAFy7O54Ewfrv.', 'ADMIN', '09809097082', 1, '2021-07-30'),
(3, 'muhamad aldi setaiwan', 'muhamadaldisetiawan02@gmail.com', '$2y$10$SyMe0Tzk4FZpDS4Hx80Eq.GPkkkJBwM3NjF1pe.ZRMcTHVAqw0dsa', 'PIMPINAN', '09809097081', 1, '2021-07-30'),
(5, 'lutfi', 'lutfi@gmail.com', '$2y$10$PSBvF8h4jjMugeJq80W.NeFh1sfFScemhkzCJBBXtJhO.DTzm/yCS', 'SALES', '09809097082', 1, '2021-07-30'),
(6, 'verdian', 'verdian@gmail.com', '$2y$10$D8q3TWAq9puTjIndTP3vKODI7EzjgTPpYGt4bbGVyCaZGyCICzKR2', 'SALES', '09809097081', 0, '2021-08-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderan`
--
ALTER TABLE `orderan`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderan`
--
ALTER TABLE `orderan`
  MODIFY `id_order` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
