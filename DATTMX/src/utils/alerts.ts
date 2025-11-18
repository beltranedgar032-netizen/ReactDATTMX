import Swal from "sweetalert2";

// ✅ Alerta de éxito
export function showSuccess(title: string, text?: string) {
  return Swal.fire({
    icon: "success",
    title,
    text,
    confirmButtonColor: "#143364",
  });
}

// ⚠️ Confirmación (devuelve promesa)
export function showConfirm(title: string, text?: string) {
  return Swal.fire({
    title,
    text,
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#143364",
    cancelButtonColor: "#d33",
    confirmButtonText: "Sí, continuar",
    cancelButtonText: "Cancelar",
  });
}

// ❌ Error
export function showError(title: string, text?: string) {
  return Swal.fire({
    icon: "error",
    title,
    text,
    confirmButtonColor: "#d33",
  });
}
