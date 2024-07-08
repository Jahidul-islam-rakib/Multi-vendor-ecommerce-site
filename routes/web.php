<?php

use App\Http\Controllers\Backend\AdminController;
use App\Http\Controllers\Backend\BrandController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\CustomerController;
use App\Http\Controllers\Backend\PurchaseController;
use App\Http\Controllers\Backend\ReturnController;
use App\Http\Controllers\Frontend\HomeController as Frontend;
use App\Http\Controllers\Frontend\ShopController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Vendor\VendorController;
use App\Http\Controllers\CkeditorController;
use App\Models\Order;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\AuthenticatedSessionController;

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

// // In routes/web.php
// Route::post('/logout', [AuthenticatedSessionController::class, 'logout'])->name('logout');
// // In routes/web.php

// Route::middleware(['web'])->group(function () {
//     Route::post('/logout', [AuthenticatedSessionController::class, 'logout'])->name('logout');
// });



Route::get('/logout', [ProfileController::class, 'destroy'])->name('profile.logout');


Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');

Route::put('/profile', [ProfileController::class, 'update'])->name('profile.update');

Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');



Route::controller(Frontend::class)->group(function () {
    Route::get('/', 'index')->name('home');
    Route::get('/contact/', 'contact')->name('contact');
});


Route::controller(\App\Http\Controllers\Frontend\ProductController::class)->group(function () {
    Route::get('/product/{slug}', 'productDetails')->name('product.details');
    Route::post('/product/{slug}', 'productView');
    Route::get('/category/all', 'index')->name('category.all');
    Route::get('/brand/all', 'index')->name('brand.all');
    Route::get('/brand/{slug}', 'index')->name('productByBrand.details');
});

Route::controller(\App\Http\Controllers\Frontend\ShopController::class)->group(function () {
    Route::get('/shop/', 'index')->name('shop');
    Route::get('/category/{slug}', 'productShowByCategory')->name('productByCategory.details');
});

Route::controller(\App\Http\Controllers\Frontend\CartController::class)->group(function () {
    Route::post('/cart/product/{slug}', 'addToCart')->name('cart.add');
    Route::post('/cart/item/', 'addToCartFromWishlist')->name('cart.itemAdd');
    Route::get('/cart/', 'allItems')->name('cart');
    Route::post('/cart/update', 'update')->name('update.cart');
    Route::get('/checkout/', 'checkout')->name('checkout');
    Route::post('/order/', 'order')->name('order');
    Route::post('/cart/all/', 'cart');
    Route::post('/cart/item/delete/{id}', 'deleteItem');
});

Route::controller(\App\Http\Controllers\Frontend\WhislistController::class)->group(function () {
    Route::post('/wishlist/product/{slug}', 'addToWishlist')->name('wishlist.add');
    Route::get('/wishlist/', 'allItems')->name('wishlist');
    Route::post('/wishlist/all/', 'wishlist');
    Route::post('/wishlist/item/delete/', 'deleteItem')->name('wish.itemDelete');
});

Route::controller(\App\Http\Controllers\Frontend\CompareController::class)->group(function () {
    Route::post('/compare/product/{slug}', 'addToCompare')->name('compare.add');
    Route::get('/compare/', 'allItems')->name('compare');
    Route::post('/compare/all/', 'compare');
    Route::post('/compare/item/delete/', 'deleteItem')->name('compare.itemDelete');
});



//// Route for backend
//Route::controller(DashboardController::class)->group(function () {
//    Route::get('/admin', 'index')->name('admin');
//});

