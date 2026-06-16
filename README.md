# Rome Trip Planner

A single-page destination ranker for Dave, Tomoko, and Kentaro's two-day Rome
trip.

Open `index.html` locally, or publish the repository with GitHub Pages from
the `main` branch and repository root.

Ranks are saved in the browser with `localStorage` under
`rome-trip-rankings-v1` and synced to Supabase when the shared backend is
available. The current data shape is keyed by stable destination IDs and person
IDs, so adding new destinations does not reset existing ranks.

Older Rome rankings used a single flat score per destination. The browser app
automatically treats those legacy values as Tomoko's ranks when loading
`localStorage`, shared URL fragments, or the Supabase row.

Shared result links encode the selected ranks in the URL fragment. Opening a
shared link reconstructs the ranked list and saves those ranks in that browser.

The page includes category filters such as Museums, Architecture, Churches,
Squares & Fountains, and Outdoor Walks. Filtering only changes the visible
destination cards; it does not remove or reset any saved ranks.

The Roman Holiday filter highlights movie locations and related existing stops,
including Via Margutta, the Mouth of Truth, Palazzo Colonna, Palazzo Barberini,
the Arch of Septimius Severus, the Spanish Steps, Castel Sant'Angelo, and other
recognizable Rome scenes.

The Supabase table and row-level security policies are documented in
`supabase-setup.sql`. The browser app uses the project's publishable key only;
database passwords, access tokens, and service-role keys must not be committed.
