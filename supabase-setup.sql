create table if not exists public.trip_rankings (
  trip_id text primary key,
  rankings jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

create or replace function public.set_trip_rankings_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists set_trip_rankings_updated_at on public.trip_rankings;

create trigger set_trip_rankings_updated_at
before update on public.trip_rankings
for each row
execute function public.set_trip_rankings_updated_at();

alter table public.trip_rankings enable row level security;

drop policy if exists "Public read trip rankings" on public.trip_rankings;
drop policy if exists "Public insert trip rankings" on public.trip_rankings;
drop policy if exists "Public update trip rankings" on public.trip_rankings;
drop policy if exists "Public read DC trip rankings" on public.trip_rankings;
drop policy if exists "Public insert DC trip rankings" on public.trip_rankings;
drop policy if exists "Public update DC trip rankings" on public.trip_rankings;

create policy "Public read trip rankings"
on public.trip_rankings
for select
to anon
using (trip_id in ('washington-dc-2027', 'rome-trip-planner'));

create policy "Public insert trip rankings"
on public.trip_rankings
for insert
to anon
with check (trip_id in ('washington-dc-2027', 'rome-trip-planner'));

create policy "Public update trip rankings"
on public.trip_rankings
for update
to anon
using (trip_id in ('washington-dc-2027', 'rome-trip-planner'))
with check (trip_id in ('washington-dc-2027', 'rome-trip-planner'));
