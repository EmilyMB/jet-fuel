$(document).ready(function(){
  $("#search-basic").keyup(function(){
    var filter = $(this).val();

    $("#urls > tr").each(function(){
      if ($(this).text().search(new RegExp(filter, "i")) < 0) {
        $(this).hide();
      } else {
        $(this).show();
      }
    });
  });
});
