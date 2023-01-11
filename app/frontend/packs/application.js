import Rails from "@rails/ujs"
import '../styles/application.scss'

Rails.start()

const images = require.context('../images', true)

$(function(){
    $('#ask-button').click(function(){
        $('#ask-form').slideToggle(300);
        return false;
    });
});
