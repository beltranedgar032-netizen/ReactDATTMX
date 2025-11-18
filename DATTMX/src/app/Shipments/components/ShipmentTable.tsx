export const ShipmentTable = ({
  data,
  loading,
  currentPage,
  totalPages,
  onPageChange,
  onDetailClick,
  onStatusClick
}: any) => {
  if (loading) return <p className="text-white mt-6">Cargando...</p>;

  if (data.length === 0)
    return <p className="text-white mt-6">Sin resultados.</p>;

  return (
    <div className="w-full bg-white/10 backdrop-blur-md p-4 rounded-lg text-white mt-4">
      <table className="w-full text-left border-collapse">
        <thead>
          <tr className="bg-white/20">
            <th className="p-2">ID</th>
            <th className="p-2">Guía</th>
            <th className="p-2">Cliente</th>
            <th className="p-2">Estatus</th>
            <th className="p-2 text-center">Acciones</th>
          </tr>
        </thead>

        <tbody>
          {data.map((item: any) => (
            <tr key={item.iIdShipment} className="border-b border-white/10 hover:bg-white/20">
              <td className="p-2">{item.iIdShipment}</td>
              <td className="p-2">{item.sGuideNumber}</td>
              <td className="p-2">{item.sCustomerName}</td>
              <td className="p-2">{item.sStatus}</td>
              <td className="p-2 text-center space-x-2">

                <button
                  className="px-3 py-1 bg-blue-600 hover:bg-blue-700 rounded text-sm"
                  onClick={() => onDetailClick(item.iIdShipment)}
                >
                  Detalle
                </button>

                <button
                  className="px-3 py-1 bg-yellow-500 hover:bg-yellow-600 rounded text-sm"
                  onClick={() => onStatusClick(item.iIdShipment, item.iIdStatus)}
                >
                  Estatus
                </button>

              </td>
            </tr>
          ))}
        </tbody>
      </table>

      {/* PAGINACIÓN */}
      <div className="flex justify-center gap-3 mt-4">
        <button
          disabled={currentPage === 1}
          onClick={() => onPageChange(currentPage - 1)}
          className="px-3 py-1 bg-white/20 rounded disabled:opacity-30"
        >
          Prev
        </button>

        <span className="px-3 py-1 bg-white/20 rounded">
          {currentPage} / {totalPages}
        </span>

        <button
          disabled={currentPage === totalPages}
          onClick={() => onPageChange(currentPage + 1)}
          className="px-3 py-1 bg-white/20 rounded disabled:opacity-30"
        >
          Next
        </button>
      </div>
    </div>
  );
};
