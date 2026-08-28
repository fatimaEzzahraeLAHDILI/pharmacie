import { BrowserRouter as Router, Routes, Route, Link, Navigate } from 'react-router-dom';
import { useEffect, useState } from 'react';

import Home from './components/Home';
import Boutique from './components/Boutique';
import Login from './components/Login';
import Register from './components/Register';
import AdminProducts from './components/AdminProducts';
import AdminUsers from './components/AdminUsers';
import ProductDetails from './components/ProductDetails';
import api from './lib/api';

function App() {
  const [medicines, setMedicines] = useState([]);
  const [isAuthenticated, setIsAuthenticated] = useState(localStorage.getItem('isAuth') === 'true');
  const [isAdmin, setIsAdmin] = useState(localStorage.getItem('isAdmin') === 'true');

  useEffect(() => {
    api.get('/api/products')
      .then(res => setMedicines(res.data))
      .catch(err => console.log("Erreur API:", err));
  }, []);

  const handleLogout = () => {
    localStorage.removeItem('isAuth');
    localStorage.removeItem('isAdmin');
    localStorage.removeItem('auth_token');
    setIsAuthenticated(false);
    setIsAdmin(false);
    window.location.href = "/login";
  };

  return (
    <Router>
      <div style={{ width: '100%', minHeight: '100vh', background: '#f0f4f8', fontFamily: "'Segoe UI', sans-serif" }}>

        {/* ===== NAVBAR ===== */}
        <nav style={navStyle}>
          <Link to="/" style={{ textDecoration: 'none', display: 'flex', alignItems: 'center', gap: '10px' }}>
            <div style={logoIconStyle}>✚</div>
            <div>
              <div style={{ color: '#00b894', fontWeight: '800', fontSize: '1.2em', lineHeight: 1 }}>PharmacieRhamna</div>
              <div style={{ color: '#636e72', fontSize: '0.72em', fontWeight: '500', letterSpacing: '0.05em' }}>Santé & Bien-être</div>
            </div>
          </Link>

          <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
            <Link to="/" style={navLinkStyle}>Accueil</Link>

            {!isAuthenticated ? (
              <>
                <Link to="/login" style={navLinkStyle}>Connexion</Link>
                <Link to="/register" style={navRegisterBtn}>S'inscrire</Link>
              </>
            ) : (
              <>
                {isAdmin && (
                  <>
                    <Link to="/admin/products" style={navAdminBtn}>⚙ Gestion Stock</Link>
                    <Link to="/admin/users" style={navAdminBtn}>👥 Gestion Utilisateurs</Link>
                  </>
                )}
                <Link to="/boutique" style={navBoutiqueBtn}>🛍 Boutique</Link>
                <button onClick={handleLogout} style={navLogoutBtn}>Déconnexion</button>
              </>
            )}
          </div>
        </nav>

        {/* ===== ROUTES ===== */}
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login setAuth={(val) => {
            setIsAuthenticated(val);
            setIsAdmin(localStorage.getItem('isAdmin') === 'true');
          }} />} />
          <Route path="/register" element={<Register />} />
          <Route path="/boutique" element={isAuthenticated ? <Boutique medicines={medicines} /> : <Navigate to="/login" />} />
          <Route path="/boutique/product/:id" element={isAuthenticated ? <ProductDetails medicines={medicines} /> : <Navigate to="/login" />} />
          <Route path="/admin/products" element={isAuthenticated && isAdmin ? <AdminProducts /> : <Navigate to="/boutique" />} />
          <Route path="/admin/users" element={isAuthenticated && isAdmin ? <AdminUsers /> : <Navigate to="/boutique" />} />
        </Routes>

      </div>
    </Router>
  );
}

/* ===== NAV STYLES ===== */
const navStyle = {
  display: 'flex', justifyContent: 'space-between', alignItems: 'center',
  padding: '0 8%', height: '68px',
  background: 'white',
  boxShadow: '0 2px 16px rgba(0,184,148,0.1)',
  position: 'sticky', top: 0, zIndex: 1000,
  borderBottom: '2px solid #e8f8f5'
};
const logoIconStyle = {
  width: '38px', height: '38px', borderRadius: '10px',
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center',
  fontWeight: '900', fontSize: '1.3em', boxShadow: '0 4px 12px rgba(0,184,148,0.35)'
};
const navLinkStyle = {
  textDecoration: 'none', color: '#2d3436', fontWeight: '600',
  padding: '8px 14px', borderRadius: '8px', fontSize: '0.95em',
  transition: 'background 0.2s'
};
const navAdminBtn = {
  textDecoration: 'none', color: '#e17055', fontWeight: '700',
  background: '#fff4f2', padding: '8px 16px', borderRadius: '10px',
  border: '1.5px solid #fab1a0', fontSize: '0.9em'
};
const navBoutiqueBtn = {
  textDecoration: 'none', color: '#00b894', fontWeight: '700',
  background: '#e8f8f5', padding: '8px 18px', borderRadius: '10px',
  border: '1.5px solid #55efc4', fontSize: '0.9em'
};
const navRegisterBtn = {
  textDecoration: 'none', background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', padding: '10px 24px', borderRadius: '24px', fontWeight: '700',
  fontSize: '0.9em', boxShadow: '0 4px 14px rgba(0,184,148,0.35)'
};
const navLogoutBtn = {
  background: 'transparent', color: '#d63031', border: '1.5px solid #d63031',
  padding: '8px 18px', borderRadius: '10px', cursor: 'pointer', fontWeight: '700',
  fontSize: '0.9em'
};

export default App;