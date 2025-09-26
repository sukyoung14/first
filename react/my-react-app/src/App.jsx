import React from "react";
import Interpolation from "./components/JSX/Interpolation";
import Header from "./components/Header";
import Footer from "./components/Footer";

import MyButton from "./components/Component/MyButton";
import MyList from "./components/Component/MyList";

export default function App() {
  return (
    <div>
      {/* <Header></Header> */}
      {/* <Interpolation></Interpolation> */}
      <MyList />
      <MyButton />
      {/* <Footer></Footer> */}
    </div>
  );
}
