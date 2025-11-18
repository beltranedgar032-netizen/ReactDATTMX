import axios from "axios";

export const useShipmentCatalogs = () => {


  const getCatalog = async (sCode: string, iId: number | null = null) => {
    const url = `https://localhost:44329/GeneralList/GetCustomer?sCode=${sCode}&iId=${iId ?? ""}`;
    const { data } = await axios.get(url);

    return data.map((item: any) => ({
      value: item.label,
      label: item.value,
      idExtra: item.idExtra
    }));
  };



  return {
    getCatalog
  };
};
