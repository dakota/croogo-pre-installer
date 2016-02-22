jQuery(function($) {
    'use strict';

    var $requirements = $('#requirements .content');

    function checkRequirements()
    {
        var $list = $('<ul class="list-unstyled"></ul>'),
            requirements = [
                {
                    title: 'PHP Version (5.5.9+, or 7.0.0+)',
                    uri: 'installer/phpVersion.php'
                },
                {
                    title: 'PHP extensions',
                    uri: 'installer/phpExtensions.php'
                }, {
                    title: 'Install directory is writable', uri: 'installer/writable.php'
                }
            ];

        requirements.forEach(function (requirement) {
            var $listItem = $('<li></li>'),
                icon = $('<i class="fa fa-spin fa-spinner"></i>'),
                listContent = ' ' + requirement.title;

            $listItem
                .append(icon)
                .append(listContent)
                .appendTo($list);

            $.ajax({
                url: requirement.uri,
                dataType: 'json'
            })
                .always(function (response) {
                    var $labelItem = $('<span class="label"></span>');

                    icon.removeClass('fa-spin fa-spinner');
                    if (response.ok == true) {
                        icon.addClass('fa-check text-success');
                        $labelItem.addClass('label-success');
                    } else {
                        icon.addClass('fa-times text-danger');
                        $labelItem.addClass('label-danger');
                    }

                    if (response.text) {
                        $labelItem.text(response.text);

                        $listItem
                            .append(' ')
                            .append($labelItem);
                    }
                });
        });

        $requirements
            .empty()
            .append($list);
    }

    checkRequirements();

    $('[data-toggle="switch-tab"]').on('click', function (e) {
        e.preventDefault();
        var href = $(this).attr('href');

        $('[href="' + href + '"].nav-link').tab('show');
    });
    $('[data-toggle="tab"]').on('click', function (e) {
        e.preventDefault();
        e.preventBubble();
        e.stopImmediatePropagation();
        return false;
    });
});
