<?php
namespace App\Helper;


class ImageUrl
{
    public static function get($path, $filename)
    {
        if ($filename){
            $file = $path.$filename;

            if ( file_exists($file) ){
                $filename = url($file);
            } else {
                $filename = url('images/no_image.png');
            }
        } else {
            $filename = url('images/no_image.png');
        }

        return $filename;
    }
}