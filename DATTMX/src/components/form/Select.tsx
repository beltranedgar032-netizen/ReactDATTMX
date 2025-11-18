// src/components/form/FormikSelectInput.tsx
import React from "react";
import Select from "react-select";
import { useField } from "formik";
import clsx from "clsx";
import { AlertTriangle } from "lucide-react";
import type {
  MultiValue,
  SingleValue,
  ActionMeta,
  StylesConfig,
} from "react-select";
import type { ReactNode } from "react";

interface Option {
  label: string;
  value: string;
}

interface Props {
  name: string;
  label?: string;
  placeholder?: string;
  options: Option[];
  required?: boolean;
  disabled?: boolean;
  className?: string;
  selectClassName?: string;
  iconSize?: number;
  isMulti?: boolean;
  icon?: ReactNode;
  onChange?: (value: Option | Option[] | null) => void;

  /** Tamaño visual del componente */
  size?: "sm" | "md" | "lg" | "full";

  /** Agrega una opción nula (con el texto del placeholder) */
  opcionNull?: boolean;
}

// 🎨 Estilos del Select (internos)
const customStyles: StylesConfig<Option, boolean> = {
  control: (provided) => ({
    ...provided,
    backgroundColor: "transparent",
    border: "none",
    boxShadow: "none",
    cursor: "pointer",
    minHeight: 0,
  }),
  option: (provided, state) => ({
    ...provided,
    color: state.isSelected ? "#fff" : "#111827",
    backgroundColor: state.isSelected
      ? "var(--tertiary)"
      : state.isFocused
      ? "hsl(var(--tertiary-hsl) / 0.15)"
      : "#fff",
    ":active": {
      backgroundColor: state.isSelected
        ? "var(--tertiary)"
        : "hsl(var(--tertiary-hsl) / 0.25)",
      color: state.isSelected ? "#fff" : "#111827",
    },
  }),
  singleValue: (p) => ({ ...p, color: "#111827" }),
  placeholder: (p) => ({ ...p, color: "#6b7280" }),
  multiValue: (p) => ({
    ...p,
    backgroundColor: "hsl(var(--tertiary-hsl) / 0.15)",
  }),
  multiValueLabel: (p) => ({ ...p, color: "#111827" }),
  multiValueRemove: (p) => ({
    ...p,
    color: "var(--tertiary)",
    ":hover": {
      backgroundColor: "hsl(var(--tertiary-hsl) / 0.25)",
      color: "var(--tertiary)",
    },
  }),
  menu: (p) => ({ ...p, zIndex: 60 }),
  menuPortal: (base) => ({ ...base, zIndex: 9999 }),
};

export const FormikSelectInput: React.FC<Props> = ({
  name,
  label,
  placeholder,
  options,
  required = false,
  disabled = false,
  className,
  selectClassName,
  isMulti = false,
  icon,
  onChange,
  size = "md", // 👈 Tamaño por defecto
  opcionNull = false, // 👈 Nueva prop
}) => {
  const [field, meta, helpers] = useField(name);
  const error = meta.touched && meta.error ? meta.error : "";
  const errorId = `${name}-error`;

  // 🎨 Tamaños visuales
  const sizeClasses = {
    sm: "w-72",
    md: "w-80",
    lg: "w-96",
    full: "w-full",
  }[size] || "w-80";

  // ✅ Si opcionNull está activa, agregamos una opción vacía al inicio
  const allOptions = opcionNull
    ? [{ label: placeholder ?? "Selecciona una opción...", value: "" }, ...options]
    : options;

  // 🧠 Valor actual
  const selectedValue = isMulti
    ? allOptions.filter(
        (o) => Array.isArray(field.value) && field.value.includes(o.value)
      )
    : allOptions.find((o) => o.value === field.value) ?? null;

  // 🔄 Manejo de cambio
  const handleChange = (
    newValue: MultiValue<Option> | SingleValue<Option>,
    _actionMeta: ActionMeta<Option>
  ) => {
    if (isMulti) {
      const values = Array.isArray(newValue)
        ? newValue.map((opt) => opt.value)
        : [];
      helpers.setValue(values);
      onChange?.(newValue as Option[]);
    } else {
      const selected = newValue as SingleValue<Option>;
      helpers.setValue(selected ? selected.value : "");
      onChange?.(selected || null);
    }
  };

  return (
    <div className={clsx(sizeClasses, "mb-4 relative font-sans", className)}>
      {/* Contenedor principal */}
      <div
        className={clsx(
          "relative flex items-center rounded-xl border-2 bg-white px-3 py-2 transition-all duration-300",
          error ? "border-red-500" : "border-[#143364]"
        )}
      >
        {/* Icono izquierdo con raya azul */}
        {icon && (
          <div
            className={clsx(
              "flex items-center justify-center w-9 h-9 mr-2 pr-2 border-r-2 text-[#143364] border-[#143364]"
            )}
          >
            {icon}
          </div>
        )}

        {/* Label fijo (azul) */}
        {label && (
          <label
            htmlFor={name}
            className="absolute -top-3 left-4 px-2 text-sm font-medium rounded-md font-sans bg-[#143364] text-white z-10"
          >
            {label}
            {required && <span className="ml-0.5 opacity-90">*</span>}
          </label>
        )}

        {/* Select */}
        <div className="flex-1 min-w-0">
          <Select
            inputId={name}
            name={name}
            value={selectedValue}
            options={allOptions}
            isMulti={isMulti}
            isDisabled={disabled}
            onBlur={() => helpers.setTouched(true)}
            onChange={handleChange}
            placeholder={placeholder}
            styles={customStyles}
            classNames={{
              container: () => "w-full",
              control: () =>
                clsx(
                  "!border-none !shadow-none !outline-none bg-transparent text-sm font-sans",
                  selectClassName
                ),
              valueContainer: () => "pl-0 text-slate-800 py-0.5",
              menu: () => "text-sm font-sans",
              input: () => "text-sm font-sans",
              option: () => "!cursor-pointer",
              indicatorsContainer: () => "pr-2",
              indicatorSeparator: () => "w-[1px] bg-[#143364] mx-2",
            }}
            classNamePrefix="custom-select"
            menuPortalTarget={document.body}
            menuPosition="fixed"
            menuShouldScrollIntoView={false}
            theme={(theme) => ({
              ...theme,
              colors: {
                ...theme.colors,
                primary: "var(--tertiary)",
                primary75: "hsl(var(--tertiary-hsl) / 0.75)",
                primary50: "hsl(var(--tertiary-hsl) / 0.25)",
                primary25: "hsl(var(--tertiary-hsl) / 0.15)",
                neutral0: "#fff",
                neutral80: "#111827",
              },
            })}
          />
        </div>

        {/* Icono de alerta (sin parpadeo) */}
        {error && (
          <div
            className="absolute right-2 top-1/2 -translate-y-1/2 text-red-500"
            aria-hidden
          >
            <AlertTriangle size={22} strokeWidth={2.5} />
          </div>
        )}
      </div>

      {/* Mensaje de error (texto rojo, sin animación) */}
      {error && (
        <p
          id={errorId}
          aria-live="polite"
          className="mt-1 text-sm text-red-500 font-sans tracking-wide"
        >
          {error}
        </p>
      )}
    </div>
  );
};
