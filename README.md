# Rome Trip Planner

A single-page destination ranker for a two-day Rome trip.

Open `index.html` locally, or publish the repository with GitHub Pages from
the `main` branch and repository root.

Scores are saved in the browser with `localStorage` under
`rome-trip-rankings-v1` and synced to Supabase when the shared backend is
available. Shared result links also encode the selected scores in the URL
fragment, so opening a shared link reconstructs the ranked list.

The page includes category filters such as Museums, Architecture, Churches,
Squares & Fountains, and Outdoor Walks. Filtering only changes the visible
destination cards; it does not remove or reset any saved scores.

The Roman Holiday filter highlights movie locations and related existing stops,
including Via Margutta, the Mouth of Truth, Palazzo Colonna, Palazzo Barberini,
the Arch of Septimius Severus, the Spanish Steps, Castel Sant'Angelo, and other
recognizable Rome scenes.

The Supabase table and row-level security policies are documented in
`supabase-setup.sql`. The browser app uses the project's publishable key only;
database passwords, access tokens, and service-role keys must not be committed.
