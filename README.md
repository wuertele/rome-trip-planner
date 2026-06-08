# Rome Trip Planner

A single-page destination ranker for a two-day Rome trip.

Open `index.html` locally, or publish the repository with GitHub Pages from
the `main` branch and repository root.

Scores are saved in the browser with `localStorage`. Shared result links also
encode the selected scores in the URL fragment, so opening a shared link
reconstructs the ranked list.

The page includes category filters such as Museums, Architecture, Churches,
Squares & Fountains, and Outdoor Walks. Filtering only changes the visible
destination cards; it does not remove or reset any saved scores.
