import React from 'react';
import { Link } from 'react-router-dom';

const Home = () => {
  return (
    <div style={{ width: '100%', fontFamily: "'Segoe UI', sans-serif" }}>

      {/* ===== HERO SECTION ===== */}
      <div style={heroSection}>
        <div style={heroBg}></div>
        <div style={heroContent}>
          <div style={heroText}>
            <div style={heroBadge}>✚ Pharmacie en ligne certifiée</div>
            <h1 style={heroTitle}>
              Votre santé,<br />
              <span style={{ color: '#00b894' }}>notre priorité</span>
            </h1>
            <p style={heroSubtitle}>
              Commandez vos médicaments et vitamines en toute sécurité, directement depuis chez vous. Livraison rapide et service professionnel.
            </p>
            <div style={{ display: 'flex', gap: '16px', flexWrap: 'wrap', marginTop: '10px' }}>
              <Link to="/login" style={heroBtnPrimary}>Se Connecter</Link>
              <Link to="/register" style={heroBtnSecondary}>Créer un compte</Link>
            </div>
            <div style={statsRow}>
              <div style={statItem}><span style={statNum}>400+</span><span style={statLbl}>Produits</span></div>
              <div style={statDivider}></div>
              <div style={statItem}><span style={statNum}>24h</span><span style={statLbl}>Livraison</span></div>
              <div style={statDivider}></div>
              <div style={statItem}><span style={statNum}>100%</span><span style={statLbl}>Sécurisé</span></div>
            </div>
          </div>
          <div style={heroImageWrap}>
            <div style={heroImageGlow}></div>
            <img
              src="https://images.unsplash.com/photo-1563213126-a4273aed2016?w=600&q=80"
              style={heroImg}
              alt="Pharmacie"
            />
          </div>
        </div>
      </div>

      {/* ===== FEATURES SECTION ===== */}
      <div style={featuresSection}>
        <div style={sectionHeader}>
          <h2 style={sectionTitle}>Pourquoi choisir PharmacieRhamna ?</h2>
          <p style={sectionSubtitle}>Un service de qualité conçu pour votre bien-être</p>
        </div>
        <div style={featuresGrid}>
          {features.map((f, i) => (
            <div key={i} style={featureCard}>
              <div style={{ ...featureIcon, background: f.bg }}>{f.icon}</div>
              <h3 style={featureTitle}>{f.title}</h3>
              <p style={featureText}>{f.desc}</p>
            </div>
          ))}
        </div>
      </div>

      {/* ===== CTA SECTION ===== */}
      <div style={ctaSection}>
        <div style={ctaContent}>
          <h2 style={{ fontSize: '2em', fontWeight: '800', marginBottom: '12px', color: 'white' }}>
            Prêt à commander ?
          </h2>
          <p style={{ color: 'rgba(255,255,255,0.85)', marginBottom: '28px', fontSize: '1.05em' }}>
            Inscrivez-vous gratuitement et accédez à notre catalogue complet.
          </p>
          <Link to="/register" style={ctaBtn}>Commencer maintenant →</Link>
        </div>
      </div>

      {/* ===== FOOTER ===== */}
      <footer style={footerStyle}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '10px', justifyContent: 'center' }}>
          <div style={{ ...logoIconStyle }}>✚</div>
          <span style={{ color: '#00b894', fontWeight: '800', fontSize: '1.1em' }}>PharmacieRhamna</span>
        </div>
        <p style={{ color: '#b2bec3', fontSize: '0.88em', marginTop: '10px' }}>
          © 2026 PharmacieRhamna · Tous droits réservés
        </p>
      </footer>

    </div>
  );
};

/* ===== DATA ===== */
const features = [
  { icon: '💊', title: 'Large catalogue', desc: 'Plus de 400 médicaments et produits de santé disponibles en stock.', bg: '#e8f8f5' },
  { icon: '🔒', title: 'Paiement sécurisé', desc: 'Transactions protégées et confidentialité des données garantie.', bg: '#fef9e7' },
  { icon: '🚀', title: 'Livraison rapide', desc: 'Réception de vos commandes en moins de 24h à domicile.', bg: '#eaf4fe' },
  { icon: '📋', title: 'Ordonnance en ligne', desc: "Envoyez votre ordonnance directement depuis l'interface.", bg: '#f9f0ff' },
];

