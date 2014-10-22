<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//sysbs.com/templates/main/style/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//sysbs.com/templates/main/style/css/bootstrap-theme.min.css">

        <link rel="stylesheet" href="//sysbs.com/templates/main/style/css/russellharrower.css">
        <!-- Latest compiled and minified JavaScript -->

        <script src="//sysbs.com/templates/main/js/jquery-1.11.1.min.js"></script>
    </head>
    <body>

        <nav class="navbar navbar-inverse" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
           <div class="navbar-inner">
            <div class="container">
            <div class="navbar-header" style="margin:0;">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" rel="home"  href="#"><img src="//sysbs.com/templates/main/images/small-logo.png" width="40" height="40" alt="RussellHarrower.com"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                <?php
                    foreach($menu as $item){
                      if(empty($item['submenu'])){
                        if(MongoId::isValid ($item['task']) === 1)
                        {
                          $link = $redi->fetch_link($item['task']);
                        }
                        else
                        {
                          $link = $item['task'];
                        }
                      ?>
                        <li
                        <?php if(URI_1 == $link){
                           echo 'class="active"';
                        }
                        ?>><a href="<?=SITEURL;?><?=$item['url'];?>"><?=$item['title'];?></a></li>
                      <?php
                      }
                      else
                      {
                      ?>
                            <li class="dropdown
                            <?php if(URI_1 == $link){
                               echo ' active';
                            }?>
                            ">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?=$item['title'];?><span class="caret"></span></a>
                                  <ul class="dropdown-menu" role="menu">
                                    <?php
                                          foreach($item['submenu'] as $submenu)
                                          {
                                            if(MongoId::isValid ($submenu['task']) === 1)
                                            {
                                              $link = $redi->fetch_link($submenu['task']);
                                            }
                                            else
                                            {
                                              $link = $submenu['task'];
                                            }
                                            ?>
                                            <li
                                            <?php
                                            if(URI_1 == $link){
                                               echo 'class="active"';
                                            }

                                            echo '><a href="'; print SITEURL."".$item['title']; echo'">';
                                            print $submenu['title'];
                                            echo '</a></li>';

                                          }
                                    ?>
                            </li>
                        <?php
                      }
                    }
                    ?>

                </ul>
        </div>
        </div>
        </nav>

    <div class="container-full">
