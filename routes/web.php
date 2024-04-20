<?php
 
use Illuminate\Support\Facades\Route;
 
use App\Http\Controllers\AdminController;
use App\Http\Controllers\Web\UserController;
use App\Http\Controllers\Web\LanguageController;
use App\Http\Controllers\Web\ProjectController;

use App\Http\Controllers\Web\LangProjectController;
use App\Http\Controllers\Web\MediaProjectController;
use App\Http\Controllers\Web\MediaStoreController;

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

Route::get('/', function () {
      return view('welcome');
   // return redirect()->route('login');
});
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
require __DIR__ . '/auth.php';
