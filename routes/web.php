<?php
 
use Illuminate\Support\Facades\Route;
 
use App\Http\Controllers\AdminController;
use App\Http\Controllers\Web\UserController;
use App\Http\Controllers\Web\LanguageController;
use App\Http\Controllers\Web\ProjectController;

use App\Http\Controllers\Web\LangProjectController;
use App\Http\Controllers\Web\MediaProjectController;
use App\Http\Controllers\Web\MediaStoreController;
use App\Http\Controllers\Web\SettingController;
use App\Http\Controllers\Web\LocationController;
//site
use App\Http\Controllers\HomeController;
//use Illuminate\Support\Facades\Facade\Artisan;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

 //defaultlang
    
    
 Route::get('/error500', [HomeController::class, 'error500'])->name('error500');
//  Route::prefix('{lang}')->group(function () {
   
//     });
   // Route::get('/about', [HomeController::class, 'about']);
    Route::get('/', [HomeController::class, 'index']);
    //selected lang
  
        // Route::get('/about', [HomeController::class, 'about']);

    

Route::get('/clear', function() {
    $exitCode = Artisan::call('route:cache');
      return 'ok';
 });
 Route::get('/storagelink', function() {
    $exitCode = Artisan::call('storage:link');
      return 'ok';
 });
 Route::get('/cashclear', function() {
    $exitCode = Artisan::call('cache:clear');
    $exitCode = Artisan::call('config:cache');
    $exitCode = Artisan::call('view:clear');
   
      return 'ok';
 });
//  Route::get('/{lang}/page/{id?}', function($lang,$id=null) {
//   //  $exitCode = Artisan::call('route:cache');
//       return 'ok'.$lang.'id='.$id;
//  });


//Route::get('/', [AuthenticatedSessionController::class, 'create']);
/*
Route::get('/dashboard', function () {
   return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

*/

Route::middleware(['auth', 'verified'])->prefix('admin')->group(function () {
    Route::get('/', [AdminController::class, 'index'])->name('admin');

    
    Route::middleware('role.admin:admin')->group(function () {
                Route::resource('user', UserController::class, ['except' => ['update']]);
        Route::prefix('user')->group(function () {
            Route::post('/update/{id}', [UserController::class, 'update'])->name('user.update');
            Route::get('/editprofile/{id}', [UserController::class, 'editprofile'])->name('user.editprofile');
            Route::post('/updateprofile/{id}', [UserController::class, 'updateprofile'])->name('user.updateprofile');
    
        });
       
        Route::resource('language', LanguageController::class, ['except' => ['update']]);
        Route::prefix('language')->group(function () {
            Route::post('/update/{id}', [LanguageController::class, 'update'])->name('language.update');
            
        });  

        Route::resource('project', ProjectController::class, ['except' => ['update']]);
        Route::prefix('project')->group(function () {
            Route::post('/update/{id}', [ProjectController::class, 'update'])->name('project.update');
            
        });  
        
        Route::prefix('langproject')->group(function () {
            Route::post('/update/{id}', [LangProjectController::class, 'update'])->name('langproject.update');
            
        });
        Route::prefix('mediaproject')->group(function () {
            Route::post('/store/{id}', [MediaProjectController::class, 'storeimages'])->name('mediaproject.store');
            Route::post('/update/{id}', [MediaProjectController::class, 'update'])->name('mediaproject.update');
            Route::post('/storevideo/{id}', [MediaProjectController::class, 'storevideo'])->name('mediaproject.storevideo');
            Route::post('/updatevideo/{id}', [MediaProjectController::class, 'updatevideo'])->name('mediaproject.updatevideo');
 
            
        });
        
        Route::prefix('mediastore')->group(function () {
            Route::get('/getbyid/{id}', [MediaStoreController::class, 'getbyid']);
            Route::delete('/destroyimage/{id}', [MediaStoreController::class, 'destroyimage']);
            Route::get('/getgallery/{id}', [MediaStoreController::class, 'getgallery']);
            Route::get('/getvideo/{id}', [MediaStoreController::class, 'getvideo']);
            
        });

        Route::prefix('setting')->group(function () {
            Route::get('/siteinfo', [SettingController::class, 'getbasic']);
            Route::post('/updatetitle', [SettingController::class, 'updatetitle']);
            Route::post('/updatefav', [SettingController::class, 'updatefav']);
            Route::post('/updatelogo', [SettingController::class, 'updatelogo']);
            //social
            Route::get('/getsocial', [SettingController::class, 'getsocial'])->name('setting.getsocial');
            Route::get('/createsocial', [SettingController::class, 'createsocial']);
            Route::post('/storesocial', [SettingController::class, 'storesocial']);
            Route::get('/editsocial/{id}', [SettingController::class, 'editsocial']);
            Route::post('/updatesocial/{id}', [SettingController::class, 'updatesocial']);
            Route::delete('/delsocial/{id}', [SettingController::class, 'delsocial']);
            //header contact
            Route::get('/headinfo', [SettingController::class, 'getheadinfo']);
            Route::post('/updatephone', [SettingController::class, 'updatephone']);
            Route::post('/updateemail', [SettingController::class, 'updateemail']);


        });

        Route::prefix('design')->group(function () {
            Route::get('/headsocial', [LocationController::class, 'getheadsocial'])->name('design.headsocial');
            Route::get('/footersocial', [LocationController::class, 'footersocial'])->name('design.footersocial');
            
            Route::post('/addheadsocial', [LocationController::class, 'addheadsocial']);
            Route::delete('/delheadsocial/{id}', [LocationController::class, 'delheadsocial']);

            Route::post('/addfootsocial', [LocationController::class, 'addfootsocial']);
            Route::delete('/delfootsocial/{id}', [LocationController::class, 'delfootsocial']);

            Route::get('/getsortpage/{loc}', [LocationController::class, 'headsocialsort']);
            Route::get('/hsocialsavesort', [LocationController::class, 'headsocialsavesort']);
            Route::get('/getsort/{loc}', [LocationController::class, 'hsocialsort']);
            Route::post('/updatesort', [LocationController::class, 'updatesort']);
        });
    });

     
////////////////////////////////////////////////////////////////////
    Route::middleware('role.admin:admin-super')->group(function () {

       
      
    });

    /*
    Route::middleware('role.admin:super')->group(function () {

        // expert
   Route::prefix('/expert')->group(function () {
       Route::get('', [ExpertController::class, 'index'])->name('admin.expert.show');

   });

   });
*/
});

/*
Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});
*/
//Route::middleware(['localemiddle'])->
Route::prefix('lang/{lang}')->group(function () {
    Route::get('/', [HomeController::class, 'index']);
    Route::get('/about', [HomeController::class, 'about']);
 
    
});
require __DIR__ . '/auth.php';
