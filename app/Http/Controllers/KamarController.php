<?php

namespace App\Http\Controllers;

use App\Helper\ImageUrl;
use App\Models\Kamar;
use App\Models\FasilitasKamar;
use Illuminate\Http\Request;

class KamarController extends Controller
{
    function __construct()
    {
        $this->middleware('can:role, "admin"',[
            'except'=>['index','show']
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
        $data = Kamar::select('id','nama_kamar','jum_kamar','harga_kamar')
                ->when($search, function($query, $search){
                    return $query->where('nama_kamar','like',"%{$search}%")
                     ->orWhere('harga_kamar','like',"%{$search}%");
                })
                ->paginate(50);

        return view('kamar.index',['data'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('kamar.create');
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
            'nama_kamar'=>'required|min:3',
            'foto'=>'required|image|mimes:png,jpg,jpeg|dimensions:min_width=1000,min_height=500|between:50,1000',
            'jumlah'=>'required',
            'harga'=>'required',
            'deskripsi'=>'required|min:10'
        ]);


        $ext = $request->foto->getClientOriginalExtension();
        $filename = rand(9,999).'_'.time().'.'.$ext;
        $request->foto->move('images/kamar/',$filename);
    
    
        Kamar::create([
            'nama_kamar'=>$request->nama_kamar,
            'foto_kamar'=> $filename,
            'jum_kamar'=>$request->jumlah,
            'harga_kamar'=>$request->harga,
            'deskripsi_kamar'=>$request->deskripsi
        ]);


        return redirect()->route('kamar.index')->with('status','store');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Kamar $kamar)
    {
        $fasilitas = FasilitasKamar::where('kamar_id',$kamar->id)->get();

        $kamar->foto_kamar = ImageUrl::get('images/kamar/',$kamar->foto_kamar);
        
        return view('kamar.show',['row'=>$kamar,'fasilitas'=>$fasilitas]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Kamar $kamar)
    {
        return view('kamar.edit',['row'=>$kamar]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Kamar $kamar)
    {
        $request->validate([    
            'nama_kamar'=>'required|min:3',
            'foto'=>'nullable|image|mimes:png,jpg,jpeg|dimensions:min_width=1000,min_height=500|between:50,1000',
            'jumlah'=>'required',
            'harga'=>'required',
            'deskripsi'=>'required|min:10'
        ]);

        if ( $kamar->foto_kamar && $request->foto ) {
            $file = 'images/kamar/'.$kamar->foto_kamar;

            if ( file_exists($file)) {
                unlink($file);
            }
        }

        if ($request->foto){
            $ext = $request->foto->getClientOriginalExtension();
            $filename = rand(9,999).'_'.time().'.'.$ext;
            $request->foto->move('images/kamar/',$filename);

            $arr = [
                'nama_kamar'=>$request->nama_kamar,
                'foto_kamar'=> $filename,
                'jum_kamar'=>$request->jumlah,
                'harga_kamar'=>$request->harga,
                'deskripsi_kamar'=>$request->deskripsi
            ];
        } else {
            $arr = [
                'nama_kamar'=>$request->nama_kamar,
                'jum_kamar'=>$request->jumlah,
                'harga_kamar'=>$request->harga,
                'deskripsi_kamar'=>$request->deskripsi
            ];
        }

        $kamar->update($arr);

        return redirect()->route('kamar.index')->with('status','update');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Kamar $kamar)
    {
        if ( $kamar->foto_kamar ) {
            $file = 'images/kamar/'.$kamar->foto_kamar;

            if ( file_exists($file) ) {
                unlink($file);
            }
        }

        $kamar->delete();

        return back()->with('status','destroy');
    }
}
