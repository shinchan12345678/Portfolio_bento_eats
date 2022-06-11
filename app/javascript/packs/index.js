// var marker = null;
// var lat = 35.4577205;
// var lng = 136.793811;
// const uluru = { lat: 35.4577205, lng: 136.793811 };


// function initMapCustomer() {
//   const map2 = new google.maps.Map(document.getElementById("map_customer"), {
//     zoom: 15, //地図の縮尺値
//     center: uluru, //地図の中心座標
//     mapTypeId: 'roadmap'   //地図の種類
//   });
// }

// function initMap() {
//   // The location of Uluru
//   // The map, centered at Uluru
//   const map = new google.maps.Map(document.getElementById("map"), {
//     zoom: 15, //地図の縮尺値
//     center: uluru, //地図の中心座標
//     mapTypeId: 'roadmap'   //地図の種類
//   });

//   // 現在地の取得
//   var now_location = document.getElementById("now_location_get");
//   now_location.addEventListener("click",function(){
//     console.log("alert") //出力確認
//     navigator.geolocation.getCurrentPosition(success, fail);
//     function success(pos) {
//   		lat = pos.coords.latitude;
//   		lng = pos.coords.longitude;
//   		latlng = new google.maps.LatLng(lat, lng); //中心の緯度, 経度
//       marker = new google.maps.Marker({
// 			  position: latlng, //マーカーの位置（必須）
// 			  map: map //マーカーを表示する地図
// 		  });
// 		  insertlatlng(lat,lng)
// 		  var latlngBounds = map.getBounds();
// 		  document.getElementById("map_viewport_position_southwest").value = latlngBounds.getSouthWest();
// 		  document.getElementById("map_viewport_position_northeast").value = latlngBounds.getNorthEast();
// 		};
//   	function fail(error) {
//   		alert('位置情報の取得に失敗しました。エラーコード：' + error.code);
//   		var latlng = new google.maps.LatLng(35.6812405, 139.7649361); //東京駅
//       map.setCenter(latlng)
//   	}
//   });

//   // var customer_now_location = document.getElementById("customer_now_location_get");
//   // customer_now_location.addEventListener("click",function(){
//   //   console.log("alert") //出力確認
//   //   navigator.geolocation.getCurrentPosition(success, fail);
//   //   function success(pos) {
//   // 		lat = pos.coords.latitude;
//   // 		lng = pos.coords.longitude;
//   // 		latlng = new google.maps.LatLng(lat, lng); //中心の緯度, 経度
//   //     map.setCenter(latlng)
//   //     marker = new google.maps.Marker({
// 		// 	  position: latlng, //マーカーの位置（必須）
// 		// 	  map: map //マーカーを表示する地図
// 		//   });
// 		//   var latlngBounds = map.getBounds();
// 		//   document.getElementById("map_viewport_position").value = latlngBounds;
// 		// };
//   // 	function fail(error) {
//   // 		alert('位置情報の取得に失敗しました。エラーコード：' + error.code);
//   // 		var latlng = new google.maps.LatLng(35.6812405, 139.7649361); //東京駅
//   //     map.setCenter(latlng)
//   // 	}
//   // });

//   // 投稿情報の設定
//   document.getElementById("post_location_get").addEventListener("click", function() {
//     document.getElementById("information_latitude").value = document.getElementById("owner_hidden_lat").value;
//     document.getElementById("information_longitude").value = document.getElementById("owner_hidden_lng").value;
//   });

//   // マップ表示位置情報の検索
//   var geocoder = new google.maps.Geocoder();
//   document.getElementById('address_form_btn').addEventListener("click",  function () {
//     var address = document.getElementById('address_form').value;
//     geocoder.geocode( { 'address': address}, function(results, status) {
//       if (status == 'OK') {
//         updateMarker(results[0].geometry.location,map);
//       } else {
//         alert('Geocode was not successful for the following reason: ' + status);
//       }
//     });
//   })

//   // クリックした位置にマーカーを設置する
//   map.addListener("click", function(event) {
//     updateMarker(event.latLng,map);
//   })

//   if (gon.informations) {
//     for (var i = 0; i < gon.informations.length; i++ ) {
//       var fragLatLng = new google.maps.LatLng({
//         lat: parseFloat(gon.informations[i]['latitude']),
//         lng: parseFloat(gon.informations[i]['longitude'])
//       });

//       var frag = new google.maps.Marker({
//         position: fragLatLng,
//         map: map,
//         icon: {
//           url: "/assets/frag.png",
//           scaledSize: new google.maps.Size( 40, 97 )
//         }
//       });

//       // var infowindow = new google.maps.InfoWindow({
//       //   content: "aaaa",
//       // });

//       // frag.addListener("click", () => {
//       // infowindow.open({
//       //   anchor: marker,
//       //   map,
//       //   shouldFocus: false,
//       // });
//     // });
//     }
//   }
// }

// function updateMarker(update_latlng,map) {

//   lat = update_latlng.lat();
//   lng = update_latlng.lng();

//   marker.setMap(null);
//   marker = new google.maps.Marker({
//   	position: update_latlng, //マーカーの位置（必須）
// 		map: map //マーカーを表示する地図
// 	});
//   map.setCenter(update_latlng);
//   insertlatlng(lat,lng)
// }

// function insertlatlng(lat,lng) {
//   document.getElementById("owner_hidden_lat").value = lat;
//   document.getElementById("owner_hidden_lng").value = lng;
// }

// // 会員と飲食店オーナーで表示するを変更
// // window.onload = function() {
// //   if (document.getElementById("map")) {
// //     console.log("オーナー側の地図表示");
// //     window.initMap = initMap;
// //   } else if (document.getElementById("map_customer")) {
// //     console.log("会員側の地図表示")
// //     window.initMap = initMap2;
// //   }
// // }


// window.initMap = initMap;
// window.initMapCustomer = initMapCustomer;
