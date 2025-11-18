import { useEffect, useState } from "react";
import { Formik, Form } from "formik";
import * as Yup from "yup";
import { Modal } from "../components/Modal";
import { FormikSelectInput } from "@/components/form/Select"; 
import { FormikButton } from "@/components/form/Button";
import { useShipmentCatalogs } from "../hooks/useShipmentCatalogs";

interface Props {
  open: boolean;
  onClose: () => void;
  onSubmit: (statusId: number) => void;
  currentStatusId?: number | null;
}

export const ModalChangeStatus = ({
  open,
  onClose,
  onSubmit,
  currentStatusId = null
}: Props) => {

  const { getCatalog } = useShipmentCatalogs();
  const [statusOptions, setStatusOptions] = useState<any[]>([]);

  useEffect(() => {
    if (open) loadStatusOptions();
  }, [open]);

  const loadStatusOptions = async () => {
    const list = await getCatalog("Shipmentstatus");
    setStatusOptions(list);
  };

  const initialValues = {
    iIdStatus: currentStatusId ? String(currentStatusId) : ""
  };

  const validationSchema = Yup.object({
    iIdStatus: Yup.string().required("Selecciona un estatus")
  });

  const handleSubmit = (values: any) => {
    onSubmit(Number(values.iIdStatus));
    onClose();
  };

  return (
    <Modal open={open} onClose={onClose}>
      <h2 className="text-xl font-bold text-[#143364] mb-4">Cambiar Estatus</h2>

      <Formik
        initialValues={initialValues}
        validationSchema={validationSchema}
        enableReinitialize
        onSubmit={handleSubmit}
      >
        <Form className="space-y-4">

          <FormikSelectInput
            name="iIdStatus"
            label="Seleccione Estatus"
            placeholder="Selecciona uno"
            options={statusOptions}
            size="full"
            required
            opcionNull={true}
          />

          <div className="flex justify-end gap-3 pt-2">
            <button
              type="button"
              className="px-4 py-2 bg-gray-500 text-white rounded-md hover:bg-gray-600"
              onClick={onClose}
            >
              Cancelar
            </button>

            <FormikButton
              label="Actualizar"
              size="md"
              className="px-4"
              color="var(--primary-an)"
            />
          </div>
        </Form>
      </Formik>
    </Modal>
  );
};
