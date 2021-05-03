@extends('layouts.dashboard')
@section('page_heading','Lembur Pegawai')
@section('breadcrumb')
<ol class="breadcrumb float-sm-right">
  <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
  <li class="breadcrumb-item"><a href="{{url('lembur')}}">Lembur Pegawai</a></li>
  <li class="breadcrumb-item active">Tambah Lembur Pegawai</li>
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
	      <div>
	        @if(Session::has('message'))
	            <input type="hidden" name="txtMessage" id="idmessage" value="{{Session::has('message')}}"></input>
	            <input type="hidden" name="txtMessage_text" id="idmessage_text" value="{{Session::get('message')}}"></input>
	        @endif
	      </div>
		  <!-- /.card-header -->
		  <!-- form start -->
		  <form role="form" id="ubahlembur" method="post" action="{{url('prosesubahlembur')}}" >
		  	{{ csrf_field() }}
	
			<div class="card-body">
				<div class="row">
				    <div class="col-md-6">
				      
			          <input type="hidden" name="id" class="form-control" id="txtID" value="{{$lemburheader->id}}"></input>
			      	 
				      <div class="form-group">
				        <label>No. Surat</label>
				        <input type="text" name="no_surat" class="form-control" value="{{$lemburheader->no_surat}}" id="txtNoSurat" placeholder="Nomor Surat">
				      </div>
				      <div class="form-group">
				        <label>Tanggal Surat</label>
				        <div class="input-group date">
		                  <input type="text" name="tanggal_surat" class="form-control" value="{{date('d/m/Y', strtotime($lemburheader->tanggal_surat))}}" id="datepicker" placeholder="dd/mm/yyyy" value="{{date('d/m/Y', strtotime(now()))}}">
		                  <div class="input-group-prepend">
		                      <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
		                  </div>
	                	</div>
			      	  </div>
			      	  <div class="card">
			      	  	<div class="card-header">
			                <h4 class="card-title"><b>Yang Mengusulkan</b></h4>
			            </div>
			            <div class="card-body">
			      	      <div class="form-group">
					        <label>Nama</label>
					        <select name="diusulkan" class="form-control select2bs4" style="width: 100%;">
			                    <option value="" selected="selected">-- Pilih Satu --</option>
			                    @foreach($pegawai as $data)
			                        <option value="{{$data->id}}" @if($data->id == $lemburheader->diusulkan) selected @endif>{{$data->nama}}</option>
			                    @endforeach
			                </select>
					      </div>
					      <div class="form-group">
					        	<label>Jabatan</label>
					        	<input type="text" name="jabatan_pengusul" class="form-control" value="{{$lemburheader->jabatan_pengusul}}" id="txtJabatanPengusul" placeholder="Jabatan Yang Mengusulkan">
					      </div>
					    </div>
					  </div>
			      	</div>

				    <div class="col-md-6">
			      	    <div class="card">
				      	  	<div class="card-header">
				                <h4 class="card-title"><b>Yang Menyetujui</b></h4>
				            </div>
				            <div class="card-body">
							    <div class="form-group">
							        <label>Nama</label>
							        <select name="disetujui" class="form-control select2bs4" style="width: 100%;">
					                    <option value="" selected="selected">-- Pilih Satu --</option>
					                    @foreach($pegawai as $data)
					                        <option value="{{$data->id}}" @if($data->id == $lemburheader->disetujui) selected @endif>{{$data->nama}}</option>
					                    @endforeach
					                </select>
							    </div>
							    <div class="form-group">
							        <label>Jabatan</label>
							        <input type="text" name="jabatan_penyetuju" class="form-control" value="{{$lemburheader->jabatan_penyetuju}}" id="txtJabatanPenyetuju" placeholder="Jabatan Yang Menyetujui">
							    </div>
							</div>
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

		<div class="row" id="detailrow">
          <div class="col-md-12">
            <div class="card card-default">
              <div class="card-header">
                <h3 class="card-title"><b>Detail Lembur Pegawai</b></h3>
                <a href="{{url('tambahlemburdetail/'.$lemburheader->id)}}" type="button" class="btn btn-success float-right">Tambah Detail</a>
              </div>
              <div class="card-body">
             	<table id="detailtable" class="table table-striped">
                    <thead>
                    <tr>
                      <th>No</th>
                      <th>Nama</th>
                      <th>NIP</th>
                      <th>Gol</th>
                      <th>Tanggal Lembur</th>
                      <th>Bidang Pekerjaan</th>
                      <th>Uraian Pekerjaan</th>
                      <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
		            @php
		            $no = 0
		            @endphp
		            @foreach($lemburdetail as $data)  
		               <tr>
		                  <td>{{++$no}}</td>
		                  <td>{{$data->nama}}</td>
		                  <td>{{$data->nip}}</td>
		                  <td>{{$data->gol}}</td>
		                  <td>{{$data->tanggallemburawal.' s/d '.$data->tanggallemburakhir}}</td>
		                  <td>{{$data->bidang_pekerjaan}}</td>
		                  <td>{{$data->uraian_pekerjaan}}</td>
		                  <td>
		                    <div class="btn-group">
		                      <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown"><i class="fas fa-check nav-icon"></i>
		                      <span class="caret"></span>
		                      </button>
		                      <div class="dropdown-menu" id="dropdown-action-id">
		                        <a class="dropdown-item" href="ubahkodearsip/{{$data->id}}">Ubah Data</a>
		                        <a class="dropdown-item swalDelete" href="{{url('hapuslemburdetail/'.$lemburheader->id.'/'.$data->id)}}">Hapus Data</a>
		                      </div>
		                    </div>
		                  </td>
		               </tr>
		            @endforeach
		            </tbody>
                  </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->
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

	  //DataTable
      $("#detailtable").DataTable({
          "paging": true,
	      "lengthChange": false,
	      "searching": false,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false,
	      "responsive": true,
      });

      //SweetAlert Success
      var message = $("#idmessage").val();
      var message_text = $("#idmessage_text").val();

      if(message=="1")
      {
        Swal.fire({     
           icon: 'success',
           title: 'Success!',
           text: message_text,
           showConfirmButton: false,
           timer: 1500
        })
      }

      //SweetAlert Delete
     $(document).on("click", ".swalDelete",function(event) {  
        event.preventDefault();
        const url = $(this).attr('href');

        Swal.fire({
          title: 'Apakah anda yakin menghapus data ini?',
          text: 'Anda tidak akan dapat mengembalikan data ini!',
          icon: 'error',
          showCancelButton: true,
          confirmButtonColor: '#dc3545',
          confirmButtonText: 'Ya, Hapus',
          cancelButtonText: 'Batal'
        }).then((result) => {
        if (result.value) 
        {
            window.location.href = url;
        }
      });
    });

   });
</script>
@endsection