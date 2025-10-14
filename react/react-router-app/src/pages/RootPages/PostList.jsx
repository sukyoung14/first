import React from "react";
import { useState, useEffect } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
export default function PostList() {
  const [posts, setPosts] = useState([]);
  useEffect(() => {
    async function getPosts() {
      const response = await axios.get("https://dummyjson.com/posts");
      setPosts(response.data.posts);
    }
    getPosts();
  }, []);
  return (
    <div>
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
