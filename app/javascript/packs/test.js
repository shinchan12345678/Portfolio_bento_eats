function test() {
  document.getElementById("now_location_get").addEventListener("click",function() {
    console.log("test1")

  });
  document.getElementById("customer_now_location_get").addEventListener("click",function() {
    console.log("test2")
  });
}


if($("#now_location_get").length >= 1){
  $("#now_location_get").on('click', function(){
   console.log("test3") 
  });
}

// function test2() {
//   var test = document.getElementById("now_location_get")
//   var test2 = document.getElementById("customer_now_location_get")
//   if (test) {
//     test.addEventListener("click",function() {
//     console.log("test3")
//     });
//   } else if (test2) {
//     test2.addEventListener("click",function() {
//     console.log("test4")
//   });
//   }
// }

window.onload = test;
// window.onload = test2;