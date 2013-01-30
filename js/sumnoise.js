$(document).ready(function(){

	var workspaceURL = $('body').attr('rel');
	
// redirect to bus stop url

	var baseURL = "http://sumnoise.com/buses/";
	$('h2.submitbus').click(function() {
		console.log('clicked');
		var busInput = $('.businput').attr('value');
		console.log(busInput);
		if (!isNaN(busInput)) { // don't do anything if there isn't a number entered
			window.location.href = baseURL + busInput;
		}
	});

// attach correct sylesheet based on screenwidth

	if($('ul#menu').css('margin-bottom') != '50px') { // not for handhelds
		function adjustStyle(width) {
		    width = parseInt(width);
		    if (width < 980) {
		    	var theThinnerURL = workspaceURL + "/css/thinner.css";
		        $("#size-stylesheet").attr("href", theThinnerURL);
		    } else {
		    	var theScreenURL = workspaceURL + "/css/screen.css";
		       $("#size-stylesheet").attr("href", theScreenURL);
		    }
		}
		
		$(function() {
		    adjustStyle($(this).width());
		    $(window).resize(function() {
		        adjustStyle($(this).width());
		    });
		});
	};

// ajaxify links

	$('.ajaxify').ajaxify({
	    animateOut:{opacity:'0'},
	    animateOutSpeed:200,
	    animateIn:{opacity:'1'},
	    animateInSpeed:200,
	    target:'#ajaxcontainer',
	    loading_target:'#loadingcontainer',
	    loading_img:'/workspace/images/loading.gif',
	    loadHash:'attr:rel'
	}); 
	
// overlay hover teasers
	
	$('.grid-image').hover(function(){
		$('.thumbteaser', this).stop().fadeTo(300,0.9);
	}, function(){
		$('.thumbteaser', this).stop().fadeTo(300,0);
	}); 
	
	$('#homework').hover(function() {
	    $('.teaser').stop().fadeTo('slow',0.9);
	}, function() {
	    $('.teaser').stop().fadeTo('slow',0);
	});
	
// cycle images
	
	$('.cyclethis').cycle(); 
	
// mouseover menu animation

	if($('ul#menu').css('margin-bottom') != '50px') {
		$('#menu li').hover(function(){
			$(this).stop().animate({'padding-left':'15px'},200);
			$('a',this).stop().animate({'color':'#555'},200);
		}, function(){
			$(this).stop().animate({'padding-left':'10px'},200);
			$('a',this).stop().animate({'color':'#888'},200);
		});
	} else { 
		$('#menu li').hover(function(){
/* 			$('.navshadow',this).fadeIn(500); */
			$('a.active').removeClass('active').css('color','#888');
			$('a',this).stop().animate({'color':'#333'},200);
		}, function(){
/* 			$('.navshadow',this).fadeOut(500); */
			$('a',this).stop().animate({'color':'#888'},200);
		});
	}

// color heading animation

	$('a h3.pink, a h3.yellow, a h3.blue, a h3.green, a h3.red').hover(function(){
		$(this).stop().animate({'padding-left':'10px'},200);
	}, function(){
		$(this).stop().animate({'padding-left':'5px'},200);
	});
	
	$('a h2.green, a h2.blue, a h2.red, a h2.yellow').hover(function(){
		$(this).stop().animate({'padding-left':'15px'},200);
	}, function(){
		$(this).stop().animate({'padding-left':'10px'},200);
	});
	
	$('a h3.cmscolor, a h3.disciplinecolor').hover(function(){
		$(this).stop().animate({'padding-left':'15px'},200);
	}, function(){
		$(this).stop().animate({'padding-left':'10px'},200);
	});

	$('#home-page h3').hover(function(){
		$(this).stop().animate({'padding-left':'10px'},200);
	}, function(){
		$(this).stop().animate({'padding-left':'5px'},200);
	})
	
	
	$('#workcontainer h2').not('.searchbox').hover(function(){
		$(this).stop().animate({'background-color':'#faf6ff'},200);
	}, function(){
		$(this).stop().animate({'background-color':'#faf6f1'},200);
	});
	
	$('.blogexcerpt, .homeblog').hover(function(){
		$(this).stop().animate({'background-color':'#faf6f1'},200);
	}, function(){
		$(this).stop().animate({'background-color':'#faf6ff'},200);
	});
	
	
	if($('ul#menu').css('margin-bottom') != '50px') { // don't do hover for handhelds (so you don't have to tap twice)
		$('.blogentry').hover(function(){
			$('.homeblogdate', this).stop().fadeTo(200,1);
		}, function(){
			$('.homeblogdate', this).stop().fadeTo(200,0);
		});
	}
	
// make end of touch events on blog links trigger links 
/*
	$('.blogentry a').on('click touchend', function(e) {
    var el = $(this);
    var link = el.attr('href');
    window.location = link;
	});
*/

// show description on hover blog image

	$('.showdescription').hover(function(){
		$('.descriptionwrapper').stop().fadeTo(200,0.7);
	}, function(){
		$('.descriptionwrapper').stop().fadeTo(200,0);
	});
	
	$('#commentsubmit').click(function(){
		$('#commentform').submit();
	});
	
//flickr hover

	$('.flickrimage').hover(function(){
		$('img',this).stop().animate({'width':'65px','z-index':'10'},100);
	}, function(){
		$('img',this).stop().animate({'width':'57px','z-index':'0'},100);
	});
	
// ajax heading hover
	$('.clickhere').live('mouseenter',function(){
		$('h2',this).stop().animate({'padding-left':'15px', 'background-color':'#fff2a8'},200);
		$('span',this).stop().fadeTo(200,1)
	});		
	$('.clickhere').live('mouseleave',function(){
		$('h2',this).stop().animate({'padding-left':'10px', 'background-color':'#ecffff'},200);
		$('span',this).stop().fadeTo(200,0)
	});
	
	
// mouseover pagination
	$('ul.pagination li a').hover(function(){
		$(this).stop().animate({'margin-top':'5px'},200);
	}, function(){
		$(this).stop().animate({'margin-top':'0px'},200);
	});
	
// word up mouseover

	$('#homecontact li a').css('opacity','0.4');
	
	$('.twitterli, .facebookli, .flickrli, .lastfmli, .githubli').hover(function(){
		$(this).stop().animate({'margin-top':'-5px'},200)
		$('a',this).css('opacity','1');
	}, function(){
		$(this).stop().animate({'margin-top':'0px'},200)
		$('a',this).css('opacity','0.4');
	});
	
// make facebook images fill the space
	$('#noisefacebook img').css({'width':'230px', 'height':'auto'});

// show the last seen time on mouseover	
	$('.lastseenhover').hover(function(){
		$('.lastseentime').stop().fadeTo(200,1);
	}, function(){
		$('.lastseentime').stop().fadeTo(200,0);
	});

// show tweet location on hover

	$('.noisetweet').mouseenter(function(){
		$('.tweetlocation',this).stop().fadeTo(400,0.9).delay(300).fadeOut(200);
	});
	
// change submit buttton on hover

	$('#commentsubmit').hover(function(){
		$(this).css({'background-color':'#FF92BB', 'color':'#fff', 'text-shadow':'1px 1px 0px #aaa'});
	}, function(){
		$(this).css({'background-color':'#FFFFF1', 'color':'#333', 'text-shadow':'1px 1px 0px #fff'});
	});
	
// rotate 'spinny' class images
	$('.spinny').rotate({ 
	   bind: 
	     { 
	        mouseover : function() { 
	            $(this).rotate({animateTo:180})
	        },
	        mouseout : function() { 
	            $(this).rotate({animateTo:0})
	        }
	    }    
	});
		
	var angle = 0;
	setInterval(function(){
	      angle+=3;
	     $(".continuousspinny").rotate(angle);
	},50);

// show tags on weekly album hover

	$('.weeklyalbum').hover(function(){
		$('.weeklyalbumpink').stop().fadeTo(200,0.9);
		$('.weeklyalbumtags').stop().fadeTo(200,1);
	}, function(){
		$('.weeklyalbumpink').stop().fadeTo(200,0);
		$('.weeklyalbumtags').stop().fadeTo(200,0);
	});
	
// make 'sticky' classes sticky

	if( ($('ul#menu').css('margin-bottom') != '50px') && ($('#left-col').css('position') != 'static' ) ) { // not for handhelds
		$('.sticky').sticky({topSpacing:0});
	};
	
// add text-shadow to blockquotes in webkit browsers

	if ($.browser.webkit) {
		$('blockquote').css('text-shadow','1px 1px 0px #fff');
	};

});



