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

# API Documentation

## Authentication

### Register
- **Endpoint:** `/api/v1/auth/register`
- **Method:** `POST`
- **Description:** Registers a new user.
- **Request Body:**
  - `username` (string, required): User's username.
  - `email` (string, required): User's email address.
  - `password` (string, required): User's password.
  - `name` (string, required): User's full name.

- **Response:**
  - `access_token`: JWT token for authentication.
  - `token_type`: Type of token (bearer).
  - `expires_in`: Token expiration time.

### Login
- **Endpoint:** `/api/v1/auth/login`
- **Method:** `POST`
- **Description:** Authenticates a user.
- **Request Body:**
  - `email` (string, required): User's email address.
  - `password` (string, required): User's password.

- **Response:**
  - `access_token`: JWT token for authentication.
  - `token_type`: Type of token (bearer).
  - `expires_in`: Token expiration time.

### User Details
- **Endpoint:** `/api/v1/auth/user`
- **Method:** `GET`
- **Description:** Gets details of the authenticated user.
- **Authorization Header:** `Bearer {access_token}`

- **Response:**
  - User details with sensitive information removed.

### Logout
- **Endpoint:** `/api/v1/auth/logout`
- **Method:** `POST`
- **Description:** Logs out the authenticated user.
- **Authorization Header:** `Bearer {access_token}`

- **Response:**
  - `message`: "Successfully logged out."

## Land Operations

### Get All Land
- **Endpoint:** `/api/v1/land/get`
- **Method:** `GET`
- **Description:** Retrieves all land data based on search terms.
- **Query Parameter:**
  - `search` (string, optional): Search term for land data.

- **Authorization Header:** `Bearer {access_token}`

- **Response:**
  - Array of land objects with details.

### Create Land
- **Endpoint:** `/api/v1/land/create`
- **Method:** `POST`
- **Description:** Creates a new land.
- **Request Body:**
  - Various fields for land details.

- **Authorization Header:** `Bearer {access_token}`

- **Response:**
  - Details of the created land.

### Add Land Photo
- **Endpoint:** `/api/v1/land/photo`
- **Method:** `POST`
- **Description:** Adds photos to a specific land.
- **Request Body:**
  - `land_id` (integer, required): ID of the land.
  - `land_img_arr` (array, required): Array of land images.

- **Authorization Header:** `Bearer {access_token}`

- **Response:**
  - Message indicating success or failure.

### Land Rating
- **Endpoint:** `/api/v1/land/rating`
- **Method:** `POST`
- **Description:** Adds a rating to a specific land.
- **Request Body:**
  - `land_id` (integer, required): ID of the land.
  - `rating` (integer, required): Rating value.

- **Authorization Header:** `Bearer {access_token}`

- **Response:**
  - Details of the added rating.

### Register as Landowner
- **Endpoint:** `/api/v1/land/landowner/register`
- **Method:** `POST`
- **Description:** Registers the authenticated user as a landowner.
- **Request Body:**
  - `phone_number` (string, required): Phone number of the landowner.
  - `owner_adress` (string, required): Address of the landowner.

- **Authorization Header:** `Bearer {access_token}`

- **Response:**
  - Details of the registered landowner.

---

**Note:** Ensure to replace `{access_token}` with the actual JWT token obtained during authentication. All endpoints, except for registration and login, require a valid JWT token in the Authorization header for authentication.
