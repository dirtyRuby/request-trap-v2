// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var alreadyDown = false;
var whoIsAlreadyDown;
var slider = function(submissiveClass){
    // If block invisible then make visible with slide down.
    if ($(submissiveClass).css('display') == "none") {
        if (alreadyDown == true) {
            $(whoIsAlreadyDown).css("display", "none")
        }
        $(submissiveClass).slideDown(500);
        whoIsAlreadyDown = submissiveClass;
        alreadyDown = true;

    }
    // If block visible then make invisible with slide up.
    else {
        alreadyDown = false;
        $(submissiveClass).slideUp(500);
    }
};

var ready = function(){
    $('#about-btn').bind('click', function(){
        slider('.about');
    });
    $('#login-btn').bind('click', function(){
        slider('.login');
    });
    $.call(console.log("2"));
};

$(document).on("page:load", ready);