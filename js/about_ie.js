$(window).load(function(){
setTimeout(function(){
// fade in the venn  diagram circles one by onError

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
		$('.aboutwebdesigntext').delay(750).fadeIn(1, function(){
			$('.aboutfrontendtext').delay(750).fadeIn(1, function(){
				$('.aboutbackendtext').delay(750).fadeIn(1, function(){
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


// glow everything once all set texts have displayed
	function intersect(){
	$('.sumnoisehitarea h2').delay(750).fadeTo(1,1);		
		setTimeout(function(){
			showInfo();
		},750)
	};

},1000);
});