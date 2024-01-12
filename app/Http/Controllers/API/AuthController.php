<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\{Validator, Hash, Log, Auth};

class AuthController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    public function user() {
        $u = Auth::user();
        unset($u->password);
        unset($u->email_verified_at);
        unset($u->role_id);
        unset($u->created_at);
        unset($u->updated_at);
        unset($u->id);
        return $u;
    }

    public function logout(Request $req) {
	 auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }
    public function register(Request $req)
    {
        $validator = Validator::make($req->all(), [
            "username" => "required",
            "email" => "required",
            "password" => "required",
            "name" => "required",
        ]);

        if ($validator->fails()) {
            return response()->json(["Message" => "Isi field body dengan benar!", "Status" => false], 400);
        }
        try {   
            if (User::where('email', $req->email)->exists() ) {
                return response()->json(["Message" => "Email already exist.", "Status" => false], 400);
            }
            $user = new User;
            $req->merge([ "password" => Hash::make($req->password), "role_id" => "1" ]);
            $user->fill($req->all());
            $user->save();
            return response($user);
        } catch (\Throwable $th) {
            Log::error('Error during user registration: ' . $th->getMessage());
            return response()->json(["Message" => "Something wrong when register", "Status" => false], 500);

        }
    }

    public function login()
    {
        $credentials = request(['email', 'password']);

        if (! $token = auth()->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }

    public function me()
    {
        return response()->json(auth()->user());
    }

    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }

    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}
