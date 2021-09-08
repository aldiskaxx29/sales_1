<?php 

class LaporanSales extends CI_Controller{
	public function index(){
		$data['title'] = 'Data Sales';
		$data['user'] = $this->M_pimpinan->get_where();
		$data['sales'] = $this->M_pimpinan->tampilSales();
		$this->load->view('templates/header', $data);
		$this->load->view('templates/sidebar', $data);
		$this->load->view('templates/topbar', $data);
		$this->load->view('pimpinan/LaporanSales/data', $data);
		$this->load->view('templates/footer');
	}
}