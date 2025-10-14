import React from "react";
import { useState, useEffect } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import { useSearchParams } from "react-router-dom";
export default function PostList() {
  const [posts, setPosts] = useState([]);
  // searchParams : 쿼리 파라미터 값을 가진 객체
  // setSearchParams : 쿼리 파라미터 값을 변경하는 함수
  const [searchParams, setSearchParams] = useSearchParams([]);
  // useEffect 의존성 배열의 역할 - 콜백함수가 언제 실행할 것이냐를 결정
  // 의존성 배열이 빈 배열이면 컴포넌트가 첫 랜더링될 때 콜백함수 실행
  // 의존성 배열에 데이터가 있으면 해당 데이터가 변경될때 콜백 함수 실행
  useEffect(() => {
    // 쿼리 파라미터에서 key가 order인 값 불러오기
    const order = searchParams.get("order") ?? "asc"; //Nullish 연산자를 통해 기본값을 지정
    const sortBy = searchParams.get("sortBy") ?? "id";
    // console.log(order);
    async function getPosts() {
      console.log(order);
      const response = await axios.get(
        `https://dummyjson.com/posts?sortBy=${sortBy}&order=${order}`
      );
      setPosts(response.data.posts);
    }
    getPosts();
  }, [searchParams]);
  return (
    <div>
      <div className="fles gap-2">
        <button
          className="border-2 p-2 cursor-pointer"
          onClick={() => {
            setSearchParams({ sortBy: "id", order: "asc" });
          }}
        >
          ID 오름차순
        </button>
        <button
          className="border-2 p-2 cursor-pointer"
          onClick={() => {
            setSearchParams({ sortBy: "id", order: "desc" });
          }}
        >
          ID 내림차순
        </button>
      </div>
      {posts.map((post) => {
        return (
          <Link key={post.id} to={`/posts/${post.id}`}>
            No.{post.id} - {post.title} <br />
          </Link>
        );
      })}
    </div>
  );
}
