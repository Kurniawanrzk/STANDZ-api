## Silahkan untuk mengimport <a href="https://github.com/Kurniawanrzk/STANDZ-api/blob/main/db_standz.sql">db_stanz.sql</a> di mysql db
## <a href="https://github.com/Kurniawanrzk/STANDZ-api/blob/main/API-STANDZ.postman_collection.json">Postman Collection</a>


## Step By Step using this code
1. Run git clone <my-cool-project>
2. Run composer install
3. Run cp .env.example .env
4. Run php artisan key:generate
5. Run php artisan migrate
6. Run php artisan vendor:publish --provider="Tymon\JWTAuth\Providers\LaravelServiceProvider"
7. Run php artisan jwt:secret
8. Run php artisan serve
9. Go to link localhost:8000

## API DOCUMENTATION
### AuthController

#### 1. Register

- **Endpoint:** `POST /api/v1/auth/register`

##### Request

```json
{
    "username": "string",
    "email": "string",
    "password": "string",
    "name": "string"
}
```

##### Response

```json
{
    "id": 1,
    "name": "string",
    "email": "string",
    "username": "string",
    "created_at": "timestamp",
    "updated_at": "timestamp"
}
```

#### 2. Login

- **Endpoint:** `POST /api/v1/auth/login`

##### Request

```json
{
    "email": "string",
    "password": "string"
}
```

##### Response

```json
{
    "access_token": "string",
    "token_type": "bearer",
    "expires_in": 3600
}
```

#### 3. Logout

- **Endpoint:** `POST /api/v1/auth/logout`

##### Request

- No request body

##### Response

```json
{
    "message": "Successfully logged out"
}
```

#### 4. Get User Details

- **Endpoint:** `GET /api/v1/auth/user`

##### Request

- No request body

##### Response

```json
{
    "id": 1,
    "name": "string",
    "email": "string",
    "username": "string"
}
```

#### 5. Refresh Token

- **Endpoint:** `GET /api/v1/auth/refresh`

##### Request

- No request body

##### Response

```json
{
    "access_token": "string",
    "token_type": "bearer",
    "expires_in": 3600
}
```

#### 6. Redirect to Google for Authentication

- **Endpoint:** `GET /api/v1/auth/google`

##### Request

- No request body

##### Response

- Redirect to Google authentication page.

#### 7. Handle Google Callback

- **Endpoint:** `GET /api/v1/auth/google/callback`

##### Request

- No request body

##### Response

- Redirect to the client with authentication details.

### LandController

#### 1. Get All Lands

- **Endpoint:** `GET /api/v1/land/get`

##### Request

- Query Parameters:
  - `search`: Search term for filtering lands.
  - `lth`: Sort by rental price in ascending order (true) or descending order (false). Default is descending.
  - `perPage`: Number of items per page. Default is 4.

##### Response

```json
[
    {
        "land_name": "string",
        "location": "string",
        "surface_area": "string",
        "deskripsi": "string",
        "rental_price": "string",
        "provinsi": "string",
        "kota": "string",
        "kecamatan": "string",
        "kelurahan": "string",
        "batas_tagihan": "string",
        "rating": 4.5,
        "land_photos": [
            "string",
            ...
        ],
        "land_owner": {
            "name": "string",
            "username": "string",
            "email": "string",
            "phone_number": "string"
        }
    },
    ...
]
```

#### 2. Get Land Details

- **Endpoint:** `GET /api/v1/land/get/{username}/{slug}`

##### Request

- No request body

##### Response

```json
{
    "land_name": "string",
    "location": "string",
    "surface_area": "string",
    "deskripsi": "string",
    "rental_price": "string",
    "provinsi": "string",
    "kota": "string",
    "kecamatan": "string",
    "kelurahan": "string",
    "batas_tagihan": "string",
    "rating": 4.5,
    "land_photos": [
        "string",
        ...
    ],
    "land_owner": {
        "name": "string",
        "username": "string",
        "email": "string",
        "phone_number": "string"
    }
}
```

#### 3. Check as Landowner

- **Endpoint:** `GET /api/v1/land/check/landowner`

##### Request

- No request body

##### Response

```json
true
```

#### 4. Create Land

- **Endpoint:** `POST /api/v1/land/create`

##### Request

```json
{
    "land_name": "string",
    "location": "string",
    "surface_area": "string",
    "deskripsi": "string",
    "rental_price": "string",
    "provinsi": "string",
    "kota": "string",
    "kecamatan": "string",
    "kelurahan": "string",
    "batas_tagihan": "string"
}
```

##### Response

```json
{
    "land_name": "string",
    "location": "string",
    "surface_area": "string",
    "deskripsi": "string",
    "rental_price": "string",
    "provinsi": "string",
    "kota": "string",
    "kecamatan": "string",
    "kelurahan": "string",
    "batas_tagihan": "string"
}
```

#### 5. Add Photo to Land

- **Endpoint:** `POST /api/v1/land/photo`

##### Request

```json
{
    "land_id": 1,
    "land_img_arr": [
        "file1.jpg",
        "file2.jpg",
        ...
    ]
}
```

##### Response

```json
{
    "Message": "Image added!",
    "Status": true
}
```

#### 6. Land Rating

- **Endpoint:** `POST /api/v1/land/rating`

##### Request

```json
{
    "land_id": 1,
    "rating": 4
}
```

##### Response

```json
{
    "land_id": 1,
    "user_id": 1,
    "rating": 4,
    "created_at": "timestamp",
    "updated_at": "timestamp"
}
```

#### 7. Register as Landowner

- **Endpoint:** `POST /api/v1/land/landowner/register`

##### Request

```json
{
    "phone_number": "string",
    "owner_adress": "string"
}
```

##### Response

```json
{
    "user_id": 1,
    "phone_number": "string",
    "owner_adress": "string",
    "created_at": "timestamp",
    "updated_at": "timestamp"
}
```

### ChatController

#### 1. Send Private Message

- **Endpoint:** `POST /api/v1/chat/message`

##### Request

```json
{
    "user_id": 1,
    "receiver_usn": "string",
    "room_id": 1,
    "message": "string"
}
```

##### Response

```json
{
    "status": "Message sent"
}
```

#### 2. Get Messages in Room

- **

Endpoint:** `GET /api/v1/chat/message/{room_id}`

##### Request

- No request body

##### Response

```json
[
    {
        "id": 1,
        "sender": {
            "id": 1,
            "name": "string",
            "username": "string",
            "email": "string",
            "created_at": "timestamp",
            "updated_at": "timestamp"
        },
        "message": "string",
        "receiver": 2,
        "room_id": 1,
        "created_at": "timestamp",
        "updated_at": "timestamp"
    },
    ...
]
```

#### 3. Create Chat Room

- **Endpoint:** `POST /api/v1/chat/create/room`

##### Request

```json
{
    "landowner": "string"
}
```

##### Response

```json
{
    "room_id": 1
}
```

#### 4. Get All Chat Users

- **Endpoint:** `GET /api/v1/chat/get/`

##### Request

- No request body

##### Response

```json
[
    {
        "room_id": 1,
        "user_id": "string",
        "user_receiver": "string",
        "data": {
            "room_id": 1,
            "user_1": "string",
            "user_2": "string",
            "latest_msg": {
                "sender": {
                    "id": 1,
                    "name": "string",
                    "username": "string",
                    "email": "string",
                    "created_at": "timestamp",
                    "updated_at": "timestamp"
                },
                "message": "string",
                "receiver": 2,
                "room_id": 1,
                "created_at": "timestamp",
                "updated_at": "timestamp"
            }
        }
    },
    ...
]
```
