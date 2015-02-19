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
//= require websocket_rails/main
//= require_tree .

var scheme   = "ws://";
var uri      = scheme + window.document.location.host + "/";
var ws       = new WebSocket(uri);

// Define if element is down or not.
var alreadyDown = false;

// Define what element is already down by selector.
var whoIsAlreadyDown;

// Slide down or slide up element with specified selector.
// Hide element that already shown.
var slider = function(submissiveClass){
    if ($(submissiveClass).css('display') == "none") {
        if (alreadyDown == true) {
            $(whoIsAlreadyDown).css("display", "none")
        }
        $(submissiveClass).slideDown(500);
        whoIsAlreadyDown = submissiveClass;
        alreadyDown = true;
    }
    else {
        alreadyDown = false;
        $(submissiveClass).slideUp(500);
    }
};

// What to execute when document is ready page loaded.
var ready = function(){
    $('#about-btn').bind('click', function(){
        slider('.about');
    });
    $('#login-btn').bind('click', function(){
        slider('.login');
    });
};

$(document).ready(ready);
$(document).on("page:load", ready);//= require websocket_rails/main

