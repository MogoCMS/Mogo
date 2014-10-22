<div class="panel panel-default">
   <div class="panel-heading">
     <div class="row top-buffer">
        <div class="col-md-12">
           <div class="btn-group">
                <a href="menu/new" class="btn btn-primary">
                    + New
                </a>
            </div>
        </div>
    </div>

   </div>
   <div class="panel-body">
       <form method="POST" action="#re-order">
      <table id="menu" class="table">
            <thead>
              <tr>
                <th>Menu</th>
                <th style="width:50px !important;">Re-order</th>
                <th style="width:50px !important;"></th>
             </tr>
            </thead>
            <tbody>
             <?php
             $a = 0;
             foreach($menus as $menu){
             ?>
              <tr id="<?=$menu['_id'];?>">
                <td><?=$menu['title'];?></td>
                <input type="hidden" name="menu[<?=$a;?>][id]" value="<?=$menu['_id'];?>">
                <td><input type="text" maxlength="2" class="form-control input-sm" value="<?php if(!empty($menu['order'])){ print $menu['order'];}?>" name="menu[<?=$a;?>][order]"></td>
                <td><button type="button" onclick="deletemenu('<?=$menu['_id'];?>');" class="btn btn-sm btn-danger">X</button></td>
              </tr>
              <?php
                   $a++;
                }
              ?>

            </tbody>
          </table>
          <br>

   </div>
   <div class="panel-footer">
        <button type="submit" class="btn btn-primary" style="width:100% !important;">Re-Order</button>
       </form>
   </div>
</div>
