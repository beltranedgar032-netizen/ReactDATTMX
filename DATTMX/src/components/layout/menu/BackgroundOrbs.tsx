// src/components/BackgroundOrbs.tsx
import { useMemo } from "react";

type Orb = {
  left: number;  // vw
  top: number;   // vh
  size: number;  // px
  color: string; // usa variables CSS
};

function random(min: number, max: number) {
  return Math.random() * (max - min) + min;
}

function generateOrbs(count: number, colors: string[]): Orb[] {
  const orbs: Orb[] = [];
  for (let i = 0; i < count; i++) {
    const size = random(80, 280);
    const left = random(-10, 110); // permite que existan fuera del viewport
    const top = random(-10, 110);
    const color = colors[Math.floor(random(0, colors.length))];
    orbs.push({ left, top, size, color });
  }
  return orbs;
}

export default function BackgroundOrbs({ count = 14 }: { count?: number }) {
  const colors = useMemo(
    () => ["var(--primary)", "var(--secondary)", "var(--tertiary)"],
    []
  );

  // Se recalculan en cada refresco → nuevas posiciones estáticas
  const orbs = useMemo(() => generateOrbs(count, colors), [count, colors]);

  return (
    <div
      className="fixed inset-0 -z-10 pointer-events-none overflow-visible"
      aria-hidden="true"
    >
      {orbs.map((o, idx) => (
        <div
          key={idx}
          className="absolute rounded-full"
          style={{
            left: `${o.left}vw`,
            top: `${o.top}vh`,
            width: o.size,
            height: o.size,
            // Borde suave sin blur: un radial gradiente con caída a transparente
            background: `radial-gradient(circle at 35% 35%, ${o.color}, transparent 65%)`,
            transform: "translate(-50%, -50%)",
          }}
        />
      ))}
    </div>
  );
}
