<?php

namespace App\Http\Controllers\API;

use App\Events\Message;
use App\Events\NotifMessage;
use App\Events\NotifMessageOther;
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

    public function getAllChatUser() 
    {   
        $u = auth()->user();
        
        $rooms = Room::where('user_1', $u->id)
                    ->orWhere('user_2', $u->id)
                    ->get();
    
        $newRooms = [];
    
        foreach($rooms as $r) {
            $user1 = User::find($r->user_1)->username;
            $user2 = User::find($r->user_2)->username;
    
            $latestMsg = ModelsMessage::where('room_id', $r->id)
                            ->latest()
                            ->first();
    
            $newRooms[] = [
                'room_id' => $r->id,
                'user_id' => $u->username,
                'user_receiver' => ($r->user_1 == $u->id) ? $user2 : $user1,
                'data' => [
                    'room_id' => $r->id,
                    'user_1' => $user1,
                    'user_2' => $user2,
                    'latest_msg' => $latestMsg,
                ],
            ];
        }
    
        return $newRooms;
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
                            'receiver' => $receiver_id,
                            'room_id' => $rooms->id
                        ];
                
                
                        broadcast(new PrivateMessage($data))->toOthers();
                        ModelsMessage::create($data);
                        $da = $this->getAllChatUser();
                        broadcast(new NotifMessage($data['sender']))->toOthers();
                        broadcast(new NotifMessageOther($data['receiver']))->toOthers();
                        return response()->json(['status' => "Message sended"]);
        } else {

            $room = Room::create([
                "user_1" => $request->user_id,
                "user_2" =>  $receiver_id
            ]);
            $data = [
                'sender' => $request->user_id,
                'message' => $request->message,
                'receiver' => $receiver_id,
                'room_id' => $room->id
            ];
    
    
            broadcast(new PrivateMessage($data))->toOthers();
            ModelsMessage::create($data);
            $da = $this->getAllChatUser();
            broadcast(new NotifMessage($da))->toOthers();
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
