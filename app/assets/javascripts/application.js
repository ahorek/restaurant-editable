//= require jquery
//= require jquery_ujs
//= require cocoon
//= require ckeditor-jquery

function initEditable() {
    $.fn.editable.defaults.mode = 'inline';
    $('.editable').each(function (_, o) {
        $(o).editable(
                {
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
        $(this).galereya({size: 200});
    });
});
