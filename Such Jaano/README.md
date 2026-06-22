# Such Jaano

A microblogging app that lives entirely on your device — no account, no
server, no Google login. Posts, your display name, and likes are all
stored in the browser's `localStorage`. Nothing leaves the machine it's
running on.

Built with React + Vite to match the visual language of the rest of the
portfolio: dotted grid background, pixel-font headers, serif body copy,
and a red `+` accent.

## Run it

```bash
npm install
npm run dev
```

Open the printed local URL (usually `http://localhost:5173`).

## Build for deployment

```bash
npm run build
npm run preview   # serve the production build locally to check it
```

The `dist/` folder is a static site — deploy it anywhere (Vercel,
Netlify, GitHub Pages, etc.) the same way the rest of the portfolio is
deployed.

## What it does

- First visit: pick a display name (no email, no password, no login)
- Compose posts up to 280 characters
- Feed sorted newest first, with relative timestamps
- Like and delete posts
- Menu (☰ top right): rename yourself, export all posts as JSON, or
  clear everything on this device
- Everything persists across reloads via `localStorage` — refreshing
  or closing the tab does not lose data, but switching browsers or
  devices does, since nothing syncs anywhere

## Why no backend

This intentionally mirrors the original idea behind Such Jaano: a
microblog where your data is yours, kept on the device, never sent to
a server. There is no database, no API, and no third-party auth to
lose access to or accidentally wipe.
