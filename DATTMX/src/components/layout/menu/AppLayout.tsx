import { useState, useEffect } from "react";
import { Outlet } from "react-router-dom";
import Topbar from "../menu/Topbar";
import Sidebar from "../menu/Sidebar";
import { useAuth } from "@/app/Login/hooks/useAuth";

export default function AppLayout() {
  const { user, checkAuth } = useAuth();
  const [open, setOpen] = useState(false);

  useEffect(() => {
    checkAuth?.();
  }, []);

  useEffect(() => {
    if (user !== null) {
      console.log("Usuario autenticado:", user);
    }
  }, [user]);

  return (
    <div className="relative z-10 mx-auto mt-5 h-[95vh] w-[92vw] overflow-hidden rounded-2xl bg-white/10 shadow-2xl backdrop-blur-md">
      <div className="grid h-full grid-rows-[56px_1fr]">
        {/* TOPBAR */}
        <Topbar onToggleSidebar={() => setOpen((v) => !v)} />

        {/* BODY */}
        <div className="relative flex h-full gap-4 p-4 overflow-hidden">

          {/* BACKDROP para cerrar sidebar en móvil */}
          {/* BACKDROP solo en móvil */}
{open && (
  <div
    className="fixed inset-0 z-30 bg-black/40 lg:hidden"
    onClick={() => setOpen(false)}
  />
)}

{/* SIDEBAR */}
<aside
  className={`
    fixed top-0 left-0 z-40 h-full w-72 overflow-y-auto rounded-xl bg-[var(--primary)] shadow-2xl transition-transform duration-300
    ${open ? "translate-x-0" : "-translate-x-full"}
    lg:static lg:z-0 lg:translate-x-0 lg:shadow-none
  `}
>
  <Sidebar onLinkClick={() => setOpen(false)} />

</aside>


          {/* MAIN CONTENT */}
          <main className="relative z-10 flex-1 overflow-auto">
            <div className="h-full rounded-2xl bg-white/10 p-6 shadow-2xl backdrop-blur-md">
              <Outlet />
            </div>
          </main>
        </div>
      </div>
    </div>
  );
}
