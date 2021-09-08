
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="row">
          <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
            <div class="login-brand">
              <img src="<?= base_url('assets') ?>/assets/img/stisla-fill.svg" alt="logo" width="100" class="shadow-light rounded-circle">
            </div>

            <div class="card card-primary">
              <div class="card-header"><h4 class="text-primary">Login</h4></div>
             
              <div class="card-body">
                 <?= $this->session->flashdata('user') ?>    
                <form method="POST" action="" class="needs-validation" novalidate="">
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" type="email" class="form-control" name="email" tabindex="1" required autofocus >
                    <div class="invalid-feedback">
                      Please fill in your email
                    </div>
                    <?= form_error('email','<small class="text-danger">','</small>') ?>
                  </div>

                  <div class="form-group">
                    <div class="d-block">
                    	<label for="password" class="control-label">Password</label>
                      <div class="float-right">
                       <!--  <a href="auth-forgot-password.html" class="text-small">
                          Forgot Password?
                        </a> -->
                      </div>
                    </div>
                    <input id="password" type="password" class="form-control" name="password" tabindex="2" required autocomplete="off">
                    <div class="invalid-feedback">
                      please fill in your password
                    </div>
                    <?= form_error('password','<small class="text-danger">','</small>') ?>
                  </div>

                  <!-- <div class="form-group">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me">
                      <label class="custom-control-label" for="remember-me">Remember Me</label>
                    </div>
                  </div> -->

                  <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                      Login
                    </button>
                  </div>
                </form>
                <div class="text-center ">
                  <!-- <h5 class=""><a href="<?= base_url('Auth/registrasi') ?>" class="text-primary">Dafatar Siswa Baru</a></h5> -->
                </div>
                <div class="row sm-gutters">
                 
                </div>

              </div>
            </div>
            <!-- <div class="mt-5 text-muted text-center">
              Don't have an account? <a href="<?= base_url('Auth/registrasi') ?>">Dafatar Siswa Baru</a>
            </div> -->
            <div class="simple-footer">
              Copyright &copy; Stisla 2018
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

