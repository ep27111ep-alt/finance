-- Выполни один раз в Supabase: SQL Editor → New query → вставь всё → Run.

create table if not exists public.budget_docs (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  doc_id     text        not null,
  body       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, doc_id)
);

alter table public.budget_docs enable row level security;

-- Каждый видит и меняет только свои строки.
drop policy if exists "own rows select" on public.budget_docs;
drop policy if exists "own rows insert" on public.budget_docs;
drop policy if exists "own rows update" on public.budget_docs;
drop policy if exists "own rows delete" on public.budget_docs;

create policy "own rows select" on public.budget_docs for select to authenticated using (auth.uid() = user_id);
create policy "own rows insert" on public.budget_docs for insert to authenticated with check (auth.uid() = user_id);
create policy "own rows update" on public.budget_docs for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own rows delete" on public.budget_docs for delete to authenticated using (auth.uid() = user_id);

grant select, insert, update, delete on public.budget_docs to authenticated;
