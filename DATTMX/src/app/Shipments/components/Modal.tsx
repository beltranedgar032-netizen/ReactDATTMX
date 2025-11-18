export const Modal = ({ open, onClose, children }: any) => {
  if (!open) return null;

  return (
    <div className="fixed inset-0 z-50 bg-black/50 backdrop-blur-sm flex justify-center items-center">
      <div className="bg-white rounded-lg p-6 w-[90%] sm:w-[450px] relative text-[#143364]">

        <button
          className="absolute right-2 top-2 text-slate-500 hover:text-red-500"
          onClick={onClose}
        >
          ✕
        </button>

        {children}
      </div>
    </div>
  );
};
