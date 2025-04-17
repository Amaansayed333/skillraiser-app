// SearchBar.jsx
import React, { useState } from 'react';

const SearchBar = ({ onSearch }) => {
  const [searchInput, setSearchInput] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    onSearch(searchInput);  // Pass search input to parent
  };

  return (
    <form onSubmit={handleSubmit} className="flex mb-4">
      <input
        type="text"
        placeholder="Search for trainings (e.g. AWS)"
        value={searchInput}
        onChange={(e) => setSearchInput(e.target.value)}
        className="p-2 border rounded-l-md flex-grow"
      />
      <button
        type="submit"
        className="p-2 bg-blue-600 text-white rounded-r-md"
      >
        Search
      </button>
    </form>
  );
};

export default SearchBar;
