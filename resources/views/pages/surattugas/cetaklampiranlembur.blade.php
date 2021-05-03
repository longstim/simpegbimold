<html>
<head>
<title>Lampiran Nota Dinas Lembur</title>
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
        <td rowspan="5" cellpadding="4" ><img src="{{asset('image/logokemenperin.png')}}" width="180px"></td>
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
      <td align="center"><b style="font-size:13pt"><u>URAIAN KERJA LEMBUR</u></b><br>
        (Lampiran Nota Dinas)<br>
      </td>
    </tr>

    <tr>
      <td>
         <br>
        <table border=0 >
          <tr>
            <td width="30%">UNIT KERJA</td>
            <td>:</td>
            <td>BARISTAND INDUSTRI MEDAN</td>
          </tr>
          <tr>
            <td>BULAN</td>
            <td>:</td>
            <td>{{$temp['bulan']}}</td>
          </tr>
           <tr border="1">
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
      <br>
        <table style="border:1px solid black; border-collapse: collapse;" width="100%" cellpadding="5" cellspacing=0>
          <thead>
            <tr align="center">
              <th width="5%" style="border:1px solid black;"><b>No.</b></th>
              <th width="25%" style="border:1px solid black;"><b>Nama</b></th>
              <th width="10%" style="border:1px solid black;"><b>Gol</b></th>
              <th width="20%" style="border:1px solid black;"><b>Tanggal Kerja Lembur</b></th>
              <th width="55%" style="border:1px solid black;"><b>Uraian Pekerjaan</b></th>
            </tr>
          </thead>
          @php
          $no = 0
          @endphp
          @foreach($lemburdetail as $data)
          <tr valign="top">
              <td align="center" style="border:1px solid black;">{{++$no}}</td>
              <td style="border:1px solid black;">{{$data->nama}}</td>
              <td align="center" style="border:1px solid black;">{{$data->gol}}</td>
              <td align="center" style="border:1px solid black;">@if($data->tanggallemburawal==$data->tanggallemburakhir) {{$data->tanggallemburawal}} @else {{$data->tanggallemburawal}} s/d {{$data->tanggallemburakhir}}  @endif</td>
              <td style="border:1px solid black;">{{$data->uraian_pekerjaan}}</td>
          </tr>
          @endforeach
        </table>
        <br>

        <table border=0 width="100%">
          <tr>
            <br>
            <td align="center">
            </td>
            <td width="50%"></td>
            <td align="center">
              Medan, {{$temp['tanggalsurat']}}<br><br>
              Diusulkan<br/>
              {{$lemburheader->jabatan_pengusul}}<br/>
              <br><br><br><br>
              <u>{{$lemburheader->nama_pengusul}}</u>
              <br>NIP. {{$lemburheader->nip_pengusul}}
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
