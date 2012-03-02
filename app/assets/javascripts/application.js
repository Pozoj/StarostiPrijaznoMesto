// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
var weekday = new Array("Nedelja", "Ponedeljek", "Torek", "Sreda", "Četrtek", "Petek", "Sobota");
function formatTime() {
  now = new Date();
  hour = now.getHours();
  min = now.getMinutes();
	month = now.getMonth() + 1;
	day = now.getDate();
	year = now.getFullYear();
	day_of_week = now.getDay();
  
	if (min <= 9) {
    min = "0" + min; }
  if (hour < 10) {
    hour = "0" + hour; }
  document.getElementById("time").innerHTML = hour + ':' + min;
	document.getElementById("date").innerHTML = weekday[day_of_week] + ', ' + day + '.' + month + '.' + year;
  setTimeout("formatTime()", 1000);
}

window.onload=formatTime;
