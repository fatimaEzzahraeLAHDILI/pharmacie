import React, { useEffect, useState } from 'react';
import axios from 'axios';

const ADMIN_EMAIL = 'fatimaishrak1@gmail.com';

const AdminUsers = () => {
  const [users, setUsers] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [editingId, setEditingId] = useState(null);
  const [formData, setFormData] = useState({ name: '', email: '', phone: '' });
  const [loading, setLoading] = useState(false);

  const fetchUsers = async () => {
    setLoading(true);
    try {
      const res = await axios.get('/api/users');
      setUsers(res.data || []);
    } catch (err) {
      console.error(err);
      alert("Erreur lors du chargement des utilisateurs");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  const handleEdit = (user) => {
    setEditingId(user.id);
    setFormData({
      name: user.name || '',
      email: user.email || '',
      phone: user.phone || '',
    });
  };

  const handleSave = async (id) => {
    try {
      await axios.put(`/api/users/${id}`, formData);
      setEditingId(null);
      fetchUsers();
    } catch (err) {
      console.error(err);
      alert(err?.response?.data?.message || 'Erreur lors de la mise a jour');
    }
  };

  const handleDelete = async (user) => {
    if (user.email === ADMIN_EMAIL) {
      alert("Le compte admin principal ne peut pas etre supprime");
      return;
    }

    if (!window.confirm(`Supprimer ${user.name} ?`)) return;

    try {
      await axios.delete(`/api/users/${user.id}`);
      fetchUsers();
    } catch (err) {
      console.error(err);
      alert(err?.response?.data?.message || 'Erreur lors de la suppression');
    }
  };

  const filteredUsers = users.filter((user) => {
    const key = searchTerm.trim().toLowerCase();
    if (!key) return true;

    return (
      String(user.name || '').toLowerCase().includes(key) ||
      String(user.email || '').toLowerCase().includes(key) ||
      String(user.phone || '').toLowerCase().includes(key)
    );
  });

  const totalUsers = users.length;
  const verifiedUsers = users.filter((u) => !!u.email_verified_at).length;
  const unverifiedUsers = totalUsers - verifiedUsers;

  return (
    <div style={pageStyle}>
      <div style={pageHeader}>
        <h1 style={pageTitle}>Gestion des utilisateurs</h1>
        <p style={pageSubtitle}>Liste, modification et suppression des comptes</p>
      </div>

      <div style={statsRow}>
        <div style={{ ...statCard, borderLeft: '4px solid #00b894' }}>
          <div style={statValue}>{totalUsers}</div>
          <div style={statLabel}>Total utilisateurs</div>
        </div>
        <div style={{ ...statCard, borderLeft: '4px solid #55efc4' }}>
          <div style={statValue}>{verifiedUsers}</div>
          <div style={statLabel}>Emails verifies</div>
        </div>
        <div style={{ ...statCard, borderLeft: '4px solid #fab1a0' }}>
          <div style={{ ...statValue, color: '#d63031' }}>{unverifiedUsers}</div>
          <div style={statLabel}>Non verifies</div>
        </div>
      </div>

      <div style={searchSection}>
        <span style={{ fontSize: '1.1em', flexShrink: 0 }}>🔍</span>
        <input
          type="text"
          placeholder="Rechercher par nom, email, telephone..."
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          style={searchInput}
        />
        {searchTerm && (
          <span style={resultsBadge}>{filteredUsers.length} resultat{filteredUsers.length > 1 ? 's' : ''}</span>
        )}
      </div>

      <div style={tableCard}>
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <thead>
            <tr style={tableHeadRow}>
              <th style={thStyle}>#</th>
              <th style={thStyle}>Nom</th>
              <th style={thStyle}>Email</th>
              <th style={thStyle}>Telephone</th>
              <th style={thStyle}>Verification</th>
              <th style={thStyle}>Actions</th>
            </tr>
          </thead>
          <tbody>
            {loading && (
              <tr>
                <td colSpan="6" style={emptyRow}>Chargement...</td>
              </tr>
            )}

            {!loading && filteredUsers.map((user, idx) => (
              <tr key={user.id} style={idx % 2 === 0 ? trEven : trOdd}>
                <td style={tdStyle}>{idx + 1}</td>
                <td style={tdStyle}>
                  {editingId === user.id ? (
                    <input
                      style={inlineInput}
                      value={formData.name}
                      onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                    />
                  ) : (
                    <span style={{ fontWeight: '700' }}>{user.name}</span>
                  )}
                </td>
                <td style={tdStyle}>
                  {editingId === user.id ? (
                    <input
                      style={inlineInputWide}
                      value={formData.email}
                      onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                    />
                  ) : (
                    user.email
                  )}
                </td>
                <td style={tdStyle}>
                  {editingId === user.id ? (
                    <input
                      style={inlineInput}
                      value={formData.phone}
                      onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                    />
                  ) : (
                    user.phone || '---'
                  )}
                </td>
                <td style={tdStyle}>
                  {user.email_verified_at ? (
                    <span style={verifiedBadge}>Verifie</span>
                  ) : (
                    <span style={unverifiedBadge}>Non verifie</span>
                  )}
                </td>
                <td style={tdStyle}>
                  {editingId === user.id ? (
                    <button style={saveBtn} onClick={() => handleSave(user.id)}>Sauvegarder</button>
                  ) : (
                    <div style={{ display: 'flex', gap: '8px' }}>
                      <button style={editBtn} onClick={() => handleEdit(user)}>Modifier</button>
                      <button style={deleteBtn} onClick={() => handleDelete(user)}>Supprimer</button>
                    </div>
                  )}
                </td>
              </tr>
            ))}

            {!loading && filteredUsers.length === 0 && (
              <tr>
                <td colSpan="6" style={emptyRow}>Aucun utilisateur trouve</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
};

const pageStyle = { padding: '32px 5%', background: '#f0f4f8', minHeight: 'calc(100vh - 68px)', fontFamily: "'Segoe UI', sans-serif" };
const pageHeader = { marginBottom: '24px' };
const pageTitle = { fontSize: '1.9em', fontWeight: '800', color: '#2d3436', margin: '0 0 4px' };
const pageSubtitle = { color: '#636e72', fontSize: '0.95em', margin: 0 };
const statsRow = { display: 'flex', gap: '18px', marginBottom: '20px', flexWrap: 'wrap' };
const statCard = { background: 'white', borderRadius: '16px', padding: '20px 24px', flex: '1', minWidth: '160px', boxShadow: '0 4px 16px rgba(0,0,0,0.05)' };
const statValue = { fontSize: '2em', fontWeight: '900', color: '#00b894' };
const statLabel = { color: '#636e72', fontSize: '0.84em', fontWeight: '600' };
const searchSection = { background: 'white', borderRadius: '16px', padding: '14px 18px', marginBottom: '20px', boxShadow: '0 4px 16px rgba(0,0,0,0.04)', display: 'flex', alignItems: 'center', gap: '12px' };
const searchInput = { flex: 1, border: 'none', outline: 'none', fontSize: '0.95em', color: '#2d3436', background: 'transparent' };
const resultsBadge = { background: '#e8f8f5', color: '#00b894', borderRadius: '20px', padding: '4px 12px', fontSize: '0.82em', fontWeight: '700', flexShrink: 0 };
const tableCard = { background: 'white', borderRadius: '18px', boxShadow: '0 4px 16px rgba(0,0,0,0.05)', overflowX: 'auto' };
const tableHeadRow = { background: 'linear-gradient(135deg, #2d3436, #636e72)' };
const thStyle = { padding: '14px 16px', color: 'white', fontWeight: '700', fontSize: '0.85em', textAlign: 'left', whiteSpace: 'nowrap' };
const tdStyle = { padding: '13px 16px', fontSize: '0.9em', verticalAlign: 'middle', whiteSpace: 'nowrap' };
const trEven = { borderBottom: '1px solid #f0f2f5', background: 'white' };
const trOdd = { borderBottom: '1px solid #f0f2f5', background: '#fafbfc' };
const inlineInput = { padding: '7px 10px', borderRadius: '8px', border: '1.5px solid #00b894', outline: 'none', fontSize: '0.88em', minWidth: '120px' };
const inlineInputWide = { ...inlineInput, minWidth: '220px' };
const verifiedBadge = { background: '#e8f8f5', color: '#00b894', borderRadius: '20px', padding: '3px 10px', fontWeight: '700', fontSize: '0.82em' };
const unverifiedBadge = { background: '#fff5f5', color: '#d63031', borderRadius: '20px', padding: '3px 10px', fontWeight: '700', fontSize: '0.82em' };
const editBtn = { background: '#fff3cd', color: '#e17055', border: '1px solid #fdcb6e', borderRadius: '8px', padding: '6px 12px', cursor: 'pointer', fontWeight: '700', fontSize: '0.82em' };
const deleteBtn = { background: '#fff5f5', color: '#d63031', border: '1px solid #fab1a0', borderRadius: '8px', padding: '6px 12px', cursor: 'pointer', fontWeight: '700', fontSize: '0.82em' };
const saveBtn = { background: 'linear-gradient(135deg,#00b894,#00cec9)', color: 'white', border: 'none', borderRadius: '8px', padding: '7px 16px', cursor: 'pointer', fontWeight: '700', fontSize: '0.85em' };
const emptyRow = { textAlign: 'center', padding: '40px', color: '#b2bec3', fontSize: '0.95em' };

export default AdminUsers;
