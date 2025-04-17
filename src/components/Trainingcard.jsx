import React, { useState } from "react";

const TrainingCard = ({ training, onResume, onDismiss }) => {
  const [isStarted, setIsStarted] = useState(false); // State to track if training is started

  const handleStart = () => {
    setIsStarted(true); // Mark training as started
    onResume(training.id); // Trigger the resume action or any logic you want
  };

  return (
    <div className="bg-white shadow-md rounded-xl border hover:shadow-lg transition-all flex overflow-hidden min-h-[180px]">
      {/* Left side - Text content */}
      <div className="w-3/4 p-4 flex flex-col justify-between">
        <div>
          <h2 className="text-xl font-semibold mb-1">{training.title}</h2>
          <p className="text-sm text-gray-500 mb-2">
            {training.category} • {training.duration_minutes} mins
          </p>

          <div className="w-full bg-gray-200 h-2 rounded-full my-2">
            <div
              className="bg-blue-500 h-2 rounded-full"
              style={{ width: `${training.progress}%` }}
            ></div>
          </div>
          <p className="text-sm mb-3">{training.progress}% completed</p>
        </div>

        <div className="flex gap-2">
          {/* Conditionally render "Start" or "Resume" button */}
          {!isStarted ? (
            <button
              onClick={handleStart}
              className="bg-blue-600 text-white px-4 py-1 rounded hover:bg-blue-700 text-sm"
            >
              Start
            </button>
          ) : (
            <button
              onClick={() => onResume(training.id)}
              className="bg-blue-600 text-white px-4 py-1 rounded hover:bg-blue-700 text-sm"
            >
              Resume
            </button>
          )}

          <button
            onClick={() => onDismiss(training.id)}
            className="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600 text-sm"
          >
            Not Interested
          </button>
        </div>
      </div>

      {/* Right side - Image */}
      <div
        className="w-1/4 bg-cover bg-center"
        style={{
          backgroundImage: "url('/public/card2.jpg')", // change this URL to your own
        }}
      ></div>
    </div>
  );
};

export default TrainingCard;
