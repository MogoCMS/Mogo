<form method="post" action="#submit">
    <input type="hidden" name="contenttype" value="post">

<div class="row top-buffer">
    <h3 class="page-header" style="margin-top:0 !important;">Create Post</h3>
    <div class="col-md-8">
        <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><input type="text" class="form-control create-input" id="titlecreate" name="title" placeholder="Posts Title" onBlur="permalinkblog(this);"></h3>
              <input type="text" name="url" id="url" class="form-control create-input" placeholder="SEO URL (Auto generated)" readonly>
            </div>
            <div>
             <textarea id="post_content" name="content" class="content" style="width:100%; height:600px;"></textarea>
            </div>
          </div>
    </div>

    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Settings</h3>
            </div>
            <div class="panel-body">
                <div class="panel-body">
                <select name="status" class="btn btn-lg btn-default" style="width:100% !important; margin-bottom:5px;">
                    <option value="draft">Draft</option>
                    <option value="publish">Published</option>
                    <option value="wait">Future Publish</option>
                </select>
                <input type="hidden" name="authorID" value="<?=$_SESSION['user_information'][0]['_id'];?>">
                <input type="text" class="form-control create-input" name="author" placeholder="Author" value="<?php print $_SESSION['user_information'][0]['mydetails']['name']['first']." ".$_SESSION['user_information'][0]['mydetails']['name']['last'];?>">

            </div>
          </div> </div>

          <div id="future_date" class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Publish On</h3>
            </div>
            <div class="panel-body">
                <?php $alert_color = "alert-warning";
                      $msg ="This will allow you to set a date for the artical to be published. The Page/Post will become viewable from midnight (12am) of the date you set.";
                      include("msg.tpl");
                ?>
                <input type="date"  class="form-control" name="publishdate">
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Category</h3>
            </div>
            <div class="panel-body">
                <select name="category" id="category" class="btn btn-lg btn-default" style="width:100% !important; margin-bottom:5px;"  onChange="permalinkblog(this);">
                    <?php
                        foreach($categories as $cat){
                    ?>
                    <option value="<?=$cat['_id'];?>"><?=$cat['category'];?></option>
                    <?php
                    }
                    ?>
                </select>
             </div>
          </div>

           <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Meta &amp; Search Data</h3>
            </div>
            <div class="panel-body">
               <input type="text" class="form-control create-input" name="description" placeholder="Description">
               <br>
               <input type="text" class="form-control create-input" name="keywords" placeholder="Keywords">
             </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Social Media</h3>
            </div>
            <div class="panel-body">
                <label>Publish to Twitter?</label>
                <select name="twitterpublish">
                    <option selected>default</option>
                    <option>no</option>
                    <option>yes</option>
                </select>

                <label>Share to Facebook?</label>
                <select name="facebookpublisbh">
                    <option selected>default</option>
                    <option>no</option>
                    <option>yes</option>
                </select>
            </div>
          </div>

     <button type="submit" class="btn btn-primary" style="width:100% !important;">Submit</button>
    </div>
</div>
</form>
