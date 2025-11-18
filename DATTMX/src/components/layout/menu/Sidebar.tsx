// src/components/layout/menu/Sidebar.tsx
import { useState } from "react";
import { NavLink, useLocation } from "react-router-dom";
import type { MenuItemDto } from "@/@types/menu.types";

import {
  Shield, Wallet, Truck, Boxes, User, Badge, Coins, Map, Grid3X3, Pin,
  Folder, ChevronDown, ChevronRight, Home
} from "lucide-react";

// ================== Config visual ==================
const ACTIVE_BG = "rgba(255,255,255,.14)";
const HOVER_BG  = "rgba(255,255,255,.10)";
const TEXT_CLR  = "white";

// ================== Icon mapping ==================
const ICONS: Record<string, React.ComponentType<{ className?: string; size?: number }>> = {
  home: Home,
  shield: Shield,
  wallet: Wallet,
  truck: Truck,
  boxes: Boxes,
  user: User,
  badge: Badge,
  coins: Coins,
  map: Map,
  grid: Grid3X3,
  pin: Pin,
  folder: Folder,
};

// ================== Helpers ==================
function nodeHasActiveDescendant(node: MenuItemDto, pathname: string): boolean {
  if (node.screen && pathname.startsWith(node.screen.sScreenPath)) return true;
  return node.children?.some((ch) => nodeHasActiveDescendant(ch, pathname)) ?? false;
}

// ================== Componentes ==================
function ItemLink({
  to,
  label,
  icon,
  onClick,
}: {
  to: string;
  label: string;
  icon?: string | null;
  onClick?: () => void;
}) {
  const Icon = icon ? ICONS[icon] : undefined;
  return (
    <NavLink
      to={to}
      end
      onClick={onClick} // 🔹 Cierra el menú al hacer clic
      className={({ isActive }) =>
        [
          "flex items-center gap-2 rounded-md px-3 py-2 text-sm transition",
          isActive ? "" : "hover:opacity-100",
        ].join(" ")
      }
      style={({ isActive }) => ({
        color: TEXT_CLR,
        background: isActive ? ACTIVE_BG : "transparent",
      })}
    >
      {Icon ? <Icon size={16} className="opacity-90" /> : null}
      <span>{label}</span>
    </NavLink>
  );
}

function Group({ node, onLinkClick }: { node: MenuItemDto; onLinkClick?: () => void }) {
  const { pathname } = useLocation();
  const isActiveSection = nodeHasActiveDescendant(node, pathname);
  const [open, setOpen] = useState(isActiveSection);
  const Icon = node.sIcon ? ICONS[node.sIcon] : undefined;

  // 🔹 Si tiene pantalla → es link (no grupo)
  if (node.screen) {
    return (
      <ItemLink
        to={node.screen.sScreenPath}
        label={node.sTitle}
        icon={node.sIcon ?? undefined}
        onClick={onLinkClick} // 👈 pasa el cierre aquí
      />
    );
  }

  // 🔸 Si no tiene screen → es contenedor
  return (
    <div className="mt-3 first:mt-0">
      <button
        type="button"
        onClick={() => setOpen((v) => !v)}
        className="flex w-full items-center justify-between rounded-md px-3 py-2 text-left text-xs uppercase tracking-wide"
        style={{ color: TEXT_CLR, background: isActiveSection ? HOVER_BG : "transparent" }}
      >
        <span className="inline-flex items-center gap-2">
          {Icon ? <Icon size={14} className="opacity-90" /> : null}
          {node.sTitle}
        </span>
        {open ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
      </button>

      {open && node.children?.length > 0 && (
        <div className="mt-1 space-y-1 pl-2">
          {node.children
            .slice()
            .sort((a, b) => a.iOrder - b.iOrder)
            .map((child) => (
              <div key={child.iIdMenuItem} className="rounded-md">
                <Group node={child} onLinkClick={onLinkClick} />
              </div>
            ))}
        </div>
      )}
    </div>
  );
}

// ================== Sidebar principal ==================
export default function Sidebar({ onLinkClick }: { onLinkClick?: () => void }) {
  const roots: MenuItemDto[] = [
    {
      iIdMenuItem: 1,
      sTitle: "Clientes",
      sIcon: "user",
      iOrder: 1,
      iLevelId: 0,
      bIsActive: true,
      screen: {
        iIdScreen: 1,
        sScreenName: "Clientes",
        sScreenPath: "/Administracion/clientes",
      },
      children: [],
    },
  ];

  return (
    <aside
      className="h-full w-72 shrink-0 overflow-y-auto rounded-xl px-3 py-4"
      style={{ background: "var(--primary)", color: TEXT_CLR }}
    >
      {/* Header del menú */}
      <div className="mb-4 flex items-center gap-3 px-2">
        
        <div>
          <div className="text-sm font-semibold opacity-90">
            {import.meta.env.VITE_APP_NAME}
          </div>
          <div className="text-xs opacity-70">v1.0</div>
        </div>
      </div>

      {/* Render del menú */}
      {roots.map((node) => (
        <Group key={node.iIdMenuItem} node={node} onLinkClick={onLinkClick} />
      ))}
    </aside>
  );
}
