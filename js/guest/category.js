$(function() {
	/*-----------------------------------------------------------------
	| Initialize the base filters of the category page
	|------------------------------------------------------------------
	*/
	$(function() {
		var $buttons = $('.ty-catPageTitle-cat .ty-catPage-baseFilters button');
		$buttons.on('click', function() {
			$buttons.parent().removeClass('active'); $(this).parent().addClass('active');
			$baseFilter = $(this).data('value');

			$page = 1;
			getProducts();
		});
	});

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

	/*-----------------------------------------------------------------
	| Initialize the checkbox filters of the category page
	|------------------------------------------------------------------
	*/
	$(function() {
		var $filterHolder = $('.ty-catPage-filters .ty-catPage-filterWrap');
		//All the checkbox filters
		$.each($filterHolder.find('.ty-filterListWrap'), function(index, item) {
			$(item).on('change', function() { 
				$values = $(this).find('input[type="checkbox"]:checked').map(function(){ return $(this).val(); });
				filterChangeHandler($(this), 'checkbox', $values.get()); 
			});
		});
	});

	/*-----------------------------------------------------------------
	| Initialize the paginator
	|------------------------------------------------------------------
	*/
    $(document).ready(function() {
        $(document).on('click', '.pagination a', function (e) {
        	e.preventDefault();
            var $tempPage = $(this).attr('href').split('page=')[1];
            if ($tempPage == Number.NaN || $tempPage <= 0) $page = 1;
            else $page = $tempPage;

            getProducts();
        });
    });

	/*-----------------------------------------------------------------
	| Filter after change handler
	|------------------------------------------------------------------
	*/
	var $baseFilter = 'all',
		$price = [],
		$filter = {},
		$page = 1;
		console.log()

	function filterChangeHandler(element, type, values) {
		if(type === 'price')
			$price = values;
		else {
			if(values.length !== 0)
				$filter[element.data('attribute-id')] = [values, (type == 'slider')];
			else {
				delete $filter[element.data('attribute-id')];
			}
		}
		$page = 1;
		getProducts();
	}


	/*-----------------------------------------------------------------
	| Retrieve Products
	|------------------------------------------------------------------
	*/
	function getProducts() {
		$.ajax({
	        type: 'GET',
	        dataType: 'json',
	        data: {
	        	baseFilter: $baseFilter,
	        	price: JSON.stringify($price),
	        	filter: JSON.stringify($filter),
	        	page: $page,
	        	_token: $('meta[name="csrf-token"]').attr('content')
	        },
	        url: window.location,
	        success: function(data) {
	    		$('.ty-catPage-products').html(data);
	    		//Scroll the contect to the top after new products are loaded
	    		$(".ty-content").animate({ scrollTop: 0 }, "slow");
	        },
	        error: function(e) {
	            console.log('Request could not complete');
	        }
	    });
    }

	/*-----------------------------------------------------------------
	| Initialize the filter navigation
	|------------------------------------------------------------------
	*/
	var	$catPagefilterTrigger = $('#ty-catPage-filters-trigger'),
		$catPageProductWrap = $('.ty-catPage-productWrap');
		
	$catPagefilterTrigger.on('click', function() {
		if( !$catPageProductWrap.hasClass('active') ) $catPageProductWrap.addClass('active');
		else $catPageProductWrap.removeClass('active');
	});

});

