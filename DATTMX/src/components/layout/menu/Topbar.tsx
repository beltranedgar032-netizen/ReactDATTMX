// src/components/layout/menu/Topbar.tsx


import { useAuth } from "@/app/Login/hooks/useAuth";

type Props = {
  onToggleSidebar?: () => void;
};

export default function Topbar({ onToggleSidebar }: Props) {
  const { user, logout } = useAuth();

  const handleLogout = async () => {
    await logout();
  };

  return (
    <header
      className="flex h-14 items-center justify-between gap-3 border-b px-4"
      style={{
        background: "var(--primary)",
        borderColor: "rgba(0,0,0,.15)",
        color: "white",
      }}
    >
      {/* 🔹 Botón menú (visible solo en pantallas pequeñas) */}
      <button
        onClick={onToggleSidebar}
        className="inline-flex items-center gap-2 rounded-md px-3 py-1.5 text-sm hover:bg-black/20 lg:hidden"
        aria-label="Abrir menú"
      >
        ☰ <span className="hidden sm:inline">Menú</span>
      </button>

      {/* 🔸 Espaciador central (útil para centrar en móviles) */}
      <div className="pointer-events-none select-none text-sm opacity-70" />

      {/* 🔸 Sección derecha: Logo + Usuario */}
      <div className="flex items-center gap-3">
        {/* 🖼 Logo empresa */}
      

        {/* 👤 Usuario logueado */}
        {!user ? (
          <div className="text-sm opacity-70">Cargando usuario...</div>
        ) : (
          <div className="flex items-center gap-2 rounded-md bg-black/20 px-3 py-1.5">
            <div className="leading-tight text-white">
              <div className="text-sm font-medium">{user.sUser}</div>
              <div className="text-[11px] opacity-80">{user.sFullName}</div>
            </div>

            {/* 🔐 Botón cerrar sesión */}
            <button
              onClick={handleLogout}
              className="ml-2 rounded-md px-2 py-1 text-xs hover:bg-black/30 transition-colors"
            >
              Cerrar sesión
            </button>
          </div>
        )}
      </div>
    </header>
  );
}
