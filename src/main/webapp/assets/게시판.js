/* 사이드바 열기 */
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";  /* 사이드바 너비 설정 */
  document.getElementById("memoir_table").style.marginLeft = "250px";  /* 본문을 250px 만큼 오른쪽으로 이동 */
}

/* 사이드바 닫기 */
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";  /* 사이드바를 숨김 */
  document.getElementById("memoir_table").style.marginLeft = "191.5px";  /* 본문을 원래 위치로 이동 */
}
