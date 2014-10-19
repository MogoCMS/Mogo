<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//<?=SITEURL;?>/redi-admin/templates/main/style/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//<?=SITEURL;?>/redi-admin/templates/main/style/css/bootstrap-theme.min.css">
        
        <link rel="stylesheet" href="//<?=SITEURL;?>/redi-admin/templates/main/style/css/mogo.css">
        <!-- Latest compiled and minified JavaScript -->
        
        
    </head>
    <body>
       
        <nav class="navbar navbar-inverse" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
           <div class="navbar-inner">
            <div class="container">
            <div class="navbar-header" style="margin:0 !important;">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" rel="home"  href="//<?=SITEURL;?>/redi-admin/#"><img src="//<?=SITEURL;?>/redi-admin/templates/main/images/small-logo.png" width="40" height="40" alt="RussellHarrower.com"></a>
            </div>
            <?php 
            if(!empty($_SESSION['user']))
            {
            ?>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="//<?=SITEURL;?>/redi-admin/home">Home</a></li>
                    <li><a href="//<?=SITEURL;?>/redi-admin/menu">Site Menu</a></li>
                    <li><a href="//<?=SITEURL;?>/redi-admin/media">Media</a></li>
                    <li class="dropdown">
                        <a href="//<?=SITEURL;?>/redi-admin/#" class="dropdown-toggle" data-toggle="dropdown">Pages<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="//<?=SITEURL;?>/redi-admin/create?t=pages">Create Page</a></li>
                                <li><a href="//<?=SITEURL;?>/redi-admin/manage?t=pages">Manage Pages</a></li>
                            </ul>
                    </li>
                    <li class="dropdown">
                        <a href="//<?=SITEURL;?>/redi-admin/#" class="dropdown-toggle" data-toggle="dropdown">Posts<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="//<?=SITEURL;?>/redi-admin/create?t=posts">New Post</a></li>
                                <li><a href="//<?=SITEURL;?>/redi-admin/manage?t=posts">Manage Posts</a></li>
                                <li class="active"><a href="//<?=SITEURL;?>/redi-admin/categories">Categories</a></li>
                            </ul>
                    </li>
                    <li class="dropdown">
                        <a href="//<?=SITEURL;?>/redi-admin/#" class="dropdown-toggle" data-toggle="dropdown">Settings <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="//<?=SITEURL;?>/redi-admin/#">Templates</a></li>
                                <li><a href="//<?=SITEURL;?>/redi-admin/#">Users</a></li>
                                <li><a href="//<?=SITEURL;?>/redi-admin/#">Comments</a></li>
                                <li><a href="//<?=SITEURL;?>/redi-admin/#">Core</a></li>
                            </ul>
                    </li>
                </ul>
                <div class="navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="#">RediUpdate <span class="badge">0</span></a></li>
                </ul>
                </div>
                
                </div><!-- /.navbar-collapse -->
        <?php 
            }
            ?>
        </div></div>
        </nav>
        
  <div class="container">
    