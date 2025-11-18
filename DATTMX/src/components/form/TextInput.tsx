// src/components/form/TextInput.tsx
import React, { forwardRef, useMemo, useState } from "react";
import clsx from "clsx";
import { Eye, EyeOff, AlertTriangle } from "lucide-react";
import { useField } from "formik";
import type { TextInputProps, FormikTextInputProps } from "@/@types/components";

/**
 * TextInput con manejo visual de errores y control de tamaño:
 * - El input, label e icono mantienen el color azul.
 * - Solo el triángulo rojo y el mensaje de error se muestran cuando hay error.
 * - Tamaños disponibles: "sm" (18rem), "md" (20rem), "lg" (24rem), "full" (100%)
 */
export const TextInput = forwardRef<HTMLInputElement, TextInputProps>(
  (
    {
      label,
      name,
      icon,
      error,
      className,
      inputClassName,
      id,
      readOnly,
      disabled,
      required,
      type = "text",
      canTogglePassword = true,
      placeholder,
      size = "md",       // <-- tu tamaño visual
      nativeSize,        // <-- tamaño nativo opcional
      ...rest
    },
    ref
  ) => {
    // ID y Name (si hay id, predomina)
    const inputId = id ?? name;
    const inputName = id ?? name;

    const isPassword = type === "password";
    const [showPass, setShowPass] = useState(false);

    const actualType = useMemo(
      () => (isPassword && canTogglePassword ? (showPass ? "text" : "password") : type),
      [isPassword, canTogglePassword, showPass, type]
    );

    const errorId = error ? `${inputId}-error` : undefined;

    // 🎨 Definición de tamaños de ancho
    const sizeClasses = {
      sm: "w-72", // 18rem = 288px
      md: "w-80", // 20rem = 320px
      lg: "w-96", // 24rem = 384px
      full: "w-full", // 100%
    }[size] || "w-80";

    return (
      <div className={clsx(sizeClasses, "mb-4 relative font-sans", className)}>
        {/* Contenedor principal (siempre azul) */}
        <div className="relative flex items-center rounded-xl border-2 border-[#143364] bg-white px-3 py-2 transition-all duration-300">
          {/* Ícono (si existe) con borde derecho */}
          {icon && (
            <div className="flex items-center justify-center w-9 h-9 mr-2 pr-2 border-r-2 text-[#143364] border-[#143364]">
              {icon}
            </div>
          )}

          {/* Label fijo (azul) */}
          <label
            htmlFor={inputId}
            className="absolute -top-3 left-4 px-2 text-sm font-medium rounded-md font-sans bg-[#143364] text-white"
          >
            {label}
            {required && <span className="ml-0.5 opacity-90">*</span>}
          </label>

          {/* Input */}
          <input
            id={inputId}
            name={inputName}
            ref={ref}
            placeholder={placeholder || ""}
            type={actualType}
            readOnly={readOnly}
            disabled={disabled}
            required={required}
            aria-invalid={Boolean(error) || undefined}
            aria-describedby={errorId}
            className={clsx(
              "block w-full bg-transparent py-2 text-sm outline-none font-sans",
              "text-slate-800 placeholder-slate-400",
              disabled && "cursor-not-allowed bg-slate-100 text-slate-400",
              readOnly && "bg-slate-50 text-slate-600",
              inputClassName
            )}
            {...rest}
          />

          {/* Toggle password (azul) */}
          {isPassword && canTogglePassword && (
            <button
              type="button"
              aria-label={showPass ? "Ocultar contraseña" : "Mostrar contraseña"}
              onClick={() => setShowPass((v) => !v)}
              className="absolute right-10 top-1/2 -translate-y-1/2 text-[#143364]"
              tabIndex={-1}
            >
              {showPass ? <EyeOff size={18} /> : <Eye size={18} />}
            </button>
          )}

          {/* Ícono de error (triángulo rojo) */}
          {error && (
            <div
              className="absolute right-2 top-1/2 -translate-y-1/2 text-red-500 animate-blink"
              aria-hidden
            >
              <AlertTriangle size={22} strokeWidth={2.5} />
            </div>
          )}
        </div>

        {/* Mensaje de error (rojo, parpadeo suave) */}
        {error && (
          <p
            id={errorId}
            aria-live="polite"
            className="mt-1 text-sm !font-sans tracking-wide animate-blink-slow"
          >
            {error}
          </p>
        )}
      </div>
    );
  }
);
TextInput.displayName = "TextInput";

/* ======== Formik wrapper ======== */
export const FormikTextInput: React.FC<FormikTextInputProps> = (props) => {
  const [field, meta] = useField(props.name);
  const error = meta.touched && meta.error ? meta.error : undefined;
  return <TextInput {...props} {...field} error={error} />;
};
