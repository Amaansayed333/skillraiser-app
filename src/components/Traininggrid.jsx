import React, { useState, useEffect } from "react";
import TrainingCard from "./Trainingcard.jsx";

const TrainingGrid = ({ trainings, onResume, onDismiss }) => {
  const [visibleTrainings, setVisibleTrainings] = useState(trainings);

  useEffect(() => {
    setVisibleTrainings(trainings);
  }, [trainings]);

  const handleDismiss = (id) => {
    setVisibleTrainings((prev) =>
      prev.filter((training) => training.training_id !== id)
    );
    if (onDismiss) onDismiss(id);
  };

  return (
    <div className="grid gap-4 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-2">
      {visibleTrainings.map((training) => (
        <TrainingCard
          key={training.training_id}
          training={training}
          onResume={onResume}
          onDismiss={handleDismiss}
        />
      ))}
    </div>
  );
};

export default TrainingGrid;
