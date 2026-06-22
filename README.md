# TGS Studio

Landing page oficial + TGS Clip Platform.

## Estructura

```
TGS-Studio/
├── index.html                  ← Landing page (raíz del sitio)
├── coi-serviceworker.min.js    ← NO eliminar (requerido por GitHub Pages)
├── SUPABASE_SETUP.sql
└── app/
    ├── index.html              ← TGS Clip Platform
    └── coi-serviceworker.min.js
```

## Deploy en GitHub Pages

1. Ve a tu repo → **Settings → Pages**
2. Source: **Deploy from a branch**
3. Branch: `main` → carpeta: `/ (root)` → **Save**

El sitio quedará en:
- Landing: `https://tagashy-tt.github.io/TGS-Studio/`
- App: `https://tagashy-tt.github.io/TGS-Studio/app/`

## Supabase (solo si es primera vez)

1. Ve a supabase.com → tu proyecto → **SQL Editor**
2. Pega el contenido de `SUPABASE_SETUP.sql` y dale **Run**

---

*TGS Studio 2025 — [@_tagashy.tt](https://www.tiktok.com/@_tagashy.tt)*
