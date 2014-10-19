<div class="panel panel-default">
   <div class="panel-heading">
     <div class="row top-buffer">
        <form action="categories" method="post" class="form">
        <div class="col-md-11">
            <input type="text" class="form-control create-input" name="category">
        </div>
        <div class="col-md-1">
        <button type="submit" class="btn btn-sm btn-primary">Submit</button>
        </div>
        </form>
     </div>
      
   </div>
   <div>
      <table class="table">
            <thead>
              <tr>
                <th>Category</th>
                <th>Most Liked</th>
                <th>No. Stories</th>
                <th style="width:50px !important;"></th>
             </tr>
            </thead>
            <tbody>
             <?php
                foreach($categories as $cat){
             ?>
              <tr>
                <td><?=$cat['category'];?></td>
                <td>Coming Soon</td>
                <td>0</td>
                <td><button class="btn btn-sm btn-danger">X</button></td>
              </tr>
              <?php
                }
              ?>
              
            </tbody>
          </table>
   </div>
</div>
