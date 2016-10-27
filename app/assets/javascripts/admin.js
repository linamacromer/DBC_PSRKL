// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $(".audioButton").on("click", function() {
    $(".audio-play")[0].currentTime = 0;
    return $(".audio-play")[0].play();
  });
});
