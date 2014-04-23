"use strict";

// This is the file that contains all the map-related javascript

// Initializes the map by calling the mapbox map and sets the view
var map = L.mapbox.map('map', 'jshelto.map-fqbhlxqi')
    .setView([37.76732233927271, -122.41430282592772], 12);

var foodIcon = L.icon({
    iconUrl: 'http://api.tiles.mapbox.com/v3/marker/pin-l-fast-food+f39c12.png',
    iconAnchor:   [18, 5]
});

var musicIcon = L.icon({
    iconUrl: 'http://api.tiles.mapbox.com/v3/marker/pin-l-music+34495e.png',
    iconAnchor:   [18, 5]
});

var communityIcon = L.icon({
    iconUrl: 'http://api.tiles.mapbox.com/v3/marker/pin-l-building+27ae60.png',
    iconAnchor:   [18, 5]
});

var nightlifeIcon = L.icon({
    iconUrl: 'http://api.tiles.mapbox.com/v3/marker/pin-l-bar+8e44ad.png',
    iconAnchor:   [18, 5]
});

var sportsIcon = L.icon({
    iconUrl: 'http://api.tiles.mapbox.com/v3/marker/pin-l-pitch+e74c3c.png',
    iconAnchor:   [18, 5]
});

var otherIcon = L.icon({
    iconUrl: 'http://api.tiles.mapbox.com/v3/marker/pin-l-embassy+7f8c8d.png',
    iconAnchor:   [18, 5]
});

var iconAssign = function(type) {
  switch (type)
  {
  case '/assets/food.png':
    return foodIcon;
    break;
  case '/assets/music.png':
    return musicIcon;
    break;
  case '/assets/nightlife.png':
    return nightlifeIcon;
    break;
  case '/assets/other.png':
    return otherIcon;
    break;
  case '/assets/community.png':
    return communityIcon;
    break;
  case '/assets/sports.png':
    return sportsIcon;
    break;
}

};

var food = new L.LayerGroup();
var sports = new L.LayerGroup();
var music = new L.LayerGroup();
var nightlife = new L.LayerGroup();
var community = new L.LayerGroup();
var other = new L.LayerGroup();
var overlayMaps = {
    "Food": food,
    "Sports": sports,
    "Music": music,
    "Nightlife": nightlife,
    "Community": community,
    "Other": other
};
var baseMaps = {};

$(document).ready(function(){

  var layerControl = document.getElementsByClassName("leaflet-control-layers leaflet-control");
  $(layerControl).css( "margin-right", "+=400" );

  var loadEvents = function(){
    $.getJSON('/events.json', function(data) {
        $.each(data, function(key, value){
          L.marker([value.latitude, value.longitude], {id: value.id, icon: iconAssign(value.event_type)}, {clickable: false}).bindPopup("<div class = popup><h4 class = popup><a href = '/events/"+value.id+"'>"+value.name+"</a></h4><p class = popup>"+value.location+"</p><hr><p>"+value.description+"</p><p>"+value.cost+"</p><p>"+value.date+"</p></div>").addTo(map);
          console.log('Marker' + value.id);
        });
    });
  }
  loadEvents();
});

value.date
value.cost
value.location


L.control.layers(baseMaps, overlayMaps).addTo(map);
