import { Modal } from "../components/Modal";

export const ModalShipmentDetail = ({ open, onClose, detail }: any) => {

  if (!open || !detail) return null;

  return (
  <Modal open={open} onClose={onClose}>
  <div className="text-[#143364] !text-[#143364] [&_*]:!text-[#143364]">
    
    <h2 className="text-xl font-bold mb-4">Detalle del envío</h2>

    <div className="space-y-2 text-sm font-medium leading-5">
      <p><b>Guía:</b> {detail.sGuideNumber}</p>
      <p><b>Cliente:</b> {detail.sCustomerName}</p>
      <p><b>Peso:</b> {detail.fWeight} kg</p>
      <p><b>Costo:</b> ${detail.fCost}</p>
      <p><b>Estatus:</b> {detail.sStatus}</p>

      <div>
        <p className="font-bold">Origen:</p>
        <p className="pl-2">{detail.shippingOriginAddress}</p>
      </div>

      <div>
        <p className="font-bold">Destino:</p>
        <p className="pl-2">{detail.shippingDestinationAddress}</p>
      </div>
    </div>

  </div>
</Modal>

  );
};
