<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Carbon\Carbon;
use DB;
Use Redirect;
use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jlhpegawai = DB::table('md_pegawai')->count();
        $jlhpns = DB::table('md_pegawai')->where('jenis_pegawai','=','pns')->count();
        $jlhcpns = DB::table('md_pegawai')->where('jenis_pegawai','=','cpns')->count();
        $jlhppnpn = DB::table('md_pegawai')->where('jenis_pegawai','=','ppnpn')->count();

        $data = [
          'jlhpegawai' => $jlhpegawai,
          'jlhpns' => $jlhpns,
          'jlhcpns' => $jlhcpns,
          'jlhppnpn' => $jlhppnpn,
        ];
        
        return view('homepage', compact('data'));
    }
}
