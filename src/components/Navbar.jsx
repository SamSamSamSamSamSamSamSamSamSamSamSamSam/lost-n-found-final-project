import { Link } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';

function Navbar() {
  return (
    <nav className="navbar navbar-expand-lg navbar-light fixed-top">
      <div className="container">

        {/* 1st Section - Company Name */}
        <div className="navbar-brand order-1 order-lg-0">
          <Link to="/">Your Company Name</Link>
        </div>

        {/* 2nd Section - Nav Links (Centered) */}
        <div className="collapse navbar-collapse order-3 order-lg-1" id="navbarNav">
          <ul className="navbar-nav mx-auto">
            <li className="nav-item mx-2">
              <Link to="/" className="nav-link">Home</Link>
            </li>
            <li className="nav-item mx-2">
              <Link to="/search" className="nav-link">Search</Link>
            </li>
            <li className="nav-item mx-2">
              <Link to="/contact" className="nav-link">Contact Us</Link>
            </li>
            <li className="nav-item mx-2">
              <Link to="/about" className="nav-link">About Us</Link>
            </li>
            <li className="nav-item mx-2">
              <Link to="/support" className="nav-link">Support</Link>
            </li>
          </ul>
        </div>

        {/* 3rd Section - Login and SignUp Buttons */}
        <div className="ml-auto order-2 order-lg-2">
          <button className="btn btn-outline-primary mx-2">Login</button>
          <button className="btn btn-primary">Sign Up</button>
        </div>

        {/* Button to toggle sidebar on small screens */}
        <button
          className="navbar-toggler order-4"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon"></span>
        </button>

      </div>
    </nav>
  );
}

export default Navbar;
