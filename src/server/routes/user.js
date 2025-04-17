// server/routes/user.js
import express from "express";
const router = express.Router();
import db from "../db.js";

// GET /api/user?name=John
router.get('/', (req, res) => {
  const name = req.query.name;

  if (!name) {
    return res.status(400).json({ success: false, message: 'Name is required' });
  }

  const userQuery = 'SELECT * FROM Users WHERE name = ?';

  db.query(userQuery, [name], (err, userResults) => {
    if (err) {
      console.error("❌ Error fetching user:", err);
      return res.status(500).json({ success: false, message: 'Error fetching user' });
    }

    if (userResults.length === 0) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    const user = userResults[0];
    console.log("✅ User found:", user);

    const skillsQuery = `
      SELECT skill FROM UserSkills
      WHERE user_id = ?
    `;

    db.query(skillsQuery, [user.user_id], (err, skillsResults) => {
      if (err) {
        console.error("❌ Error fetching skills:", err);
        return res.status(500).json({ success: false, message: 'Failed to fetch skills' });
      }

      console.log("✅ Skills fetched:", skillsResults);

      const skills = skillsResults.map(row => row.skill);

      res.json({
        success: true,
        user: {
          ...user,
          skills
        }
      });
    });
  });
});

export default router;
