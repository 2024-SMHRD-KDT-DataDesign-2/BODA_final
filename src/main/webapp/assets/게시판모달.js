// openModal 함수: memoir 정보를 모달에 표시
  function openModal(memoir_idx, memoir_name, memoir_info, memoir_info1, memoir_info2, memoir_date) {
    // 각 값들을 모달의 입력 필드에 할당
	document.getElementById('memoirIdx').value = memoir_idx;
    document.getElementById('memoirName').value = memoir_name;
    document.getElementById('memoirInfo').value = memoir_info;
    document.getElementById('memoirInfo1').value = memoir_info1;
    document.getElementById('memoirInfo2').value = memoir_info2;
    // 모달 창 띄우기
    document.getElementById('modal').style.display = 'block';
  }

  // closeModal 함수: 모달 창 닫기
  function closeModal() {
    document.getElementById('modal').style.display = 'none';
  }