@extends('layouts.dashboard')
@section('page_heading','Detail Lembur Pegawai')
@section('breadcrumb')
<ol class="breadcrumb float-sm-right">
  <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
  <li class="breadcrumb-item"><a href="{{url('lembur')}}">Lembur Pegawai</a></li>
  <li class="breadcrumb-item active">Tambah Detail Lembur Pegawai</li>
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
		  <form role="form" id="tambahlemburdetail" method="post" action="{{url('prosestambahlemburdetail')}}" >
		  	{{ csrf_field() }}
	
			<div class="card-body">
				<div class="row">
				    <div class="col-md-6">
			        	
			          <input type="hidden" name="id_header" class="form-control" id="txtIDHeader" value="{{$lemburheader->id}}"></input>

				      <div class="form-group">
				        <label>Nama Pegawai</label>
				        <select name="pegawai" class="form-control select2bs4" style="width: 100%;">
		                    <option value="" selected="selected">-- Pilih Satu --</option>
		                    @foreach($pegawai as $data)
		                        <option value="{{$data->id}}">{{$data->nama}}</option>
		                    @endforeach
		                </select>
				      </div>
				      <div class="form-group">
				        <label>NIP</label>
				        <input type="text" name="nip" class="form-control" id="txtNIP" placeholder="NIP" readonly>
				      </div>
				      <div class="form-group">
				        <label>Golongan</label>
				        <input type="text" name="golongan" class="form-control" id="txtGolongan" placeholder="Golongan" readonly>
				      </div>
				    </div>
				    <div class="col-md-6">
				    	<div class="form-group">
					        <label>Tanggal Lembur</label>
					        <div class="row">
					        	 <div class="col-md-5">
							        <div class="input-group date">
					                  <input type="text" name="tanggal_lembur_awal" class="form-control" id="datepickerawal" placeholder="dd/mm/yyyy" value="{{date('d/m/Y', strtotime(now()))}}">
					                  <div class="input-group-prepend">
					                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
					                  </div>
				                	</div>
				                </div>
				                <div class="col-md-1">
				            		<h5>s/d</h5>
				                </div>
				                <div class="col-md-5">
				                	<div class="input-group date">
					                  <input type="text" name="tanggal_lembur_akhir" class="form-control" id="datepickerakhir" placeholder="dd/mm/yyyy" value="{{date('d/m/Y', strtotime(now()))}}">
					                  <div class="input-group-prepend">
					                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
					                  </div>
				                	</div>
				                </div>
			                </div>
				      	</div>
					    <div class="form-group">
					      	<label>Bidang Pekerjaan</label>
					        <input type="text" name="bidang_pekerjaan" class="form-control" id="txtBidangPekerjaan" Placeholder="Bidang Pekerjaan"></textarea>
					    </div>

					    <div class="form-group">
					      	<label>Uraian Pekerjaan</label>
					        <textarea name="uraian_pekerjaan" class="form-control" id="txtUraianPekerjaan" rows="2" placeholder="Keterangan"></textarea>
					    </div>
					</div>
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
<script src="{{asset('js/jquery.min.js')}}"></script>
<script>
	$(document).ready(function () {
	  $('#tambahkodearsip').validate({
	    rules: {
	      nama: {
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
	      nama: {
	        required: "Nama Pegawai harus diisi."
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


	  	//datepicker
	    $('#datepickerawal').datepicker({
	      format: 'dd/mm/yyyy',
	      autoclose: true
		})

		$('#datepickerakhir').datepicker({
	      format: 'dd/mm/yyyy',
	      autoclose: true
		})
	});
</script>
@endsection