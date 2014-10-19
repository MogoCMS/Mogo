<!--login modal-->
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <h1 class="text-center"><img src="templates/main/images/logo.png" height="80" alt="RediMongo"></h1>
          <p>Below is the install form to get you started - once you have filled out the config.php file manually with the correct connection to your mongoDB database. You will need to fill this form out - only after this will you be able to use RediMongo.</p>
          <p>Pleae remove the install.php from the redi-admin folder once completed - as any user that fills this form in will be set with admin rights</p>
      </div>
      <div class="modal-body">
          <form method="post" class="form col-md-12 center-block">
            <div class="form-group">
              <input type="text" name="username" class="form-control input-lg" placeholder="Admin Username">
            </div>
            <div class="form-group">
              <input type="password" name="password" class="form-control input-lg" placeholder="Admin Password">
            </div>
            <div class="form-group">
              <input type="text" name="firstname" class="form-control input-lg" placeholder="First Name">
            </div>
            <div class="form-group">
              <input type="text" name="lastname" class="form-control input-lg" placeholder="Last Name">
            </div>
            <div class="form-group">
              <input type="email" name="email" class="form-control input-lg" placeholder="email@emailaddress.com">
            </div>
            
            <div class="form-group">
              <button class="btn btn-success btn-lg btn-block">Run Install</button>
             
            </div>
          </form>
      </div>
      <div class="modal-footer">
         
      </div>
  </div>
  </div>
</div>