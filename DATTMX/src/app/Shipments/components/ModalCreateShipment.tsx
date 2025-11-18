import { useEffect, useState } from "react";
import { Modal } from "../components/Modal";
import { Formik, Form } from "formik";
import * as Yup from "yup";
import { FormikTextInput } from "@/components/form/TextInput";
import { FormikSelectInput } from "@/components/form/Select";
import { FormikButton } from "@/components/form/Button";
import { useShipmentCatalogs } from "../hooks/useShipmentCatalogs";

interface Props {
  open: boolean;
  onClose: () => void;
  onSubmit: (data: any) => void;
}

export const ModalCreateShipment = ({ open, onClose, onSubmit }: Props) => {

  const { getCatalog } = useShipmentCatalogs();

  // Catalog options
  const [customerOptions, setCustomerOptions] = useState<any[]>([]);
  const [statusOptions, setStatusOptions] = useState<any[]>([]);
  
  // Cascading catalog options (Origen)
  const [originStates, setOriginStates] = useState<any[]>([]);
  const [originMunicipalities, setOriginMunicipalities] = useState<any[]>([]);
  const [originZipCodes, setOriginZipCodes] = useState<any[]>([]);
  const [originColonies, setOriginColonies] = useState<any[]>([]);

  // Cascading catalog options (Destino)
  const [destStates, setDestStates] = useState<any[]>([]);
  const [destMunicipalities, setDestMunicipalities] = useState<any[]>([]);
  const [destZipCodes, setDestZipCodes] = useState<any[]>([]);
  const [destColonies, setDestColonies] = useState<any[]>([]);

  useEffect(() => {
    if (open) loadInitial();
  }, [open]);

  const loadInitial = async () => {
    setCustomerOptions(await getCatalog("Customer", null));
    setStatusOptions(await getCatalog("Shipmentstatus", 1));
    setOriginStates(await getCatalog("States", null));
    setDestStates(await getCatalog("States", null));
  };

  // Load cascading lists
  const loadOriginMunicipalities = async (stateId: number) => {
    setOriginMunicipalities(await getCatalog("MunicipalitiesByStates", stateId));
  };

  const loadOriginZipCodes = async (municipalityId: number) => {
    setOriginZipCodes(await getCatalog("ZipCodesByMunicipalities", municipalityId));
  };

  const loadOriginColonies = async (zipCodeId: number) => {
    setOriginColonies(await getCatalog("ColoniesByZipCodes", zipCodeId));
  };

  const loadDestMunicipalities = async (stateId: number) => {
    setDestMunicipalities(await getCatalog("MunicipalitiesByStates", stateId));
  };

  const loadDestZipCodes = async (municipalityId: number) => {
    setDestZipCodes(await getCatalog("ZipCodesByMunicipalities", municipalityId));
  };

  const loadDestColonies = async (zipCodeId: number) => {
    setDestColonies(await getCatalog("ColoniesByZipCodes", zipCodeId));
  };

  const initialValues = {
    iIdCustomer: "",
    fWeight: "",
    fCost: "",
    iIdStatus: "",

    origin: {
      iIdState: "",
      iIdMunicipality: "",
      iIdZipCode: "",
      iIdColony: "",
      sStreet: "",
      sExteriorNumber: "",
      sInteriorNumber: "",
      sReference: ""
    },

    dest: {
      iIdState: "",
      iIdMunicipality: "",
      iIdZipCode: "",
      iIdColony: "",
      sStreet: "",
      sExteriorNumber: "",
      sInteriorNumber: "",
      sReference: ""
    }
  };

  const validationSchema = Yup.object({
    iIdCustomer: Yup.string().required("Seleccione un cliente"),
    fWeight: Yup.number().min(0.1).required(),
    fCost: Yup.number().min(1).required(),
    iIdStatus: Yup.string().required("Seleccione un estatus"),

    origin: Yup.object({
      iIdColony: Yup.string().required("Seleccione colonia"),
      sStreet: Yup.string().required(),
      sExteriorNumber: Yup.string().required()
    }),

    dest: Yup.object({
      iIdColony: Yup.string().required("Seleccione colonia"),
      sStreet: Yup.string().required(),
      sExteriorNumber: Yup.string().required()
    })
  });

  const handleSubmit = (values: any) => {

    const payload = {
      iIdShipment: 0,
      iIdCustomer: Number(values.iIdCustomer),
      fWeight: Number(values.fWeight),
      fCost: Number(values.fCost),
      iIdStatus: Number(values.iIdStatus),
      bActive: true,
      bDelete: false,
      addresses: [
        {
          iIdShipmentAddress: 0,
          iIdShipment: 0,
          bIsOrigin: true,
          iIdColony: Number(values.origin.iIdColony),
          sStreet: values.origin.sStreet,
          sExteriorNumber: values.origin.sExteriorNumber,
          sInteriorNumber: values.origin.sInteriorNumber,
          sReference: values.origin.sReference,
          bActive: true,
          bDelete: false
        },
        {
          iIdShipmentAddress: 0,
          iIdShipment: 0,
          bIsOrigin: false,
          iIdColony: Number(values.dest.iIdColony),
          sStreet: values.dest.sStreet,
          sExteriorNumber: values.dest.sExteriorNumber,
          sInteriorNumber: values.dest.sInteriorNumber,
          sReference: values.dest.sReference,
          bActive: true,
          bDelete: false
        }
      ]
    };

    onSubmit(payload);
    onClose();
  };

  return (
    <Modal open={open} onClose={onClose}>
      <h2 className="text-xl font-bold text-[#143364] mb-4">Registrar envío</h2>

      <Formik initialValues={initialValues} validationSchema={validationSchema} onSubmit={handleSubmit}>

        <Form className="space-y-4 max-h-[75vh] overflow-y-auto pr-2">

          {/* Basic Fields */}
          <FormikSelectInput name="iIdCustomer" label="Cliente" options={customerOptions} required size="full" />
          <FormikTextInput name="fWeight" type="number" label="Peso (Kg)" required size="full" />
          <FormikTextInput name="fCost" type="number" label="Costo ($)" required size="full" />
          <FormikSelectInput name="iIdStatus" label="Estatus" options={statusOptions} size="full" required />

          {/* ORIGIN */}
          <h3 className="text-xl font-bold !text-[#143364] mb-4">Dirección Origen</h3>

          <FormikSelectInput name="origin.iIdState" label="Estado" options={originStates} onChange={(opt) => loadOriginMunicipalities(opt?.value)} />
          <FormikSelectInput name="origin.iIdMunicipality" label="Municipio" options={originMunicipalities} onChange={(opt) => loadOriginZipCodes(opt?.value)} />
          <FormikSelectInput name="origin.iIdZipCode" label="Código Postal" options={originZipCodes} onChange={(opt) => loadOriginColonies(opt?.value)} />
          <FormikSelectInput name="origin.iIdColony" label="Colonia" options={originColonies} required />
          <FormikTextInput name="origin.sStreet" label="Calle" required />
          <FormikTextInput name="origin.sExteriorNumber" label="Número Exterior" required />
          <FormikTextInput name="origin.sInteriorNumber" label="Número Interior" />
          <FormikTextInput name="origin.sReference" label="Referencia" />

          {/* DESTINATION */}
          <h3 className="text-xl font-bold !text-[#143364] mb-4">Dirección Destino</h3>

          <FormikSelectInput name="dest.iIdState" label="Estado" options={destStates} onChange={(opt) => loadDestMunicipalities(opt?.value)} />
          <FormikSelectInput name="dest.iIdMunicipality" label="Municipio" options={destMunicipalities} onChange={(opt) => loadDestZipCodes(opt?.value)} />
          <FormikSelectInput name="dest.iIdZipCode" label="Código Postal" options={destZipCodes} onChange={(opt) => loadDestColonies(opt?.value)} />
          <FormikSelectInput name="dest.iIdColony" label="Colonia" options={destColonies} required />
          <FormikTextInput name="dest.sStreet" label="Calle" required />
          <FormikTextInput name="dest.sExteriorNumber" label="Número Exterior" required />
          <FormikTextInput name="dest.sInteriorNumber" label="Número Interior" />
          <FormikTextInput name="dest.sReference" label="Referencia" />

          <div className="flex justify-end gap-3 pt-2">
            <button type="button" onClick={onClose} className="px-4 py-2 bg-gray-400 text-white rounded-md">Cancelar</button>
            <FormikButton label="Guardar" color="var(--primary-an)" size="md" />
          </div>
        </Form>
      </Formik>
    </Modal>
  );
};
