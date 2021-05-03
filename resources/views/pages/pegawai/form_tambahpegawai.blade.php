@extends('layouts.dashboard')
@section('page_heading','Kode Arsip')
@section('breadcrumb')
<ol class="breadcrumb float-sm-right">
  <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
  <li class="breadcrumb-item"><a href="{{url('kodearsip')}}">Kode Arsip</a></li>
  <li class="breadcrumb-item active">Tambah Kode Arsip</li>
</ol>
@endsection
@section('content')
<div class="row">
	<!-- left column -->
	<div class="col-md-12">
	<!-- jquery validation -->
		<div class="card card-primary">
		  <div class="card-header">
		    <h3 class="card-title">Tambah Data</h3>
		  </div>
		  <!-- /.card-header -->
		  <!-- form start -->
		  <div class="col-md-8">
			  <form role="form" id="tambahkodearsip" method="post" action="{{url('prosestambahkodearsip')}}" >
			  	{{ csrf_field() }}
			    <div class="card-body">
			      <div class="form-group">
			        <label>Kode</label>
			        <input type="text" name="kode" class="form-control" id="txtKode" placeholder="Kode">
			      </div>
			      <div class="form-group">
			        <label>Nama Arsip</label>
			        <input type="text" name="nama_arsip" class="form-control" id="txtNamaArsip" placeholder="Nama Arsip">
			      </div>
			      <div class="form-group">
			        <label>Aktif</label>
			        <input type="text" name="aktif" class="form-control" id="txtAktif" placeholder="Retensi Arsip Aktif">
			      </div>
			      <div class="form-group">
			        <label>Inaktif</label>
			        <input type="text" name="inaktif" class="form-control" id="txtInaktif" placeholder="Retensi Arsip Inaktif">
			      </div>
			      <div class="form-group">
			        <label>Keterangan</label>
			        <textarea name="keterangan" class="form-control" id="txtKeterangan" rows="2" placeholder="Keterangan"></textarea>
			      </div>
			    </div>
			    <!-- /.card-body -->
			    <div class="card-footer">
			      <button type="submit" class="btn btn-primary">Simpan</button>
			    </div>
		  	</form>
		  </div>
		</div>
	</div>
</div>
<script src="{{asset('js/jquery.min.js')}}"></script>
<script>
	$(document).ready(function () {
	  $('#tambahkodearsip').validate({
	    rules: {
	      kode: {
	        required: true
	      },
	      nama_arsip: {
	        required: true
	      },
	      aktif: {
	        required: true,
	        number:true
	      },
	      inaktif: {
	        required: true,
	        number:true
	      },
	    },
	    messages: {
	      kode: {
	        required: "Kode harus diisi."
	      },
	      nama_arsip: {
	        required: "Nama Arsip harus diisi."
	      },
	      aktif: {
	        required: "Aktif harus diisi.",
	        number: "Aktif harus diisi dengan angka."
	      },
	      inaktif: {
	        required: "Inaktif harus diisi.",
	        number: "Inaktif harus diisi dengan angka."
	      },
	    },
	    errorElement: 'span',
	    errorPlacement: function (error, element) {
	      error.addClass('invalid-feedback');
	      element.closest('.form-group').append(error);
	    },
	    highlight: function (element, errorClass, validClass) {
	      $(element).addClass('is-invalid');
	    },
	    unhighlight: function (element, errorClass, validClass) {
	      $(element).removeClass('is-invalid');
	    }
	  });
	});
</script>
@endsection