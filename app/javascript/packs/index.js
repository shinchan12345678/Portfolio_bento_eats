function start_jquery() {

  $(function() {
    // 一旦保留
    // var navbars = $(".navbar .nav-item").find("span")
    // for (var i = 0; i < navbars.length; i++ ) {
    //   mouseoverAction2($(`.navbar .nav-item #nav_${i}`))
    // }

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

    // 他の機能との兼ね合いで一時停止
    // $('td[data-href]').click(function (e) {
    //   if (!$(e.target).is('a')) {
    //     window.location = $(e.target).data('action');
    //   };
    // });

    var map_roots = $(".googlemap_root")
    for (var i = 0; i < map_roots.length; i++ ) {
      var url = map_roots.filter(`#map_id_${i}`).find("input")[0].value
      var btn = map_roots.filter(`#map_id_${i}`).find(".info_icon")
      opengooglemaps(url,btn)
    }

    $("#helper").on("click",function() {
      $(".box").slideToggle();
    });
  });

  // Skipprの実行
  $("#theTarget").skippr({
    transition : 'fade',
    speed : 1000, // 変化にかかる時間（ミリ秒）
    easing : 'easeOutQuart',
    navType : 'block',
    childrenElementType : 'div', // 子要素の種類（"div" or "img"）
    arrows : true,
    autoPlay : false,
    autoPlayDuration : 5000,  // 自動再生時のスライド切替間隔（ミリ秒）
    keyboardOnAlways : true, // キーボードの矢印キーによるスライド送りの設定（trueで有効）
    hidePrevious : false
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

function mouseoverAction2(element) {
  element.on("mouseover",function() {
    element.addClass("mouseover_2");
  });
  element.on("mouseout",function() {
    element.removeClass("mouseover_2");
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

function opengooglemaps(url,btn) {
  btn.on("click", ()=> {
    window.open(url);
  })
}


$(document).on('turbolinks:load', start_jquery);