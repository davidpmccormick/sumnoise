$(window).load(function(){
setTimeout(function(){
// fade in the venn  diagram circles one by one

	function whenReady(){
		$()
	};
	
	$('.aboutfrontendcontainer').fadeIn(750, function(){
		$('.aboutwebdesigncontainer').fadeIn(750, function(){
			$('.aboutbackendcontainer').fadeIn(750, function(){
				setTimeout(function(){
					fadeInText();
				},200);
			});
		});
	});
	
	function fadeInText(){
		$('.aboutwebdesigntext').fadeIn(750, function(){
			$('.aboutfrontendtext').fadeIn(750, function(){
				$('.aboutbackendtext').fadeIn(750, function(){
					intersect();
				});
			});
		});
	}
	
	function showInfo(){
		$('.preventmouseevents').remove();
		$('.sumnoisehitarea').remove();
		$('.aboutwebdesigncontainer').animate({'margin-left':'-278px','margin-top':'-278px','opacity':'0'},1000, 'swing', function(){
			$(this).remove();
		});
		$('.aboutfrontendcontainer').animate({'margin-right':'-278px','margin-top':'-278px','opacity':'0'},1000, 'swing', function(){
			$(this).remove();
		});

		$('.aboutbackendcontainer').animate({'margin-bottom':'-178px','opacity':'0'},1000, 'swing', function(){
			$(this).remove();
			$('.aboutdescription').css('z-index','20');
			$('.ad1').fadeIn(2000, function(){
				$('.ad2').fadeIn(2000, function(){
					$('.ad3').fadeIn(2000, function(){
						$('.ad4').fadeIn(2000);
					});
				});
			});
		});
	};


// on hover display venn diagram tooltips
	
	$('.backendhit').hover(function(){
		$('.aboutbackendtext').stop().animate({'color':'#fffff1'},200);
	},function(){
		$('.aboutbackendtext').stop().animate({'color':'#fff'},200);
	});

	$('.webdesignhit').hover(function(){
		$('.aboutwebdesigntext').stop().animate({'color':'#fffff1'},200);
	},function(){
		$('.aboutwebdesigntext').stop().animate({'color':'#fff'},200);
	});

	$('.frontendhit').hover(function(){
		$('.aboutfrontendtext').stop().animate({'color':'#fffff1'},200);
	},function(){
		$('.aboutfrontendtext').stop().animate({'color':'#fff'},200);
	});

// glow everything once all set texts have displayed
	function intersect(){
	$('.sumnoisehitarea h2').fadeTo(200,1);
		$('.venntext').stop().fadeTo(200,1, function(){
			$(this).animate({'color':'#fff2a8','text-shadow':'1px 1px 0px #aaa'},500, function() {
				$(this).animate({'color':'#fff', 'text-shadow':'1px 1px 0px #ccc'},500);
				setTimeout(function(){
					showInfo();
				},750)
			});
		});
	};

},1000);
});