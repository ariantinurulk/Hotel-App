<?php

namespace App\Http\Controllers;

use App\Helper\Lamanya;
use App\Models\Pemesanan;
Use App\Models\Kamar;
use Illuminate\Http\Request;

class PemesananController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->search;
        $tanggal = $request->tanggal;
        $data = Pemesanan::leftJoin('kamars','kamars.id','pemesanans.kamar_id')
            ->select(
                'pemesanans.id as id',
                'nama_tamu',
                'tgl_checkin',
                'tgl_checkout',
                'nama_kamar',
                'jum_kamar_dipesan as jum',
                'status'
            )
            ->when($search, function($query, $search){
                return $query->where('nama_tamu','like',"%{$search}%");
            })
            ->when($tanggal, function($query, $tanggal){
                return $query->whereDate('tgl_checkin','like',"%{$tanggal}%");
            })
            ->orderBy('id','desc')
            ->paginate(50);

        $data->map( function($row){
            $row->nama_tamu = ucwords($row->nama_tamu);
            $row->nama_kamar = ucwords($row->nama_kamar);
            $row->lamanya = Lamanya::get($row->tgl_checkin, $row->tgl_checkout );
            $row->tgl_checkin = date('d/m/Y', strtotime( $row->tgl_checkin ));
            $row->tgl_checkout = date('d/m/Y', strtotime( $row->tgl_checkout ));
            $row->status = $this->status($row->status);
        });
        return view('pemesanan.index',['data'=>$data]);
    }

    public function show(Pemesanan $pemesanan)
    {
        $kamar = Kamar::find($pemesanan->kamar_id);

        $pemesanan->nama_pemesan = ucwords($pemesanan->nama_pemesan);
        $pemesanan->nama_tamu = ucwords($pemesanan->nama_tamu);
        $pemesanan->lamanya = Lamanya::get($pemesanan->tgl_checkin,$pemesanan->tgl_checkout );
        $pemesanan->tgl_checkin = date('d/m/Y',strtotime($pemesanan->tgl_checkin));
        $pemesanan->tgl_checkout = date('d/m/Y',strtotime($pemesanan->tgl_checkout));
        $kamar->nama_kamar = ucwords($kamar->nama_kamar);
        $bayar = $kamar->harga_kamar * $pemesanan->jum_kamar_dipesan;
        $pemesanan->bayar= number_format($bayar,0,',','.');
        $pemesanan->tgl_dibuat = date('d/m/Y H:i:s', strtotime( $pemesanan->created_at ) );
        $pemesanan->value_status = $pemesanan->status;
        $pemesanan->status = $this->status($pemesanan->status);

        $option = [
            ['value'=>'pesan','option'=>'Permintaan'],
            ['value'=>'checkin','option'=>'Check IN'],
            ['value'=>'checkout','option'=>'Check OUT'],
            ['value'=>'batal','option'=>'Cancel'],
        ];

        return view('pemesanan.show',['pemesanan'=>$pemesanan, 'kamar'=>$kamar, 'option'=>$option]);
    }

    public function update(Request $request, Pemesanan $pemesanan)
    {
        $request->validate([
            'status'=>'required|in:pesan,checkin,checkout,batal',
        ]);

        $pemesanan->update([
            'status'=>$request->status,
        ]);

        return back()->with('status','update');
    }
    
    public function status($status)
    {
        $arr_status = [
            'pesan'=> 'Permintaan',
            'checkin'=>'Check IN',
            'checkout'=>'Check OUT',
            'batal'=>'Cancel'
        ];

        return $arr_status[$status];
    }
}
