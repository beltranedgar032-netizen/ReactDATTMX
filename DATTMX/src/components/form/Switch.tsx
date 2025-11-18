import React from "react";
import { useField } from "formik";
import clsx from "clsx";

type Props = {
  name: string;
  label: string;          // Texto del chip (ej. "Activo", "Recordar sesión", etc.)
  className?: string;
  disabled?: boolean;
  defaultChecked?: boolean;
};

export const FormikSwitch: React.FC<Props> = ({
  name,
  label,
  className,
  disabled = false,
  defaultChecked = false,
}) => {
  const [field, meta, helpers] = useField({ name, type: "checkbox" });
  const error = meta.touched && meta.error ? meta.error : undefined;
  const errorId = error ? `${name}-error` : undefined;

  // Valor inicial si no está definido
  React.useEffect(() => {
    if (field.value === undefined && defaultChecked !== undefined) {
      helpers.setValue(defaultChecked);
    }
  }, [defaultChecked]);

  return (
    <div className={clsx("w-fit font-sans", className)}>
      <label
        htmlFor={name}
        className={clsx(
          "flex items-center gap-3 cursor-pointer select-none",
          disabled && "opacity-60 cursor-not-allowed"
        )}
      >
        {/* 🔘 Switch */}
        <div
          className={clsx(
            "relative w-10 h-6 rounded-full transition-colors duration-300",
            field.value
              ? "bg-[var(--tertiary)]"
              : "bg-[var(--primary-an)]"
          )}
        >
          <input
            id={name}
            name={name}
            type="checkbox"
            checked={Boolean(field.value)}
            onChange={(e) => helpers.setValue(e.target.checked)}
            onBlur={field.onBlur}
            disabled={disabled}
            aria-invalid={!!error}
            aria-describedby={errorId}
            className="absolute opacity-0 inset-0 cursor-pointer"
          />
          <span
            className={clsx(
              "absolute top-0.5 left-0.5 w-5 h-5 bg-white rounded-full shadow-md transform transition-transform duration-300",
              field.value ? "translate-x-4" : "translate-x-0"
            )}
          ></span>
        </div>

        {/* 🟦 Label azul */}
        <span
          className={clsx(
            "px-3 py-[4px] rounded-md text-sm font-semibold text-white select-none",
            field.value ? "bg-[var(--tertiary)]" : "bg-[var(--primary-an)]"
          )}
        >
          {label}
        </span>
      </label>

      {/* ⚠️ Error */}
      {error && (
        <p id={errorId} className="mt-1 text-sm text-red-500 animate-blink-slow">
          {error}
        </p>
      )}
    </div>
  );
};
