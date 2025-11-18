import { create } from "zustand";
import { getUsuarioActual, login as loginService, logout as logoutService } from "@/app/Login/services/auth";
import { showSuccess, showError } from "@/utils/alerts";
import type { LoginValues } from "@/app/Login/@types/login";

interface User {
  sUser: string;
  sFullName: string;
}

interface AuthStore {
  user: User | null;
  loading: boolean;
  error: string | null;
  login: (values: LoginValues) => Promise<void>;
  logout: () => Promise<void>;
  checkAuth: () => Promise<boolean>; // devolvemos true/false
}

export const useAuthStore = create<AuthStore>((set) => ({
  user: null,
  loading: false,
  error: null,

  login: async (values) => {
    set({ loading: true, error: null });
    try {
      await loginService(values);
      const data = await getUsuarioActual();
      set({ user: data });
      showSuccess(`Bienvenido ${data.sUser}`);
    } catch (err: any) {
      const message = err.message || "Error al iniciar sesión";
      showError("Error", message);
      set({ error: message, user: null });
    } finally {
      set({ loading: false });
    }
  },

  logout: async () => {
    set({ loading: true });
    try {
      await logoutService();
      set({ user: null });
      showSuccess("Sesión cerrada");
    } catch (err: any) {
      showError("Error al cerrar sesión", err.message);
    } finally {
      set({ loading: false });
    }
  },

  checkAuth: async () => {
    set({ loading: true });
    try {
      const data = await getUsuarioActual();
      set({ user: data, loading: false });
      return true;
    } catch {
      set({ user: null, loading: false });
      return false;
    }
  },
}));
