import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import api from '../lib/api';

const ADMIN_EMAIL = "fatimaishrak1@gmail.com";

const Login = ({ setAuth }) => {
  const navigate = useNavigate();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleLogin = async (e) => {
    e.preventDefault();
    setError('');
    setLoading(true);
    try {
      const response = await api.post('/api/login', { email, password });
      const token = response.data.access_token;
      localStorage.setItem('auth_token', token);
      localStorage.setItem('isAuth', 'true');
      if (email === ADMIN_EMAIL) {
        localStorage.setItem('isAdmin', 'true');
      } else {
        localStorage.setItem('isAdmin', 'false');
      }
      if (setAuth) setAuth(true);
      navigate(email === ADMIN_EMAIL ? '/admin/products' : '/boutique');
    } catch (error) {
      console.error('Login error:', error);
      setError('Email ou mot de passe incorrect.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={pageStyle}>
      <div style={cardStyle}>

        {/* Left Panel */}
        <div style={leftPanel}>
          <div style={leftOverlay}>
            <div style={leftLogoWrap}>
              <div style={leftLogoIcon}>✚</div>
              <span style={{ fontWeight: '800', fontSize: '1.3em' }}>PharmacieRhamna</span>
            </div>
            <h2 style={{ fontSize: '2em', fontWeight: '800', margin: '0 0 14px' }}>Bienvenue 👋</h2>
            <p style={{ opacity: 0.88, lineHeight: 1.6, fontSize: '0.97em' }}>
              Accédez à votre espace santé sécurisé et gérez vos commandes facilement.
            </p>
            <div style={leftBadgesRow}>
              <span style={leftBadge}>💊 400+ Produits</span>
              <span style={leftBadge}>🔒 Sécurisé</span>
            </div>
          </div>
        </div>

        {/* Right Panel */}
        <div style={rightPanel}>
          <div style={formHeader}>
            <div style={formIconWrap}>✚</div>
            <h2 style={formTitle}>Connexion</h2>
            <p style={formSubtitle}>Entrez vos identifiants pour continuer</p>
          </div>

          {error && (
            <div style={errorBox}>
              <span>⚠️</span> {error}
            </div>
          )}

          <form onSubmit={handleLogin} style={{ width: '100%' }}>
            <label style={labelStyle}>Adresse Email</label>
            <div style={inputWrap}>
              <span style={inputIcon}>✉</span>
              <input
                type="email"
                placeholder="nom@exemple.com"
                style={inputStyle}
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>

            <label style={labelStyle}>Mot de passe</label>
            <div style={inputWrap}>
              <span style={inputIcon}>🔑</span>
              <input
                type="password"
                placeholder="••••••••"
                style={inputStyle}
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>

            <button type="submit" style={submitBtn} disabled={loading}>
              {loading ? 'Connexion...' : 'Se connecter →'}
            </button>
          </form>

          <p style={bottomText}>
            Pas encore de compte ?{' '}
            <span onClick={() => navigate('/register')} style={bottomLink}>S'inscrire</span>
          </p>
        </div>
      </div>
    </div>
  );
};

/* ===== STYLES ===== */
const pageStyle = {
  minHeight: 'calc(100vh - 68px)', display: 'flex',
  alignItems: 'center', justifyContent: 'center',
  background: 'linear-gradient(135deg, #f0faf8, #e8f4fd)',
  padding: '30px 20px', boxSizing: 'border-box'
};
const cardStyle = {
  display: 'flex', width: '100%', maxWidth: '920px',
  borderRadius: '28px', overflow: 'hidden',
  boxShadow: '0 25px 60px rgba(0,0,0,0.12)'
};
const leftPanel = {
  flex: '1.1',
  backgroundImage: 'url("https://images.unsplash.com/photo-1587854692152-cbe660dbbb88?auto=format&fit=crop&w=800&q=80")',
  backgroundSize: 'cover', backgroundPosition: 'center',
  position: 'relative', display: 'flex', alignItems: 'flex-end'
};
const leftOverlay = {
  width: '100%', padding: '36px 32px',
  background: 'linear-gradient(to top, rgba(0,80,60,0.92) 0%, rgba(0,0,0,0.2) 100%)',
  color: 'white'
};
const leftLogoWrap = { display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '30px' };
const leftLogoIcon = {
  width: '34px', height: '34px', borderRadius: '8px',
  background: 'rgba(255,255,255,0.25)', backdropFilter: 'blur(4px)',
  display: 'flex', alignItems: 'center', justifyContent: 'center',
  fontWeight: '900', fontSize: '1.1em', color: 'white'
};
const leftBadgesRow = { display: 'flex', gap: '10px', marginTop: '20px', flexWrap: 'wrap' };
const leftBadge = {
  background: 'rgba(255,255,255,0.18)', backdropFilter: 'blur(6px)',
  borderRadius: '20px', padding: '6px 14px', fontSize: '0.82em',
  fontWeight: '600', border: '1px solid rgba(255,255,255,0.25)'
};
const rightPanel = {
  flex: '1', background: 'white', padding: '48px 40px',
  display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center'
};
const formHeader = { textAlign: 'center', marginBottom: '28px', width: '100%' };
const formIconWrap = {
  width: '52px', height: '52px', borderRadius: '14px',
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', fontSize: '1.5em', fontWeight: '900',
  display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 14px'
};
const formTitle = { fontSize: '1.7em', fontWeight: '800', color: '#2d3436', marginBottom: '6px' };
const formSubtitle = { color: '#636e72', fontSize: '0.92em' };
const errorBox = {
  background: '#fff5f5', border: '1px solid #fab1a0', color: '#d63031',
  borderRadius: '10px', padding: '12px 16px', marginBottom: '18px',
  width: '100%', fontSize: '0.9em', display: 'flex', gap: '8px', alignItems: 'center',
  boxSizing: 'border-box'
};
const labelStyle = { display: 'block', marginBottom: '6px', fontWeight: '700', color: '#2d3436', fontSize: '0.88em', width: '100%' };
const inputWrap = { position: 'relative', width: '100%', marginBottom: '18px' };
const inputIcon = { position: 'absolute', left: '14px', top: '50%', transform: 'translateY(-50%)', fontSize: '1em', lineHeight: 1 };
const inputStyle = {
  width: '100%', padding: '13px 14px 13px 40px',
  borderRadius: '12px', border: '1.5px solid #dfe6e9',
  boxSizing: 'border-box', outline: 'none', fontSize: '0.95em',
  transition: 'border-color 0.2s', background: '#f8f9fa'
};
const submitBtn = {
  width: '100%', padding: '15px',
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', border: 'none', borderRadius: '13px',
  fontWeight: '800', cursor: 'pointer', fontSize: '1em',
  boxShadow: '0 6px 20px rgba(0,184,148,0.4)', marginTop: '4px'
};
const bottomText = { color: '#636e72', fontSize: '0.9em', marginTop: '22px', textAlign: 'center' };
const bottomLink = { color: '#00b894', fontWeight: '700', cursor: 'pointer' };

export default Login;