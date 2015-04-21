$(document).ready(function(){
  //add a click handler to the add a recipe link
  $("#new-recipe-link").on("click", function(event){
  //we've got it.
  event.preventDefault();
  var link = $(this);
  //show the new recipe form
  //ajax? get an html partial from server
  var request = $.get("/recipes/new");
  request.done(function(responseBody) {
    link.after(responseBody);
  });
  //hide the add a recipe link
  $(this).hide();
  });
//submit on form
  $(document).on("submit", "#new-recipe-form", function(event) {
    event.preventDefault();
    //where?
    var action = $(this).attr("action");
    var method = $(this).attr("method");
    //what data?
    //serialize goes through each form and turns it into a query string "recipe%5Btitle%5D=asd&....."
    var data = $(this).serialize();
    var form = $(this);
    //ajax!
    $.ajax({
      url: action,
      method: method,
      data: data
    });

    request.done(function(response) {
      //add a line item to the recipe list
      $(".recipe-list").append(response);
      $(form).remove();
      $("#new-recipe-link").show();
    })

    // in show <%= erb :"recipes/_recipe", locals: {recipe :@recipe}
    //in post
    //if request.xhr?
    //erb :"/recipes/_recipe", locals {recipe: @recipe}, layout: false
  })
})
//in "get recipes/new"
//if request.xhr?
//erb :"/recipes/_new_recipe_form", layout: false
//else erb :"recipes/new"
//JSON is a language that allows JS programs to talk to Ruby, talk to Java, clojure etc.
//JSON is a string
//Ruby can send data that is interpretable to other languages
//Ruby can send information through JSON, and other languages can read it