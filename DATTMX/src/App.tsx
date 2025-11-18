// src/App.tsx
import AppRouter from "./router";
import BackgroundOrbs from "./components/layout/menu/BackgroundOrbs";


function App() {
  return (
    <>
      <BackgroundOrbs count={18} />
      <AppRouter />
    </>
  );
}

export default App;
