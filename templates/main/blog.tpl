<div class="container-full">
     <div class="mainpic">
         <h1 class="sitename">RussellHarrower.com</h1><h2 class="tagline">Who knows where life will take you!</h2>
     </div>
</div>

<div class="container">
    <div class="row top-buffer">
        <div class="col-lg-8">
            <article>
                <header><h1><?=$content['title'];?></h1>
                    <p class="lead">
                        Written by: <a href="#"><?=$content['author'];?></a> <br><small>Published On <?=date('d-M-y', $content['date']);?></small>
                      
                    </p>
                </header>
                
                <?=$content['content'];?>

            </article>
        </div>
    </div>
</div>