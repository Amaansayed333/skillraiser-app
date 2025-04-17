// src/components/TrainingCard.jsx
import React from "react";

const TrainingCard = ({ training, onResume, onDismiss }) => {
  return (
    <div className="bg-white shadow-md rounded-xl p-4 border hover:shadow-lg transition-all">
      <h2 className="text-xl font-semibold mb-1">{training.title}</h2>
      <p className="text-sm text-gray-500 mb-2">{training.category} • {training.duration_minutes} mins</p>
      
      <div className="w-full bg-gray-200 h-2 rounded-full my-2">
        <div
          className="bg-blue-500 h-2 rounded-full"
          style={{ width: `${training.progress}%` }}
        ></div>
      </div>
      <p className="text-sm mb-3">{training.progress}% completed</p>

      <div className="flex gap-2">
        <button
          onClick={() => onResume(training.id)}
          className="bg-blue-600 text-white px-4 py-1 rounded hover:bg-blue-700 text-sm"
        >
          Resume
        </button>
        <button
          onClick={() => onDismiss(training.id)}
          className="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 text-sm"
        >
          Not Interested
        </button>
      </div>
    </div>
  );
};

export default TrainingCard;
