
<div class="container-full">
     <div class="mainpic">
         <h1 class="sitename">RussellHarrower.com</h1><h2 class="tagline">Who knows where life will take you!</h2>
     </div>
</div>

<div class="container" style="margin; 0 5px;">


<div id="content" class="row top-buffer">

<?php
$o = 0;
foreach($blog as $post)
{
?>
  <div class="col-lg-4 col-md-4 col-sm-4">
    <div class="thumbnail">
	<?php
	if(!empty($post['main_image']))
	{
		echo '<img src="'.$post['main_image'].'" alt="'.$post['title'].'" style="width:300px !important; height:150px; overflow:none;">';
	}
	else{
		echo '<img data-src="holder.js/300x150" alt="...">';
	}
	?>
      <div class="caption">
        <h3><?=$post['title'];?></h3>
        <p>
        <?php
          $content = html_entity_decode($post['content']);
          preg_match('/^([^.!?]*[\.!?]+){0,3}/', strip_tags($content), $abstract);
          echo self::limit_words($abstract[0],30)
        ?>...</p>
        <p><a href="//<?=SITEURL;?>/<?=$post['url'];?>" class="btn btn-default" role="button">Read More</a></p>
      </div>
    </div>
  </div>
<?php
	$o++;
    if($o > 2)
    {
    $o = 0; echo ' <div class="clearfix visible-md-block" style="width:100% !important; float:left; display:block !important; height:2px !important;"></div>';
    }
	$lastid = $post['_id'];
}
  if(!empty($cat)){$cat = $cat['_id'];}
?>

</div>
<script>
	var last_id = '<?=Syscore::getfirst_blog_id();?>';
	var id='<?=$lastid;?>';
  var cat='<?=$cat;?>';
	 //alert(id);
</script>
<script src="//<?=SITEURL;?>/templates/main/js/main.js"></script>
<button id="loadmore" class="btn btn-block btn-default" onclick="loadmore();">Load More here</button>

</div>
