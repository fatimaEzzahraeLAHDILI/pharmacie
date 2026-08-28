import React, { useRef, useState } from 'react';
import { Link } from 'react-router-dom';
import api, { apiBaseUrl } from '../lib/api';

const getImageUrl = (image) => {
  if (!image) return null;
  const cleanImage = String(image).replace(/^\/+/, '');
  if (cleanImage.startsWith('http')) return cleanImage;
  if (cleanImage.startsWith('uploads/')) return `${apiBaseUrl}/${cleanImage}`;
  return `${apiBaseUrl}/assets/${cleanImage}`;
};

const Boutique = ({ medicines }) => {
  const [cart, setCart] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [ordonnanceUrl, setOrdonnanceUrl] = useState('');
  const [isUploadingOrdonnance, setIsUploadingOrdonnance] = useState(false);
  const ordonnanceInputRef = useRef(null);

  const addToCart = (product) => {
    if (Number(product.stock) <= 0) return;
    const exist = cart.find((x) => x.id === product.id);
    if (exist) {
      setCart(cart.map((x) => x.id === product.id ? { ...exist, qty: exist.qty + 1 } : x));
    } else {
      setCart([...cart, { ...product, qty: 1 }]);
    }
  };

  const removeFromCart = (product) => {
    const exist = cart.find((x) => x.id === product.id);
    if (exist.qty === 1) {
      setCart(cart.filter((x) => x.id !== product.id));
    } else {
      setCart(cart.map((x) => x.id === product.id ? { ...exist, qty: exist.qty - 1 } : x));
    }
  };

  const totalPrice = cart.reduce((a, c) => a + c.price * c.qty, 0);

  const sendToWhatsApp = () => {
    const phoneNumber = "212644119305"; 
    let message = "Bonjour PharmacieRhamna, je souhaite commander :\n\n";
    cart.forEach(item => {
      message += `• ${item.name} (x${item.qty}) : ${item.price * item.qty} DH\n`;
    });
    if (ordonnanceUrl) message += `\nOrdonnance : ${ordonnanceUrl}\n`;
    message += `\n*Total: ${totalPrice} DH*`;
    window.open(`https://wa.me/${phoneNumber}?text=${encodeURIComponent(message)}`, '_blank');
  };

  const openOrdonnancePicker = () => ordonnanceInputRef.current?.click();

  const handleOrdonnanceChange = async (e) => {
    const file = e.target.files?.[0];
    if (!file) return;
    const payload = new FormData();
    payload.append('ordonnance', file);
    try {
      setIsUploadingOrdonnance(true);
      const res = await api.post('/api/ordonnances/upload', payload, {
        headers: { 'Content-Type': 'multipart/form-data' },
      });
      setOrdonnanceUrl(res.data?.url || '');
      alert('Ordonnance envoyée avec succès.');
    } catch (err) {
      console.error(err);
      alert(err?.response?.data?.message || "Erreur lors de l'envoi de l'ordonnance");
    } finally {
      setIsUploadingOrdonnance(false);
      if (ordonnanceInputRef.current) ordonnanceInputRef.current.value = '';
    }
  };

  const filteredMedicines = medicines.filter((med) => {
    const keyword = searchTerm.trim().toLowerCase();
    if (!keyword) return true;
    return (
      String(med.name || '').toLowerCase().includes(keyword) ||
      String(med.category || '').toLowerCase().includes(keyword) ||
      String(med.price || '').includes(keyword)
    );
  });

  const cartItemsCount = cart.reduce((a, c) => a + c.qty, 0);

  return (
    <div style={pageStyle}>

      {/* ===== PAGE HEADER ===== */}
      <div style={pageHeader}>
        <div>
          <h1 style={pageTitle}>Notre Boutique</h1>
          <p style={pageSubtitle}>Trouvez vos médicaments et produits de santé</p>
        </div>
        <div style={cartCountBadge}>
          Panier : {cartItemsCount} article{cartItemsCount !== 1 ? 's' : ''}
        </div>
      </div>

      <div style={layoutWrap}>

        {/* ===== PRODUCTS SECTION ===== */}
        <div style={{ flex: 3, minWidth: 0 }}>

          {/* Search bar */}
          <div style={searchCard}>
            <div style={searchInner}>
              <span style={searchIconEl}>🔍</span>
              <input
                type="text"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                placeholder="Rechercher un médicament, vitamine..."
                style={searchInput}
              />
              {searchTerm && (
                <button onClick={() => setSearchTerm('')} style={clearSearchBtn}>×</button>
              )}
            </div>
          </div>

          {/* Products grid */}
          {filteredMedicines.length === 0 ? (
            <div style={emptyState}>
              <h3 style={{ color: '#2d3436', marginBottom: '6px' }}>Aucun résultat</h3>
              <p style={{ color: '#636e72', fontSize: '0.95em' }}>Essayez un autre mot-clé</p>
            </div>
          ) : (
            <div style={productsGrid}>
              {filteredMedicines.map((med) => {
                const inStock = Number(med.stock) > 0;
                const imgUrl = getImageUrl(med.image);
                return (
                  <div key={med.id} style={productCard}>
                    {/* Stock badge on card */}
                    <span style={inStock ? inStockBadge : outStockBadge}>
                      {inStock ? '● En stock' : '● Épuisé'}
                    </span>

                    {/* Product image */}
                    <Link to={`/boutique/product/${med.id}`} style={{ textDecoration: 'none', display: 'block' }}>
                      {imgUrl ? (
                        <img src={imgUrl} alt={med.name} style={productImg} />
                      ) : (
                        <div style={imgPlaceholder}>
                          <span style={{ fontSize: '0.95em', color: '#636e72', fontWeight: '600' }}>{med.name}</span>
                        </div>
                      )}
                    </Link>

                    {/* Product info */}
                    <div style={productInfo}>
                      <Link to={`/boutique/product/${med.id}`} style={{ textDecoration: 'none' }}>
                        <h3 style={productName}>{med.name}</h3>
                      </Link>
                      {med.forme && <p style={productForme}>{med.forme}</p>}
                      <div style={productFooter}>
                        <span style={productPrice}>{med.price} <span style={{ fontSize: '0.75em', fontWeight: '600' }}>DH</span></span>
                        <button
                          onClick={() => addToCart(med)}
                          style={inStock ? addCartBtn : disabledBtn}
                          disabled={!inStock}
                          title={inStock ? 'Ajouter au panier' : 'Produit épuisé'}
                        >
                          {inStock ? 'Ajouter +' : 'Indisponible'}
                        </button>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </div>

        {/* ===== CART SIDEBAR ===== */}
        <div style={cartSidebar}>
          <div style={cartHeader}>
            <h2 style={cartTitle}>Mon Panier</h2>
            {cart.length > 0 && (
              <span style={cartBadge}>{cartItemsCount}</span>
            )}
          </div>

          {cart.length === 0 ? (
            <div style={emptyCart}>
              <p style={{ color: '#636e72', fontSize: '0.9em' }}>Votre panier est vide</p>
              <p style={{ color: '#b2bec3', fontSize: '0.82em' }}>Ajoutez des produits depuis la boutique</p>
            </div>
          ) : (
            <>
              <div style={cartItems}>
                {cart.map((item) => (
                  <div key={item.id} style={cartItem}>
                    <div style={{ flex: 1 }}>
                      <div style={cartItemName}>{item.name}</div>
                      <div style={cartItemPrice}>{item.price * item.qty} DH</div>
                    </div>
                    <div style={qtyControl}>
                      <button onClick={() => removeFromCart(item)} style={qtyBtn}>-</button>
                      <span style={qtyNum}>{item.qty}</span>
                      <button onClick={() => addToCart(item)} style={qtyBtn}>+</button>
                    </div>
                  </div>
                ))}
              </div>

              <div style={cartTotalSection}>
                <div style={totalRow}>
                  <span style={{ color: '#636e72', fontSize: '0.9em' }}>Total</span>
                  <span style={totalAmount}>{totalPrice} DH</span>
                </div>
              </div>

              {/* Ordonnance */}
              <input
                ref={ordonnanceInputRef}
                type="file"
                accept="image/*"
                capture="environment"
                onChange={handleOrdonnanceChange}
                style={{ display: 'none' }}
              />
              <button onClick={openOrdonnancePicker} style={ordonnanceBtn} disabled={isUploadingOrdonnance}>
                <span>Ordonnance</span>
                {isUploadingOrdonnance ? ' Envoi en cours...' : ' Joindre une ordonnance'}
              </button>
              {ordonnanceUrl && (
                <div style={ordonnanceSuccess}>Ordonnance jointe avec succès</div>
              )}

              {/* WhatsApp Order */}
              <button onClick={sendToWhatsApp} style={whatsappBtn}>
                Commander via WhatsApp
              </button>
            </>
          )}
        </div>
      </div>
    </div>
  );
};

/* ===== STYLES ===== */
const pageStyle = { padding: '32px 5%', background: '#f0f4f8', minHeight: 'calc(100vh - 68px)', fontFamily: "'Segoe UI', sans-serif" };
const pageHeader = { display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '28px', flexWrap: 'wrap', gap: '12px' };
const pageTitle = { fontSize: '1.9em', fontWeight: '800', color: '#2d3436', margin: '0 0 4px' };
const pageSubtitle = { color: '#636e72', fontSize: '0.95em', margin: 0 };
const cartCountBadge = { background: '#e8f8f5', color: '#00b894', border: '1.5px solid #55efc4', borderRadius: '20px', padding: '8px 18px', fontWeight: '700', fontSize: '0.92em' };
const layoutWrap = { display: 'flex', gap: '28px', alignItems: 'flex-start', flexWrap: 'wrap' };

const searchCard = { background: 'white', borderRadius: '18px', padding: '14px 18px', marginBottom: '22px', boxShadow: '0 4px 20px rgba(0,184,148,0.08)', border: '1px solid #e8f8f5' };
const searchInner = { display: 'flex', alignItems: 'center', gap: '10px' };
const searchIconEl = { fontSize: '1.1em', flexShrink: 0 };
const searchInput = { flex: 1, border: 'none', outline: 'none', fontSize: '0.97em', color: '#2d3436', background: 'transparent' };
const clearSearchBtn = { background: '#f0f2f5', border: 'none', borderRadius: '50%', width: '24px', height: '24px', cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', flexShrink: 0, fontSize: '0.75em', color: '#636e72' };

const productsGrid = { display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '20px' };
const productCard = {
  background: 'white', borderRadius: '20px', overflow: 'hidden',
  boxShadow: '0 4px 20px rgba(0,0,0,0.06)', position: 'relative',
  border: '1px solid #f0f2f5',
  transition: 'transform 0.2s'
};
const inStockBadge = {
  position: 'absolute', top: '10px', left: '10px', zIndex: 2,
  background: '#e8f8f5', color: '#00b894', fontWeight: '700',
  fontSize: '0.72em', padding: '4px 10px', borderRadius: '20px', border: '1px solid #55efc4'
};
const outStockBadge = {
  position: 'absolute', top: '10px', left: '10px', zIndex: 2,
  background: '#fff5f5', color: '#d63031', fontWeight: '700',
  fontSize: '0.72em', padding: '4px 10px', borderRadius: '20px', border: '1px solid #fab1a0'
};
const productImg = { width: '100%', height: '150px', objectFit: 'cover', display: 'block' };
const imgPlaceholder = { width: '100%', height: '150px', background: 'linear-gradient(135deg, #f0f2f5, #e8f8f5)', display: 'flex', alignItems: 'center', justifyContent: 'center' };
const productInfo = { padding: '14px' };
const productName = { fontSize: '0.95em', fontWeight: '700', color: '#2d3436', margin: '0 0 4px', lineHeight: 1.4 };
const productForme = { fontSize: '0.78em', color: '#636e72', margin: '0 0 10px', fontStyle: 'italic' };
const productFooter = { display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '8px' };
const productPrice = { fontSize: '1.15em', fontWeight: '800', color: '#00b894' };
const addCartBtn = { background: 'linear-gradient(135deg, #00b894, #00cec9)', color: 'white', border: 'none', borderRadius: '9px', padding: '7px 13px', cursor: 'pointer', fontWeight: '700', fontSize: '0.82em', whiteSpace: 'nowrap' };
const disabledBtn = { background: '#dfe6e9', color: '#b2bec3', border: 'none', borderRadius: '9px', padding: '7px 13px', cursor: 'not-allowed', fontWeight: '700', fontSize: '0.82em', whiteSpace: 'nowrap' };

const emptyState = { background: 'white', borderRadius: '20px', padding: '60px 30px', textAlign: 'center', boxShadow: '0 4px 20px rgba(0,0,0,0.04)' };

/* Cart sidebar */
const cartSidebar = {
  flex: '0 0 310px', background: 'white', borderRadius: '24px',
  boxShadow: '0 8px 30px rgba(0,184,148,0.1)', border: '1px solid #e8f8f5',
  padding: '24px 22px', position: 'sticky', top: '88px', alignSelf: 'flex-start'
};
const cartHeader = { display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '18px', paddingBottom: '14px', borderBottom: '2px solid #e8f8f5' };
const cartTitle = { fontSize: '1.15em', fontWeight: '800', color: '#2d3436', margin: 0 };
const cartBadge = { background: '#00b894', color: 'white', borderRadius: '50%', width: '22px', height: '22px', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '0.78em', fontWeight: '800' };
const emptyCart = { textAlign: 'center', padding: '30px 10px' };
const cartItems = { display: 'flex', flexDirection: 'column', gap: '10px', maxHeight: '260px', overflowY: 'auto', marginBottom: '16px' };
const cartItem = { display: 'flex', alignItems: 'center', gap: '10px', padding: '10px 12px', background: '#f8f9fa', borderRadius: '12px' };
const cartItemName = { fontSize: '0.88em', fontWeight: '700', color: '#2d3436', marginBottom: '2px' };
const cartItemPrice = { fontSize: '0.82em', color: '#00b894', fontWeight: '700' };
const qtyControl = { display: 'flex', alignItems: 'center', gap: '6px', flexShrink: 0 };
const qtyBtn = { width: '26px', height: '26px', borderRadius: '8px', border: '1.5px solid #dfe6e9', background: 'white', cursor: 'pointer', fontWeight: '800', fontSize: '14px', display: 'flex', alignItems: 'center', justifyContent: 'center' };
const qtyNum = { fontSize: '0.9em', fontWeight: '800', color: '#2d3436', minWidth: '16px', textAlign: 'center' };
const cartTotalSection = { background: '#f8f9fa', borderRadius: '12px', padding: '12px 14px', marginBottom: '14px' };
const totalRow = { display: 'flex', justifyContent: 'space-between', alignItems: 'center' };
const totalAmount = { fontSize: '1.3em', fontWeight: '900', color: '#00b894' };
const ordonnanceBtn = {
  width: '100%', padding: '12px', border: '1.5px dashed #a29bfe',
  background: '#f5f3ff', color: '#6c5ce7', borderRadius: '12px',
  cursor: 'pointer', fontWeight: '700', fontSize: '0.9em',
  marginBottom: '10px', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '4px'
};
const ordonnanceSuccess = { color: '#00b894', fontWeight: '700', fontSize: '0.85em', textAlign: 'center', marginBottom: '10px' };
const whatsappBtn = {
  width: '100%', padding: '14px',
  background: 'linear-gradient(135deg, #25D366, #128C7E)',
  color: 'white', border: 'none', borderRadius: '14px',
  cursor: 'pointer', fontWeight: '800', fontSize: '0.97em',
  display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px',
  boxShadow: '0 6px 18px rgba(37,211,102,0.35)'
};

  export default Boutique;

