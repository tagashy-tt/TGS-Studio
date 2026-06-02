# TGS Studio — Setup

## Paso 1 — SQL en Supabase (una sola vez)

1. Ve a supabase.com → tu proyecto → **SQL Editor**
2. Pega el contenido de `SUPABASE_SETUP.sql` y dale **Run**
3. Esto crea la tabla `collections` y el bucket `tgs-files`

## Paso 2 — GitHub Pages

1. Ve a tu repo → **Settings → Pages**
2. Source: **Deploy from a branch**
3. Branch: `main` → carpeta: `/ (root)` → **Save**
4. En ~1 minuto el sitio estará en `https://tagashy-tt.github.io/Estudio-TSG/`

> **Nota:** El archivo `coi-serviceworker.min.js` es necesario para que FFmpeg funcione correctamente en GitHub Pages. No lo elimines.

---

## Archivos

| Archivo | Descripción |
|---|---|
| `index.html` | Sitio completo (todo en un archivo) |
| `coi-serviceworker.min.js` | Habilita SharedArrayBuffer para FFmpeg.wasm |
| `SUPABASE_SETUP.sql` | Script SQL para crear tablas y bucket en Supabase |

---

## Cómo funciona

- **Archivos** (clips, Twixtors, APKs): se suben a **Supabase Storage** → bucket `tgs-files`
- **Metadata** (nombre, usuario, sección, URLs): se guarda en la tabla `collections`
- **100% gratuito**: Supabase free tier + GitHub Pages sin límite de créditos
- **Calidad original**: los archivos se suben sin comprimir ni modificar
- **Descarga directa**: URL pública permanente de Supabase
- **Todos los usuarios** ven las mismas colecciones en tiempo real

---

*TGS Studio 2026 — [@_tagashy.tt](https://www.tiktok.com/@_tagashy.tt)*