/* ===== STYLES ===== */
const heroSection = {
  position: 'relative', overflow: 'hidden',
  background: 'linear-gradient(135deg, #f0faf8 0%, #e8f4fd 100%)',
  padding: '70px 8% 80px',
};
const heroBg = {
  position: 'absolute', top: '-100px', right: '-100px',
  width: '500px', height: '500px', borderRadius: '50%',
  background: 'radial-gradient(circle, rgba(0,184,148,0.12) 0%, transparent 70%)',
  pointerEvents: 'none'
};
const heroContent = {
  display: 'flex', alignItems: 'center', gap: '60px',
  flexWrap: 'wrap', maxWidth: '1200px', margin: '0 auto', position: 'relative', zIndex: 1
};
const heroText = { flex: '1', minWidth: '300px' };
const heroBadge = {
  display: 'inline-block', background: '#e8f8f5', color: '#00b894',
  border: '1px solid #55efc4', borderRadius: '30px', padding: '6px 18px',
  fontSize: '0.85em', fontWeight: '700', marginBottom: '22px'
};
const heroTitle = {
  fontSize: 'clamp(2em, 5vw, 3.2em)', fontWeight: '900', color: '#2d3436',
  lineHeight: '1.15', marginBottom: '18px'
};
const heroSubtitle = {
  fontSize: '1.1em', color: '#636e72', lineHeight: '1.7', marginBottom: '30px', maxWidth: '480px'
};
const heroBtnPrimary = {
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', padding: '14px 32px', borderRadius: '14px',
  textDecoration: 'none', fontWeight: '700', fontSize: '1em',
  boxShadow: '0 6px 20px rgba(0,184,148,0.4)'
};
const heroBtnSecondary = {
  border: '2px solid #00b894', color: '#00b894', padding: '14px 32px',
  borderRadius: '14px', textDecoration: 'none', fontWeight: '700', fontSize: '1em',
  background: 'white'
};
const statsRow = { display: 'flex', alignItems: 'center', gap: '20px', marginTop: '36px' };
const statItem = { display: 'flex', flexDirection: 'column', alignItems: 'center' };
const statNum = { fontSize: '1.5em', fontWeight: '900', color: '#00b894' };
const statLbl = { fontSize: '0.78em', color: '#636e72', fontWeight: '600' };
const statDivider = { width: '1px', height: '36px', background: '#dfe6e9' };
const heroImageWrap = { flex: '1', minWidth: '280px', position: 'relative' };
const heroImageGlow = {
  position: 'absolute', inset: '20px', borderRadius: '30px',
  background: 'radial-gradient(circle, rgba(0,184,148,0.2), transparent 70%)',
  filter: 'blur(20px)', zIndex: 0
};
const heroImg = {
  width: '100%', borderRadius: '24px',
  boxShadow: '0 30px 60px rgba(0,0,0,0.12)',
  position: 'relative', zIndex: 1
};
const featuresSection = {
  padding: '80px 8%', background: 'white', maxWidth: '100%'
};
const sectionHeader = { textAlign: 'center', marginBottom: '48px' };
const sectionTitle = { fontSize: '2em', fontWeight: '800', color: '#2d3436', marginBottom: '10px' };
const sectionSubtitle = { color: '#636e72', fontSize: '1.05em' };
const featuresGrid = {
  display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(230px, 1fr))',
  gap: '24px', maxWidth: '1100px', margin: '0 auto'
};
const featureCard = {
  background: '#f8f9fa', borderRadius: '20px', padding: '32px 24px',
  border: '1px solid #eaedef', textAlign: 'center',
  boxShadow: '0 4px 20px rgba(0,0,0,0.04)'
};
const featureIcon = {
  width: '56px', height: '56px', borderRadius: '16px', fontSize: '1.6em',
  display: 'flex', alignItems: 'center', justifyContent: 'center',
  margin: '0 auto 16px'
};
const featureTitle = { fontSize: '1.05em', fontWeight: '700', color: '#2d3436', marginBottom: '10px' };
const featureText = { fontSize: '0.9em', color: '#636e72', lineHeight: '1.6' };
const ctaSection = {
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  padding: '70px 8%', textAlign: 'center'
};
const ctaContent = { maxWidth: '600px', margin: '0 auto' };
const ctaBtn = {
  display: 'inline-block', background: 'white', color: '#00b894',
  padding: '15px 36px', borderRadius: '14px', textDecoration: 'none',
  fontWeight: '800', fontSize: '1.05em', boxShadow: '0 6px 20px rgba(0,0,0,0.15)'
};
const footerStyle = {
  textAlign: 'center', padding: '32px', background: '#2d3436'
};
const logoIconStyle = {
  width: '32px', height: '32px', borderRadius: '8px',
  background: 'linear-gradient(135deg, #00b894, #00cec9)',
  color: 'white', display: 'inline-flex', alignItems: 'center', justifyContent: 'center',
  fontWeight: '900', fontSize: '1em'
};

export default Home;