$(window).load(function(){

	var workspaceURL = $('body').attr('rel');

// bounce in the dot on the 'i' of sumnoise
	setTimeout(function(){
		$('.dot').animate({'top':'125px'},500, 'easeOutBounce');
	},1000);
	
    // filter disciplines with isotope

	// cache container
	var $workcontainer = $('#workcontainer');
	// initialize isotope
	$workcontainer.isotope({
	  // options…
	});
	// filter items when filter link is clicked
	$('#disciplinelist a').click(function(){
	  var selector = $(this).attr('data-filter');
	  $workcontainer.isotope({ filter: selector });
	  return false;
	});
	
	// only show the work grid once isotope's done its thing
	
	$('.gifspinner, .gifspinnerblog').fadeOut(500).remove();
	$('#workcontainer .span-4').fadeIn(200);

// blog excerpts isotope

	var $blogcontainer = $('#blogcontainer');
	$blogcontainer.isotope();
	$('#blogcontainer .span-4').fadeIn(200);
	
	$('ul.pagination').fadeIn(200);

// preload images

	if($('ul#menu').css('margin-bottom') != '50px') { // don't do it for handhelds (images not displayed)
		var images = [
			workspaceURL + '/images/loading.gif',
			workspaceURL + '/images/backend.png',
			workspaceURL + '/images/frontend.png',
			workspaceURL + '/images/webdesign.png'
		];
		
		$(images).each(function() {
			var image = $('<img />').attr('src', this);
		});
	}

// scroll the menu out of view on handheld devices	
	if($('ul#menu').css('margin-bottom') == '50px') { // it's on a handheld device (set in handheld.css)
	var distanceToScroll = $('ul#menu').height() + 50; // height of the nav menu
		setTimeout(function(){
			// while we're here, make any syntaxhighlighter code a sensible size
			$('.syntaxhighlighter *').attr('style','font-size:50px!important;height:1em!important;');
			$("html, body").animate({ scrollTop: distanceToScroll }, 750, 'easeInOutQuint' );
		}, 500);
	};
			
});