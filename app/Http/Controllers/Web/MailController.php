<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
//use App\Providers\MailConfigServiceProvider;
use Illuminate\Http\Request; 
use DB;
use Config;
use Mail;
use  App\Mail\ContactEmail;
use App;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\Mail\StoreRequest;
use App\Providers\MailConfigServiceProvider;
use App\Http\Controllers\Web\SiteDataController;

//use FFMpeg;
class MailController extends Controller
{
    public function viewForm()
    {
        return view('mail.add');
    }
    public function create(Request $request)
    {
     
   
    }
    public function sendMail($mailTo )
    {
        $mailTo = "najyms@gmail.com";
        $app = App::getInstance();
      $data=[];

        $app->register('App\Providers\MailConfigServiceProvider');
        $bcc="support@oras.orasweb.com";
        Mail::to( $mailTo)->bcc($bcc)->send(new ContactEmail( $data ));
      
/*
        Mail::send(array(),array(), function($message) use ($content,$mailTo)
        {
            $message->to($mailTo)
                    ->subject('Test Dynamic SMTP Config')
                    ->from(Config::get('mail.from.address'),Config::get('mail.from.name'))
                    //->setBody($content);
                    ->html($content);
           
            echo 'Mail Sent Successfully';
        });
        */
    }
    public function store(StoreRequest $request)
    {
        $formdata = $request->all();
   // return  $formdata;
    // return redirect()->back()->with('success_message', $formdata);
    $validator = Validator::make(
      $formdata,
      $request->rules(),
      $request->messages()
    );

    if ($validator->fails()) {
      /*
                           return  redirect()->back()->withErrors($validator)
                           ->withInput();
                           */
      // return response()->withErrors($validator)->json();
      return response()->json($validator);

    } else {
      $name=  $formdata['name'];
     $clientmail= $formdata['email']; 
      $subject= $formdata['subject'];
      $message= $formdata['message'];
      $lang_code=  $formdata['lang_code'];
      $sitedctrlr=new SiteDataController();  
      $comdata=  $sitedctrlr->getCompanyData();
      //return $lang_code;
      $mailTo = $comdata['com_email'] ;    
     // $app = App::getInstance();
      $config = array(
        'driver'     => 'smtp',
        'host'       => 'mail.prevalentautomation.com',
        'port'       => '587',
        'from'       => array('address' =>$clientmail, 'name' =>$name),
        'encryption' => '',
        'username'   => 'info@prevalentautomation.com',
        'password'   => '7o()8khK_YIU',
        'sendmail'   => '/usr/sbin/sendmail -bs',
        'pretend'    => false,
        'timeout' => null,
        'local_domain' => env('MAIL_EHLO_DOMAIN'),
        'verify_peer' => false, // <== This is needed here
    );
    Config::set('mail', $config); 

     // $app->register('App\Providers\MailConfigServiceProvider');
  //   $bcc="info@prevalentautomation.com";
     $data=[
        'name'=>$name,
        'client_mail'=>$clientmail,
        'subject'=>$subject,
        'message'=>$message,
      'com_title'=>$comdata['com_title']
     ];
     
  //  Mail::to( $mailTo)->bcc($bcc)->send(new ContactEmail( $data));
   Mail::to( $mailTo)->send(new ContactEmail( $data));
//       $newObj = new Language;
//            //reset all to 0
//   $isdefault=0;
//   if(isset ($formdata["is_default"])){
//     $isdefault=1;
//     Language::query()->update([       
//         'is_default' =>0,
//       ]);
//   }
//       $newObj->code = $formdata['code'];
//       $newObj->name = $formdata['name'];    
//       $newObj->status = isset ($formdata["status"]) ? 1 : 0;
//       $newObj->is_default =$isdefault;
//       $newObj->save();

//       if ($request->hasFile('image')) {
//         $file = $request->file('image');
//         $this->storeImage($file, $newObj->id);    
//       }
return "OK";
     // return response()->json("ok");
    }
    }

 
}
