<?php

namespace Database\Seeders;

use App\Models\FasilitasHotel;
use Illuminate\Database\Seeder;

class FasilitasHotelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        FasilitasHotel::create([
            'nama_fasilitas_hotel'=>'Kolam Renang',
            'foto_fasilitas_hotel'=>null,
            'deskripsi_fasilitas_hotel'=>'In imperdiet mi in auctor vestibulum. Sed imperdiet neque nisl, a feugiat leo efficitur quis. Maecenas rhoncus vel urna vel tempus. Praesent imperdiet ut massa semper varius. Quisque in aliquam leo, et pharetra elit. Vivamus hendrerit volutpat consectetur. Maecenas sed nisl ut arcu volutpat dignissim egestas quis sapien. Fusce metus velit, hendrerit id bibendum in, feugiat sed augue. Nunc interdum imperdiet quam, eu euismod ante molestie sed. Phasellus ut porttitor erat. Phasellus imperdiet massa eu diam rutrum tincidunt. Aenean varius ligula nec nibh volutpat molestie.',
        ]);

        FasilitasHotel::create([
            'nama_fasilitas_hotel'=>'Restoran',
            'foto_fasilitas_hotel'=>null,
            'deskripsi_fasilitas_hotel'=>'In imperdiet mi in auctor vestibulum. Sed imperdiet neque nisl, a feugiat leo efficitur quis. Maecenas rhoncus vel urna vel tempus. Praesent imperdiet ut massa semper varius. Quisque in aliquam leo, et pharetra elit. Vivamus hendrerit volutpat consectetur. Maecenas sed nisl ut arcu volutpat dignissim egestas quis sapien. Fusce metus velit, hendrerit id bibendum in, feugiat sed augue. Nunc interdum imperdiet quam, eu euismod ante molestie sed. Phasellus ut porttitor erat. Phasellus imperdiet massa eu diam rutrum tincidunt. Aenean varius ligula nec nibh volutpat molestie.',
        ]);

        FasilitasHotel::create([
            'nama_fasilitas_hotel'=>'Parkir Luas',
            'foto_fasilitas_hotel'=>null,
            'deskripsi_fasilitas_hotel'=>'In imperdiet mi in auctor vestibulum. Sed imperdiet neque nisl, a feugiat leo efficitur quis. Maecenas rhoncus vel urna vel tempus. Praesent imperdiet ut massa semper varius. Quisque in aliquam leo, et pharetra elit. Vivamus hendrerit volutpat consectetur. Maecenas sed nisl ut arcu volutpat dignissim egestas quis sapien. Fusce metus velit, hendrerit id bibendum in, feugiat sed augue. Nunc interdum imperdiet quam, eu euismod ante molestie sed. Phasellus ut porttitor erat. Phasellus imperdiet massa eu diam rutrum tincidunt. Aenean varius ligula nec nibh volutpat molestie.',
        ]);

        FasilitasHotel::create([
            'nama_fasilitas_hotel'=>'Sarapan Pagi Gratis',
            'foto_fasilitas_hotel'=>null,
            'deskripsi_fasilitas_hotel'=>'In imperdiet mi in auctor vestibulum. Sed imperdiet neque nisl, a feugiat leo efficitur quis. Maecenas rhoncus vel urna vel tempus. Praesent imperdiet ut massa semper varius. Quisque in aliquam leo, et pharetra elit. Vivamus hendrerit volutpat consectetur. Maecenas sed nisl ut arcu volutpat dignissim egestas quis sapien. Fusce metus velit, hendrerit id bibendum in, feugiat sed augue. Nunc interdum imperdiet quam, eu euismod ante molestie sed. Phasellus ut porttitor erat. Phasellus imperdiet massa eu diam rutrum tincidunt. Aenean varius ligula nec nibh volutpat molestie.',
        ]);
    }
}
