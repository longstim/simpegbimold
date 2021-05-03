<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Carbon\Carbon;
use DB;
Use Redirect;
use Auth;

class LemburController extends Controller
{
    public function __construct()
  	{
        $this->middleware('auth');
  	}

  	public function index()
   	{
   		  return view('pages.pegawai.daftarpegawai');
   	}

   	public function daftarlembur()
   	{
        $lemburheader=DB::table('td_lembur_header')
                  ->join('md_pegawai AS t1', 'td_lembur_header.diusulkan', '=', 't1.id')
                  ->join('md_pegawai AS t2', 'td_lembur_header.disetujui', '=', 't2.id')
                  ->select('td_lembur_header.*', 't1.nama AS nama_pengusul', 't2.nama AS nama_penyetuju')
                  ->orderBy('td_lembur_header.tanggal_surat','desc')
                  ->get();
        return view('pages.lembur.daftarlembur', compact('lemburheader'));
   	}

   	public function tambahlembur()
   	{
   		$lemburheader=DB::table('td_lembur_header')->get();
   		$lemburdetail=DB::table('td_lembur_detail')->get();
   		$pegawai=DB::table('md_pegawai')->get();

   		return view('pages.lembur.form_tambahlembur',['lemburheader'=>$lemburheader, 'lemburdetail'=>$lemburdetail, 'pegawai'=>$pegawai]);
   	}

   	public function prosestambahlembur(Request $request)
   	{
   		$tanggalsurat = $request->input('tanggal_surat');
      $newTanggalSurat = Carbon::createFromFormat('d/m/Y', $tanggalsurat)->format('Y-m-d');

      $data = array(
	      'no_surat' => $request->input('no_surat'),
	      'tanggal_surat' => $newTanggalSurat,
	      'diusulkan' => $request->input('diusulkan'),
	      'jabatan_pengusul' => $request->input('jabatan_pengusul'),
	      'disetujui' => $request->input('disetujui'),
	      'jabatan_penyetuju' => $request->input('jabatan_penyetuju'),
    	);

  		$insertID = DB::table('td_lembur_header')->insertGetId($data);

      $lemburheader=DB::table('td_lembur_header')->where('id','=',$insertID)->first();
      $lemburdetail=DB::table('td_lembur_detail')->get();
      $pegawai=DB::table('md_pegawai')->get();

      return Redirect::to('ubahlembur/'.$insertID)->with('message','Berhasil menyimpan data');
    }

    public function ubahlembur($id_lembur)
    {
      $lemburheader=DB::table('td_lembur_header')->where('id','=',$id_lembur)->first();
      $lemburdetail=DB::table('td_lembur_detail')->where('td_lembur_detail.id_header','=',$id_lembur)
                  ->leftjoin('md_pegawai', 'td_lembur_detail.id_pegawai', '=', 'md_pegawai.id')
                  ->leftjoin('td_pangkat_pegawai', 'md_pegawai.id', '=', 'td_pangkat_pegawai.id_pegawai')
                  ->leftjoin('md_pangkat', 'td_pangkat_pegawai.id_pangkat', '=', 'md_pangkat.id')
                  ->select('td_lembur_detail.*', 'md_pegawai.nama AS nama', 'md_pegawai.nip AS nip', 'md_pangkat.golongan AS gol', DB::raw('DATE_FORMAT(td_lembur_detail.tanggal_lembur_awal, "%d-%m-%Y") AS tanggallemburawal'), DB::raw('DATE_FORMAT(td_lembur_detail.tanggal_lembur_akhir, "%d-%m-%Y") AS tanggallemburakhir'))
                  ->orderBy('id','asc')
                  ->get();

      $pegawai=DB::table('md_pegawai')->get();

      return view('pages.lembur.form_ubahlembur',['lemburheader'=>$lemburheader, 'lemburdetail'=>$lemburdetail, 'pegawai'=>$pegawai]);
    }

    public function prosesubahlembur(Request $request)
    {

      $tanggalsurat = $request->input('tanggal_surat');
      $newTanggalSurat = Carbon::createFromFormat('d/m/Y', $tanggalsurat)->format('Y-m-d');

      $data = array(
        'no_surat' => $request->input('no_surat'),
        'tanggal_surat' => $newTanggalSurat,
        'diusulkan' => $request->input('diusulkan'),
        'jabatan_pengusul' => $request->input('jabatan_pengusul'),
        'disetujui' => $request->input('disetujui'),
        'jabatan_penyetuju' => $request->input('jabatan_penyetuju'),
      );
        
      DB::table('td_lembur_header')->where('id','=',$request->input('id'))->update($data);
  
      return Redirect::to('lembur')->with('message','Berhasil menyimpan data');
    }

