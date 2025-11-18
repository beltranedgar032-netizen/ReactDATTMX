import { useAuthStore } from "@/stores/auth.store";

/**
 * Envoltorio de fetch para detectar 401 solo si el usuario
 * ya está autenticado y NO está en rutas públicas.
 */
export async function fetchWithAuth(
  input: RequestInfo | URL,
  init?: RequestInit
) {
  const res = await fetch(input, init);

  if (res.status === 401) {
    const { user, logout } = useAuthStore.getState();
    const path = window.location.pathname;

    // rutas donde no queremos interceptar 401
    const publicRoutes = ["/Login", "/NotFound", "/Forbidden", "/ServerError"];

    const isPublic = publicRoutes.some((r) => path.startsWith(r));

    // Solo actuar si el usuario ya estaba logueado y no estamos en rutas públicas
    if (user && !isPublic) {
      console.warn("Sesión expirada → cerrando sesión y redirigiendo");
      await logout();
      window.location.href = "/NotFound"; // o "/Login", como prefieras
    }

    // Lanza el error, pero sin redirección en el login
    throw new Error("No autorizado");
  }

  return res;
}
