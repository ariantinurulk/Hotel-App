<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pemesanan extends Model
{
    use HasFactory;

    public $fillable = [
        'kamar_id',
        'tgl_checkin',
        'tgl_checkout',
        'jum_kamar_dipesan',
        'nama_pemesan',
        'email_pemesan',
        'no_hp',
        'nama_tamu',
        'status',
        'created_at'
    ];
}
