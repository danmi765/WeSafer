/* 주메뉴 슬라이드 이벤트 처리 */
$("#header").hover(function(){
    $(this).stop().animate({"top":"0"},300);
     $(".headerIcon").css({"display":"none"});
},function(){
    $(this).stop().animate({"top":"-120px"},300);
    $(".headerIcon").css({"display":"inline-block"});
});

/* 메인페이지 버튼이미지 마우스오버 이벤트처리 */


$(".bb1b,.bb3b, .bb6b, .bb5b").hide();

$(".bb1a").on("mouseover focusin", function(){
    $(this).parent().siblings().children().stop().fadeIn(300);
});

$(".bb1b").on("mouseleave focusout", function(){
    $(this).stop().fadeOut(300);
});

$(".bb3a").on("mouseover focusin", function(){
    $(this).parent().siblings().children().stop().fadeIn(300);
});

$(".bb3b").on("mouseleave focusout", function(){
    $(this).stop().fadeOut(300);
});


$(".bb6a").on("mouseover focusin", function(){
    $(this).parent().siblings().children().stop().fadeIn(300);
});

$(".bb6b").on("mouseleave focusout", function(){
    $(this).stop().fadeOut(300);
});

$(".bb5a").on("mouseover focusin", function(){
    $(this).parent().siblings().children().stop().fadeIn(300);
});

$(".bb5b").on("mouseleave focusout", function(){
    $(this).stop().fadeOut(300);
});