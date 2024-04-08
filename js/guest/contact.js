/*-----------------------------------------------------------------
| Function to prepare and set up the Google Maps
|------------------------------------------------------------------
|
*/
$(function() {
    var mapn = null;
    var lat  = $('.ty-contactMap .ty-map').data('latitude');
    var long = $('.ty-contactMap .ty-map').data('longitude');
    var centerLatLang = new google.maps.LatLng(lat, long);

    function initialize() {
        var e = {
            center: centerLatLang,
            zoom: 17,
            mapTypeControl: !0,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
            },
            navigationControl: !0,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles:[{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"administrative","elementType":"labels.text.stroke","stylers":[{"saturation":"-31"},{"color":"#805419"},{"visibility":"simplified"}]},{"featureType":"administrative.locality","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"administrative.locality","elementType":"labels.text.stroke","stylers":[{"hue":"#00ebff"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#c67b16"}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#b69b80"}]},{"featureType":"landscape.natural.terrain","elementType":"geometry.fill","stylers":[{"color":"#b67013"}]},{"featureType":"poi.attraction","elementType":"geometry.fill","stylers":[{"color":"#63523e"}]},{"featureType":"poi.business","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"poi.business","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#4d493e"}]},{"featureType":"poi.medical","elementType":"geometry.fill","stylers":[{"color":"#64513e"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#63523e"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"poi.school","elementType":"geometry.fill","stylers":[{"color":"#7e654b"}]},{"featureType":"poi.school","elementType":"labels.text","stylers":[{"visibility":"simplified"},{"color":"#a6a6a6"}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#a26411"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#4d493e"}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#5b574b"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#8a4e01"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#eda646"}]},{"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#493a2b"}]},{"featureType":"transit.station.airport","elementType":"geometry.fill","stylers":[{"color":"#64513e"}]},{"featureType":"transit.station.airport","elementType":"labels.text","stylers":[{"visibility":"simplified"},{"color":"#aeaeae"}]},{"featureType":"transit.station.bus","elementType":"labels.text.fill","stylers":[{"color":"#63523e"},{"visibility":"on"},{"weight":"1.62"}]},{"featureType":"transit.station.bus","elementType":"labels.text.stroke","stylers":[{"color":"#eba444"}]},{"featureType":"transit.station.rail","elementType":"labels.text.fill","stylers":[{"visibility":"simplified"},{"color":"#ffffff"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#935e17"}]}]
        };
        mapn = new google.maps.Map(document.getElementById("googleMap"), e);

        new google.maps.Marker({
            position: centerLatLang,
            map: mapn,
            title: "Nanotek"
        });
    }

    google.maps.event.addDomListener(window, "load", initialize);
});

/*-----------------------------------------------------------------
| Contact Form preparation and submit
|------------------------------------------------------------------
|
*/
$(function() {
    var $form = $('.ty-contactForm form'),
        $inputSelector = 'input[type="text"], input[type="email"], textarea',
        $mainWrap = $('.ty-mainWrap');
    $form.find('p.ty-verifyText').html('');
    $form.find('div.ty-inputHolder').removeClass('verify');

    $form.submit(function (e) {
        e.preventDefault();
        var contactData = {};
        contactData['_token'] = $('meta[name="csrf-token"]').attr('content');
        $form.find($inputSelector).each(function() {
            contactData[$(this).attr('name')] = $(this).val();
        });

        $.ajax({
            type: 'POST',
            dataType: 'json',
            url: $form.data('form-action'),
            data: contactData,
            beforeSend: function() { 
                $form.find('p.ty-verifyText').html('');
                $form.find('div.ty-inputHolder').removeClass('verify');
                $form.find('input[type="submit"]').val('Processing');
                $('.ty-contactForm .ty-form-inputWrap').removeClass('loading').addClass('loading');
            },
            success: function(data) {
                if(data.status == 'success') showModal('#modal-contact-success');
                else if(data.status == 'failed') {
                    if(data.code == 'validation_error') {
                        $.each(data.errors, function(key, value) {
                            var pTag = $form.find('[name=' + key + ']').next();
                            pTag.html(value);
                            pTag.closest('div.ty-inputHolder').addClass('verify');
                        });
                    } else console.log('Request made was not an ajax');
                }
            },
            error: function(e) {
                showModal('#modal-email-error');
                console.log('Request could not complete');
            },
            complete: function() {
                $form.find('input[type="submit"]').val('Submit');
                $('.ty-contactForm .ty-form-inputWrap').removeClass('loading');
            }
        });
    });

    function showModal(modalId) {
        $form.find($inputSelector).val('').trigger('blur');
        if( !$mainWrap.hasClass('modalOpen') ) $mainWrap.addClass('modalOpen');
        $('.ty-modal ' + modalId + '.ty-modalContentWrap').addClass('ty-modal-show');
    }

});