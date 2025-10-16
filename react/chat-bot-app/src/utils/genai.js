import { GoogleGenAI } from "@google/genai";
const GEMINI_API_KEY = import.meta.env.VITE_GEMINI_API_KEY;
// AI 객체 생성
const ai = new GoogleGenAI({ apiKey: GEMINI_API_KEY });
// AI chat 객체 생성
const chat = ai.chats.create({
  model: "gemini-2.5-flash",
});
// 응답 스키마
const responseSchema = {
  type: "object",
  properties: {
    isMemo: {
      type: "boolean",
      description: "할 일, 메모, 업무, 계획 등 관련 여부",
    },
    content: {
      type: "string",
      description: "할 일 내용(본문)",
    },
    dueDate: {
      type: "string",
      description: "할 일 마감 기한(YYYY-MM-DD)",
    },
  },
  required: ["isMemo", "content", "dueDate"],
  additionalProperties: false,
};

const systemInstruction = [
  `오늘 날짜: ${new Date().toISOString().split("T")[0]}`,
  "당신은 할 일 관리 AI입니다. 오직 할 일이나 업무 관련 내용만 처리합니다.",
  "JSON 형식으로 응답합니다.",
  "할 일이 아닌 일반적인 대화, 인사, 질문은 무시하고, isMemo를 false로 설정합니다.",
  "사용자의 질문을 이해할 수 없는 경우에는 isMemo를 false로 설정합니다.",
  "응답할 때는 할 일 내용, 마감 날짜, 우선 순위, 할 일 종류를 포함한 객체를 생성합니다.",
];

const config = {
  responseMimeType: "application/json", // 응답 형식(확장자)
  responseJsonSchema: responseSchema, // 응답 JSON 구조
  systemInstruction: systemInstruction, //
};
// 응답 파라미터 설정
// const config = {
//   temperature: 0, // 창의성 수준 (0~1)
//   stopSequences: ["\\n\\n"], // 중단 문자열 : "\\n\\n"
//   maxOutputTokens: 1000, // 응답 최대 토큰 수 : 8192?
//   systemInstruction: [
//     "당신은 전문 할 일 관리 분석가입니다.",
//     "업무, 할일, 메모와 관련된 질문만 답변합니다.",
//     "그 외 질문에는 '할일과 관련 없습니다.'라고 답변합니다.",
//   ],
// };
export { ai, chat, config };
