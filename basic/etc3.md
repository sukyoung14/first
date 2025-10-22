import { useState, useEffect, useCallback } from "react";
const BASE_URL = import.meta.env.VITE_SUPABASE_MEMO_URL;
const [memos, setMemos] = useState([]);
const getMemo = useCallback( async (userId, filterFlag = null) => {
      if (!userId) return;
      try {
        const url = `${BASE_URL}/rest/v1/tb_memo`;
        const params = {
          select: "*",
          order: "created_at.desc",
        };

        if (filterFlag !== null) {
          params.flag = `eq.${filterFlag}`;
        }

        const config = {
          method: "GET",
          url: url,
          headers: {
            apikey: ANON_KEY,
            "Content-Type": "application/json",
          },
          params: params,
        };

        const response = await axios(config);
        const data = response.data;
        console.log(data);
        setMemos(data);
      } catch (err) {
        alert("메모 목록을 불러오는데 실패했습니다.");
      }
    },
    [token]
  );
const handleMemoUpdated = useCallback(() => {
    if (currentUserId) {
      getMemo(currentUserId, null);
    }
  }, [currentUserId, getMemo, activeFilter]);
const handleMemoUpdated = useCallback(() => {
    if (currentUserId) {
      setActiveFilter(null);
      getMemo(currentUserId, null);
    }
  }, [currentUserId, getMemo, activeFilter]);
----------------------------------
{flagMemos.length === 0 ? (
        <p>메모가 없습니다.</p>
      ) : (
        flagMemos.map((memo) => {
          return (
            <MemoList
              key={memo.id}
              memo={memo}
              onDelete={handleDeleteMemo}
              onMemoUpdated={handleMemoUpdated}
            />
          );
        })
      )}
----------------------------------
export default function MemoList({ memo, onDelete, onMemoUpdated }) {}
function handelClick() {
    if (confirm(`${memo.flag ? "미완료" : "완료"}로 변경하시겠습니까?`)) {
      postMemo(memo.flag ? false : true);
    }
  }
 async function postMemo(memoFlag) {
    try {
      const url = `${BASE_URL}/rest/v1/tb_memo?id=eq.${memo.id}`;
      const config = {
        method: "PATCH",
        url: url,
        headers: {
          apikey: ANON_KEY,
          "Content-Type": "application/json",
        },
        data: {
          id: memo.id,
          flag: memoFlag,
        },
      };
      const response = await axios(config);
      const data = response.data;
      setflag(memo.flag ? false : true);
      if (onMemoUpdated) {
        onMemoUpdated();
      }
    } catch (err) {
      alert("변경에 실패했습니다.");
    }
  }
  async function DelMemo() {
    try {
      const url = `${BASE_URL}/rest/v1/tb_memo?id=eq.${memo.id}`;
      const config = {
        method: "DELETE",
        url: url,
        headers: {
          apikey: ANON_KEY,
          "Content-Type": "application/json",
        },
        data: {
          id: memo.id,
        },
      };
      const response = await axios(config);
      const data = response.data;
      console.log("Memo Delete successfully.");
      if (onDelete) {
        onDelete(memo.id); // 부모 컴포넌트에 삭제된 메모의 ID 전달
      }
    } catch (err) {
      console.error("DeleteMemo error:", err);
      alert("메모 삭제가 실패했습니다.");
    }
  }
  ----------------------------------