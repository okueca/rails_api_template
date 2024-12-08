
# Rails API Template with Authentication

This repository provides a **Ruby on Rails API template** that includes user authentication using **Devise** and JWT (JSON Web Token). It is designed for quickly creating new Rails projects with a prebuilt authentication system and standard API response handling.

---

## Features 🚀

1. **User Authentication**:
   - `Devise` integrated with custom controllers for handling login, registration, and logout.
   - Token-based authentication using JWT.

2. **API Response Handling**:
   - Consistent JSON responses using a custom response handler.
   - Standardized error and success messages.

3. **Exception Handling**:
   - Catch and handle various API errors, including JWT issues, validation errors, and missing parameters.

4. **Ready for Development**:
   - Preconfigured structure for rapid API development.
   - Clean, modular code organization.

---

## Setup and Installation 🛠️

### Prerequisites
- **Ruby**: Ensure Ruby is installed.
- **Rails**: Install Rails version `>= 7.0`.
- **Database**: PostgreSQL or your preferred DB.

### Steps to Set Up

1. Clone this repository:
   ```bash
   git clone https://github.com/okueca/rails_api_template.git
   cd rails_api_template
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Generate a Rails secret key:
   ```bash
   bundle exec rails secret
   ```

4. Add the secret to your encrypted credentials file:
   - If you use **VSCode** as your editor:
     ```bash
     EDITOR='code --wait' rails credentials:edit
     ```
   - Add the following to your encrypted credentials file:
     ```yaml
     # Other secrets...
     # Used as the base secret for Devise-JWT
     devise_jwt_secret_key: <paste your generated secret here>
     ```

5. Set up your database:
   ```bash
   rails db:create db:migrate
   ```

6. Start the server:
   ```bash
   rails server
   ```

---

## Usage 💡

### Authentication Endpoints

#### **1. User Registration**
- **Endpoint**: `POST /signup`
- **Request**:
   ```json
   {
     "user": {
       "name": "Ariclene Chimbili",
       "email": "user@example.com",
       "password": "password",
       "password_confirmation": "password"
     }
   }
   ```
- **Response**:
   ```json
    {
        "message": "Signed up successfully.",
        "data": {
            "id": 11,
            "email": "ariclinis10@gmail.com",
            "name": "Ariclene"
        },
        "meta": [],
        "errors": []
    }
   ```

#### **2. User Login**
- **Endpoint**: `POST /login`
- **Request**:
   ```json
    {
        "user":{
            "email": "ariclinis1@gmail.com",
            "password": "123456"
        }
    }
   ```
- **Response**:
   ```json
    {
        "status": 200,
        "message": "Logged in successfully.",
        "data": {
            "user": {
                "id": 1,
                "email": "ariclinis1@gmail.com",
                "name": "Ariclene"
            }
        }
    }
   ```

#### **3. User Logout**
- **Endpoint**: `DELETE /logout`
- **Request**: Pass Authorization token in the headers.
- **Response**:
   ```json
   {
     "status": 200,
     "message": "Logged out successfully."
   }
   ```

---

## Custom Modules 📦

### **1. ApiResponseHandler**
- Provides consistent JSON response structures for success, error, and pagination.

### **2. ApiExceptionsHandler**
- Handles exceptions globally and ensures appropriate error messages.

### **3. JSON Response Helper**
- A helper class (`JsonResponse`) for building structured JSON responses.

---

## Folder Structure 🗂️

```
rails_api_template/
├── app/
│   ├── controllers/
│   │   ├── concerns/
│   │   │   ├── api_response_handler.rb
│   │   │   ├── api_exceptions_handler.rb
│   │   ├── users/
│   │   │   ├── sessions_controller.rb
│   │   │   ├── registrations_controller.rb
│   ├── serializers/  # Custom UserSerializer (not included here)
│   │   │   ├── plan_serializer.rb
│   │   │   ├── user_serializer.rb
├── lib/
│   ├── okueca_tools/
│   │   ├── json_response.rb
```

---

## Contributing 🤝

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-branch
   ```
3. Make your changes and commit:
   ```bash
   git commit -m "Add new feature"
   ```
4. Push and submit a pull request:
   ```bash
   git push origin feature-branch
   ```

---

## License 📜

This project is open-sourced under the [MIT License](LICENSE).

---

## Author 👤
Created by Ariclene Chimbili (https://github.com/ariclinis). Feel free to reach out for questions or collaborations!