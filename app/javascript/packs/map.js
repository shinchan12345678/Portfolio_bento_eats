// ---------------------------------------------------------------------------------------------------
// 会員の投稿一覧画面表示
function initMapCustomer() {
  initilize().then(function(){
    console.log("成功2");
    // 地図の表示
    const map_customer = document.getElementById("map_customer");
    var map = mapping(map_customer);
    var latlng = new google.maps.LatLng(lat, lng);
    marker = new google.maps.Marker({
		  position: latlng, //マーカーの位置
		  map: map //マーカーを表示する地図
	  });

    google.maps.event.addListener(map, 'bounds_changed', function() {
      mapBounds();
      latlngInsert();
      // 現在地を取得するイベントを設定
      (function(){
        var element = document.getElementById("customer_now_postion_get");
        positionGet(element);
        element.addEventListener("click",function(){
          mapBounds();
          latlngInsert();
        });
      })();

      // 住所検索し位置取得するイベントを設定
      (function(){
        var element = document.getElementById('address_form_btn');
        positionSearch(element);
        element.addEventListener("click",function(){
          mapBounds();
          latlngInsert();
        });
      })();

      // クリックした位置にマーカーを移動するイベントを設定
      (function () {
        map.addListener("click", function(event) {
          updateMarker(event.latLng);
          mapBounds();
          latlngInsert();
        })
      })();

      // 投稿情報を取得して地図上に表示
      if (gon.informations) {
        var infowindow = new google.maps.InfoWindow({});
        for (var i = 0; i < gon.informations.length; i++ ) {
          var fragLatLng = new google.maps.LatLng({
            lat: parseFloat(gon.informations[i]['latitude']),
            lng: parseFloat(gon.informations[i]['longitude'])
          });

          var frag = new google.maps.Marker({
            position: fragLatLng,
            map: map,
            icon: {
              url: "/assets/frag.png",
              scaledSize: new google.maps.Size( 40, 97 )
            }
          });

          attachMessage(frag, gon.informations[i]['longitude']);
        }
      }
    });
  }).catch(function(){
    alert("ページをリロードします");
    window.location.reload();
  })
}

// ---------------------------------------------------------------------------------------------------
// 飲食店オーナーの新規投稿画面表示
function initMapOwner() {
  initilize().then(function(){
    // 地図の表示
    const map_owner = document.getElementById("map_owner")
    var map = mapping(map_owner);
    var latlng = new google.maps.LatLng(lat, lng);
    marker = new google.maps.Marker({
  		position: latlng,
  		map: map
  	});

  	google.maps.event.addListener(map, 'bounds_changed', function() {
  	  latlngInsert();

      // 現在地を取得するイベントを設定
      (function(){
        var element = document.getElementById("owner_now_position_get");
        positionGet(element);
        element.addEventListener("click",function(){
          console.log(element);
          latlngInsert();
        });
      })();

      // 住所検索し位置取得するイベントを設定
      (function(){
        var element = document.getElementById('address_form_btn');
        positionSearch(element);
        element.addEventListener("click",function(){
          latlngInsert();
        });
      })();

      // クリックした位置にマーカーを移動するイベントを設定
      (function () {
        map.addListener("click", function(event) {
          updateMarker(event.latLng);
          latlngInsert();
        })
      })();
  	});

  	 // 投稿情報の設定
    (function(){
      var element = document.getElementById('post_position_get');
      element.addEventListener("click",function(){
        console.log(element);
        document.getElementById("information_latitude").value = document.getElementById("information_hidden_lat").value;
        document.getElementById("information_longitude").value = document.getElementById("information_hidden_lng").value;
      });
    })();
  })
}

// ---------------------------------------------------------------------------------------------------
// 座標データを初期化する関数
function initilize() {
  var initilize = new Promise(function(resolve) {
    lat = gon.latitude ? gon.latitude:null;
    lng = gon.longitude ? gon.longitude:null;
    var marker = null;
    var latlng = null;
    uluru = { lat: lat, lng: lng };
    console.log("成功");
    resolve();
  });
  return initilize
}


// Mapオブジェクトを生成する関数
function mapping(map_view) {
  map = new google.maps.Map(map_view, { // map_viewには地図を表示領域要素を設定
    zoom: 15, //地図の縮尺値
    center: uluru, //地図の中心座標
    mapTypeId: 'roadmap',   //地図の種類
    disableDoubleClickZoom: true, //ダブルクリックでの地図の拡大を無効化
		scrollwheel: false //マウススクロールでの拡大縮小を無効化
  });
  return map
}

// 現在地の取得する関数
function positionGet(position_get_btn) {
  position_get_btn.addEventListener("click",function(){
    console.log("alert") //出力確認
    navigator.geolocation.getCurrentPosition(success, fail);
    function success(pos) {
  		lat = pos.coords.latitude;
  		lng = pos.coords.longitude;
  		update_latlng = new google.maps.LatLng(lat, lng); //中心の緯度, 経度
      updateMarker(update_latlng)
		};
  	function fail(error) {
  		alert('位置情報の取得に失敗しました。エラーコード：' + error.code);
      map.setCenter(latlng) //直前に取得した座標情報に更新
  	}
  });
}

// 位置の検索機能を実装する関数
function positionSearch(position_search_btn) {
  var geocoder = new google.maps.Geocoder();
  position_search_btn.addEventListener("click",  function () {
    var address = document.getElementById('address_form').value;
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == 'OK') {
        updateMarker(results[0].geometry.location);
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
        map.setCenter(latlng)
      }
    });
  })
}

// マーカーの位置更新する関数
function updateMarker(update_latlng) {
  lat = update_latlng.lat();
  lng = update_latlng.lng();

  marker.setMap(null);
  marker = new google.maps.Marker({
  	position: update_latlng, //マーカーの位置（必須）
		map: map //マーカーを表示する地図
	});
  map.setCenter(update_latlng);
}

// GoogleMapの表示領域の座標を取得する関数
function mapBounds() {
  latlngBounds = map.getBounds();
  document.getElementById("information_map_viewport_position_southwest").value = latlngBounds.getSouthWest();
  document.getElementById("information_map_viewport_position_northeast").value = latlngBounds.getNorthEast();
}

// 座標情報をinputタグに保持
function latlngInsert() {
  document.getElementById("information_hidden_lat").value = lat;
  document.getElementById("information_hidden_lng").value = lng;
}

function attachMessage(marker,msg) {
  google.maps.event.addListener(marker,"click", function() {
    new google.maps.InfoWindow({
      content: msg
    }).open(marker.getMap(),marker);
  });
}

window.initMapOwner = initMapOwner;
window.initMapCustomer = initMapCustomer;
