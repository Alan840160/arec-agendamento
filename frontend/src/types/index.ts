// Tipos para a aplicação

export interface User {
  id: string;
  name: string;
  email: string;
  role: 'user' | 'admin';
  createdAt: string;
}

export interface Resource {
  id: string;
  name: string;
  description: string;
  capacity?: number;
  createdAt: string;
}

export interface Reservation {
  id: string;
  userId: string;
  resourceId: string;
  startDate: string;
  endDate: string;
  status: 'pending' | 'approved' | 'rejected' | 'cancelled';
  createdAt: string;
}

export interface AuthResponse {
  token: string;
  user: User;
}
