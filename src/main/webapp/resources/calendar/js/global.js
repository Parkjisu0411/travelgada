(function ($) {
    'use strict';
    /*==================================================================
        [ Daterangepicker ]*/
    // 다이어리의 날짜를 YYYY-MM-DD 로 format을 해줌
    // 달력이 옆에 눌러도 나오도록 할 것
    
    try {
    
        $('.input-start').daterangepicker({
            ranges: true,
            autoApply: true,
            applyButtonClasses: false,
            autoUpdateInput: false
        },function (start, end) {
        
            var startDay = start.format('YYYY-MM-DD');
            var endDay = end.format('YYYY-MM-DD');
    
            $('.input-start').val(startDay.replace(/\//g, ' '));
            $('.input-end').val(endDay.replace(/\//g, ' '));
        });
    
        $('#input-start-2').daterangepicker({
            ranges: true,
            autoApply: true,
            applyButtonClasses: false,
            autoUpdateInput: false
        },function (start, end) {
            $('#input-start-2').val(start.format('YYYY-MM-DD'));
            $('#input-end-2').val(end.format('YYYY-MM-DD'));
        });
    
    } catch(er) {console.log(er);}
    /*==================================================================
        [ Single Datepicker ]*/
    
    
    try {
        var singleDate = $('.js-single-datepicker');
    
        singleDate.each(function () {
            var that = $(this);
            var dropdownParent = '#dropdown-datepicker' + that.data('drop');
    
            that.daterangepicker({
                "singleDatePicker": true,
                "showDropdowns": true,
                "autoUpdateInput": true,
                "parentEl": dropdownParent,
                "opens": 'left',
                "locale": {
                    "format": 'YYYY-MM-DD'
                }
            });
        });
    
    } catch(er) {console.log(er);}
    /*================================================================== */
    
})(jQuery);