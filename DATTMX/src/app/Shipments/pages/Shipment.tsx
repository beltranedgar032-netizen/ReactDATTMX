import { useState } from "react";
import { Filters } from "../components/filters";
import { ShipmentTable } from "../components/ShipmentTable";
import { ModalShipmentDetail } from "../components/ModalShipmentDetail";
import { ModalChangeStatus } from "../components/ModalChangeStatus";
import { ModalCreateShipment } from "../components/ModalCreateShipment"; // <-- IMPORTANTE
import { useShipments } from "../hooks/useShipments";
import { getShipmentDetail, updateShipmentStatus, createShipment } from "../services/shipmentservice";

export const Shipment = () => {
  const { shipments, loading, fetchShipments, currentPage, setCurrentPage, totalPages } = useShipments();

  const [detailModal, setDetailModal] = useState(false);
  const [statusModal, setStatusModal] = useState(false);
  const [createModal, setCreateModal] = useState(false);

  const [shipmentDetail, setShipmentDetail] = useState<any | null>(null);
  const [activeShipmentId, setActiveShipmentId] = useState<number | null>(null);
  const [currentStatusId, setCurrentStatusId] = useState<number | null>(null);

  // === FILTROS ===
  const handleFilters = (values: any) => {
    fetchShipments({
      iIdShipment: null,
      sGuideNumber: values.sGuide,
      iIdCustomer: null,
      iIdStatus: values.iIdStatus
    });
  };

  // === ABRIR DETALLE ===
  const openDetail = async (id: number) => {
    setActiveShipmentId(id);
    const detail = await getShipmentDetail(id);
    setShipmentDetail(detail);
    setDetailModal(true);
  };

  // === ABRIR MODAL DE ESTATUS ===
  const openStatusModal = (id: number, statusId: number) => {
    setActiveShipmentId(id);
    setCurrentStatusId(statusId);
    setStatusModal(true);
  };

  // === SUBMIT CAMBIO DE ESTATUS ===
  const handleStatusChange = async (newStatusId: number) => {
    await updateShipmentStatus(activeShipmentId!, newStatusId);
    setStatusModal(false);
    fetchShipments({});
  };

  // === CREAR NUEVO ENVÍO ===
  const handleCreate = async (payload: any) => {
    await createShipment(payload);
    setCreateModal(false);
    fetchShipments({});
  };

  return (
    <div className="p-6 w-full text-white">

      {/* BOTÓN CREAR */}
      <div className="flex justify-end mb-4">
        <button
          className="px-4 py-2 bg-green-600 hover:bg-green-700 rounded font-medium"
          onClick={() => setCreateModal(true)}
        >
          + Crear Envío
        </button>
      </div>

      <Filters onSubmit={handleFilters} />

      <ShipmentTable
        data={shipments}
        loading={loading}
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={setCurrentPage}
        onDetailClick={openDetail}
        onStatusClick={openStatusModal}
      />

      {/* MODAL DETALLE */}
      <ModalShipmentDetail
        open={detailModal}
        onClose={() => setDetailModal(false)}
        detail={shipmentDetail}
      />

      {/* MODAL CAMBIAR ESTATUS */}
      <ModalChangeStatus
        open={statusModal}
        onClose={() => setStatusModal(false)}
        currentStatusId={currentStatusId}
        onSubmit={handleStatusChange}
      />

      {/* MODAL CREAR ENVÍO */}
      <ModalCreateShipment
        open={createModal}
        onClose={() => setCreateModal(false)}
        onSubmit={handleCreate}
      />
    </div>
  );
};
