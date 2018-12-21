<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\facades\Hash;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    
    public function index()
    {
        return User::latest()->paginate(10);
    }

    
    public function store(Request $request)
    {

        $this->validate($request,[
            'name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|unique:users',
            'password' => 'required|string|min:6'
        ]);

        return User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'type' => $request['type'],
            'bio' => $request['bio'],
            'photo' => $request['photo'],
            'password' => Hash::make($request['password']),
        ]);
    }

   
    public function show($id)
    {
        //
    }

   
    public function update(Request $request, $id)
    { 
        $user = User::findOrFail($id);
        $this->validate($request, [
            'name' => 'required|min:3|max:256',
            'email' => 'required|email|unique:users,email,'.$user->id,
            'bio' => 'required',
            'type' => 'required',
        ]);
        $user->update($request->all());

        return ['message' => 'Updated the User'];
    }

    
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        // delete the User
        $user->delete();
        return ['message' => 'User Deleted'];
    }
}
