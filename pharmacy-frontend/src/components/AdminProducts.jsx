import React, { useState, useEffect, useRef } from 'react';
import api from '../lib/api';

const AdminProducts = () => {
    const [products, setProducts] = useState([]);
    const [editingId, setEditingId] = useState(null);
    const [formData, setFormData] = useState({ name: '', price: '', stock: '', dosage: '', forme: '' });
    const [newProduct, setNewProduct] = useState({ name: '', price: '', stock: '', dosage: '', forme: '', image: null });
    const [searchTerm, setSearchTerm] = useState('');
    const [addOpen, setAddOpen] = useState(true);
    const imageInputRef = useRef(null);

    

    const fetchProducts = () => {
        api.get('/api/products').then(res => setProducts(res.data));
    };
useEffect(() => { fetchProducts(); }, []);
    const handleAddProduct = (e) => {
        e.preventDefault();
        const payload = new FormData();
        payload.append('name', newProduct.name);
        payload.append('price', newProduct.price);
        payload.append('stock', newProduct.stock);
        payload.append('dosage', newProduct.dosage);
        payload.append('forme', newProduct.forme);
        if (newProduct.image) payload.append('image', newProduct.image);
        api.post('/api/products', payload, {
            headers: { 'Content-Type': 'multipart/form-data' },
        }).then(() => {
            fetchProducts();
            setNewProduct({ name: '', price: '', stock: '', dosage: '', forme: '', image: null });
            if (imageInputRef.current) imageInputRef.current.value = '';
            alert('Médicament ajouté avec succès ✅');
        }).catch(err => {
            console.error(err);
            alert(err?.response?.data?.error || err?.response?.data?.message || 'Erreur lors de l\'ajout');
        });
    };

    const handleDelete = (id) => {
        if (window.confirm('Confirmer la suppression de ce médicament ? 🗑️')) {
            api.delete(`/api/products/${id}`).then(() => fetchProducts());
        }
    };

    const handleEdit = (product) => {
        setEditingId(product.id);
        setFormData(product);
    };

    const handleSave = (id) => {
        api.put(`/api/products/${id}`, formData).then(() => {
            setEditingId(null);
            fetchProducts();
        });
    };

    const filteredProducts = products.filter((p) => {
        const keyword = searchTerm.trim().toLowerCase();
        if (!keyword) return true;
        return (
            String(p.name || '').toLowerCase().includes(keyword) ||
            String(p.category || '').toLowerCase().includes(keyword) ||
            String(p.price || '').includes(keyword) ||
            String(p.stock || '').includes(keyword)
        );
    });

    const totalProducts = products.length;
    const inStock = products.filter(p => Number(p.stock) > 0).length;
    const outOfStock = products.filter(p => Number(p.stock) <= 0).length;

    return (
        <div style={pageStyle}>

            
            <div style={pageHeader}>
                <div>
                    <h1 style={pageTitle}>⚙ Gestion du Stock</h1>
                    <p style={pageSubtitle}>PharmacieRhamna · Tableau de bord administration</p>
                </div>
            </div>

            
            <div style={statsRow}>
                <div style={{ ...statCard, borderLeft: '4px solid #00b894' }}>
                    <div style={{ fontSize: '2em', fontWeight: '900', color: '#00b894' }}>{totalProducts}</div>
                    <div style={statLabel}>Total produits</div>
                </div>
                <div style={{ ...statCard, borderLeft: '4px solid #55efc4' }}>
                    <div style={{ fontSize: '2em', fontWeight: '900', color: '#00b894' }}>{inStock}</div>
                    <div style={statLabel}>En stock</div>
                </div>
                <div style={{ ...statCard, borderLeft: '4px solid #fab1a0' }}>
                    <div style={{ fontSize: '2em', fontWeight: '900', color: '#d63031' }}>{outOfStock}</div>
                    <div style={statLabel}>Épuisés</div>
                </div>
            </div>

            
            <div style={sectionCard}>
                <div style={sectionCardHeader} onClick={() => setAddOpen(!addOpen)}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                        <div style={sectionIcon}>+</div>
                        <h3 style={sectionTitle}>Ajouter un nouveau médicament</h3>
                    </div>
                    <span style={{ color: '#636e72', fontSize: '1.2em' }}>{addOpen ? '▲' : '▼'}</span>
                </div>
                {addOpen && (
                    <form onSubmit={handleAddProduct} style={addForm}>
                        <div style={fieldGroup}>
                            <label style={fieldLabel}>Nom du médicament *</label>
                            <input style={fieldInput} placeholder="Ex: Doliprane 500mg" value={newProduct.name}
                                onChange={e => setNewProduct({ ...newProduct, name: e.target.value })} required />
                        </div>
                        <div style={fieldGroup}>
                            <label style={fieldLabel}>Prix (DH) *</label>
                            <input style={fieldInput} type="number" placeholder="0.00" value={newProduct.price}
                                onChange={e => setNewProduct({ ...newProduct, price: e.target.value })} required />
                        </div>
                        <div style={fieldGroup}>
                            <label style={fieldLabel}>Quantité en stock *</label>
                            <input style={fieldInput} type="number" placeholder="0" value={newProduct.stock}
                                onChange={e => setNewProduct({ ...newProduct, stock: e.target.value })} required />
                        </div>
                        <div style={fieldGroup}>
                            <label style={fieldLabel}>Dosage</label>
                            <input style={fieldInput} placeholder="Ex: 500mg" value={newProduct.dosage}
                                onChange={e => setNewProduct({ ...newProduct, dosage: e.target.value })} />
                        </div>
                        <div style={fieldGroup}>
                            <label style={fieldLabel}>Forme</label>
                            <input style={fieldInput} placeholder="Comprimés, Sirop..." value={newProduct.forme}
                                onChange={e => setNewProduct({ ...newProduct, forme: e.target.value })} />
                        </div>
                        <div style={fieldGroup}>
                            <label style={fieldLabel}>Image</label>
                            <input ref={imageInputRef} style={fieldInput} type="file" accept="image/*"
                                onChange={e => setNewProduct({ ...newProduct, image: e.target.files?.[0] || null })} />
                        </div>
                        <div style={{ gridColumn: '1 / -1', display: 'flex', justifyContent: 'flex-end' }}>
                            <button type="submit" style={addBtn}>+ Ajouter le médicament</button>
                        </div>
                    </form>
                )}
            </div>

            
            <div style={searchSection}>
                <span style={{ fontSize: '1.1em', flexShrink: 0 }}>🔍</span>
                <input
                    type="text"
                    placeholder="Rechercher par nom, prix, stock..."
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    style={searchInput}
                />
                {searchTerm && (
                    <span style={resultsBadge}>{filteredProducts.length} résultat{filteredProducts.length !== 1 ? 's' : ''}</span>
                )}
            </div>

           
            <div style={tableCard}>
                <table style={{ width: '100%', borderCollapse: 'collapse' }}>
                    <thead>
                        <tr style={tableHeadRow}>
                            <th style={thStyle}>#</th>
                            <th style={thStyle}>Médicament</th>
                            <th style={thStyle}>Prix</th>
                            <th style={thStyle}>Stock</th>
                            <th style={thStyle}>Dosage</th>
                            <th style={thStyle}>Forme</th>
                            <th style={thStyle}>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {filteredProducts.map((p, idx) => (
                            <tr key={p.id} style={idx % 2 === 0 ? trEven : trOdd}>
                                <td style={tdStyle}>{idx + 1}</td>
                                <td style={tdStyle}>
                                    {editingId === p.id
                                        ? <input style={inlineInput} value={formData.name} onChange={e => setFormData({ ...formData, name: e.target.value })} />
                                        : <span style={{ fontWeight: '600', color: '#2d3436' }}>{p.name}</span>}
                                </td>
                                <td style={tdStyle}>
                                    {editingId === p.id
                                        ? <input style={inlineInput} type="number" value={formData.price} onChange={e => setFormData({ ...formData, price: e.target.value })} />
                                        : <span style={{ color: '#00b894', fontWeight: '700' }}>{p.price} DH</span>}
                                </td>
                                <td style={tdStyle}>
                                    {editingId === p.id
                                        ? <input style={inlineInput} type="number" value={formData.stock} onChange={e => setFormData({ ...formData, stock: e.target.value })} />
                                        : <span style={Number(p.stock) > 0 ? stockOkBadge : stockEmptyBadge}>{p.stock}</span>}
                                </td>
                                <td style={tdStyle}>
                                    {editingId === p.id
                                        ? <input style={inlineInputWide} value={formData.dosage || ''} onChange={e => setFormData({ ...formData, dosage: e.target.value })} placeholder="Dosage" />
                                        : <span style={infoPill}>{p.dosage || '—'}</span>}
                                </td>
                                <td style={tdStyle}>
                                    {editingId === p.id
                                        ? <input style={inlineInputWide} value={formData.forme || ''} onChange={e => setFormData({ ...formData, forme: e.target.value })} placeholder="Forme" />
                                        : <span style={infoPill}>{p.forme || '—'}</span>}
                                </td>
                                <td style={tdStyle}>
                                    {editingId === p.id ? (
                                        <button onClick={() => handleSave(p.id)} style={saveBtn}>✓ Sauvegarder</button>
                                    ) : (
                                        <div style={{ display: 'flex', gap: '6px', justifyContent: 'center' }}>
                                            <button onClick={() => handleEdit(p)} style={editBtn}>✏ Modifier</button>
                                            <button onClick={() => handleDelete(p.id)} style={deleteBtn}>🗑 Supprimer</button>
                                        </div>
                                    )}
                                </td>
                            </tr>
                        ))}
                        {filteredProducts.length === 0 && (
                            <tr>
                                <td colSpan="7" style={emptyRow}>
                                    <div style={{ fontSize: '2em', marginBottom: '8px' }}>📦</div>
                                    <div>Aucun produit trouvé</div>
                                </td>
                            </tr>
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
};


const pageStyle = { padding: '32px 5%', background: '#f0f4f8', minHeight: 'calc(100vh - 68px)', fontFamily: "'Segoe UI', sans-serif" };
const pageHeader = { marginBottom: '28px' };
const pageTitle = { fontSize: '1.9em', fontWeight: '800', color: '#2d3436', margin: '0 0 4px' };
const pageSubtitle = { color: '#636e72', fontSize: '0.92em' };
const statsRow = { display: 'flex', gap: '18px', marginBottom: '24px', flexWrap: 'wrap' };
const statCard = { background: 'white', borderRadius: '16px', padding: '20px 24px', flex: '1', minWidth: '140px', boxShadow: '0 4px 16px rgba(0,0,0,0.05)' };
const statLabel = { fontSize: '0.82em', color: '#636e72', fontWeight: '600', marginTop: '4px' };
const sectionCard = { background: 'white', borderRadius: '18px', marginBottom: '20px', boxShadow: '0 4px 16px rgba(0,0,0,0.05)', overflow: 'hidden' };
const sectionCardHeader = { display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '18px 22px', cursor: 'pointer', borderBottom: '1px solid #f0f2f5' };
const sectionIcon = { width: '32px', height: '32px', borderRadius: '8px', background: 'linear-gradient(135deg,#00b894,#00cec9)', color: 'white', fontWeight: '900', fontSize: '1.2em', display: 'flex', alignItems: 'center', justifyContent: 'center' };
const sectionTitle = { fontSize: '1em', fontWeight: '700', color: '#2d3436', margin: 0 };
const addForm = { display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(220px, 1fr))', gap: '16px', padding: '22px' };
const fieldGroup = { display: 'flex', flexDirection: 'column', gap: '5px' };
const fieldLabel = { fontSize: '0.82em', fontWeight: '700', color: '#636e72' };
const fieldInput = { padding: '10px 12px', borderRadius: '10px', border: '1.5px solid #dfe6e9', outline: 'none', fontSize: '0.93em', background: '#f8f9fa' };
const addBtn = { background: 'linear-gradient(135deg,#00b894,#00cec9)', color: 'white', border: 'none', padding: '12px 28px', borderRadius: '12px', fontWeight: '800', cursor: 'pointer', fontSize: '0.95em', boxShadow: '0 4px 14px rgba(0,184,148,0.35)' };
const searchSection = { background: 'white', borderRadius: '16px', padding: '14px 18px', marginBottom: '20px', boxShadow: '0 4px 16px rgba(0,0,0,0.04)', display: 'flex', alignItems: 'center', gap: '12px' };
const searchInput = { flex: 1, border: 'none', outline: 'none', fontSize: '0.95em', color: '#2d3436', background: 'transparent' };
const resultsBadge = { background: '#e8f8f5', color: '#00b894', borderRadius: '20px', padding: '4px 12px', fontSize: '0.82em', fontWeight: '700', flexShrink: 0 };
const tableCard = { background: 'white', borderRadius: '18px', boxShadow: '0 4px 16px rgba(0,0,0,0.05)', overflow: 'hidden' };
const tableHeadRow = { background: 'linear-gradient(135deg, #2d3436, #636e72)' };
const thStyle = { padding: '14px 16px', color: 'white', fontWeight: '700', fontSize: '0.85em', textAlign: 'left' };
const tdStyle = { padding: '13px 16px', fontSize: '0.9em' };
const trEven = { borderBottom: '1px solid #f0f2f5', background: 'white' };
const trOdd = { borderBottom: '1px solid #f0f2f5', background: '#fafbfc' };
const inlineInput = { padding: '7px 10px', borderRadius: '8px', border: '1.5px solid #00b894', outline: 'none', fontSize: '0.88em', width: '100px' };
const inlineInputWide = { ...inlineInput, width: '140px' };
const stockOkBadge = { background: '#e8f8f5', color: '#00b894', borderRadius: '20px', padding: '3px 10px', fontWeight: '700', fontSize: '0.82em' };
const stockEmptyBadge = { background: '#fff5f5', color: '#d63031', borderRadius: '20px', padding: '3px 10px', fontWeight: '700', fontSize: '0.82em' };
const infoPill = { background: '#f0f2f5', color: '#636e72', borderRadius: '8px', padding: '3px 10px', fontSize: '0.82em', fontWeight: '600' };
const editBtn = { background: '#fff3cd', color: '#e17055', border: '1px solid #fdcb6e', borderRadius: '8px', padding: '6px 12px', cursor: 'pointer', fontWeight: '700', fontSize: '0.82em' };
const deleteBtn = { background: '#fff5f5', color: '#d63031', border: '1px solid #fab1a0', borderRadius: '8px', padding: '6px 12px', cursor: 'pointer', fontWeight: '700', fontSize: '0.82em' };
const saveBtn = { background: 'linear-gradient(135deg,#00b894,#00cec9)', color: 'white', border: 'none', borderRadius: '8px', padding: '7px 16px', cursor: 'pointer', fontWeight: '700', fontSize: '0.85em' };
const emptyRow = { textAlign: 'center', padding: '50px', color: '#b2bec3', fontSize: '0.95em' };

export default AdminProducts;