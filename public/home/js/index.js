//鼠标滚动导航栏隐藏
$(function () {
  $(window).scroll(function () {
    if($(window).scrollTop() >120){
      $(".nav").addClass('fixed');
    }else {
      $(".nav").removeClass('fixed');
    }
  })
})

//回到顶部
$(function(){
  $('.return_top').on('click',function(){
    $('html,body').animate({scrollTop:0},800);
  })
});

//轮播插件调用
jQuery(".slideBox").slide({
  titCell : ".hd ul",
  mainCell : ".bd ul",
  effect : "leftLoop",
  //effect : "fade",
  vis : "auto",
  scroll : 1,
  interTime:4000,
  autoPlay : true,
  autoPage : true
});

//跳转入户条件
function clickCondition() {
  var scroll_offset = $(".condition").offset();
  $("body,html").animate({
    scrollTop:scroll_offset.top
  },1000);
}

//跳转测试
function clickest() {
  var scroll_offset = $(".test").offset();
  $("body,html").animate({
    scrollTop:scroll_offset.top
  },1000);
}