    public function tambahlemburdetail($id_lembur)
    {
      $lemburheader=DB::table('td_lembur_header')->where('id','=',$id_lembur)->first();
      $lemburdetail=DB::table('td_lembur_detail')->get();
      $pegawai=DB::table('md_pegawai')->get();

      return view('pages.lembur.form_tambahlemburdetail',['lemburheader'=>$lemburheader, 'lemburdetail'=>$lemburdetail, 'pegawai'=>$pegawai]);
    }

    public function prosestambahlemburdetail(Request $request)
    {
      $tanggallemburawal = $request->input('tanggal_lembur_awal');
      $newTanggalLemburAwal = Carbon::createFromFormat('d/m/Y', $tanggallemburawal)->format('Y-m-d');

      $tanggallemburakhir = $request->input('tanggal_lembur_akhir');
      $newTanggalLemburAkhir = Carbon::createFromFormat('d/m/Y', $tanggallemburakhir)->format('Y-m-d');

      $data = array(
        'id_header' => $request->input('id_header'),
        'id_pegawai' => $request->input('pegawai'),
        'tanggal_lembur_awal' => $newTanggalLemburAwal,
        'tanggal_lembur_akhir' => $newTanggalLemburAkhir,
        'bidang_pekerjaan' => $request->input('bidang_pekerjaan'),
        'uraian_pekerjaan' => $request->input('uraian_pekerjaan'),
      );

      $insertID = DB::table('td_lembur_detail')->insertGetId($data);

      $lemburheader=DB::table('td_lembur_header')->where('id','=',$request->input('id_header'))->first();
      $lemburdetail=DB::table('td_lembur_detail')->get();

      $pegawai=DB::table('md_pegawai')->get();

      return Redirect::to('ubahlembur/'.$request->input('id_header'))->with('message','Berhasil menyimpan data');
    }

    public function hapuslembur($id_lembur)
    {
        $data = DB::table('td_lembur_header')->where('id','=',$id_lembur)->delete();
        $datadetail = DB::table('td_lembur_detail')->where('id_header','=',$id_lembur)->delete();

        return Redirect::to('lembur')->with('message','Berhasil menghapus data');
    }

    public function hapuslemburdetail($id_lembur, $id_lemburdetail)
    {
        $datadetail = DB::table('td_lembur_detail')->where('id','=',$id_lemburdetail)->delete();

        return Redirect::to('ubahlembur/'.$id_lembur)->with('message','Berhasil menghapus data');
    }

    public function cetaklembur($id_lembur)
    {

      $lemburheader=DB::table('td_lembur_header')->where('td_lembur_header.id','=',$id_lembur)
                  ->leftjoin('md_pegawai AS t1', 'td_lembur_header.diusulkan', '=', 't1.id')
                  ->leftjoin('md_pegawai AS t2', 'td_lembur_header.disetujui', '=', 't2.id')
                  ->select('td_lembur_header.*', 't1.nama AS nama_pengusul', 't1.nip AS nip_pengusul','t2.nama AS nama_penyetuju',  't2.nip AS nip_penyetuju', DB::raw('DATE_FORMAT(td_lembur_header.tanggal_surat, "%d-%m-%Y") AS tanggalsurat'))
                  ->first();

      $lemburdetail=DB::table('td_lembur_detail')->where('td_lembur_detail.id_header','=',$id_lembur)
                  ->leftjoin('md_pegawai', 'td_lembur_detail.id_pegawai', '=', 'md_pegawai.id')
                  ->leftjoin('td_pangkat_pegawai', 'md_pegawai.id', '=', 'td_pangkat_pegawai.id_pegawai')
                  ->leftjoin('md_pangkat', 'td_pangkat_pegawai.id_pangkat', '=', 'md_pangkat.id')
                  ->select('td_lembur_detail.*', 'md_pegawai.nama AS nama', 'md_pegawai.nip AS nip', 'md_pangkat.golongan AS gol', DB::raw('DATE_FORMAT(td_lembur_detail.tanggal_lembur_awal, "%d-%m-%Y") AS tanggallemburawal'), DB::raw('DATE_FORMAT(td_lembur_detail.tanggal_lembur_akhir, "%d-%m-%Y") AS tanggallemburakhir'))
                  ->orderBy('id','asc')
                  ->get();

      $tanggallembur=DB::table('td_lembur_detail')->where('td_lembur_detail.id_header','=',$id_lembur)
                   ->select(DB::raw('MIN(tanggal_lembur_awal) as awal'), DB::raw('MAX(tanggal_lembur_akhir) as akhir'))
                   ->get();

      setlocale(LC_ALL, 'IND');
      $tanggalsurat  = Carbon::parse($lemburheader->tanggal_surat)->formatLocalized('%d %B %Y');

      $tanggallemburawal = Carbon::parse($tanggallembur[0]->awal)->formatLocalized('%d %B %Y');
      $tanggallemburakhir = Carbon::parse($tanggallembur[0]->akhir)->formatLocalized('%d %B %Y');
     
      if($tanggallembur[0]->awal===$tanggallembur[0]->akhir)
      {
         $tanggallemburakhir = "";
      }

      $temp = [
          'tanggalsurat'  => $tanggalsurat,
          'tanggallemburawal' => $tanggallemburawal,
          'tanggallemburakhir' => $tanggallemburakhir,
      ];

      return view('pages.lembur.cetaklembur', ['lemburheader'=>$lemburheader, 'lemburdetail'=>$lemburdetail, 'temp'=>$temp]);
    }

