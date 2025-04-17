// server/index.js
import express from "express";
import cors from "cors";
import userRoute from "./routes/user.js";
import trainingRoute from "./routes/training.js"; // Import the new training route

const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

// Register routes
app.use("/api/user", userRoute);
app.use("/api/trainings", trainingRoute); // Register the training route

app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});