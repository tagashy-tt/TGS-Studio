-- ══════════════════════════════════════
-- PASO 1: Crear tabla de colecciones
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
  created_at timestamptz default now()
);

alter table collections enable row level security;

create policy "read_all" on collections for select using (true);
create policy "insert_all" on collections for insert with check (true);
create policy "delete_all" on collections for delete using (true);

-- ══════════════════════════════════════
-- PASO 2: Crear bucket de Storage
-- ══════════════════════════════════════
insert into storage.buckets (id, name, public)
values ('tgs-files', 'tgs-files', true)
on conflict (id) do nothing;

-- Permitir subida y lectura pública
create policy "storage_read_all"
  on storage.objects for select
  using (bucket_id = 'tgs-files');

create policy "storage_insert_all"
  on storage.objects for insert
  with check (bucket_id = 'tgs-files');

create policy "storage_delete_all"
  on storage.objects for delete
  using (bucket_id = 'tgs-files');
