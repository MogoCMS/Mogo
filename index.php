<?php
//phpinfo();die;
error_reporting(E_ALL);
session_start();
require_once("system/limon/limonade.php");
require_once("system/config.php");
require_once("system/core.php");
$uris = explode("/", $_GET['uri']);

$i=0;
foreach($uris as $u)
{
  if(!$i == 0)
  {
  define("URI_".$i, $u);
  }
  else
  {
  define("URI_0", NULL);
  }
  $i++;
}
$redi = new syscore();
$redi->settings();

dispatch("/**", array($redi, 'fetchmenuitem'));
dispatch("/**", array($redi, 'fetchmenuitem'));

run();
?>
