# SkillRaiser

**Personalized Learning Recommendations**

SkillRaiser is a full-stack web application that recommends training courses to users based on their current skill set and interests. It combines both NoSQL (MongoDB) and SQL (MySQL) databases to store and manage user and training data.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Database Setup](#database-setup)
- [Environment Variables](#environment-variables)
- [Installation](#installation)
- [Development & Running](#development--running)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Features

- 🔹 User authentication and personalized greeting
- 🔹 Dynamic fetching and display of user skills
- 🔹 Intelligent course recommendations based on skills and interests
- 🔹 Live search and filtering of training programs
- 🔹 Add new interests to get tailored suggestions
- 🔹 Sort courses by duration, creation date, or popularity
- 🔹 Responsive UI designed with Tailwind CSS
- 🔹 Gradient overlay background for enhanced visuals

---

## Tech Stack

- **Frontend:** React.js, Tailwind CSS, Vite
- **Backend:** Node.js, Express.js
- **Databases:**
  - MongoDB (user profiles, training metadata)
  - MySQL (relational queries via `training_platform.sql` schema)
- **Linting & Formatting:** ESLint

---

## Prerequisites

- **Node.js** v18 or higher
- **npm** v8 or higher
- **MySQL** 8.0+ (or compatible MariaDB)

---

## Database Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Amaansayed333/skillraiser-app.git
   cd skillraiser-app
   ```
2. **Create and import the SQL schema**
   ```sql
   -- In MySQL shell or client:
   CREATE DATABASE training_platform;
   USE training_platform;
   SOURCE training_platform.sql;
   ```
3. **Verify tables and sample data**
   ```sql
   SHOW TABLES;
   SELECT * FROM Users LIMIT 5;
   ```

---

## Environment Variables

Create a `.env` file in the project root and add the following (adjust values as needed):

```
# MongoDB connection string
MONGO_URI=mongodb://localhost:27017/skillraiser

# MySQL configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=training_platform

# App configuration
PORT=3000
```

---

## Installation

Install dependencies for both frontend and backend:

```bash
npm install        # Installs server-side dependencies
npm run client:install  # Installs React client dependencies
```

---

## Development & Running

- **Start both server and client in development mode**
  ```bash
  npm run dev
  ```
  This will:
  - Launch the Express server on `http://localhost:3000`
  - Launch the React dev server on `http://localhost:5173`

- **Production build**
  ```bash
  npm run build
  npm start
  ```

---

## Project Structure

```
skillraiser-app/
├── training_platform.sql    # SQL schema & seed data
├── package.json             # Scripts & dependencies
├── vite.config.js           # Vite configuration
├── eslint.config.js         # Lint rules
├── index.html               # Root HTML template
├── src/
│   ├── client/              # React frontend
│   │   ├── components/
│   │   └── App.jsx
│   └── server/              # Express backend
│       ├── controllers/
│       ├── models/          # Mongoose & SQL models
│       └── routes/
└── .gitignore
```

---

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -m 'Add my feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Open a Pull Request

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

