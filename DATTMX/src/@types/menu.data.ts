// src/menu/menu.data.ts
import type { MenuItemDto } from "./menu.types";

export const MENU_TREE: MenuItemDto[] = [
  {
    iIdMenuItem: 1,
    sTitle: "Administration",
    iOrder: 1,
    iLevelId: 1,
    bIsActive: true,
    sIcon: "shield",
    screen: null,
    children: [
      {
        iIdMenuItem: 10,
        sTitle: "Users",
        iOrder: 1,
        iLevelId: 2,
        bIsActive: true,
        sIcon: "user",
        screen: { iIdScreen: 101, sScreenName: "Users", sScreenPath: "/admin/users" },
        children: []
      },
      {
        iIdMenuItem: 11,
        sTitle: "Roles",
        iOrder: 2,
        iLevelId: 2,
        bIsActive: true,
        sIcon: "badge",
        screen: { iIdScreen: 102, sScreenName: "Roles", sScreenPath: "/admin/roles" },
        children: []
      }
    ]
  },
  {
    iIdMenuItem: 2,
    sTitle: "Cashier",
    iOrder: 2,
    iLevelId: 1,
    bIsActive: true,
    sIcon: "wallet",
    screen: null,
    children: [
      {
        iIdMenuItem: 20,
        sTitle: "Daily Cash",
        iOrder: 1,
        iLevelId: 2,
        bIsActive: true,
        sIcon: "coins",
        screen: { iIdScreen: 201, sScreenName: "Daily Cash", sScreenPath: "/cashier/daily" },
        children: []
      }
    ]
  },
  {
    iIdMenuItem: 3,
    sTitle: "Logistics",
    iOrder: 3,
    iLevelId: 1,
    bIsActive: true,
    sIcon: "truck",
    screen: null,
    children: [
      {
        iIdMenuItem: 30,
        sTitle: "Deliveries",
        iOrder: 1,
        iLevelId: 2,
        bIsActive: true,
        sIcon: "map",
        screen: { iIdScreen: 301, sScreenName: "Deliveries", sScreenPath: "/logistics/deliveries" },
        children: []
      },
      {
        iIdMenuItem: 31,
        sTitle: "Routes",
        iOrder: 2,
        iLevelId: 2,
        bIsActive: true,
        sIcon: "map",
        screen: { iIdScreen: 302, sScreenName: "Routes", sScreenPath: "/logistics/routes" },
        children: []
      }
    ]
  },
  {
    iIdMenuItem: 4,
    sTitle: "Warehouse",
    iOrder: 4,
    iLevelId: 1,
    bIsActive: true,
    sIcon: "boxes",
    screen: null,
    children: [
      {
        iIdMenuItem: 40,
        sTitle: "Stock by Bin",
        iOrder: 1,
        iLevelId: 2,
        bIsActive: true,
        sIcon: "boxes",
        screen: { iIdScreen: 401, sScreenName: "Stock by Bin", sScreenPath: "/warehouse/stock-bins" },
        children: []
      },
      {
        iIdMenuItem: 41,
        sTitle: "Catalogs",
        iOrder: 99,
        iLevelId: 2,
        bIsActive: true,
        sIcon: "folder",
        screen: null,
        children: [
          {
            iIdMenuItem: 42,
            sTitle: "Bins",
            iOrder: 1,
            iLevelId: 3,
            bIsActive: true,
            sIcon: "grid",
            screen: { iIdScreen: 402, sScreenName: "Bins", sScreenPath: "/warehouse/catalogs/bins" },
            children: []
          },
          {
            iIdMenuItem: 43,
            sTitle: "Locations",
            iOrder: 2,
            iLevelId: 3,
            bIsActive: true,
            sIcon: "pin",
            screen: { iIdScreen: 403, sScreenName: "Locations", sScreenPath: "/warehouse/catalogs/locations" },
            children: []
          }
        ]
      }
    ]
  }
];
