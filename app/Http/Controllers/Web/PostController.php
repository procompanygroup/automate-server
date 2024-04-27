<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Language;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
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
    public function edit($id)
    {
        $item = Post::with([
            'mediaposts' => function ($q) use ($id) {
                $q->with('mediastore');
            }
        ])->find($id);
        $lang_list = Language::orderByDesc('is_default')->with(
            [
                'langposts' => function ($q) use ($id) {
                    $q->where('post_id', $id);
                }
            ]
        )->get();
        //
        //   return $item;
        return view("admin.design.section.footer.edit", ["item" => $item, 'lang_list' => $lang_list]);
    }
    public function editfooter($id)
    {
        $item = Post::with([
            'mediaposts' => function ($q) use ($id) {
                $q->with('mediastore');
            }
        ])->find($id);
        $lang_list = Language::orderByDesc('is_default')->with(
            [
                'langposts' => function ($q) use ($id) {
                    $q->where('post_id', $id);
                }
            ]
        )->get();
        //
        //   return $item;
        return view("admin.design.section.footer.edit", ["item" => $item, 'lang_list' => $lang_list]);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
