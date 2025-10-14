import React from "react";
import { useState, useEffect } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
// 주소에 있는 경로 파라미터를 불러오는 훅(hook)
// posts/:postId -> postId 부분이 경로 파라미터
import { useParams } from "react-router-dom";
export default function PostDetail() {
  // 라우터 설정에서 설정한 파라미터명과 동일한 변수명을 사용
  const { postId } = useParams();
  const [posts, setPosts] = useState([]);
  useEffect(() => {
    console.log(postId);
    async function getPosts() {
      const response = await axios.get(`https://dummyjson.com/posts/${postId}`);
      console.log(response.data);

      setPosts(response.data);
    }
    getPosts();
  }, [postId]);
  return (
    <div>
      제목 - {posts.title}
      <br />
      내용 - {posts.body}
    </div>
  );
}
