<html>
    <head>
        <title>Toko Buku Online - By Lukman</title>
        <link rel="stylesheet" href="css/framelayout.css" type="text/css">
    </head>
    <body>
        <?php
            include ("dbconn.php");
            $btnCari = $_POST['btnCari'];

            if (!isset($btnCari)) {
                exit();
            }

            $comboCari = $_POST['comboCari'];
            $txtCari = $_POST['txtCari'];

            switch ($comboCari) {
                case 0: {
                    $label = "Hasil pencarian buku <u>berdasarkan judul</u> '<strong>$txtCari</strong>':";
                    $str = "upper(a.buku_judul) like upper('%txtCari%')";
                    break;
                }

                case 1: {
                    $label = "Hasil pencarian buku berdasarkan <u>nama pengarang</u> '<strong>$txtCari</strong>':";
                    $str = "upper(c.pengarang_nama) like upper('%txtCari%')";
                    break;
                }

                case 2: {
                    $label = "Hasil pencarian buku berdasarkan <u>nama penerbit</u> '<strong>$txtCari</strong>':";
                    $str = "upper(b.penerbit_nama) like upper('%txtCari%')";
                    break;
                }
            }
        ?>
        <h2>Hasil Pencarian Buku</h2>
        <p><?php echo $label ?></p>
        <br>

        <?php
            $query = "select distinc
                        a.buku_isbn,
                        a.buku_judul,
                        b.penerbit_nama,
                        a.buku_harga
                    from
                        buku a,
                        penerbit b,
                        pengarang c,
                        link_buku_pengarang d
                    where
                        a.penerbit_id = b.penerbit_id and
                        a.buku_isbn = d.buku_isbn and
                        c.pengarang_id = d.pengarang_id and ".
                        $str;
            
            $result = mysqli_query($link, $query);
            if ($result) {
                ?>
                <table class="buku">
                    <tr>
                        <th width="50">ISBN</th>
                        <th width="280">Judul</th>
                        <th width="150">Penerbit</th>
                        <th width="80">Harga</th>
                        <th>Detail</th>
                    </tr>
                    <?php
                        while ($row = mysqli_fetch_array($result)) {
                            ?>
                            <tr>
                                <td><?php echo $row[0]; ?></td>
                                <td align="left"><?php echo $row[1]; ?></td>
                                <td align="left"><?php echo $row[2]; ?></td>

                                <td align="right">
                                    <?php echo "Rp " . number_format($row[3], 0, '', '.') . ",-"; ?>
                                </td>
                                <td>
                                    <a href="detailbuku.php?isbn=<?php echo $row[0]; ?>">Lihat Detail</a>
                                </td>
                            </tr>
                            <?php
                        }
                    ?>
                </table>
                <?php
                mysqli_free_result($result);
            }
        ?>
    </body>
</html>