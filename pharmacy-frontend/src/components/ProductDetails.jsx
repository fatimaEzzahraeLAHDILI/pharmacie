import { apiBaseUrl } from '../lib/api';
import React from 'react';
import { Link, Navigate, useParams } from 'react-router-dom';

const getImageUrl = (image) => {
  if (!image) return null;
  const cleanImage = String(image).replace(/^\/+/, '');
  if (cleanImage.startsWith('http')) return cleanImage;
  if (cleanImage.startsWith('uploads/')) return `${apiBaseUrl}/${cleanImage}`;
  return `${apiBaseUrl}/assets/${cleanImage}`;
};

const extractDosage = (medicine) => {
  const text = `${medicine?.name || ''} ${medicine?.description || ''} ${medicine?.benefits || ''}`;
  const match = text.match(/(\d+\s?(mg|g|ml))/i);
  return medicine?.dosage || (match ? match[1] : 'Non précisé');
};
const resolveForme = (medicine) => medicine?.forme || medicine?.category || 'Comprimés';
const resolveNotice = (medicine) => medicine?.description || medicine?.benefits || 'Aucune notice disponible.';

const ProductDetails = ({ medicines = [] }) => {
  const { id } = useParams();
  const medicine = medicines.find((item) => String(item.id) === String(id));

  if (!medicine && medicines.length > 0) return <Navigate to="/boutique" replace />;

  if (!medicine) {
    return (
      <div style={pageStyle}>
        <div style={{ maxWidth: '600px', margin: '60px auto', background: 'white', borderRadius: '20px', padding: '40px', textAlign: 'center', boxShadow: '0 10px 30px rgba(0,0,0,0.06)' }}>
          <div style={{ fontSize: '2.5em', marginBottom: '12px' }}>💊</div>
          <p style={{ color: '#636e72' }}>Chargement du médicament...</p>
        </div>
      </div>
    );
  }

  const imageUrl = getImageUrl(medicine.image);
  const dosage = extractDosage(medicine);
  const forme = resolveForme(medicine);
  const notice = resolveNotice(medicine);
  const inStock = Number(medicine.stock) > 0;

  return (
    <div style={pageStyle}>
      <div style={container}>

        {/* Back link */}
        <Link to="/boutique" style={backLink}>
          ← Retour à la boutique
        </Link>

        {/* Main card */}
        <div style={mainCard}>

          {/* Left: Image */}
          <div style={imageSection}>
            {imageUrl ? (
              <img src={imageUrl} alt={medicine.name} style={imgStyle} />
            ) : (
              <div style={imgPlaceholder}>
                <span style={{ fontSize: '3em' }}>💊</span>
                <span style={{ color: '#b2bec3', marginTop: '8px', fontSize: '0.9em' }}>Aucune image</span>
              </div>
            )}
            {/* Stock badge on image */}
            <div style={inStock ? inStockOverlay : outStockOverlay}>
              {inStock ? '● En stock' : '● Épuisé'}
            </div>
          </div>

          {/* Right: Info */}
          <div style={infoSection}>
            <div style={topRow}>
              <div>
                <h1 style={nameStyle}>{medicine.name}</h1>
                <div style={priceRow}>
                  <span style={priceStyle}>{medicine.price}</span>
                  <span style={priceCurrency}> DH</span>
                </div>
              </div>
            </div>

            {/* Dosage & Forme cards */}
            <div style={infoGrid}>
              <div style={{ ...infoCard, borderTop: '3px solid #00b894' }}>
                <div style={infoCardLabel}>💊 Dosage</div>
                <div style={infoCardValue}>{dosage}</div>
              </div>
              <div style={{ ...infoCard, borderTop: '3px solid #00cec9' }}>
                <div style={infoCardLabel}>📦 Forme</div>
                <div style={infoCardValue}>{forme}</div>
              </div>
              <div style={{ ...infoCard, borderTop: '3px solid #fdcb6e' }}>
                <div style={infoCardLabel}>📊 Stock</div>
                <div style={infoCardValue}>{medicine.stock} unités</div>
              </div>
            </div>

            {/* Notice */}
            <div style={noticeCard}>
              <h3 style={noticeTitle}>📋 Notice & Description</h3>
              <p style={noticeText}>{notice}</p>
            </div>

            {/* CTA */}
            <Link to="/boutique" style={cta}>
              🛍 Ajouter au panier depuis la boutique
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
};

/* ===== STYLES ===== */
const pageStyle = { padding: '36px 5%', background: '#f0f4f8', minHeight: 'calc(100vh - 68px)', fontFamily: "'Segoe UI', sans-serif" };
const container = { maxWidth: '1100px', margin: '0 auto' };
const backLink = { display: 'inline-flex', alignItems: 'center', gap: '6px', textDecoration: 'none', color: '#00b894', fontWeight: '700', marginBottom: '22px', background: '#e8f8f5', padding: '8px 16px', borderRadius: '20px', border: '1px solid #55efc4', fontSize: '0.9em' };
const mainCard = { display: 'grid', gridTemplateColumns: 'minmax(280px, 360px) 1fr', gap: '28px', background: 'white', borderRadius: '24px', padding: '28px', boxShadow: '0 10px 40px rgba(0,184,148,0.1)', border: '1px solid #e8f8f5' };
const imageSection = { position: 'relative', borderRadius: '18px', overflow: 'hidden', background: 'linear-gradient(135deg, #f0faf8, #e8f4fd)' };
const imgStyle = { width: '100%', height: '320px', objectFit: 'cover', display: 'block' };
const imgPlaceholder = { height: '320px', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', background: 'linear-gradient(135deg, #f0faf8, #e8f4fd)' };
const inStockOverlay = { position: 'absolute', bottom: '12px', left: '12px', background: '#e8f8f5', color: '#00b894', border: '1px solid #55efc4', borderRadius: '20px', padding: '5px 14px', fontWeight: '700', fontSize: '0.82em' };
const outStockOverlay = { position: 'absolute', bottom: '12px', left: '12px', background: '#fff5f5', color: '#d63031', border: '1px solid #fab1a0', borderRadius: '20px', padding: '5px 14px', fontWeight: '700', fontSize: '0.82em' };
const infoSection = { display: 'flex', flexDirection: 'column', gap: '20px' };
const topRow = { display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' };
const nameStyle = { fontSize: '1.8em', fontWeight: '900', color: '#2d3436', margin: '0 0 8px', lineHeight: 1.2 };
const priceRow = { display: 'flex', alignItems: 'baseline', gap: '2px' };
const priceStyle = { fontSize: '2em', fontWeight: '900', color: '#00b894' };
const priceCurrency = { fontSize: '1em', fontWeight: '700', color: '#636e72' };
const infoGrid = { display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(130px, 1fr))', gap: '14px' };
const infoCard = { background: '#f8f9fa', borderRadius: '14px', padding: '16px' };
const infoCardLabel = { fontSize: '0.78em', color: '#636e72', fontWeight: '700', marginBottom: '6px' };
const infoCardValue = { fontSize: '1em', fontWeight: '800', color: '#2d3436' };
const noticeCard = { background: '#f8f9fa', borderRadius: '16px', padding: '18px' };
const noticeTitle = { margin: '0 0 10px', fontSize: '0.95em', fontWeight: '800', color: '#2d3436' };
const noticeText = { margin: 0, lineHeight: 1.7, color: '#636e72', fontSize: '0.92em' };
const cta = { display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px', textDecoration: 'none', background: 'linear-gradient(135deg, #00b894, #00cec9)', color: 'white', padding: '14px 24px', borderRadius: '14px', fontWeight: '800', fontSize: '0.97em', boxShadow: '0 6px 18px rgba(0,184,148,0.38)', textAlign: 'center' };

export default ProductDetails;
