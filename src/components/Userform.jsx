import { useState } from 'react';

const UserForm = ({ onUserSubmit }) => {
  const [name, setName] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    if (name.trim()) {
      onUserSubmit(name);
    }
  };

  return (
    
      <div className="relative h-screen flex justify-center items-center">
        {/* Background Image with overlay */}
        <div
          className="absolute inset-0 bg-cover bg-center opacity-70"
          style={{ backgroundImage: "url('public/homebackground.jpg')" }}
        ></div>
    
        {/* Gradient Overlay for extra smoothness */}
        <div className="absolute inset-0 bg-gradient-to-r from-blue-200 to-purple-200 opacity-50"></div>
    
        {/* Form content */}
        <form
          onSubmit={handleSubmit}
          className="relative z-10 bg-white p-6 rounded-xl shadow-lg w-96"
        >
          <h2 className="text-2xl font-semibold mb-4 text-center text-gray-800">
            Welcome to SkillRaiser 🚀
          </h2>
          <label className="block mb-2 text-sm font-medium text-gray-700">
            Enter your name:
          </label>
          <input
            type="text"
            className="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"
            placeholder="Your Name"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
          <button
            type="submit"
            className="mt-4 w-full bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded-md transition duration-200"
          >
            Get My Recommendations
          </button>
        </form>
      </div>
    );
    
};

export default UserForm;
