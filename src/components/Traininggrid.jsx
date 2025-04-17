// src/components/TrainingGrid.jsx
import React from "react";
import TrainingCard from "./Trainingcard.jsx";

const TrainingGrid = ({ trainings, onResume, onDismiss }) => {
  return (
    <div className="grid gap-4 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
      {trainings.map((training) => (
        <TrainingCard
          key={training.id}
          training={training}
          onResume={onResume}
          onDismiss={onDismiss}
        />
      ))}
    </div>
  );
};

export default TrainingGrid;
