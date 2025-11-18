import { Routes, Route, Navigate } from "react-router-dom";
import { NotFound } from "./components/layout/error/NotFound";
import { Forbidden } from "./components/layout/error/Forbidden";
import { ServerError } from "./components/layout/error/ServerError";
import { Shipment } from "./app/Shipments/pages/Shipment";

export default function AppRouter() {

  return (
    <Routes>
     
      <Route>
        <Route path="" element={<Shipment />} />
      </Route>

      {/* 🔹 Páginas de error */}
      <Route path="/NotFound" element={<NotFound />} />
      <Route path="/Forbidden" element={<Forbidden />} />
      <Route path="/ServerError" element={<ServerError />} />

      {/* 🔁 Fallback */}
      <Route path="*" element={<Navigate to="/NotFound" replace />} />
    </Routes>
  );
}
