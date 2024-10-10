document.getElementById('signup').addEventListener('click', function() {
    document.querySelector('.pinkbox').style.transform = 'translateX(80%)';
    document.querySelector('.signin').classList.add('nodisplay');
    document.querySelector('.signup').classList.remove('nodisplay');
  });
  
  document.getElementById('signin').addEventListener('click', function() {
    document.querySelector('.pinkbox').style.transform = 'translateX(0%)';
    document.querySelector('.signup').classList.add('nodisplay');
    document.querySelector('.signin').classList.remove('nodisplay');
  });

  $('#signup').click(function() {
    $('.pinkbox').addClass('enlarged'); // 클래스 추가로 크기와 위치 변환
    $('.signin').addClass('nodisplay');
    $('.signup').removeClass('nodisplay');
  });
  
  $('#signin').click(function() {
    $('.pinkbox').removeClass('enlarged'); // 클래스 제거로 원래 상태로 복귀
    $('.signup').addClass('nodisplay');
    $('.signin').removeClass('nodisplay');
  });
  
  