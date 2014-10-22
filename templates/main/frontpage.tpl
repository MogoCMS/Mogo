
<div class="container-full">
     <div class="mainpic">
         <h1 class="sitename">RussellHarrower.com</h1><h2 class="tagline">Who knows where life will take you!</h2>
     </div>
</div>

<div class="container" style="margin; 0 5px;">


<div class="row top-buffer">

<?php
$blog = Syscore::load_blog();

foreach($blog as $post)
{
?>
  <div class="col-lg-4 col-md-4 col-sm-4">
    <div class="thumbnail">
      <img data-src="holder.js/300x150" alt="...">
      <div class="caption">
        <h3><?=$post['title'];?></h3>
        <p>
        <?php
          $content = html_entity_decode($post['content']);
          preg_match('/^([^.!?]*[\.!?]+){0,3}/', strip_tags($content), $abstract);
          echo $abstract[0];
        ?>...</p>
        <p><a href="<?=SITEURL;?>/<?=$post['url'];?> class="btn btn-default" role="button">Read More</a></p>
      </div>
    </div>
  </div>
<?php
}
?>


</div>


</div>
