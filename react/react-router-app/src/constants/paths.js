// 경로 문자열을 관리 상수 객체
const PATHS = {
  ROOT: {
    // Root Layout의 기본(진입) 경로
    INDEX: "/",
    ABOUT: "/about",
    POSTS: "/posts",
    // 경로 파라미터의 라우터 설정 속성
    // 라우터 설정에서 사용할 경로파라미터 주소(경로)
    POST_DETAIL: "/posts/:postId",
    // 경로 파라미터를 처리한 메서드(함수)
    // 외부에서 postId를 전달 받아서
    // 동적으로 경로 파라미터를 적용한 주소 생성
    // 컴포넌트에서 사용할 경로 파라미터 주소 생성 메서드
    getPostDetail: (postId) => `/posts/${postId}`,
    PROFILE: "/profile",
  },
  AUTH: {
    INDEX: "/auth",
    LOGIN: "/auth/login",
    SIGNUP: "/auth/signup",
  },
};

export default PATHS;
