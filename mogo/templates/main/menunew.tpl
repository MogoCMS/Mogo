<form method="post" action="#submit">
<div class="row top-buffer">
    <div class="col-md-8">
        <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><input type="text" class="form-control create-input" name="title" placeholder="Menu Title"></h3>
            </div>
            <div>
            </div>
          </div>




           <div id="load-pages" class="panel panel-default">
            <div class="panel-heading">
                 <h3 class="panel-title">Select Page</h3>
            </div>
            <div>


           <table class="table">

            <tbody>
             <?php
                foreach($items as $item){
             ?>
              <tr>
                <td><?=$item['title'];?></td>

                <td><input id="pagetask" type="checkbox" value="<?=$item['_id'];?>" name="task"></td>
              </tr>
              <?php
                }
              ?>

            </tbody>
          </table>






            </div>
          </div>


            <div id="load-plugin" class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Select Plugin</h3>
            </div>
            <div>


              This area will come later








            </div>
          </div>

          <div id="load-url" class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">URL</h3>
            </div>
            <div>
            <label>Where are we directing your users?</label>
            <input id="urlfield" type="text" name="task" placeholder="http://site.com/" >







            </div>
          </div>


    </div>

    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Settings</h3>
            </div>
            <div class="panel-body">
               <label> Select Task </label>
               <select name="menutask" class="btn btn-lg btn-default" style="width:100% !important; margin-bottom:5px;">
                    <option selected>Select</option>
                    <option value="page">Page</option>
                    <option value="url">URL</option>
                    <option value="plugin">Plugin</option>
                </select>
                <label>Is this a sub-menu?</label>
                <select name="submenu" class="btn btn-lg btn-default" style="width:100% !important; margin-bottom:5px;">
                  <option selected desiabled>no</option>
                  <option value="0">no</option>
                  <option value="1">yes</option>
                </select>
                <label>Where should we place this link?</label>
                <select name="menulevel" class="btn btn-lg btn-default" style="width:100% !important; margin-bottom:5px;">
                    <option value="0" selected>Main Menu</option>
                    <?php
                    if(!empty($menus))
                    {
                        foreach($menus as $menu){
                    ?>
                    <option value="<?=$menu['_id'];?>"><?=$menu['title'];?></option>
                    <?php
                        }
                    }
                    ?>
                </select>

            </div>
          </div>


     </div>
</div>
<button type="submit" class="btn btn-primary" style="width:100% !important;">Submit</button>
</form>