    public function cetaklampiranlembur($id_lembur)
    {

      $lemburheader=DB::table('td_lembur_header')->where('td_lembur_header.id','=',$id_lembur)
                  ->leftjoin('md_pegawai AS t1', 'td_lembur_header.diusulkan', '=', 't1.id')
                  ->leftjoin('md_pegawai AS t2', 'td_lembur_header.disetujui', '=', 't2.id')
                  ->select('td_lembur_header.*', 't1.nama AS nama_pengusul', 't1.nip AS nip_pengusul','t2.nama AS nama_penyetuju',  't2.nip AS nip_penyetuju', DB::raw('DATE_FORMAT(td_lembur_header.tanggal_surat, "%d-%m-%Y") AS tanggalsurat'))
                  ->first();

      $lemburdetail=DB::table('td_lembur_detail')->where('td_lembur_detail.id_header','=',$id_lembur)
                  ->leftjoin('md_pegawai', 'td_lembur_detail.id_pegawai', '=', 'md_pegawai.id')
                  ->leftjoin('td_pangkat_pegawai', 'md_pegawai.id', '=', 'td_pangkat_pegawai.id_pegawai')
                  ->leftjoin('md_pangkat', 'td_pangkat_pegawai.id_pangkat', '=', 'md_pangkat.id')
                  ->select('td_lembur_detail.*', 'md_pegawai.nama AS nama', 'md_pegawai.nip AS nip', 'md_pangkat.golongan AS gol', DB::raw('DATE_FORMAT(td_lembur_detail.tanggal_lembur_awal, "%d-%m-%Y") AS tanggallemburawal'), DB::raw('DATE_FORMAT(td_lembur_detail.tanggal_lembur_akhir, "%d-%m-%Y") AS tanggallemburakhir'))
                  ->orderBy('id','asc')
                  ->get();

      $tanggallembur=DB::table('td_lembur_detail')->where('td_lembur_detail.id_header','=',$id_lembur)
                   ->select(DB::raw('MIN(tanggal_lembur_awal) as awal'), DB::raw('MAX(tanggal_lembur_akhir) as akhir'))
                   ->get();

      setlocale(LC_ALL, 'IND');
      $tanggalsurat  = Carbon::parse($lemburheader->tanggal_surat)->formatLocalized('%d %B %Y');

      $tanggallemburawal = Carbon::parse($tanggallembur[0]->awal)->formatLocalized('%d %B %Y');
      $tanggallemburakhir = Carbon::parse($tanggallembur[0]->akhir)->formatLocalized('%d %B %Y');
      $bulan = strtoupper(Carbon::parse($tanggallembur[0]->awal)->formatLocalized('%B %Y'));
     
      if($tanggallembur[0]->awal===$tanggallembur[0]->akhir)
      {
         $tanggallemburakhir = "";
      }

      $temp = [
          'tanggalsurat'  => $tanggalsurat,
          'tanggallemburawal' => $tanggallemburawal,
          'tanggallemburakhir' => $tanggallemburakhir,
          'bulan' => $bulan,
      ];

      return view('pages.lembur.cetaklampiranlembur', ['lemburheader'=>$lemburheader, 'lemburdetail'=>$lemburdetail, 'temp'=>$temp]);
    }
}
