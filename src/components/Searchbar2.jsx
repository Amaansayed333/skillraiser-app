import { useState } from "react";

function SearchBar2({ onSkillSearch }) {
  const [newSkill, setNewSkill] = useState("");

  const handleSkillSubmit = async (e) => {
    e.preventDefault();
    if (!newSkill.trim()) return;

    try {
      const res = await fetch(`http://localhost:5000/api/trainings?skills=${newSkill}`);
      const data = await res.json();

      if (data.success) {
        const trainingsWithProgress = data.trainings.map(training => ({
          ...training,
          progress: training.progress || 0
        }));
        onSkillSearch(trainingsWithProgress);  // Send results to parent
      } else {
        onSkillSearch([]);  // No trainings found, send empty array
      }
    } catch (err) {
      console.error("Error fetching trainings:", err);
      alert("Something went wrong while searching.");
    }
  };

  return (
    <form onSubmit={handleSkillSubmit} className="flex flex-col md:flex-row gap-3 mt-4 bg-white p-3 rounded-lg shadow-sm">
      <input
        type="text"
        value={newSkill}
        onChange={(e) => setNewSkill(e.target.value)}
        placeholder="Enter new skill (e.g., Python, AWS)"
        className="px-3 py-1.5 border border-gray-300 rounded-md w-full text-sm bg-white"
      />
      <button
        type="submit"
        className="bg-green-500 text-white px-3 py-1.5 rounded-md text-sm hover:bg-green-600 transition"
      >
        Search Trainings
      </button>
    </form>
  );
}

export default SearchBar2;
