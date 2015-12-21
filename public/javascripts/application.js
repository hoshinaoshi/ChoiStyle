// Some general UI pack related JS
// Extend JS String with repeat method
String.prototype.repeat = function(num) {
    return new Array(num + 1).join(this);
};

(function($) {

  // Add segments to a slider
  $.fn.addSliderSegments = function (amount) {
    return this.each(function () {
      var segmentGap = 100 / (amount - 1) + "%"
        , segment = "<div class='ui-slider-segment' style='margin-left: " + segmentGap + ";'></div>";
      $(this).prepend(segment.repeat(amount - 2));
    });
  };

  $(function() {
  
    // Todo list
    $(".todo li").click(function() {
        $(this).toggleClass("todo-done");
    });

    // Custom Select
    $("select[name='herolist']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='target']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='stylist[gender]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='stylist[target]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='stylist[want_long]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='stylist[want_style]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='stylist[can_style]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[salon_attributes][salon_prefecture]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[salon_attributes][salon_area]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[user_type]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[gender]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[prefecture]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][hair_long]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][hair_type]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][volume]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][wavy]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][when_parm]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][when_color]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][want_long]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][want_style]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][can_style]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][prefecture]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[cut_model_attributes][area]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='want_long']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='want_style']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='can_style']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='salon_prefecture']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='salon_area']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[stylist_attributes][target]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[stylist_attributes][want_long]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[stylist_attributes][want_style]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[stylist_attributes][can_style]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[stylist_attributes][salon_area]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});
    $("select[name='user[stylist_attributes][salon_prefecture]']").selectpicker({style: 'btn-primary', menuStyle: 'dropdown-inverse'});

    // Tooltips
    $("[data-toggle=tooltip]").tooltip("show");

    // Tags Input
    $(".tagsinput").tagsInput();

    // jQuery UI Sliders
    var $slider = $("#slider");
    if ($slider.length) {
      $slider.slider({
        min: 1,
        max: 5,
        value: 2,
        orientation: "horizontal",
        range: "min"
      }).addSliderSegments($slider.slider("option").max);
    }

    // Placeholders for input/textarea
    $("input, textarea").placeholder();

    // Make pagination demo work
    $(".pagination a").on('click', function() {
      $(this).parent().siblings("li").removeClass("active").end().addClass("active");
    });

    $(".btn-group a").on('click', function() {
      $(this).siblings().removeClass("active").end().addClass("active");
    });

    // Disable link clicks to prevent page scrolling
    $('a[href="#fakelink"]').on('click', function (e) {
      e.preventDefault();
    });

    // Switch
    $("[data-toggle='switch']").wrap('<div class="switch" />').parent().bootstrapSwitch();
    
  });
  
})(jQuery);
