<?php

use App\Http\Middleware\Cors;
use App\Models\Message;
use App\Models\User;
use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/



Broadcast::channel('receiver.{receiverId}', function ($user, $receiverId) {
    // Check if the user is authorized to access the channel
    if ($user->id === $receiverId) {
        return ['id' => $user->id];
    }
    return null;
});






