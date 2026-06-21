// ─────────────────────────────────────────────────────────────
//  DotGridBackground.jsx
//  FINAL CONFIG → Dot: 1.2px | Spacing: 26px | Colour: #c0c0c0
//
//  USAGE — drop once in your root layout / App.jsx:
//
//    import DotGridBackground from './components/DotGridBackground';
//
//    function App() {
//      return (
//        <>
//          <DotGridBackground />
//          <YourPages />
//        </>
//      );
//    }
// ─────────────────────────────────────────────────────────────

import { useEffect } from "react";

const CSS = `
  /* ── PERMANENT DOT GRID BACKGROUND ── */
  .dot-grid-bg {
    position: fixed;           /* always behind everything, never scrolls away */
    inset: 0;                  /* covers full viewport                         */
    z-index: -1;               /* sits behind ALL page content                 */
    pointer-events: none;      /* never blocks any clicks                      */

    background-color: #ffffff;
    background-image: radial-gradient(
      circle,
      #000000ce 1.2px,           /* ← DOT COLOUR: #c0c0c0 | SIZE: 1.2px         */
      transparent 1.2px
    );
    background-size: 26px 26px; /* ← SPACING: 26px                             */
  }

  /* Soft white centre glow so page content stands out */
  .dot-grid-bg::after {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse 70% 65% at 50% 45%,
      rgba(255, 255, 255, 0.78) 0%,
      transparent 100%
    );
    pointer-events: none;
  }
`;

export default function DotGridBackground() {
  useEffect(() => {
    const id = "dot-grid-bg-style";
    if (document.getElementById(id)) return;

    const tag = document.createElement("style");
    tag.id = id;
    tag.textContent = CSS;
    document.head.appendChild(tag);

    return () => document.getElementById(id)?.remove();
  }, []);

  return <div className="dot-grid-bg" aria-hidden="true" />;
}

// ─────────────────────────────────────────────────────────────
//  YOUR LOCKED CONFIG (from Live Controls):
//  ┌──────────────┬──────────┐
//  │ Dot colour   │ #000000e5  │
//  │ Dot size     │ 1.2px    │
//  │ Grid spacing │ 26px     │
//  └──────────────┴──────────┘
// ─────────────────────────────────────────────────────────────
