function start_jquery() {
  console.log("good")

  $(function() {
    var profile = $("#my_profile")
    profile.on("click",function() {
      // $("#my_profile .card-text").toggleClass("active passive");
      console.log("good2")
      $("#my_profile .card-text").slideToggle();
    });
    mouseoverAction(profile.find(".card-header"));
    
    var edit_button = profile.find(".edit_button")
    var profiles =  $("#my_profile, #my_profile_edit")
    activePassive(edit_button,profiles);
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


$(document).on('turbolinks:load', start_jquery);