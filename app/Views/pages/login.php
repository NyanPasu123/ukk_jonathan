<?= view('layout/header')?>


<div class="unix-login">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="login-content">
                    <div class="card">
                    <div class="login-form">
                        <h4>Perpustakaan Digital</h4>
                        <?php if(!empty($error)) { 
                        implode('', $errors->all('<div style="color: red;">:message</div>')); 
                        } ?>
                        <form action="/home/aksi_login" method="POST">
                            <div class="form-group">
                                <label>Username :</label>
                                <input type="text" id="username" name="username" class="form-control" placeholder="Username" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label>Password :</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                            </div>
                           
                          <button type="submit" class="btn btn-primary col-lg-4 align-right">Login</button>
                      </form><br>

                      <sub><b>Tidak punya akun? <a href="/home/register">Klik Link Berikut</b></a></sub>
                  </div>
                    </div>
              </div>
          </div>
      </div>
  </div>
</div>

<?= view('layout/footer')?>