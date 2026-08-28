import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import api from '../lib/api';

const Register = () => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({ name: '', email: '', phone: '', password: '' });
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleRegister = async (e) => {
    e.preventDefault();
    setMessage('');
    setError('');
    setLoading(true);
    try {
      await api.post('/api/register', {
        name: formData.name,
        email: formData.email,
        password: formData.password,
        phone: formData.phone,
      });
      setMessage("Inscription réussie ! Redirection...");
      setTimeout(() => navigate('/'), 3000);
    } catch (err) {
      setError(err.response?.data?.message || "Une erreur est survenue lors de l'inscription.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={pageStyle}>
      <div style={cardStyle}>

        {/* Left image panel */}
        <div style={leftPanel}>
          <div style={leftOverlay}>
            <div style={leftLogoWrap}>
              <div style={leftLogoIcon}>✚</div>
              <span style={{ fontWeight: '800', fontSize: '1.2em' }}>PharmacieRhamna</span>
            </div>
            <h2 style={{ fontSize: '1.9em', fontWeight: '800', margin: '0 0 12px' }}>
              Qualité & Confiance 🏥
            </h2>
            <p style={{ opacity: 0.88, lineHeight: 1.6, fontSize: '0.95em' }}>
              Rejoignez notre pharmacie en ligne et gérez votre santé facilement, à tout moment.
            </p>
            <div style={leftSteps}>
              {['Créez votre compte', 'Parcourez le catalogue', 'Commandez par WhatsApp'].map((s, i) => (
                <div key={i} style={stepItem}>
                  <div style={stepNum}>{i + 1}</div>
                  <span style={{ fontSize: '0.88em', fontWeight: '600' }}>{s}</span>
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Right form panel */}
        <div style={rightPanel}>
          <div style={formHeader}>
            <div style={formIconWrap}>✚</div>
            <h2 style={formTitle}>Créer un compte</h2>
            <p style={formSubtitle}>Rejoignez-nous gratuitement dès maintenant</p>
          </div>

          {message && <div style={successBox}>✅ {message}</div>}
          {error && <div style={errorBox}>⚠️ {error}</div>}

          <form onSubmit={handleRegister} style={{ width: '100%' }}>
            <label style={labelStyle}>Nom complet</label>
            <div style={inputWrap}>
              <span style={inputIcon}>👤</span>
              <input type="text" placeholder="fatima ezzahrae lahdili" style={inputStyle} required
                onChange={(e) => setFormData({ ...formData, name: e.target.value })} />
            </div>

            <label style={labelStyle}>Adresse Email</label>
            <div style={inputWrap}>
              <span style={inputIcon}>✉</span>
              <input type="email" placeholder="nom@exemple.com" style={inputStyle} required
                onChange={(e) => setFormData({ ...formData, email: e.target.value })} />
            </div>

            <label style={labelStyle}>Numéro de Téléphone</label>
            <div style={inputWrap}>
              <span style={inputIcon}>📞</span>
              <input type="tel" placeholder="06 00 00 00 00" style={inputStyle} required
                onChange={(e) => setFormData({ ...formData, phone: e.target.value })} />
            </div>

            <label style={labelStyle}>Mot de passe</label>
            <div style={inputWrap}>
              <span style={inputIcon}>🔑</span>
              <input type="password" placeholder="••••••••" style={inputStyle} required
                onChange={(e) => setFormData({ ...formData, password: e.target.value })} />
            </div>

            <button type="submit" style={submitBtn} disabled={loading}>
              {loading ? 'Création du compte...' : 'Créer mon compte →'}
            </button>
          </form>

          <p style={bottomText}>
            Déjà inscrit ?{' '}
            <span onClick={() => navigate('/login')} style={bottomLink}>Se connecter</span>
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
  display: 'flex', width: '100%', maxWidth: '960px',
  borderRadius: '28px', overflow: 'hidden',
  boxShadow: '0 25px 60px rgba(0,0,0,0.12)'
};
const leftPanel = {
  flex: '1', minWidth: '240px',
  backgroundImage: 'url("https://images.unsplash.com/photo-1576091160550-2173dad99901?auto=format&fit=crop&w=800&q=80")',
  backgroundSize: 'cover', backgroundPosition: 'center',
  display: 'flex', alignItems: 'flex-end'
};
const leftOverlay = {
  width: '100%', padding: '36px 28px',
  background: 'linear-gradient(to top, rgba(0,80,60,0.93) 0%, rgba(0,0,0,0.15) 100%)',
  color: 'white'
};
const leftLogoWrap = { display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '26px' };
const leftLogoIcon = {
  width: '32px', height: '32px', borderRadius: '8px',
  background: 'rgba(255,255,255,0.22)', display: 'flex', alignItems: 'center',
  justifyContent: 'center', fontWeight: '900', fontSize: '1em', color: 'white',
  border: '1px solid rgba(255,255,255,0.3)'
};
const leftSteps = { marginTop: '22px', display: 'flex', flexDirection: 'column', gap: '12px' };
const stepItem = { display: 'flex', alignItems: 'center', gap: '12px' };
const stepNum = {
  width: '26px', height: '26px', borderRadius: '50%',
  background: 'rgba(255,255,255,0.22)', border: '1px solid rgba(255,255,255,0.4)',
  display: 'flex', alignItems: 'center', justifyContent: 'center',
  fontWeight: '800', fontSize: '0.82em', flexShrink: 0
};
const rightPanel = {
  flex: '1.1', background: 'white', padding: '44px 36px',
  display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center'
};
const formHeader = { textAlign: 'center', marginBottom: '22px', width: '100%' };
const formIconWrap = {
  width: '50px', height: '50px', borderRadius: '14px',
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', fontSize: '1.4em', fontWeight: '900',
  display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 12px'
};
const formTitle = { fontSize: '1.65em', fontWeight: '800', color: '#2d3436', marginBottom: '6px' };
const formSubtitle = { color: '#636e72', fontSize: '0.9em' };
const successBox = {
  background: '#e8f8f5', border: '1px solid #55efc4', color: '#00b894',
  borderRadius: '10px', padding: '11px 15px', marginBottom: '14px',
  width: '100%', fontSize: '0.88em', boxSizing: 'border-box', fontWeight: '600'
};
const errorBox = {
  background: '#fff5f5', border: '1px solid #fab1a0', color: '#d63031',
  borderRadius: '10px', padding: '11px 15px', marginBottom: '14px',
  width: '100%', fontSize: '0.88em', boxSizing: 'border-box'
};
const labelStyle = {
  display: 'block', marginBottom: '5px',
  fontWeight: '700', color: '#2d3436', fontSize: '0.86em', width: '100%'
};
const inputWrap = { position: 'relative', width: '100%', marginBottom: '13px' };
const inputIcon = {
  position: 'absolute', left: '13px', top: '50%',
  transform: 'translateY(-50%)', fontSize: '0.95em', lineHeight: 1
};
const inputStyle = {
  width: '100%', padding: '11px 14px 11px 38px',
  borderRadius: '11px', border: '1.5px solid #dfe6e9',
  boxSizing: 'border-box', outline: 'none', fontSize: '0.93em', background: '#f8f9fa'
};
const submitBtn = {
  width: '100%', padding: '14px',
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', border: 'none', borderRadius: '13px',
  fontWeight: '800', cursor: 'pointer', fontSize: '1em',
  boxShadow: '0 6px 20px rgba(0,184,148,0.38)', marginTop: '6px'
};
const bottomText = { color: '#636e72', fontSize: '0.88em', marginTop: '18px', textAlign: 'center' };
const bottomLink = { color: '#00b894', fontWeight: '700', cursor: 'pointer' };

export default Register;