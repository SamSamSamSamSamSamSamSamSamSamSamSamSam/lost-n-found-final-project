import { BrowserRouter as Router} from 'react-router-dom';
import { Navbar, Footer } from './components'
import 'jquery/dist/jquery.min.js'; // Include jQuery first
import 'bootstrap/dist/js/bootstrap.bundle.min.js'; // Include Bootstrap JavaScript after jQuery
import './App.css'

function App() {

  return (
    <Router>
      <Navbar />
        
      <Footer />
    </Router>
  )
}

export default App
