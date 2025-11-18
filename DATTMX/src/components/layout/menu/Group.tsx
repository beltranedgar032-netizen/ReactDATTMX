import { useEffect, useState } from "react";
import { Link, useLocation } from "react-router-dom";
import { ChevronDown } from "lucide-react";
import type { MenuItemDto } from "@/@types/menu.types";

// Función para validar si alguno de los hijos está activo
function hasActiveChild(node: MenuItemDto, pathname: string): boolean {
  if (node.screen?.sScreenPath === pathname) return true;
  return node.children?.some((child) => hasActiveChild(child, pathname)) ?? false;
}

interface Props {
  node: MenuItemDto;
}

export function Group({ node }: Props) {
  const { pathname } = useLocation();
  const isActiveSection = hasActiveChild(node, pathname);
  const [open, setOpen] = useState(isActiveSection);

  useEffect(() => {
    setOpen(isActiveSection);
  }, [isActiveSection]);

  return (
    <div className="space-y-1">
      {/* Encabezado del grupo (toggle) */}
      <div
        className="flex items-center justify-between cursor-pointer px-3 py-2 hover:bg-white/10 rounded-md text-white"
        onClick={() => setOpen((prev) => !prev)}
      >
        <span className="text-sm font-medium">{node.sTitle}</span>
        <ChevronDown
          size={16}
          className={`transition-transform ${open ? "rotate-180" : ""}`}
        />
      </div>

      {/* Lista de hijos */}
      {open && node.children?.length > 0 && (
        <div className="ml-4 space-y-1">
          {node.children.map((child) =>
            child.screen ? (
              <Link
                key={child.iIdMenuItem}
                to={child.screen.sScreenPath}
                className={`block px-3 py-1 rounded-md text-sm text-white hover:bg-white/10 ${
                  child.screen.sScreenPath === pathname ? "bg-white/10" : ""
                }`}
              >
                {child.sTitle}
              </Link>
            ) : (
              <Group key={child.iIdMenuItem} node={child} />
            )
          )}
        </div>
      )}
    </div>
  );
}
