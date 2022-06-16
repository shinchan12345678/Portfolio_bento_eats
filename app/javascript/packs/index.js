function start_jquery() {

  $(function() {
    // 会員側のプロフィール設定のイベント付与
    var profile = $("#my_profile")
    profile.find(".card-header").on("click",function() {
      $("#my_profile .card-text").slideToggle();
    });
    mouseoverAction(profile.find(".card-header"));

    var edit = $("#my_profile .edit_button")
    var profiles = $("#my_profile, #my_profile_edit")
    activePassive(edit,profiles);

    // 会員・飲食店オーナーマイページにイベント付与
    var customer_owners_element= $("#customer_owners")
    var customer_items_element= $("#customer_items")
    activePassive2($("#customer_owners_btn"), customer_owners_element, customer_items_element);
    activePassive2($("#customer_items_btn"), customer_items_element, customer_owners_element);
    mouseoverAction($("#customer_owners_btn"))
    mouseoverAction($("#customer_items_btn"))

    // 営業中の飲食店のみ点灯
    setInterval(function(){
      $('#open_is_valid ').fadeOut(500,function(){$(this).fadeIn(500)});
    },3000);

  });
}

function mouseoverAction(element) {
  element.on("mouseover",function() {
    element.addClass("mouseover");
  });
  element.on("mouseout",function() {
    element.removeClass("mouseover");
  });
}

function activePassive(btn,element) {
  btn.on("click",function() {
    element.toggleClass("active passive");
  })
}

function activePassive2(btn,activeElement,passiveElement) {
  btn.on("click",function() {
    if (activeElement[0].className.split(" ").includes("passive")) {
      activeElement.addClass("active");
      activeElement.removeClass("passive")
      passiveElement.addClass("passive");
      passiveElement.removeClass("active");
    }
  })
}


$(document).on('turbolinks:load', start_jquery);