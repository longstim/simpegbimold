<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', 'HomeController@index')->name('home');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/adminlte', function () {
    return view('admin/adminlte');
});

//Absensi
Route::get('absen', 'AbsenController@daftarabsen');

//Pegawai
Route::get('pegawai', 'PegawaiController@daftarpegawai');

Route::get('profilpegawai/{id_pegawai}', 'PegawaiController@profilpegawai');

Route::get('tambahkodearsip', 'KodeArsipController@tambahkodearsip');

Route::post('prosestambahkodearsip', 'KodeArsipController@prosestambahkodearsip');

Route::get('ubahkodearsip/{id_kodearsip}','KodeArsipController@ubahkodearsip');

Route::post('prosesubahkodearsip','KodeArsipController@prosesubahkodearsip');

Route::get('hapuskodearsip/{id_kodearsip}','KodeArsipController@hapuskodearsip');


//Lembur Pegawai
Route::get('lembur', 'LemburController@daftarlembur');

Route::get('tambahlembur', 'LemburController@tambahlembur');

Route::post('prosestambahlembur', 'LemburController@prosestambahlembur');

Route::get('ubahlembur/{id_lembur}','LemburController@ubahlembur');

Route::post('prosesubahlembur','LemburController@prosesubahlembur');

Route::get('tambahlemburdetail/{id_lembur}','LemburController@tambahlemburdetail');

Route::post('prosestambahlemburdetail','LemburController@prosestambahlemburdetail');

Route::get('cetaklembur/{id_lembur}','LemburController@cetaklembur');

Route::get('cetaklampiranlembur/{id_lembur}','LemburController@cetaklampiranlembur');

Route::get('hapuslembur/{id_lembur}','LemburController@hapuslembur');

Route::get('hapuslemburdetail/{id_lembur}/{id_lemburdetail}','LemburController@hapuslemburdetail');


//Surat Tugas
Route::get('surattugas', 'SuratTugasController@daftarsurattugas');

