const path = require('path');
const express = require('express');
const db = require('better-sqlite3')(path.join(__dirname, 'store.db'));
db.exec(require('fs').readFileSync(path.join(__dirname, 'schema.sql'), 'utf8')); // create + seed on start

const app = express();
app.use(express.static(path.join(__dirname, 'public')));

// GET /api/products?q=text&category=Decor  -> product catalogue (search/filter)
app.get('/api/products', (req, res) => {
  const q = `%${req.query.q || ''}%`, cat = req.query.category || '';
  res.json(db.prepare(`SELECT * FROM products WHERE (name LIKE ? OR category LIKE ? OR description LIKE ?)
    AND (? = '' OR category = ?) ORDER BY id`).all(q, q, q, cat, cat));
});

// GET /api/products/:id -> single product
app.get('/api/products/:id', (req, res) => {
  if (!/^\d+$/.test(req.params.id)) return res.status(400).json({ error: 'Invalid product id' });
  const p = db.prepare('SELECT * FROM products WHERE id = ?').get(req.params.id);
  p ? res.json(p) : res.status(404).json({ error: 'Product not found' });
});

app.listen(3000, () => console.log('WhoAmI store running at http://localhost:3000'));
