// src/components/SortDropdown.jsx
import React from "react";

const SortDropdown = ({ sortOption, onChange }) => {
  return (
    <select
      value={sortOption}
      onChange={(e) => onChange(e.target.value)}
      className="p-2 border rounded-md shadow-sm mb-4"
    >
      <option value="relevant">Most Relevant</option>
      <option value="newest">Newest First</option>
    </select>
  );
};

export default SortDropdown;
