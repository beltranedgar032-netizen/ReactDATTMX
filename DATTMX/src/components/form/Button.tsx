import React, { useState, forwardRef } from "react";
import clsx from "clsx";
import { useFormikContext } from "formik";
import type { ButtonProps, FormikButtonProps } from "@/@types/components";

/**
 * 🔘 Button
 * - Mantiene el icono visible en loading
 * - Muestra tres puntos en ola en loading
 */
export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  (
    {
      label,
      icon,
      onClick,
      color = "var(--primary-an)",
      variant = "solid",
      size = "md",
      bTextDark = false,
      type = "button",
      disabled = false,
      className,
      fullWidth = false,
      loading = false,
      loadingVariant = "dots",
      hideLabelWhileLoading = true,
      ...rest
    },
    ref
  ) => {
    const [internalLoading, setInternalLoading] = useState(false);

    const handleClick = async () => {
      if (!onClick || disabled || internalLoading) return;
      try {
        setInternalLoading(true);
        await onClick();
      } finally {
        setInternalLoading(false);
      }
    };

    const isLoading = loading || internalLoading;
    const style = { ["--btn-color" as any]: color };

    const sizeCls =
      {
        sm: "text-sm px-3 py-1.5",
        md: "text-base px-4 py-2",
        lg: "text-lg px-6 py-3",
      }[size] || "text-base px-4 py-2";

    const variantCls =
      variant === "solid"
        ? `bg-[var(--btn-color)] ${bTextDark ? "text-black" : "text-white"} hover:opacity-90`
        : `border-2 border-[color:var(--btn-color)] text-[color:var(--btn-color)] hover:bg-[var(--btn-color)] hover:text-white`;

    const Dots = (
      <span className="flex items-center gap-1 h-5" aria-hidden>
        <span className="w-2 h-2 rounded-full bg-current animate-bounce [animation-delay:0ms]" />
        <span className="w-2 h-2 rounded-full bg-current animate-bounce [animation-delay:150ms]" />
        <span className="w-2 h-2 rounded-full bg-current animate-bounce [animation-delay:300ms]" />
      </span>
    );

    return (
      <button
        ref={ref}
        type={type}
        disabled={disabled || isLoading}
        onClick={onClick ? handleClick : undefined}
        style={style}
        className={clsx(
          "inline-flex items-center justify-center rounded-lg font-medium gap-2 transition-all",
          sizeCls,
          variantCls,
          fullWidth && "w-full",
          "disabled:opacity-60 disabled:cursor-not-allowed",
          className
        )}
        {...rest}
      >
        {icon && <span className="flex items-center justify-center w-5 h-5">{icon}</span>}

        {isLoading ? (
          loadingVariant === "dots" ? (
            <>
              {!hideLabelWhileLoading && <span>{label}</span>}
              {Dots}
            </>
          ) : (
            <span className="flex items-center justify-center w-5 h-5">
              <svg
                className="animate-spin w-5 h-5 text-current"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                aria-hidden
              >
                <circle
                  className="opacity-25"
                  cx="12"
                  cy="12"
                  r="10"
                  stroke="currentColor"
                  strokeWidth="4"
                />
                <path
                  className="opacity-75"
                  fill="currentColor"
                  d="M4 12a8 8 0 018-8v8H4z"
                />
              </svg>
            </span>
          )
        ) : (
          <span>{label}</span>
        )}
      </button>
    );
  }
);

Button.displayName = "Button";

/* =========================
 * FormikButton
 * ========================= */
export const FormikButton: React.FC<FormikButtonProps> = ({
  label,
  loadingLabel,
  hideLabelWhileLoading = true,
  loading,
  ...rest
}) => {
  const { isSubmitting } = useFormikContext<any>();
  const isLoading = loading ?? isSubmitting;

  return (
    <Button
      type="submit"
      loading={isLoading}
      disabled={isLoading}
      label={label}
      hideLabelWhileLoading={hideLabelWhileLoading}
      {...rest}
    />
  );
};
