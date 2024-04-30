$(function() {

	/*-----------------------------------------------------------------
	| Initialize the sliders of the category page
	|------------------------------------------------------------------
	*/
	$(function() {
		var $priceRangeSliderArray = $('.ty-catPage-priceRange-slider');
		$.each($priceRangeSliderArray, function(index, item) {
			var $relatedInput = $($(item).parent().parent().find('input')),
				$suffix = $(item).data('suffix');

			$(item).slider({
				range: true,
				min: $(item).data('min'),
				max: $(item).data('max'),
				values: [$(item).data('min'), $(item).data('max')],
				slide: duringSlider,
				stop: afterSlider
			});

			function duringSlider (event, ui) {
				$relatedInput.val( ui.values[0] + " " + $suffix + "  -  " + ui.values[1] + " " + $suffix );
			}

			function afterSlider(event, ui) {
				var $parentElement = $(event.target).parent().parent();
				filterChangeHandler(
						$($parentElement), 
						(($parentElement.find('label').html() == 'Price') ? 'price' : 'slider'),
						[ui.values[0], ui.values[1]]
					);
			}

			$relatedInput.val(
				$(item).slider( "values", 0 ) + " " + $suffix + "  -  " + $(item).slider( "values", 1 ) + " " + $suffix
			);
		});
	});

	

});

