<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Techshop</title>
        <meta http-equiv="Cache-Control" content="max-age=3600, must-revalidate" />
        <link rel="stylesheet" href="../Public/css/components/header.css">
        <link rel="stylesheet" href="../Public/css/components/navbar.css">
        <link rel="stylesheet" href="../Public/css/global/common.css">
        <link rel="shortcut icon" href="../Public/img/logo/logo.png" type="image/x-icon">
    </head>
    <body>
        <?php require_once "./MVC/Views/blocks/header.php" ?>
        <?php require_once "./MVC/Views/blocks/navbar.php" ?>
        <?php require_once "./MVC/Views/pages/".$data["Page"].".php" ?>
        <?php require_once "./MVC/Views/blocks/footer.php" ?>
        <script src="../Public/js/navbar.js"></script>
    </body>
</html>
