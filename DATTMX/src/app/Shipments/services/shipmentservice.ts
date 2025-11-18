import axios from "axios";

const BASE_URL = "https://localhost:44329/api/Shipment";

export const getShipments = async (params: {
  iIdShipment?: number | null;
  sGuideNumber?: string | null;
  iIdCustomer?: number | null;
  iIdStatus?: number | null;
}) => {
  const response = await axios.get(`${BASE_URL}/GetShipments`, { params });
  return response.data;
};

export const getShipmentDetail = async (iIdShipment: number) => {
  const response = await axios.get(`${BASE_URL}/GetShipmentsById`, {
    params: { iIdShipment }
  });

  return Array.isArray(response.data) ? response.data[0] : response.data;
};

export const updateShipmentStatus = async (iIdShipment: number, iIdStatus: number) => {
  const payload = { iIdShipment, iIdStatus };
  const response = await axios.put(`${BASE_URL}/UpdateStatus`, payload);
  return response.data;
};


export const createShipment = async (data: any) => {
  const response = await axios.post(`${BASE_URL}/Register`, data);
  return response.data;
};

