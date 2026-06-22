-- ══════════════════════════════════════
-- TGS STUDIO — SUPABASE SETUP (consolidated)
-- Run this once on a fresh project, or run only the
-- sections you're missing on an existing project.
-- All statements are safe to re-run (idempotent).
-- ══════════════════════════════════════

-- ══════════════════════════════════════
-- PASO 1: Tabla de colecciones
-- ══════════════════════════════════════
create table if not exists collections (
  id text primary key,
  name text not null,
  section text not null,
  user_name text not null,
  user_photo text,
  cover_url text,
  clips jsonb default '[]',
  clip_count integer default 0,
  link_url text,
  created_at timestamptz default now()
);

-- Si la tabla ya existía sin la columna link_url (Community Edits):
alter table collections add column if not exists link_url text;

alter table collections enable row level security;

create policy "read_all" on collections for select using (true);
create policy "insert_all" on collections for insert with check (true);
create policy "delete_all" on collections for delete using (true);

-- ══════════════════════════════════════
-- PASO 2: Bucket de Storage
-- ══════════════════════════════════════
insert into storage.buckets (id, name, public)
values ('tgs-files', 'tgs-files', true)
on conflict (id) do nothing;

create policy "storage_read_all"
  on storage.objects for select
  using (bucket_id = 'tgs-files');

create policy "storage_insert_all"
  on storage.objects for insert
  with check (bucket_id = 'tgs-files');

create policy "storage_delete_all"
  on storage.objects for delete
  using (bucket_id = 'tgs-files');

-- ══════════════════════════════════════
-- PASO 3: Tabla de admins (moderación)
-- ══════════════════════════════════════
create table if not exists admins (
  user_name text primary key,
  added_at timestamptz default now()
);

alter table admins enable row level security;

create policy "admins_read_all" on admins for select using (true);

-- ── Agrega tu usuario como admin (tu username/first_name de Telegram) ──
insert into admins (user_name) values ('tagashy')
on conflict (user_name) do nothing;

-- ══════════════════════════════════════
-- NOTAS
-- ══════════════════════════════════════
-- collections.section puede ser: 'twixtor', 'flowframes', 'apk',
--   'community', 'community_edit'.
-- collections.link_url solo se usa cuando section = 'community_edit'
--   (link a TikTok/YouTube/Instagram del edit).
-- admins.user_name = currentUser.username || currentUser.first_name
--   de Telegram. Cualquier usuario en esta tabla puede borrar
--   ediciones de otros desde el panel (botón ✕ amarillo).
