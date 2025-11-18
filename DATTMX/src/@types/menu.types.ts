// src/menu/menu.types.ts
export type ScreenDto = {
  iIdScreen: number;
  sScreenName: string;
  sScreenPath: string; // e.g. "/warehouse/stock-bins"
};

export type MenuItemDto = {
  iIdMenuItem: number;
  sTitle: string;
  iOrder: number;
  iLevelId: number;
  bIsActive: boolean;
  sIcon?: string | null;
  screen: ScreenDto | null;     // null = contenedor (tiene children y no navega)
  children: MenuItemDto[];      // recursivo
};
