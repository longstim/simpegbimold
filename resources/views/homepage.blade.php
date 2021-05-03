@extends('layouts.dashboard')
@section('page_heading','')
@section('content')
  <!-- Main content -->
   <div class="error-page">
      <div>
        <center>
          <h3>Selamat Datang, {{Auth::user()->name}}!</h3>
          <body onload="startTime()">
          <h4 class="headline text-danger"><div id="txt"></div></h4>
          <p>
            Waktu absen anda dapat dilihat pada tautan berikut <a href="{{url('absen')}}">ini</a>.
          </p>
      </center>
    </div>
  </div>
    <!-- /.error-page -->

<script type="text/javascript">
    function startTime() {
      var days = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
      var months = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
      var today = new Date();
      var d = today.getDate();
      var y = today.getFullYear();
      var h = today.getHours();
      var m = today.getMinutes();
      var s = today.getSeconds();
      m = checkTime(m);
      s = checkTime(s);
      document.getElementById('txt').innerHTML = days[today.getDay()] + ", " + d + " " + months[today.getMonth()] +" " + y + ", " +
      h + ":" + m + ":" + s + " WIB";
      var t = setTimeout(startTime, 500);
    }

    function checkTime(i) {
      if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
      return i;
    }
</script>
@endsection
