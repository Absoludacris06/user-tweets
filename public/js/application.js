$(document).ready(function() {
  console.log("yep");
  $("#user_form").on("submit", function(e){
    console.log("inside listener");
    $("#tweet_list").hide();
    e.preventDefault();
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize()
    })
    .done(function(server_data) {
      console.log("success");
      $('#tweet_list').html(server_data);
      $("#tweet_list").show();
    })
    .fail(function() {
      console.log("error");
    });
  });
  $(document).ajaxStart(function() {
    $("#loading").show();
  });
  
  $(document).ajaxStop(function() {
    $("#loading").hide();
  });

});

// $(document).ajaxStart(function() {
//   $("#loading").show();
// });

// $(document).ajaxStop(function() {
//   $("#loading").hide();
// });
