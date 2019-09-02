# README

**API Documentation**

- List Users
  - Method - GET
  - URL - /api/v1/users
  
- Create User
  - Method - POST
  - URL - /api/v1/users
  - Body - {"user": {"first_name": "RK", "last_name": "KR", "birthday": "1985-09-01", "email": "rk@yopmail.com"}}
  - Header - { "Content-Type": "application/json" }

- Create Transaction
  - Method - POST
  - URL - /api/v1/users/:user_id/transactions
  - Body - {"transaction": {"latitude": "11.676445", "longitude": "78.131845", "amount": 150}}
  - Header - { "Content-Type": "application/json" }

- Assign Rewards
  - Method - POST
  - URL - /api/v1/users/:user_id/user_rewards/assign_rewards

**Setup Instructions**

1. Clone the Project.
2. The database.yml is present, so just run rake db:create db:migrate db:seed
3. Start the Rails server - rails s
4. To run the test cases - rspec

If you have any questions, feel free to reach out.