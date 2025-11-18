import { useState } from "react";
import { getShipments } from "../services/shipmentservice";

export const useShipments = () => {
  const [shipments, setShipments] = useState<any[]>([]);
  const [loading, setLoading] = useState(false);

  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 10;

  const fetchShipments = async (filters: any) => {
    try {
      setLoading(true);
      const data = await getShipments(filters);
      setShipments(data);
      setCurrentPage(1);
    } catch (error) {
      console.error("Error fetching shipments:", error);
    } finally {
      setLoading(false);
    }
  };

  const totalPages = Math.ceil(shipments.length / pageSize);

  const paginatedData = shipments.slice(
    (currentPage - 1) * pageSize,
    currentPage * pageSize
  );

  return {
    shipments: paginatedData,
    loading,
    fetchShipments,
    currentPage,
    setCurrentPage,
    totalPages
  };
};
