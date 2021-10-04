<?php 

class Role extends CI_Controller{
	public function __construct(){
		parent::__construct();
		auth_check();	
		$this->load->model('M_admin','admin');
	}

	public function index(){
		$data = [
			'title' => 'Data Role',
			'role'  => $this->admin->get('company'),
			'user'  => $this->admin->get_where(),
		];
		$this->form_validation->set_rules('role','Role','required|trim', [
			'required' => 'Tdak boleh kosong',
		]);

		if ($this->form_validation->run() == false) {
			$this->load->view('templates/header', $data);
			$this->load->view('templates/sidebar', $data);
			$this->load->view('templates/topbar', $data);
			$this->load->view('admin/role/data', $data);
			$this->load->view('templates/footer');
		}
		else{
			$role = $this->input->post('role');
			$data = ['role' => $role];

			$this->admin->insert($data, 'company');
			$this->session->set_flashdata('role','<div class="alert alert-success">Data Berhasil Di Tambahkan</div>');
			redirect('Admin/Role');
		}	
	}

	public function edit(){
		$id =  $this->input->post('id');
		$role = $this->input->post('role');

		$data = ['role' => $role];
		$where = ['id_company' => $id];

		$this->admin->edit($where,$data, 'company');
		$this->session->set_flashdata('role','<div class="alert alert-success">Data Berhasil Di Ubah</div>');
		redirect('Admin/Role');
	}

	public function delete($id){	
		$where = ['id_company' => $id];
		$this->admin->delete($where,'company');
		$this->session->set_flashdata('role','<div class="alert alert-success">Data Berhasil Di Hapus</div>');
		redirect('Admin/Role');
	}
}