<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::all()->sortDesc();
        return view('backend.category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.category.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:categories,name',
            'slug' => 'required|unique:categories,slug',
            'photo' => 'required|image|max: 512|mimes:jpg,webp,png',
        ]);

        $image    =     $request->file('photo');
            $img_name =     "category_".time().".".$image->getClientOriginalExtension();
            $image->move('upload/categories',$img_name);
            $img_name = 'upload/categories/'.$img_name;

            $category = Category::create([
                'name'    =>    $request->input('name'),
                'slug'    =>    $request->input('slug'),
                'details' =>    $request->input('details'),
                'created_by' =>    Auth::guard('admin')->user()->id,
                'photo'   =>    $img_name,
            ]);

            if ($category) {
                toastr()->closeButton()->addSuccess('Category Added');
                return redirect()->route('category.create');
            }
            else
            {
                toastr()->closeButton()->addError('Category Not added');
                return redirect()->back();
            }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $category = Category::find($id);
        return view('backend.category.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|unique:categories,name,'.$id,
            'slug' => 'required|unique:categories,slug,'.$id,
            'photo' => 'image|max: 512|mimes:jpg,webp,png',
        ]);
        $image    =     $request->file('photo');
        if ($image){
            $img_name =     "category_".time().".".$image->getClientOriginalExtension();
            if (file_exists($request->input('pre_photo'))){
                unlink($request->input('pre_photo'));
            }
            $image->move('upload/categories',$img_name);
            $img_name = 'upload/categories/'.$img_name;
        }else{
            $img_name = $request->input('pre_photo');
        }
        $category = Category::find($id)->update([
            'name'    =>    $request->input('name'),
            'slug'    =>    $request->input('slug'),
            'details' =>    $request->input('details'),
            'status'  =>    $request->input('status'),
            'photo'   =>    $img_name,
        ]);
        if ($category) {
            toastr()
                ->closeButton()
                ->addSuccess('Category Updated');
            return redirect()->route('category.index');
        }
        else
        {
            toastr()
                ->closeButton()
                ->addError('Category Not Updated');
            return redirect()->back();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = Category::find($id);
        if (file_exists($category->photo)){
            unlink($category->photo);
        }
        $result = $category->delete();

        if ($result) {
            toastr()
                ->closeButton()
                ->addSuccess('Category Deleted');
            return redirect()->route('category.index');
        }
        else
        {
            toastr()
                ->closeButton()
                ->addError('Category Not Delete');
            return redirect()->back();
        }
    }


}
