# SkillRaiser

**Personalized Learning Recommendations**

SkillRaiser is a full-stack web application that provides training course recommendations based on users’ existing skills and new interests. It leverages both MongoDB and MySQL databases to manage user profiles, skills, and training metadata.

## Table of Contents

1. [Features](#features)
2. [Tech Stack](#tech-stack)
3. [Prerequisites](#prerequisites)
4. [Database Setup](#database-setup)
5. [Environment Variables](#environment-variables)
6. [Installation](#installation)
7. [Development & Running](#development--running)
8. [Project Structure](#project-structure)
9. [Contributing](#contributing)
10. [License](#license)

---

## Features

- 🔹 **User Authentication & Personalized Greeting**: Users sign in by name and receive a custom welcome message.
- 🔹 **Skill Profile Management**: Fetch and display users’ existing skills from MongoDB.
- 🔹 **Intelligent Course Recommendations**: Recommend trainings by matching user skills and newly entered interests.
- 🔹 **Live Search & Filtering**: Search for additional courses by skill; filter and sort results.
- 🔹 **Add New Interests**: Dynamically query for new training programs by entering new skills.
- 🔹 **Sort Options**: Sort by duration, creation date, or popularity.
- 🔹 **Responsive UI**: Built with Tailwind CSS; gradient overlays for enhanced visuals.

## Tech Stack

- **Frontend**: React.js, Vite, Tailwind CSS  
- **Backend**: Node.js, Express.js  
- **Databases**:
  - MongoDB (user profiles & skill data)  
  - MySQL (training schema & relational queries via `training_platform.sql`)  
- **Linting & Formatting**: ESLint, Prettier

## Prerequisites

- **Node.js** v18 or higher
- **npm** v8 or higher
- **MySQL** 8.0+ or MariaDB-compatible
- **MongoDB** 4.4+

## Database Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Amaansayed333/skillraiser-app.git
   cd skillraiser-app
   ```

2. **MySQL Schema**
   ```sql
   -- In MySQL shell or client:
   CREATE DATABASE training_platform;
   USE training_platform;
   SOURCE training_platform.sql;

   -- Verify tables:
   SHOW TABLES;
   SELECT * FROM Users LIMIT 5;
   ```

3. **MongoDB Database**
   ```bash
   # Start MongoDB locally or use Atlas
   mongo --eval "use skillraiser"
   # (Optionally import seed data if provided)
   ```

## Environment Variables

Create a `.env` file in the project root:

```dotenv
# MongoDB connection
MONGO_URI=mongodb://localhost:27017/skillraiser

# MySQL configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=training_platform

# Server port
PORT=3000
```

## Installation

Install dependencies for both backend and frontend:

```bash
npm install            # Backend dependencies
npm run client:install # Frontend dependencies
```

## Development & Running

Start both server and client in development mode:

```bash
npm run dev
```

- **Express server** runs at `http://localhost:3000`  
- **React dev server** runs at `http://localhost:5173`

**Production Build**:

```bash
npm run build   # Builds the React frontend
npm start       # Starts the Express server with the built frontend
```

## Project Structure

```
skillraiser-app/
├── training_platform.sql       # MySQL schema & seed data
├── package.json                # Scripts & dependencies
├── vite.config.js              # Vite configuration
├── .eslintrc.js                # ESLint rules
├── .gitignore
├── index.html                  # Frontend entry HTML
├── src/
│   ├── client/                 # React frontend
│   │   ├── components/         # Reusable UI components
│   │   ├── assets/             # Images & styles
│   │   ├── App.jsx             # Main React component
│   │   └── main.jsx            # React entry point
│   └── server/                 # Express backend
│       ├── controllers/        # Route handlers
│       ├── models/             # Mongoose & SQL models
│       ├── routes/             # API route definitions
│       ├── db.js               # Database connection setup
│       └── index.js            # Server entry point
└── public/                     # Static assets
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository  
2. Create a feature branch: `git checkout -b feature/my-feature`  
3. Commit changes: `git commit -m "Add my feature"`  
4. Push branch: `git push origin feature/my-feature`  
5. Open a Pull Request

Ensure lint checks pass:
```bash
npm run lint
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

