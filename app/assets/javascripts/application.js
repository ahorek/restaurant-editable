//= require jquery
//= require jquery_ujs
//= require ckeditor-jquery
//= require bootstrap
//= require bootstrap_editable
//= require jquery_galereya
//= require jquery_ui
//
// require jquery_multilevelpushmenu
// require modernizr

function initEditable() {
    $.fn.editable.defaults.mode = 'popup';
    $('.editable').each(function (_, o) {
        $(o).editable(
                {
                    placement: 'top',
                    ajaxOptions: {
                        type: 'PUT'
                    },
                    emptytext: '-',
                    params: function (data) {
                        var params = {};
                        params[data.name] = data.value;
                        return params;
                    },
                    error: function (xhr) {
                        try {
                            var json = $.parseJSON(xhr.responseText.replace(/<br\s*[\/]?>/gi, "\\n"));
                        }
                        catch (e) {
                            return 'Internal error';
                        }

                        if (json && json.errors) {
                            return json.errors.join("\n");
                        }
                    }
                }
        );
    });
}

$(document).ready(function () {
    initEditable();
    $('.thumbnails').each(function () {
        $(this).galereya({size: 200, spacing: 20});
    });
});
