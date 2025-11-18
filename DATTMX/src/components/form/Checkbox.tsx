import React from "react";
import { useField } from "formik";
import clsx from "clsx";
import { Check } from "lucide-react";

type Props = {
  name: string;
  label: string;          // Texto: "Recuérdame"
  className?: string;
  disabled?: boolean;
  defaultChecked?: boolean;
};

export const FormikCheckbox: React.FC<Props> = ({
  name,
  label,
  className,
  disabled = false,
  defaultChecked = false,
}) => {
  const [field, meta, helpers] = useField({ name, type: "checkbox" });
  const error = meta.touched && meta.error ? meta.error : undefined;
  const errorId = error ? `${name}-error` : undefined;

  React.useEffect(() => {
    if (field.value === undefined && defaultChecked !== undefined) {
      helpers.setValue(defaultChecked);
    }
  }, [defaultChecked]);

  return (
    <div className={clsx("w-fit font-sans", className)}>
      {/* 🟦 Contenedor del checkbox y label (sin borde ni fondo extra) */}
      <label
        htmlFor={name}
        className={clsx(
          "flex items-center gap-3 cursor-pointer select-none",
          disabled && "opacity-60 cursor-not-allowed"
        )}
      >
        {/* Checkbox */}
        <span
          className={clsx(
            "relative grid place-items-center rounded-md border-2 w-5 h-5 transition-all duration-200",
            field.value
              ? "bg-[var(--tertiary)] border-[var(--tertiary)]"
              : "border-[var(--primary-an)] bg-transparent"
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
          <Check
            className={clsx(
              "pointer-events-none transition-opacity duration-200",
              field.value ? "opacity-100" : "opacity-0"
            )}
            size={14}
            color="#fff"
            strokeWidth={3}
          />
        </span>

        {/* Label azul al lado */}
        <span
          className={clsx(
            "px-3 py-[4px] rounded-md text-sm font-semibold text-white select-none",
            field.value ? "bg-[var(--tertiary)]" : "bg-[var(--primary-an)]"
          )}
        >
          {label}
        </span>
      </label>

      {/* Mensaje de error opcional */}
      {error && (
        <p id={errorId} className="mt-1 text-sm text-red-500 animate-blink-slow">
          {error}
        </p>
      )}
    </div>
  );
};
