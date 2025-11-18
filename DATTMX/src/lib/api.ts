// src/lib/api.ts
export type AccessTokenProvider = () => string | null;
export type RefreshHandler = () => Promise<boolean>; // true si refrescó bien

let _getToken: AccessTokenProvider = () => null;
let _onRefresh: RefreshHandler | null = null;

export function setAccessTokenProvider(fn: AccessTokenProvider) {
  _getToken = fn;
}
export function setRefreshHandler(fn: RefreshHandler) {
  _onRefresh = fn;
}

const BASE_URL =
  import.meta.env.VITE_API_URL?.replace(/\/$/, "") || "";

export interface ApiOptions extends RequestInit {
  parseJson?: boolean; // soporta endpoints 204/no-JSON
}

export async function api(path: string, opts: ApiOptions = {}) {
  const { parseJson = true, headers, ...rest } = opts;
  const token = _getToken();

  const res = await fetch(`${BASE_URL}${path}`, {
    credentials: "include", // envía cookies (refresh HttpOnly)
    headers: {
      "Content-Type": "application/json",
      ...(token ? { Authorization: `Bearer ${token}` } : {}),
      ...(headers || {}),
    },
    ...rest,
  });

  // Reintento único si 401
  if (res.status === 401 && _onRefresh) {
    const ok = await _onRefresh();
    if (ok) {
      const retry = await fetch(`${BASE_URL}${path}`, {
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
          ...(_getToken() ? { Authorization: `Bearer ${_getToken()}` } : {}),
          ...(headers || {}),
        },
        ...rest,
      });
      if (!retry.ok) throw await toApiError(retry);
      return parseJson ? retry.json() : retry;
    }
  }

  if (!res.ok) throw await toApiError(res);
  return parseJson ? res.json() : res;
}

async function toApiError(res: Response) {
  let detail: any = undefined;
  try { detail = await res.json(); } catch {}
  const err = new Error(`HTTP ${res.status}`) as Error & { status?: number; detail?: any };
  err.status = res.status;
  err.detail = detail;
  return err;
}
