<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Land;
use App\Models\Landowner;
use App\Models\Landphoto;
use App\Models\Landreview;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

use function PHPUnit\Framework\isNan;
use function PHPUnit\Framework\isNull;

class LandController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['get_all_land']]);
    }

    public function get_all_land(Request $req)
    {   
        $searchTerm = $req->search;
    
        if (is_null($searchTerm)) {
            $all_lands = Land::all();
        } else {
            $searchTerms = explode(' ', $searchTerm);
            $all_lands = Land::where(function ($query) use ($searchTerms) {
                foreach ($searchTerms as $term) {
                    $query->where(function ($query) use ($term) {
                        $query->where('land_name', 'LIKE', '%' . $term . '%')
                            ->orWhere('location', 'LIKE', '%' . $term . '%')
                            ->orWhere('provinsi', 'LIKE', '%' . $term . '%')
                            ->orWhere('kota', 'LIKE', '%' . $term . '%')
                            ->orWhere('kecamatan', 'LIKE', '%' . $term . '%')
                            ->orWhere('kelurahan', 'LIKE', '%' . $term . '%');
                    });
                }
            })->get();
            
        }
    
        foreach ($all_lands as $land) {
            $rating = Landreview::where("land_id", $land->id)->pluck("rating")->toArray();
            
            $land->rating = count($rating) > 0 ? round(array_sum($rating) / count($rating), 2) : 0;
    
            $land->land_photos = Landphoto::where("land_id", $land->id)->pluck("file_name")->toArray();
            $landowner = Landowner::find($land->landowner_id);

if ($landowner) {
    $user = User::find($landowner->user_id);
    $land->land_owner = [
        'name' => $user->name,
        'username' => $user->username,
        'email' => $user->email,
        'phone_number' => $landowner->phone_number,
    ];
} else {
    // Handle the case where $landowner is null
    $land->land_owner = null;
}

    
            unset($land->id);
            unset($land->created_at);
            unset($land->updated_at);
        }
    
        return response($all_lands);
    }
    
    
    

    public function create_land(Request $req)
    {
        $u = Auth::User();
        if(!Landowner::where('user_id', $u->id)->exists()) {
            return response()->json(["Message" => "have not registered as landowner, please register first", "Status" => false], 400);
        }

        $validator = Validator::make($req->all(), [
            "land_name" => "required",
            "location" => "required",
            "surface_area" => "required",
            "deskripsi" => "required",
            "rental_price" => "required",
            "provinsi" => "required",
            "kota" => "required",
            "kecamatan" => "required",
            "kelurahan" => "required"
        ]);

        if($validator->fails()) {
            return response()->json(["Message" => "Isi field body dengan benar!", "Status" => false], 400);
        }

        try {
            $land = new Land;
            $req->merge([ "landowner_id" => Landowner::where("user_id", $u->id)->first()->id ]);
            $land->fill($req->all());
            $land->save();
            return response($land);
        } catch (\Throwable $th) {
            return response()->json(["Message" => $req->all(), "Status" => $th->getMessage()], 500);
        }

    }
    public function add_photo_land(Request $req)
    {
        $u = Auth::User();

        $validator = Validator::make($req->all(), [
            "land_id" => "required",
        ]);

        if($validator->fails()) {
            return response()->json(["Message" => "Isi field body dengan benar!", "Status" => false], 400);
        }

        if($req->hasFile("land_img_arr")) {
            $image = $req->file("land_img_arr");
            for($i = 0; $i < count($image); $i++) {
                try {
                    $landname = explode(' ',Land::where("id", $req->land_id)->first()->land_name);
                    $imagename = implode('_',$landname) .'_' . date("dmy") . '_' . $i + 1 .'.'. $image[$i]->getClientOriginalExtension();
                    $image[$i]->move(public_path("uploads/land_image/$req->land_id/"), $imagename);
                    $landphoto = new Landphoto;
                    $landphoto->fill([
                        "land_id" => $req->land_id,
                        "file_name" => asset("uploads/land_image/$req->land_id") . "/".$imagename
                    ]);
                    $landphoto->save();
                } catch (\Throwable $th) {
                    return $th->getMessage();
                }
            }
            return response()->json(["Message" => "Image added!", "Status" => true], 200);
        }else {
            return false;
        }
    }

    public function land_rating(Request $req)
    {   
        $u = Auth::user();
        $validator = Validator::make($req->all(), [
            "land_id" => "required",
            "rating" => "required",
        ]);
        

        if($validator->fails()) {
            return response()->json(["Message" => "Isi field body dengan benar!", "Status" => false], 400);
        }

        if(Landreview::where("land_id", $req->land_id)->exists() && Landreview::where("user_id", $u->id)->exists() ) {
            return response()->json(["Message" => "already rate", "Status" => false], 400);
        }

        $landrating = new Landreview;
        $req->merge(["user_id" => $u->id]);
        $landrating->fill($req->all());
        $landrating->save();
        return response($landrating);

    }
    
    public function register_as_landowner(Request $req) 
    {

        $u = Auth::User();
        if(Landowner::where('user_id', $u->id)->exists()) {
            return response()->json(["Message" => "already registered as landowner" ,"Status" => false], 400);
        }

        $validator = Validator::make($req->all(), [
            "phone_number" => "required",
            "owner_adress" => "required",
        ]);

        if($validator->fails()) {
            return response()->json(["Message" => "Isi field body dengan benar!", "Status" => false], 400);
        }

        try {
            $landowner = new Landowner;
            $req->merge([ "user_id" => $u->id]);
            $landowner->fill($req->all());
            $landowner->save();
            return response($landowner);
            
        } catch (\Throwable $th) {
            Log::error('Error during landowner registration: ' . $th->getMessage());
            return response()->json(["Message" => "Something wrong when register", "Status" => false], 500);
        }

    }
}
