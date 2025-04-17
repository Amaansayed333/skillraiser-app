// server/routes/trainings.js
import express from "express";
import db from "../db.js";

const router = express.Router();

// GET /api/trainings?skills=react,nodejs,aws
router.get("/", (req, res) => {
  const skillsParam = req.query.skills;

  if (!skillsParam) {
    return res.status(400).json({ success: false, message: "Skills are required" });
  }

  // Split comma-separated skills and trim each one
  const skills = skillsParam.split(",").map(skill => skill.trim().toLowerCase());

  // Dynamically build the WHERE clause with LIKE for each skill
  const likeClauses = skills.map(() => `LOWER(skill_required) LIKE ?`).join(" OR ");
  const values = skills.map(skill => `%${skill}%`);
  
  const query = `
    SELECT * FROM Trainings
    WHERE ${likeClauses}
  `;

  db.query(query, values, (err, trainingResults) => {
    if (err) {
      console.error("❌ Error fetching trainings:", err);
      return res.status(500).json({ success: false, message: "Error fetching training courses" });
    }

    if (trainingResults.length === 0) {
      return res.status(404).json({ success: false, message: "No training courses found" });
    }

    res.json({
      success: true,
      trainings: trainingResults,
    });
  });
});

export default router;
