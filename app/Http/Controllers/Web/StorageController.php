<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Expert;
use App\Models\Selectedservice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use File;
use Illuminate\Support\Carbon;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use PhpParser\Node\Expr\Cast\Object_;
use Ramsey\Uuid\Type\Decimal;
use Illuminate\Support\Facades\URL;
class StorageController extends Controller
{


  public $path = [];
  public $iconpath = [];
  public $recordpath = [];
  private $defaultimage = "default.png";
  private $defaultsvg = "default.svg";
  public function __construct()
  {
    //inputs
    
    //experts
     

    // $recordpath['experts'] = 'images/experts/records';
 

    //clients
    $this->path['clients'] = 'images/clients';
    //users
    $this->path['users'] = 'images/users';
    //empty
    $this->path['default'] = 'images/default';
    $this->iconpath['default'] = 'images/default/icons';
    $this->path['languages'] = 'images/languages';
   
    //value
 
    //answer
  
  }
  /**
   * Display a listing of the resource.
   */
  // public function ExpertPath($type)
  // { //image record
  //   $url = "";

  //   if ($type == "image") {
  //     $url = url(Storage::url($this->path['experts'])) . '/';
  //   } else {
  //     $url = url(Storage::url($this->recordpath['experts'])) . '/';
  //   }

  //   return $url;

  // }
  public function UserPath()
  {  
    $url = "";  
  //  $url = Storage::url($this->path['users'])  . '/';
    // $url = url(Storage::url($this->path['users'])) . '/';
     if(!File::isDirectory(Storage::url('/images')))  {
      $url = url(Storage::url($this->path['users'])) . '/';
     }
     else{
      $url = url('public'.Storage::url($this->path['users'])) . '/';
     }
   //  $url = url('public'.Storage::url($this->path['users'])) . '/';//temp
   //   $url = url(Storage::url( 'storage/app/public' ) ). '/'. $this->path['users']. '/'; 
          return $url;
  }
  public function LanguagePath()
  {  
    $url = "";  
  //  $url = Storage::url($this->path['users'])  . '/';
     $url = url(Storage::url($this->path['languages'])) . '/';
     // $url = URL::asset( 'storage/app/public' . '/' . $this->path['languages']). '/'; 
  //   $url = URL::asset( 'storage/app/public' . '/' . $this->path['languages']). '/'; 
          return $url;
  }

  public function DefaultPath($type)
  { //image icon
    $url = "";
    if ($type == "image") {
      $url = url(Storage::url($this->path['default'])) . '/' . $this->defaultimage;
    } else {
      $url = url(Storage::url($this->iconpath['default'])) . '/' . $this->defaultsvg;
    }
    return $url;


  }
  
 
  public static function CalcPercentVal($percent,$total)
  {
      //10% 200->200*10/100
      $val=$total*$percent/100;
      return $val;
  }
  public static function addZeros($number)
  {
      $number = (int) $number;
      $numLength = strlen($number);
      if ($numLength < 6) {
          $zeroslen = 6 - $numLength;
          $paddedNumber = str_pad($number, 6, '0', STR_PAD_LEFT);
      } else {
          $paddedNumber = str_pad($number, $numLength + 1, '0', STR_PAD_LEFT);
      }
      return $paddedNumber;
  }
  //
  public static function diffTimeinMinutes($start_date, $end_date)
  {
      $minutes = 0;
      if ((!is_null($start_date)) && (!is_null($end_date))) {
          $end = Carbon::parse($end_date);
          $start = Carbon::parse($start_date);

          $minutes = $end->diffInMinutes($start);
      }
      return $minutes;
  }
  
  
  
}
