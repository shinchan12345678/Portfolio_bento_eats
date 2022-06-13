function start_jquery() {
  console.log("good")

  $(function() {
    var profile = $("#my_profile")
    profile.find(".card-header").on("click",function() {
      // $("#my_profile .card-text").toggleClass("active passive");
      console.log("good2")
      $("#my_profile .card-text").slideToggle();
    });
    mouseoverAction(profile.find(".card-header"));
    
    // $("#my_profile .edit_button").on("click",function() {
    //   console.log("good3")
    //   $("#my_profile, #my_profile_edit").toggleClass("active passive");
    // })
    
    var edit = $("#my_profile .edit_button")
    var profiles = $("#my_profile, #my_profile_edit")
    
    activePassive(edit,profiles);
    
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