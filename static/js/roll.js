/**
 * Created by sjr on 2019/7/17.
 */

$(function () {
    /*消息滚动*/
    var $ul = $('.roll ul');
    var timeID;
    function roll() {
        clearInterval(timeID);
        timeID = setInterval(function () {
            clearInterval(timeID);
            $ul.animate({ top: "0px" }, 2500, function () {
                $ul.find("li:first").removeClass().addClass('roll_hide').appendTo($ul);
                /*$ul.find("li").eq(0).removeClass().addClass('roll_1')
                 $ul.find("li").eq(1).removeClass().addClass('roll_2')
                 $ul.find("li").eq(2).removeClass().addClass('roll_3')
                 $ul.find("li").eq(3).removeClass().addClass('roll_4')
                 $ul.find("li").eq(4).removeClass().addClass('roll_5')*/
                for(var i=0;i<5;i++){
                    $ul.find("li").eq(i).removeClass().addClass('roll_'+ (i+1) +'')
                }
                roll()
            })
        }, 1000);
    }
    roll()
})