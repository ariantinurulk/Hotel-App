<?php

namespace App\Http\Controllers;

use App\Models\FasilitasHotel;
use App\Helper\ImageUrl;
use Illuminate\Http\Request;

class FasilitasHotelController extends Controller
{
    function __construct()
    {
        $this->middleware('can:role,"admin"',[
            'except'=>['index','show'],
        ]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $search = $request->search;
        $data = FasilitasHotel::select('id','nama_fasilitas_hotel')
                ->when($search, function($query, $search){
                    return $query->where('nama_fasilitas_hotel','like',"%{$search}%");
                })
                ->paginate(50);

        return view('fasilitas_hotel.index',['data'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('fasilitas_hotel.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama_fasilitas'=>'required|min:3',
            'foto'=>'required|image|mimes:png,jpg,jpeg|dimensions:min_width=1000,min_height=500|between:50,1000',
            'deskripsi'=>'required|min:10'
        ]);

        $ext = $request->foto->getClientOriginalExtension();
        $filename = rand(9,999).'_'.time().'.'.$ext;
        $request->foto->move('images/fasilitas/',$filename);

        FasilitasHotel::create([
            'nama_fasilitas_hotel'=>ucwords($request->nama_fasilitas),
            'foto_fasilitas_hotel'=>$filename,
            'deskripsi_fasilitas_hotel'=>$request->deskripsi,
        ]);

        return redirect()->route('fasilitas.index')->with('status'.'store');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(FasilitasHotel $fasilita)
    {
        $fasilita->foto_fasilitas_hotel = ImageUrl::get('images/fasilitas/',$fasilita->foto_fasilitas_hotel);

        return view('fasilitas_hotel.show',['row'=>$fasilita]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(FasilitasHotel $fasilita)
    {
        $fasilita->foto_fasilitas_hotel = ImageUrl::get('images/fasilitas/',$fasilita->foto_fasilitas_hotel);

        return view('fasilitas_hotel.edit',['row'=>$fasilita]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FasilitasHotel $fasilita)
    {
        $request->validate([
            'nama_fasilitas'=>'required|min:3',
            'foto'=>'nullable|image|mimes:png,jpg,jpeg|dimensions:min_width=1000,min_height=500|between:50,1000',
            'deskripsi'=>'required|min:10'
        ]);

        if ( $fasilita->foto_fasilitas_hotel && $request->foto ) {
            
            $file = 'images/fasilitas/'.$fasilita->foto_fasilitas_hotel;

            if ( file_exists($file)) {
                unlink($file);
            }
        }

        $arr = [
            'nama_fasilitas_hotel'=>ucwords($request->nama_fasilitas),
            'deskripsi_fasilitas_hotel'=>$request->deskripsi,
        ];

        if ($request->foto) {
            
            $ext = $request->foto->getClientOriginalExtension();
            $filename = rand(9,999).'_'.time().'.'.$ext;
            $request->foto->move('images/fasilitas/',$filename);

            $arr['foto_fasilitas_hotel'] = $filename;
        }

        $fasilita->update($arr);

        return redirect()->route('fasilitas.index')->with('status','update');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(FasilitasHotel $fasilita)
    {
        if ( $fasilita->foto_fasilitas_hotel) {
            $file = 'images/fasilitas/'.$fasilita->foto_fasilitas_hotel;

            if (file_exists($file)) {
                unlink($file);
            }
        }

        $fasilita->delete();

        return back()->with('status','destroy');
    }
}
