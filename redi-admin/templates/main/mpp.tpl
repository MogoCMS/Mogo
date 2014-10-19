<div class="panel panel-default">
   <div class="panel-heading">
     <div class="row top-buffer">
        <div class="col-md-12">
           <div class="btn-group">
                <a href="<?=$link;?>" class="btn btn-primary">
                    New <?=ucfirst($_GET['t']);?>
                </a>
            </div>
        </div>
    </div>
      
   </div>
   <div>
      <table class="table">
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>Title</th>
                <th>Description</th>
                <th>Comments</th>
                <th>Likes</th>
                <th style="width:50px !important;"></th>
             </tr>
            </thead>
            <tbody>
             <?php
                foreach($items as $item){
             ?>
              <tr>
                <td><a href="edit_post/<?=$item['_id'];?>" title="<?=$item['title'];?>">Edit</a></td>
                <td><?=$item['title'];?></td>
                <td><?=$item['description'];?></td>
                <td></td>
                <td></td>
                <td><button class="btn btn-sm btn-danger">X</button></td>
              </tr>
              <?php
                }
              ?>
              
            </tbody>
          </table>
   </div>
</div>
