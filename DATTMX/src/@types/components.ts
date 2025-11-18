// src/components/Components.ts
import type {
  ReactNode,
  ButtonHTMLAttributes,
  InputHTMLAttributes,
} from "react";

/* ========= Button ========= */
export type ButtonVariant = "solid" | "outline";
export type ButtonSize = "sm" | "md" | "lg";
export type ButtonType = "button" | "submit" | "reset";

/** Variantes de loading opcionales */
export type ButtonLoadingVariant = "dots" | "spinner";

export interface ButtonProps
  extends Omit<
    ButtonHTMLAttributes<HTMLButtonElement>,
    "type" | "color" | "disabled" | "className"
  > {
  /** Texto principal del botón */
  label: string;
  /** Ícono opcional */
  icon?: ReactNode;
  /** Acción al hacer click (sync o async) */
  onClick?: () => Promise<void> | void;
  /** Color (hex, nombre o var CSS) */
  color?: string;
  /** Variante visual */
  variant?: ButtonVariant;
  /** Tamaño */
  size?: ButtonSize;
  /** Texto en negro si variant=solid */
  bTextDark?: boolean;
  /** Tipo de botón */
  type?: ButtonType;
  /** Deshabilitado */
  disabled?: boolean;
  /** Ocupa el ancho completo */
  fullWidth?: boolean;
  /** Clases extra */
  className?: string;

  /** Controla loading desde afuera (Formik u otro) */
  loading?: boolean;
  /** Tipo de loading: puntos en ola (default) o spinner */
  loadingVariant?: ButtonLoadingVariant;
  /** Ocultar el label mientras hay loading (default: true) */
  hideLabelWhileLoading?: boolean;
}

/** Botón submit conectado a Formik */
export type FormikButtonProps = Omit<
  ButtonProps,
  "type" | "disabled" | "onClick" | "loading"
> & {
  /** Si quisieras mostrar un texto en loading (no usado si hideLabelWhileLoading=true) */
  loadingLabel?: string;
  /** Permite controlar loading manualmente además de Formik */
  loading?: boolean;
  /** Ocultar el label mientras hay loading (default: true) */
  hideLabelWhileLoading?: boolean;
};

/* ========= TextInput ========= */
export interface TextInputProps
  extends Omit<InputHTMLAttributes<HTMLInputElement>, "className" | "size"> {
  /** Texto del label */
  label: string;
  /** name usado por form libs (Formik) */
  name: string;
  /** Id del input; si se envía, se usará también como name */
  id?: string;
  /** Ícono opcional a la izquierda */
  icon?: ReactNode;
  /** Mensaje de error (renderiza debajo del input) */
  error?: string;
  /** Clases extra del wrapper */
  className?: string;
  /** Clases extra del input nativo */
  inputClassName?: string;
  /** Mostrar/ocultar contraseña si type="password" */
  canTogglePassword?: boolean;

  /** Tamaño visual del input */
  size?: "sm" | "md" | "lg" | "full";

  /** Tamaño nativo (HTML) en caracteres, si se requiere */
  nativeSize?: number;
}

/** Wrapper Formik para TextInput */
export type FormikTextInputProps = Omit<
  TextInputProps,
  "value" | "onChange" | "onBlur" | "error"
>;

// @types/components.ts

// @/@types/components.ts

export interface Option {
  label: string;
  value: string | number;
}

export interface FormikSelectInputProps {
  label: string;
  name: string;
  options: Option[];
  isMulti?: boolean;
  required?: boolean;
  placeholder?: string;
  opcionNull?: boolean;
  className?: string;
  selectClassName?: string;
  icon?: React.ReactNode;
  onChange?: (value: Option | Option[] | null) => void;
}


