<?php
// app/Events/PrivateMessage.php

namespace App\Events;

use App\Models\Room;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use App\Models\User;

class PrivateMessage implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $data;

    public function __construct($data)
    {
        $this->data = [
            'sender' => User::find($data['sender']),
            'message' => $data['message'],
            'room_id' => Room::find($data["room_id"])
        ];
    }

    public function broadcastOn()
    {
        return new  Channel("room.". $this->data['room_id']->id);
    }


}
