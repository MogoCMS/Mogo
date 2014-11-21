<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><?=$title;?></title>
    <meta name="keywords" content="<?=$meta['keywords'];?>" />
   	<meta name="description" content="<?=$meta['desc'];?>" />
   	<meta name="twitter:card" value="summary">
   	<meta name="twitter:site" content="@russellharrower">
	<meta name="twitter:title" content="<?=$title;?>">
	<meta name="twitter:description" content="<?=$meta['desc'];?>">
	<meta name="twitter:creator" content="@russellharrower">
	<meta name="twitter:image" content="<?=$meta['image'];?>">
   	
   	<meta property="og:title" content="<?=$title;?>" />
	<meta property="og:type" content="article" />
	<meta property="og:url" content="//<?=SITEURL;?><?=$_REQUEST['uri'];?>" />
	<meta property="og:image" content="<?=$meta['image'];?>" />
	<meta property="og:description" content="<?=$meta['desc'];?>" />
   	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//<?=SITEURL;?>/templates/main/style/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//<?=SITEURL;?>/templates/main/style/css/bootstrap-theme.min.css">

        <link rel="stylesheet" href="//<?=SITEURL;?>/templates/main/style/css/russellharrower.css">
        <!-- Latest compiled and minified JavaScript -->

        <script src="//<?=SITEURL;?>/templates/main/js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript">var switchTo5x=true;</script>
   		<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
		<script type="text/javascript">stLight.options({publisher: "13ba6589-afa9-47f8-b363-211f275df0e4", doNotHash: false, doNotCopy: false, hashAddressBar: true});</script>
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
                <a class="navbar-brand" rel="home"  href="#"><img src="//<?=SITEURL;?>/templates/main/images/small-logo.png" width="40" height="40" alt="RussellHarrower.com"></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                <?php
                    foreach($menu as $item){
                      if(empty($item['submenu'])){
                        if(MongoId::isValid ($item['task']) == 1)
                        {
                          $link = self::fetch_link($item['task']);
                          
                        }
                        else
                        {
                          $link = array();
                          $link['url'] = $item['task'];
                        }
                      ?>
                        <li <?php if(URI_1 == $link['url']){echo 'class="active"';}?>><a href="//<?=SITEURL;?>/<?=$link['url'];?>"><?=$item['title'];?></a></li>
                      <?php
                      }
                      else
                      {
                      	if(MongoId::isValid ($item['task']) == 1)
                        {
                          $link = self::fetch_link($item['task']);
                          
                        }
                        else
                        {
                          $link = array();
                          $link['url'] = $item['task'];
                        }
                      ?>
                            <li class="dropdown
                            <?php if(URI_1 == $link){
                               echo ' active';
                            }?>
                            ">
                              <a href="//<?=SITEURL;?>/<?=$link['url'];?>" class="dropdown-toggle" data-toggle="dropdown"><?=$item['title'];?><span class="caret"></span></a>
                                  <ul class="dropdown-menu" role="menu">
                                    <?php
                                          foreach($item['submenu'] as $submenu)
                                          {
                                            if(MongoId::isValid ($submenu['task']) == 1)
                                            {
                                              $link = self::fetch_link($submenu['task']);
                                            }
                                            else
                                            {
                                           	$link = array();
                                            $link['url'] = $submenu['task'];
                                            }
                                            ?>
                                            <li
                                            <?php
                                            if(URI_1 == $link){
                                               echo 'class="active"';
                                            }

                                            echo '><a href="//'; print SITEURL."/".$link['url']; echo'">';
                                            print $submenu['title'];
                                            echo '</a></li>';

                                          }
                                    ?>
                                    </ul>
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
