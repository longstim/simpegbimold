<html>
<head>
<title>Nota Dinas Lembur</title>
  <style type="text/css">
      td {font-family:"arial"; font-size:11pt}
      th {font-family:"arial"; font-weight:bold; font-size:11pt}
      a {text-decoration:none;}
      a:hover {color:red}
      textarea {font-family:"arial"; font-size:9pt}
      input {font-family:"arial"; font-size:9pt}
  </style>
  <link REL="shortcut icon" HREF="/favicon.ico" TYPE="image/x-icon">
</head>

<body bgcolor="white"> <!--onload="window.print()">-->
<font face="arial">
<center>
   <table border="0" width="650" cellpadding="1" cellspacing="0" id="kopsurat">
      <tr>
        <td rowspan="5" cellpadding="4" ><a href="{{url('cetaklampiranlembur/'.$lemburheader->id)}}"><img src="{{asset('image/logokemenperin.png')}}" width="180px"></a></td>
        <td align="center" style="font-size:11pt">BADAN PENELITIAN DAN PENGEMBANGAN INDUSTRI</td>
      </tr>
      <tr valign="top">
          <td align="center" style="font-size:12pt"><b>BALAI RISET DAN STANDARDISASI INDUSTRI MEDAN</b></td>
      </tr>
      <tr valign="top">
          <td align="center" style="font-size:9pt">Jl. Sisingamangaraja No. 24, Telp. (061) 7363471, 7365379, Fax. (061) 7362830</td>
      </tr>
      <tr valign="top">
          <td align="center" style="font-size:9pt">Email : bind_medan@kemenperin.go.id</td>
      </tr>
      <tr valign="top">
        <td align="center" style="font-size:12pt"><b>MEDAN – 20217</b></td>
      </tr>
  </table>
  <hr style="border:2px solid black;color:black;background-color:black;" width="750">
  <hr style="border:1px solid black;color:black;background-color:black; margin-top:-6px;" width="750" >
  <table border=0 width="650">
    <tr>
      <br>
      <td align="center"><b style="font-size:13pt"><u>NOTA DINAS</u></b><br>
        Nomor : {{$lemburheader->no_surat}}<br>
      </td>
    </tr>

    <tr>
      <td>
         <br>
        <table border=0 >
          <tr>
            <td width="30%">Kepada</td>
            <td>:</td>
            <td>{{$lemburheader->jabatan_penyetuju}}</td>
          </tr>
          <tr>
            <td>Dari</td>
            <td>:</td>
            <td>{{$lemburheader->jabatan_pengusul}}</td>
          </tr>
          <tr>
            <td>Perihal</td>
            <td>:</td>
            <td>Surat Perintah Kerja Lembur</td>
          </tr>
          <tr>
            <td>Lampiran</td>
            <td>:</td>
            <td>1 (satu) lembar</td>
          </tr>
          <tr>
            <td>Tanggal</td>
            <td>:</td>
            <td>{{$temp['tanggalsurat']}}</td>
          </tr>
           <tr border="1">
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
      <br>
        <div align="justify">&nbsp; &nbsp; &nbsp; Dengan ini memerintahkan kepada  pegawai yang namanya tercantum di bawah ini untuk melakukan Kerja Lembur pada tanggal {{$temp['tanggallemburawal']}} @if(!empty($temp['tanggallemburakhir'])) s/d @endif{{$temp['tanggallemburakhir']}} sehubungan dengan pekerjaan yang tidak dapat ditangguhkan.<br><br>
        </div>

        <table style="border:1px solid black; border-collapse: collapse;" width="100%" cellpadding="5" cellspacing=0>
          <thead>
            <tr align="center">
              <th width="5%" style="border:1px solid black;"><b>No.</b></th>
              <th width="25%" style="border:1px solid black;"><b>Nama</b></th>
              <th width="20%" style="border:1px solid black;"><b>NIP</b></th>
              <th width="10%" style="border:1px solid black;"><b>Gol</b></th>
              <th width="55%" style="border:1px solid black;"><b>Bidang Pekerjaan</b></th>
            </tr>
          </thead>
          @php
          $no = 0
          @endphp
          @foreach($lemburdetail as $data)
          <tr valign="top">
              <td align="center" style="border:1px solid black;">{{++$no}}</td>
              <td style="border:1px solid black;">{{$data->nama}}</td>
              <td align="center" style="border:1px solid black;">{{$data->nip}}</td>
              <td align="center" style="border:1px solid black;">{{$data->gol}}</td>
              <td style="border:1px solid black;">{{$data->bidang_pekerjaan}}</td>
          </tr>
          @endforeach
        </table>
        <br>

        <div align="justify">&nbsp; &nbsp; &nbsp; Adapun tugas Kerja Lembur yang dilaksanakan sebagaimana disampaikan pada Lampiran yang tidak terpisahkan dari Nota Dinas ini.<br><br>
        </div>

        <table border=0 width="100%">
          <tr>
            <br>
            <td align="center"><br><br>
              Disetujui<br/>
              {{$lemburheader->jabatan_penyetuju}}<br/>
              <br><br><br><br>
              <u>{{$lemburheader->nama_penyetuju}}</u>
              <br>NIP. {{$lemburheader->nip_penyetuju}}
            </td>
            <td width="20%"></td>
            <td align="center">
              Medan, {{$temp['tanggalsurat']}}<br><br>
              Diusulkan<br/>
              {{$lemburheader->jabatan_pengusul}}<br/>
              <br><br><br><br>
              <u>{{$lemburheader->nama_pengusul}}</u>
              <br>NIP. {{$lemburheader->nip_pengusul}}
            </td>
          </tr>
          <tr>
            <td style="font-size:9pt">
              <br>
              <br>
              <u>Tembusan :</u><br>
              1. PPK RM<br />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</center>
</font>

</body>
</html>
