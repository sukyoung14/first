import React from "react";
import { Navigate } from "react-router-dom";
import { useSelector } from "react-redux";
import { Outlet } from "react-router-dom";

export default function AuthLayout() {
  const token = useSelector((state) => state.auth.token);
  console.log("AuthLayout : ", token);
  if (token) return <Navigate to="/profile" replace></Navigate>;
  else return <Outlet></Outlet>;
}