Route::prefix('/admin')->group(function () {
    Route::get('/', function (){
        return redirect()->route('admin.dashboard');
    });
    Route::get('/login', [AdminController::class, 'login']);
    Route::post('/login', [AdminController::class, 'checkLogin'])->name('admin.login');
    Route::middleware('admin')->group(function () {

        Route::get('/logout', [AdminController::class, 'adminLogout'])->name('admin.logout');
        Route::get('/profile', [AdminController::class, 'profile'])->name('admin.profile');
        Route::post('/profile', [AdminController::class, 'profileUpdate'])->name('admin.profile.update');
        Route::post('/profile/password', [AdminController::class, 'passwordUpdate'])->name('admin.profile.password');
        Route::post('/profile/photo', [AdminController::class, 'photoUpdate'])->name('admin.profile.photo');


        Route::controller(DashboardController::class)->group(function () {
            Route::get('/dashboard', 'index')->name('admin.dashboard');
        });


        // Route for Order
        Route::controller(\App\Http\Controllers\Backend\OrderController::class)->group(function () {
            Route::prefix('/order')->group(function () {
                Route::name('order.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/view/{id}', 'show')->name('view');
                    Route::post('/view/', 'statusUpdate')->name('status');
                    Route::post('/add', 'store')->name('store');
                });
            });
        });

        // Route for category
        Route::controller(CategoryController::class)->group(function () {
            Route::prefix('/category')->group(function () {
                Route::name('category.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for brand
        Route::controller(BrandController::class)->group(function () {
            Route::prefix('/brand')->group(function () {
                Route::name('brand.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for product
        Route::controller(ProductController::class)->group(function () {
            Route::prefix('/product')->group(function () {
                Route::name('product.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for purchase
        Route::controller(PurchaseController::class)->group(function () {
            Route::prefix('/purchase')->group(function () {
                Route::name('purchase.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for return product
        Route::controller(ReturnController::class)->group(function () {
            Route::prefix('/return')->group(function () {
                Route::name('return.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/purchase', 'create')->name('create');
                    Route::post('/purchase', 'store')->name('store');
                });
            });
        });

        // Route for vendors
        Route::controller(VendorController::class)->group(function () {
            Route::prefix('/vendor')->group(function () {
                Route::name('a_vendor.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for customer
        Route::controller(CustomerController::class)->group(function () {
            Route::prefix('/customer')->group(function () {
                Route::name('a_customer.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });


    });

});


//route for vendor pannel
Route::prefix('/vendor')->group(function () {
    Route::get('/',function (){
        return redirect()->route('vendor.dashboard');
    });
    Route::get('/login', [VendorController::class, 'login']);
    Route::post('/login', [VendorController::class, 'checkLogin'])->name('vendor.login');

    Route::post('/editor/imgUpload', [CkeditorController::class, 'imageUpload'])->name('ckeditor.v_upload');

    Route::middleware('vendor')->group(function () {
        Route::get('/logout', [VendorController::class, 'vendorLogout'])->name('vendor.logout');
        Route::get('/profile', [\App\Http\Controllers\Vendor\VendorProfileController::class, 'profile'])->name('vendor.profile');
        Route::post('/profile/', [\App\Http\Controllers\Vendor\VendorProfileController::class, 'profileUpdate'])->name('vendor.profile.update');
        Route::post('/profile/password', [\App\Http\Controllers\Vendor\VendorProfileController::class, 'passwordUpdate'])->name('vendor.profile.password');
        Route::post('/profile/photo', [\App\Http\Controllers\Vendor\VendorProfileController::class, 'photoUpdate'])->name('vendor.profile.photo');


        Route::controller(\App\Http\Controllers\Vendor\DashboardController::class)->group(function () {
            Route::get('/dashboard', 'index')->name('vendor.dashboard');
        });


        // Route for Order
        Route::controller(\App\Http\Controllers\Vendor\OrderController::class)->group(function () {
            Route::prefix('/order')->group(function () {
                Route::name('v_order.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/view/{id}', 'show')->name('view');
                    Route::post('/view/', 'statusUpdate')->name('status');
                });
            });
        });

        // Route for brand
        Route::controller(\App\Http\Controllers\Vendor\BrandController::class)->group(function () {
            Route::prefix('/brand')->group(function () {
                Route::name('v_brand.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for product
        Route::controller(\App\Http\Controllers\Vendor\ProductController::class)->group(function () {
            Route::prefix('/product')->group(function () {
                Route::name('v_product.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for Customer
        Route::controller(\App\Http\Controllers\Vendor\CustomerController::class)->group(function () {
            Route::prefix('/customer')->group(function () {
                Route::name('v_customer.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for purchase
        Route::controller(\App\Http\Controllers\Vendor\PurchaseController::class)->group(function () {
            Route::prefix('/purchase')->group(function () {
                Route::name('v_purchase.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/add', 'create')->name('create');
                    Route::post('/add', 'store')->name('store');
                    Route::get('/edit/{id}', 'edit')->name('edit');
                    Route::post('/edit/{id}', 'update')->name('update');
                    Route::get('/delete/{id}', 'destroy')->name('delete');
                });
            });
        });

        // Route for return product
        Route::controller(\App\Http\Controllers\Vendor\ReturnController::class)->group(function () {
            Route::prefix('/return')->group(function () {
                Route::name('v_return.')->group(function () {
                    Route::get('/', 'index')->name('index');
                    Route::get('/purchase', 'create')->name('create');
                    Route::post('/purchase', 'store')->name('store');
                });
            });
        });
    });

});



Route::get('/dashboard', function () {
    $t_wishlists = count(\session()->has('wishlist') ? \session()->get('wishlist') : []);
    $t_carts = count(\session()->has('cart') ? \session()->get('cart') : []);
    $t_compares = count(\session()->has('compare') ? \session()->get('compare') : []);
    $t_orders = Order::where('user_id',auth()->user()->id)->orderByDesc('id')->get()->count();
    return view('dashboard', compact('t_wishlists','t_compares','t_carts','t_orders'));
})->middleware(['auth', 'verified'])->name('dashboard');

Route::get('/search', [ShopController::class, 'search'])->name('search');
Route::get('/order/track', [\App\Http\Controllers\Frontend\ProfileController::class, 'order'])->name('order.track');
Route::post('/order/track', [\App\Http\Controllers\Frontend\ProfileController::class, 'orderTrack'])->name('order.track.info');

Route::middleware('auth')->group(function () {
    Route::get('/profile/', [\App\Http\Controllers\Frontend\ProfileController::class, 'index'])->name('profile');
    Route::post('/profile/', [\App\Http\Controllers\Frontend\ProfileController::class, 'update'])->name('update.profile');
    Route::get('/order/', [\App\Http\Controllers\Frontend\ProfileController::class, 'allOrders'])->name('profile.order');

    Route::get('/order/{id}', [\App\Http\Controllers\Frontend\ProfileController::class, 'orderInfo'])->name('profile.order.info');
    Route::get('/profile/password/', [\App\Http\Controllers\Frontend\ProfileController::class, 'password'])->name('profile.password');
    Route::post('/profile/password/', [\App\Http\Controllers\Frontend\ProfileController::class, 'updatePassword'])->name('profile.upPassword');
});





require __DIR__.'/auth.php';
