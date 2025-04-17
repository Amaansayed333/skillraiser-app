import { useState } from "react";
import UserForm from "./components/Userform.jsx";

import SearchBar2 from "./components/Searchbar2.jsx"
import TrainingGrid from "./components/Traininggrid.jsx";
import Sortoptions from "./components/Sortdropdown.jsx";

function App() {
  const [userName, setUserName] = useState("");
  const [userData, setUserData] = useState(null);
  const [searchTerm, setSearchTerm] = useState("");
  const [trainings, setTrainings] = useState([]);
  const [filteredTrainings, setFilteredTrainings] = useState([]);

  // Fetch user data and their skills from backend
  const handleUserSubmit = async (name) => {
    setUserName(name);

    try {
      const res = await fetch(`http://localhost:5000/api/user?name=${name}`);
      const data = await res.json();

      if (data.success) {
        setUserData(data.user);
        fetchTrainings(data.user.skills); // Fetch training data based on skills
      } else {
        alert(data.message || "User not found.");
      }
    } catch (err) {
      console.error("Error fetching user:", err);
      alert("Something went wrong.");
    }
  };

  // Fetch training courses based on user skills
  const fetchTrainings = async (skills) => {
    if (!skills || skills.length === 0) {
      setTrainings([]);
      setFilteredTrainings([]);
      return;
    }

    try {
      const res = await fetch(`http://localhost:5000/api/trainings?skills=${skills.join(",")}`);
      const data = await res.json();

      if (data.success) {
        // Add default progress if not provided
        const trainingsWithProgress = data.trainings.map((training) => ({
          ...training,
          progress: training.progress || 0,
        }));

        setTrainings(trainingsWithProgress);
        setFilteredTrainings(trainingsWithProgress);
      } else {
        alert("No training courses found.");
      }
    } catch (err) {
      console.error("Error fetching training courses:", err);
      alert("Something went wrong.");
    }
  };

  // Handle search term and filter trainings
  const handleSortChange = (type) => {
    let sorted = [...filteredTrainings];
  
    if (type === "duration") {
      sorted.sort((a, b) => a.duration_minutes - b.duration_minutes);
    } else if (type === "date") {
      sorted.sort((a, b) => new Date(b.date_created) - new Date(a.date_created));
    }
  
    setFilteredTrainings(sorted);
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-200 via-green-100 to-blue-200">
      {!userData ? (
        <UserForm onUserSubmit={handleUserSubmit} />
      ) : (
        <div className="p-6 max-w-4xl mx-auto space-y-6">
          {/* 1. Greeting */}
          <div className="text-center">
            <h1 className="text-3xl font-bold text-gray-800">
              👋 Welcome {userData.name} to SkillRaiser
            </h1>
                <p className="text-2xl font-bold text-gray-600 mt-2">
                  Your skills:
                  <span className="font-medium text-blue-600 text-lg font-semibold">
                    {" "}
                      {userData.skills.join(", ")}
                  </span>
                </p>
          </div>

          {/* 3. Search Bar */}
          <div>
            <h2 className="text-xl font-semibold text-gray-800 mb-2">
              🔍 Explore More Trainings by Interest
              <SearchBar2 onSkillSearch={(results) => setFilteredTrainings(results)} />
            </h2>
            <Sortoptions onSortChange={handleSortChange}/>
            
            
          </div>

          {/* 2. Trainings based on existing skills */}
          <div>
            <h2 className="text-2xl font-semibold mb-3 text-gray-800">
              🎯 Recommended Trainings Based on Your Skills
            </h2>
            {trainings.length > 0 ? (
              <TrainingGrid
                trainings={filteredTrainings}
                onResume={(id) => console.log(`Resuming training with id: ${id}`)}
                onDismiss={(id) => console.log(`Dismissed training with id: ${id}`)}
              />
            ) : (
              <p className="text-gray-500">No trainings found based on your skills.</p>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
