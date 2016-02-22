jQuery(function($) {
    'use strict';

    function allGood() {

    }

    var tabs = {
        '#requirements': function () {

            var $requirements = $('#requirements .content'),
                $list = $('<ul class="list-unstyled"></ul>'),
                requirements = [
                    {
                        title: 'PHP Version (5.5.9+, or 7.0.0+)', uri: 'installer/phpVersion.php'
                    }, {
                        title: 'PHP extensions', uri: 'installer/phpExtensions.php'
                    }, {
                        title: 'Install directory is writable', uri: 'installer/writable.php'
                    }
                ];

            requirements.forEach(function (requirement) {
                var $listItem = $('<li></li>'), icon = $('<i class="fa fa-spin fa-spinner"></i>'), listContent = ' ' +
                    requirement.title;

                $listItem
                    .append(icon)
                    .append(listContent)
                    .appendTo($list);

                $.ajax({
                        url: requirement.uri, dataType: 'json'
                    })
                    .always(function (response)
                    {
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
        },
        '#composer-install': function () {
            $.ajax({
                url: 'installer/composer.php',
                dataType: 'json'
            })
                .always(function (response) {

                });
        }
    };

    $('#tab-buttons')
        .on('click', 'a[data-toggle="tab"]', function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            return false;
        })
        .on('shown.bs.tab', function (e) {
            tabs[$(e.target).attr('href')]();
        })
        .find('a:first').tab('show');

    $('#tab-content')
        .on('click', 'a[data-toggle="switch-tab"]', function (e) {
            e.preventDefault();
            var href = $(this).attr('href');

            $('#tab-buttons a[href="' + href + '"].nav-link').tab('show');
        })
        .find('a[data-toggle="switch-tab"]').addClass('disabled');
});
