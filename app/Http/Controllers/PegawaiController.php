<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use DB;
use Redirect;
use Auth;

class PegawaiController extends Controller
{
    public function __construct()
  	{
        $this->middleware('auth');
  	}

  	public function index()
   	{
   		  return view('pages.pegawai.daftarpegawai');
   	}

   	public function daftarpegawai()
   	{
        $pegawai=DB::table('md_pegawai')
              	  ->leftjoin('td_jabatan_pegawai', 'md_pegawai.id', '=', 'td_jabatan_pegawai.id_pegawai')
              	  ->leftjoin('md_jabatan', 'td_jabatan_pegawai.id_jabatan', '=', 'md_jabatan.id')
              	  ->leftjoin('md_jenjang_jabatan', 'td_jabatan_pegawai.id_jenjang_jabatan', '=', 'md_jenjang_jabatan.id')
              	  ->leftjoin('md_jenis_jabatan', 'md_jabatan.jenis_jabatan', '=', 'md_jenis_jabatan.id')
              	  ->leftjoin('td_pangkat_pegawai', 'md_pegawai.id', '=', 'td_pangkat_pegawai.id_pegawai')
              	  ->leftjoin('md_pangkat', 'td_pangkat_pegawai.id_pangkat', '=', 'md_pangkat.id')
                  ->select('md_pegawai.*', 'md_jabatan.jabatan AS jabatan', 'md_jenjang_jabatan.jenjang_jabatan AS jenjangjabatan', 'md_jenis_jabatan.jenis_jabatan AS jenisjabatan', 'md_pangkat.pangkat AS pangkat', 'md_pangkat.golongan AS golongan')
                  ->orderBy('id','asc')
                  ->get();
        return view('pages.pegawai.daftarpegawai', compact('pegawai'));
   	}

    public function profilpegawai($id_pegawai)
    {
        $pegawai=DB::table('md_pegawai')->where('md_pegawai.id','=',$id_pegawai)
                  ->leftjoin('td_jabatan_pegawai', 'md_pegawai.id', '=', 'td_jabatan_pegawai.id_pegawai')
                  ->leftjoin('md_jabatan', 'td_jabatan_pegawai.id_jabatan', '=', 'md_jabatan.id')
                  ->leftjoin('md_jenjang_jabatan', 'td_jabatan_pegawai.id_jenjang_jabatan', '=', 'md_jenjang_jabatan.id')
                  ->leftjoin('md_jenis_jabatan', 'md_jabatan.jenis_jabatan', '=', 'md_jenis_jabatan.id')
                  ->leftjoin('td_pangkat_pegawai', 'md_pegawai.id', '=', 'td_pangkat_pegawai.id_pegawai')
                  ->leftjoin('md_pangkat', 'td_pangkat_pegawai.id_pangkat', '=', 'md_pangkat.id')
                  ->select('md_pegawai.*', DB::raw('DATE_FORMAT(md_pegawai.tanggal_lahir, "%d-%m-%Y") AS tanggallahir'), 'md_jabatan.jabatan AS jabatan', 'md_jenjang_jabatan.jenjang_jabatan AS jenjangjabatan', 'md_jenis_jabatan.jenis_jabatan AS jenisjabatan', 'md_pangkat.pangkat AS pangkat', 'md_pangkat.golongan AS golongan')
                  ->first();

        $jabatan = DB::table('td_jabatan_pegawai')->where('td_jabatan_pegawai.id_pegawai','=',$id_pegawai)
                  ->leftjoin('md_jabatan', 'td_jabatan_pegawai.id_jabatan', '=', 'md_jabatan.id')
                  ->leftjoin('md_jenjang_jabatan', 'td_jabatan_pegawai.id_jenjang_jabatan', '=', 'md_jenjang_jabatan.id')
                  ->leftjoin('md_jenis_jabatan', 'md_jabatan.jenis_jabatan', '=', 'md_jenis_jabatan.id')
                  ->select('td_jabatan_pegawai.*', 'md_jabatan.jabatan AS jabatan', 'md_jenjang_jabatan.jenjang_jabatan AS jenjangjabatan', 'md_jenis_jabatan.jenis_jabatan AS jenisjabatan')
                  ->get();

        return view('pages.pegawai.profilpegawai', compact('pegawai','jabatan'));
    }
}
