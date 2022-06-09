
function initMap() {
  // The location of Uluru
  const uluru = { lat: 35.4577205, lng: 136.7938116 };
  // The map, centered at Uluru
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 15, //地図の縮尺値
    center: uluru, //地図の中心座標
    mapTypeId: 'roadmap'   //地図の種類
  });

  // 現在地の取得
  var now_location = document.getElementById("now_location_get");
  now_location.addEventListener("click",function(){
    console.log("alert") //出力確認
    navigator.geolocation.getCurrentPosition(success, fail);
    function success(pos) {
  		var lat = pos.coords.latitude;
  		var lng = pos.coords.longitude;
  		var latlng = new google.maps.LatLng(lat, lng); //中心の緯度, 経度
      map.setCenter(latlng)
      var marker = new google.maps.Marker({
			  position: latlng, //マーカーの位置（必須）
			  map: map //マーカーを表示する地図
		  });
		};
  	function fail(error) {
  		alert('位置情報の取得に失敗しました。エラーコード：' + error.code);
  		var latlng = new google.maps.LatLng(35.6812405, 139.7649361); //東京駅
      map.setCenter(latlng)
  	}
  });


  const contentString =
      '<div id="content">' +
      '<div id="siteNotice">' +
      "</div>" +
      '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
      '<div id="bodyContent">' +
      "<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large " +
      "<img src='test_item.jpeg'></img>" +
      "sandstone rock formation in the southern part of the " +
      "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
      "south west of the nearest large town, Alice Springs; 450&#160;km " +
      "(280&#160;mi) by road. Kata Tjuta and Uluru are the two major " +
      "features of the Uluru - Kata Tjuta National Park. Uluru is " +
      "sacred to the Pitjantjatjara and Yankunytjatjara, the " +
      "Aboriginal people of the area. It has many springs, waterholes, " +
      "rock caves and ancient paintings. Uluru is listed as a World " +
      "Heritage Site.</p>" +
      '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">' +
      "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
      "(last visited June 22, 2009).</p>" +
      "</div>" +
      "</div>";
    const infowindow = new google.maps.InfoWindow({
      content: contentString,
    });

    var Frag = new google.maps.Marker({
      position: uluru,
      map: map,
      title: "Uluru (Ayers Rock)",
      // icon: {
      //   url: "./images/frag.png",
      //   scaledSize: new google.maps.Size( 50, 50 )
      // }
    });

    Frag.addListener("click", () => {
      infowindow.open({
        anchor: marker,
        map,
        shouldFocus: false,
      });
    });
}

window.initMap = initMap;