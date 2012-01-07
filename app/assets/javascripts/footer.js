$(function() {
	var slide = false;
	var height = $('#footer_content').height();
	$('#footer_button').click(function() {
		var docHeight = $(document).height();
		var windowHeight = $(window).height();
		var scrollPos = docHeight - windowHeight + height;
		$('#footer_content').animate({ height: "toggle"}, 700);
		if(slide == false) {
			if($.browser.opera) { //Fix opera double scroll bug by targeting only HTML.
				$('html').animate({scrollTop: scrollPos+'px'}, 700);
			} else {
				$('html, body').animate({scrollTop: scrollPos+'px'}, 700);
			}
            slide = true;
		} else {
            slide = false;
        }
	});
});
