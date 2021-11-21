$(document).ready(function(e) {
   
	// 사이드 윙 스크립트
    var default_h = $(".header").height() + $(".carry_image").height() - 50;

    $(window).scroll(function(){
        var scroll_Top = $(this).scrollTop();
        
        var bottom_Top = $('.footer').offset().top - 900;
        

        //main
        if (scroll_Top > default_h){
            $(".right_banner").stop().animate({"top":scroll_Top-default_h-80},600);
            
            if(scroll_Top >= bottom_Top) {
              $(".right_banner").stop().animate({"top":bottom_Top-default_h},600);
           }
        } else { 
            $(".right_banner").stop().animate({"top":0},600);
        } 
    });

    

}); //ready fnc
