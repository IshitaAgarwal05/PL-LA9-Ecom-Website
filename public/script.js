const $ = (id) => document.getElementById(id);
const app = $('app');
const inr = (n) => '₹' + n.toLocaleString('en-IN');
const imgUrl = (src) => (src && src.startsWith('/') ? src.slice(1) : src || '');

// Fallback loader when running on static servers (like VS Code Live Server) without Express backend
const fetchStaticFallback = async (url) => {
  const products = await (await fetch('products.json')).json();
  const parsed = new URL(url, window.location.href);
  const path = parsed.pathname;

  const idMatch = path.match(/\/api\/products\/(\d+)/);
  if (idMatch) {
    const item = products.find((p) => p.id === Number(idMatch[1]));
    if (!item) throw 'Product not found';
    return item;
  }

  const q = (parsed.searchParams.get('q') || '').toLowerCase();
  const cat = parsed.searchParams.get('category') || '';
  return products.filter((p) => {
    const matchesSearch =
      !q ||
      p.name.toLowerCase().includes(q) ||
      p.category.toLowerCase().includes(q) ||
      p.description.toLowerCase().includes(q);
    const matchesCategory = !cat || p.category === cat;
    return matchesSearch && matchesCategory;
  });
};

const get = async (url) => {
  try {
    const r = await fetch(url);
    if (!r.ok) {
      return await fetchStaticFallback(url);
    }
    return await r.json();
  } catch (err) {
    return await fetchStaticFallback(url);
  }
};

// Theme toggle (persisted in localStorage)
const theme = (t) => {
  document.documentElement.dataset.theme = t;
  $('tt').textContent = t === 'dark' ? '☀️' : '🌙';
  try {
    localStorage.theme = t;
  } catch (e) {}
};

$('tt').onclick = () =>
  theme(document.documentElement.dataset.theme === 'dark' ? 'light' : 'dark');

theme(
  (() => {
    try {
      return localStorage.theme;
    } catch (e) {}
  })() || 'dark'
);

// Product card component
const card = (p) => `
  <a class="card" href="#/product/${p.id}">
    <div class="img"><img loading="lazy" src="${imgUrl(p.image)}" alt="${p.name}"></div>
    <h3>${p.name}</h3>
    <div class="tag">${p.category}</div>
    <div class="price">${inr(p.price)}${p.original_price ? `<s>${inr(p.original_price)}</s>` : ''}</div>
  </a>`;

// Shop view (product listing + search/filter)
async function shop() {
  app.insertAdjacentHTML(
    'beforeend',
    `<section id="shop">
      <h2>✦ The Artifact Vault</h2>
      <div class="bar">
        <input id="q" placeholder="Search the vault…">
        <select id="c">
          <option value="">All</option>
          <option>Book Accessories</option>
          <option>Collectibles</option>
          <option>Decor</option>
          <option>Keychains</option>
        </select>
      </div>
      <div class="grid" id="g"></div>
    </section>`
  );

  const load = async () => {
    const products = await get(
      `/api/products?q=${encodeURIComponent($('q').value)}&category=${$('c').value}`
    );
    $('g').innerHTML = products.map(card).join('') || 'No artifacts found.';
  };

  $('q').oninput = $('c').onchange = load;
  load();
}

// Home view (Hero + Shop)
const home = () => {
  app.innerHTML = `
    <section class="hero">
      <div>
        <h1>Identity. Chosen. Conjured.</h1>
        <p>Enchanted 3D-printed artifacts for the quietly expressive — bookmarks, keychains and collectibles from the worlds you love, handcrafted in Jaipur.</p>
        <a class="btn" href="#/shop">Enter the Vault ✨</a>
      </div>
      <img src="img/hero.webp" alt="WhoAmI artifacts">
    </section>`;
  shop();
};

// Single product detail view
async function detail(id) {
  try {
    const p = await get('/api/products/' + id);
    app.innerHTML = `
      <a href="#/shop">← Back to the vault</a>
      <div class="detail">
        <div class="img"><img src="${imgUrl(p.image)}" alt="${p.name}"></div>
        <div>
          <h1>${p.name}</h1>
          <div class="tag">${p.category}</div>
          <p>${p.description}</p>
          <p class="tag">Material: ${p.material || '—'} · Size: ${p.dimensions || '—'}</p>
          <p class="price" style="font-size:1.6rem">${inr(p.price)}${p.original_price ? `<s>${inr(p.original_price)}</s>` : ''}</p>
          <a class="btn" href="https://wa.me/917891063938?text=${encodeURIComponent('Hi, I want to order ' + p.name)}">Order on WhatsApp</a>
        </div>
      </div>`;
  } catch (e) {
    app.innerHTML = `<a href="#/shop">← Back to the vault</a><h2>${e}</h2>`;
  }
}

// Our story / about view
const about = () => {
  app.innerHTML = `
    <section style="max-width:700px;margin:auto">
      <h1>Our Story</h1>
      <p>WhoAmI began in a small Jaipur workshop with a simple spell: turn the universes you love into
      quiet, geometric artifacts for your desk. Every piece is 3D-printed, hand-finished and made in India — not merchandise, but your identity made tangible.</p>
      <a class="btn" href="#/shop">Browse Artifacts</a>
    </section>`;
};

// Client-side hash routing
const route = () => {
  const h = location.hash;
  const m = h.match(/^#\/product\/(.+)/);
  if (m) {
    detail(m[1]);
  } else if (h === '#/about') {
    about();
  } else {
    home();
    if (h === '#/shop') {
      $('shop').scrollIntoView();
    }
  }
  if (m || h === '#/about') {
    scrollTo(0, 0);
  }
};

window.addEventListener('hashchange', route);
route();
