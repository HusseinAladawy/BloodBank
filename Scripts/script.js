$(document).ready(function () {
  // navbar dropdowns start
  $(".dropToggler1").mouseenter(function () {
    $(".toggShow").addClass("show");
  });
  $(".dropToggler1").mouseleave(function () {
    $(".toggShow").removeClass("show");
  });

  $(".dropToggler2").mouseenter(function () {
    $(".toggShow2").addClass("show");
  });
  $(".dropToggler2").mouseleave(function () {
    $(".toggShow2").removeClass("show");
  });

  $(".dropToggler3").mouseenter(function () {
    $(".toggShow3").addClass("show");
  });
  $(".dropToggler3").mouseleave(function () {
    $(".toggShow3").removeClass("show");
  });
  // end navbar dropdowns
})