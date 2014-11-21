<div class="container-full">
     <div class="mainpic" <?php if(!empty($content['main_image'])){echo "style=\"background:url('".$content['main_image']."'); background-position:center;\"";}?>   >
  
     </div>
</div>

<div class="container">
    <div class="row top-buffer">
        <div class="col-lg-8">
            <article>
                <header><h1><?=$content['title'];?></h1>
                    <p class="lead">
                        Written by: <a href="http://www.twitter.com/russellharrower" title="Russell Harrower Twitter"><?=$content['author'];?></a> <br><small>Published On <?=date('d-M-y', $content['date']);?></small>
                      
                    </p>
                </header>
                
                <?=$content['content'];?>

            </article>
            
            <div class="well">
            	<div id="disqus_thread"></div>
    			<script type="text/javascript">
        			/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        			var disqus_shortname = 'russellharrower'; // required: replace example with your forum shortname

        			/* * * DON'T EDIT BELOW THIS LINE * * */
        			(function() {
            			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            			dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        			})();
    			</script>
    			<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    
            </div>
        </div>
        
        <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-4">
            	<!-- Blog Social Wall -->
                <div class="well">
                    <h4>Share Post</h4>
                    <div>
						<span class='st_twitter_large' displayText='Tweet'></span>
						<span class='st_facebook_large' displayText='Facebook'></span>
						<span class='st_googleplus_large' displayText='Google +'></span>
						<span class='st_pinterest_large' displayText='Pinterest'></span>
						<span class='st_linkedin_large' displayText='LinkedIn'></span>
						<span class='st_email_large' displayText='Email'></span>

                    </div>
                    <!-- /.input-group -->
                </div>
            </div>
    </div>
</div>