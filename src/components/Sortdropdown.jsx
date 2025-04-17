function SortOptions({ onSortChange }) {
  return (
    <div className="bg-white p-4 rounded-lg shadow-md mt-4 flex items-center gap-4">
      <label className="text-gray-700 font-medium">Sort by:</label>
      <select
        onChange={(e) => onSortChange(e.target.value)}
        className="border border-gray-300 rounded-md px-3 py-2"
      >
        <option value="">-- Select --</option>
        <option value="duration">Duration (Shortest First)</option>
        <option value="date">Date Created (Newest First)</option>
      </select>
    </div>
  );
}

export default SortOptions;