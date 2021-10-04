<!-- Main Content -->
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1><?= $title ?></h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="<?= base_url('Admin/Dashboard') ?>">Dashboard</a></div>
        <!-- <div class="breadcrumb-item"><a href="#">Bootstrap Components</a></div> -->
        <div class="breadcrumb-item"><?= $title ?></div>
      </div>
    </div>

    <div class="section-body">
      <div class="card">
        <div class="card-body">
          <?= $this->session->flashdata('role') ?>
          <a href="" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal"><i class="fas fa-plus"></i> Tambah Data</a>
          <hr>
          <table class="table table-striped" id="myTable">
            <thead>
              <tr>
                <th>No</th>
                <th>Nama Sales</th>
                <th>Action</th>
              </tr>
            </thead>        
            <tbody>
              <?php foreach ($role as $no => $item): ?>
                <tr>
                  <td><?= $no+1 ?></td>
                  <td><?= $item->role ?></td>
                  <td>
                    <a href="<?= base_url('Admin/Role/delete/' . $item->id_company) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin Ingin Di Hapus')"><i class="fas fa-trash"></i></a>
                    <a href="" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#exampleModalEdit<?= $item->id_company ?>"><i class="fas fa-edit"></i></a>
                  </td>
                </tr>
              <?php endforeach ?>                  
            </tbody>         
          </table>
        </div>
      </div>
    </div>
  </section>
</div>
  

<!-- Modal tambah -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal Tambah</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label>Role</label>
            <input type="text" name="role" class="form-control" value="">
            <?= form_error('role','<small class="text-danger text-form">','</small>') ?>
          </div>
          <div class="form-group float-right">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>



<!-- Modal Edit-->
<?php foreach ($role as $item): ?>
<div class="modal fade" id="exampleModalEdit<?= $item->id_company ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal Tambah</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="<?= base_url('Admin/Role/edit') ?>" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label>Role</label>
            <input type="hidden" name="id" value="<?= $item->id_company ?>">
            <input type="text" name="role" value="<?= $item->role ?>" class="form-control">
          </div>
          <div class="form-group float-right">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>  
<?php endforeach ?>