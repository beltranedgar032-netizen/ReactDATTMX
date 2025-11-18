import { useEffect, useState } from "react";
import { Formik, Form } from "formik";
import * as Yup from "yup";
import { FormikTextInput } from "@/components/form/TextInput";
import { FormikSelectInput } from "@/components/form/Select";
import { FormikButton } from "@/components/form/Button";
import { useShipmentCatalogs } from "../hooks/useShipmentCatalogs";

interface FiltersProps {
  onSubmit: (values: any) => void;
}

export const Filters = ({ onSubmit }: FiltersProps) => {
  const { getCatalog } = useShipmentCatalogs();

  const [statesOptions, setStatesOptions] = useState<any[]>([]);
  const [statusOptions, setStatusOptions] = useState<any[]>([]);

  const initialValues = {
    sGuide: "",
    iIdState: "",
    iIdStatus: ""
  };

  const validationSchema = Yup.object({
    sGuide: Yup.string().nullable(),
    iIdState: Yup.string().nullable(),
    iIdStatus: Yup.string().nullable()
  });

  // 🔽 Cargar catálogos una sola vez al iniciar
  useEffect(() => {
    loadCatalogs();
  }, []);

  const loadCatalogs = async () => {
    const states = await getCatalog("States");
    const status = await getCatalog("Shipmentstatus");

    setStatesOptions(states);
    setStatusOptions(status);
  };

  const handleSubmit = (values: any) => {
    console.log(values);
    const payload = {
      sGuide: values.sGuide || null,
      iIdState: values.iIdState || null,
      iIdStatus: values.iIdStatus || null
    };
    onSubmit(payload);
  };

  return (
    <Formik
      initialValues={initialValues}
      validationSchema={validationSchema}
      onSubmit={handleSubmit}
    >
      {() => (
        <Form
          className="
            grid grid-cols-1 md:grid-cols-4 gap-4
            bg-white/10 backdrop-blur-md border border-white/20
            p-4 rounded-xl w-full shadow-lg
          "
        >
          <FormikTextInput
            name="sGuide"
            label="Número de Guía"
            placeholder="Ingrese la guía"
            size="full"
          />

          <FormikSelectInput
            name="iIdStatus"
            label="Estatus"
            placeholder="Seleccione estatus"
            options={statusOptions}
            opcionNull={true}
            size="full"
          />

          <FormikSelectInput
            name="iIdState"
            label="Estado"
            placeholder="Seleccione estado"
            options={statesOptions}
            opcionNull={true}
            size="full"
          />

          <FormikButton
            label="Buscar"
            size="md"
            className="w-full h-[49px] mt-1"
            color="var(--primary-an)"
            loading = {false}
          />
        </Form>
      )}
    </Formik>
  );
};
