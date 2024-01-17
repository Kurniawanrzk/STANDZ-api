<?php

namespace App\Http\Controllers\API;

use App\Events\Message;
use App\Events\PrivateMessage;
use App\Http\Controllers\Controller;
use App\Models\{Message as ModelsMessage, User};
use App\Models\Room;
use Illuminate\Http\Request;

class ChatController extends Controller
{
    public function __construct() {
        $this->middleware('auth:api');
    }

    public function createRoom(Request $req) {
        $u = auth()->user();
        $u_2 = User::where("username", $req->landowner)->first();

        if((Room::where("user_1", $u->id)->exists() && 
        Room::where("user_2", $u_2->id)->exists()) || 
        (Room::where("user_2", $u_2->id)->exists() && Room::where("user_1", $u->id)->exists())) {
            $rooms = Room::where("user_1",  $u->id)
            ->Where('user_2',  $u_2->id)
            ->orWhere('user_1',  $u_2->id)
            ->Where('user_2', $u->id)->first();

            return $rooms;
        } else {

            $room = Room::create([
                "user_1" => $u->id,
                "user_2" =>  $u_2->id
            ]);
            return $room;
        }
    }
    public function sendPrivateMessage(Request $request)
    {

        $receiver_id = User::where("username", $request->receiver_usn)->first()->id ;
        if(Room::where("id", $request->room_id)->exists()) {
            $rooms = Room::where("user_1", $request->user_id)
                        ->Where('user_2',  $receiver_id)
                        ->orWhere('user_1',  $receiver_id)
                        ->Where('user_2', $request->user_id)->first();
                        $data = [
                            'sender' => $request->user_id,
                            'message' => $request->message,
                            'room_id' => $rooms->id
                        ];
                
                
                        broadcast(new PrivateMessage($data))->toOthers();
                        
                        ModelsMessage::create($data);
                        return response()->json(['status' => 'Message sent']);
        } else {

            $room = Room::create([
                "user_1" => $request->user_id,
                "user_2" =>  $receiver_id
            ]);
            $data = [
                'sender' => $request->user_id,
                'message' => $request->message,
                'room_id' => $room->id
            ];
    
    
            broadcast(new PrivateMessage($data))->toOthers();
            
            ModelsMessage::create($data);
            return response()->json(['status' => 'Message sent']);
        }

    }

    public function getMessage($room_id) {
        $chat = ModelsMessage::where("room_id", $room_id)->get();

        foreach($chat as $data) {
            $data->sender = User::where("id", $data->sender)->first();
        }
        return $chat;
    }
}
