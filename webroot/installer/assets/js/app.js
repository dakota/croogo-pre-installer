jQuery(function($) {
    'use strict';

    var dependencies = {};

    var tabs = {
        '#requirements': function () {
            var $content = $('#requirements .content'),
                $list = $('<ul class="list-unstyled"></ul>'),
                requirements = [
                    {
                        title: 'PHP Version (5.5.9+, or 7.0.0+)', uri: 'scripts/phpVersion.php'
                    }, {
                        title: 'PHP extensions', uri: 'scripts/phpExtensions.php'
                    }, {
                        title: 'Install directory is writable', uri: 'scripts/writable.php'
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

            $content
                .empty()
                .append($list);
        },
        '#create-project': function () {
            var $content = $('#create-project .content'),
                $list = $(
                '<ul class="list-unstyled"></ul>'),
                steps = [
                    {
                        title: 'Creating initial files', uri: 'scripts/createProject.php'
                    }, {
                        title: 'Determining dependencies', uri: 'scripts/getDependencies.php', callback: function (response) {
                            dependencies = response;
                        }
                    }
                ];

            $content
                .empty()
                .append($list);

            steps.forEach(function (step)
            {
                var $listItem = $('<li></li>'),
                    icon = $('<i class="fa fa-spin fa-spinner"></i>'),
                    listContent = ' ' + step.title;

                $.ajaxQueue({
                        url: step.uri,
                        beforeSend: function () {
                            $listItem
                                .append(icon)
                                .append(listContent)
                                .appendTo($list);
                        }
                    })
                    .done(function (response)
                    {
                        icon
                            .removeClass('fa-spin fa-spinner')
                            .addClass('fa-check text-success');

                        if (step.callback) {
                            step.callback(response);
                        }
                    });

            });
        },
        '#download-croogo': function () {
            var $content = $('#download-croogo .content'),
                $list = $('<ul class="list-unstyled"></ul>'),
                uri = 'scripts/installPackage.php';

            $content
                .empty()
                .append($list);

            $.each(dependencies, function (package_name, version)
            {
                var $listItem = $('<li></li>'),
                    icon = $('<i class="fa fa-spin fa-spinner"></i>'),
                    listContent = ' Installing ' + package_name;

                $.ajaxQueue({
                        url: uri,
                        data: {
                            'package': package_name,
                            'version': version
                        },
                        beforeSend: function ()
                        {
                            $listItem
                                .append(icon)
                                .append(listContent)
                                .appendTo($list);
                        }
                    })
                    .done(function ()
                    {
                        icon
                            .removeClass('fa-spin fa-spinner')
                            .addClass('fa-check text-success');
                    });
            });
        }
    };

    $('#tab-content')
        .on('click', 'a[data-toggle="switch-tab"]', function (e)
        {
            e.preventDefault();
            var href = $(this).attr('href');

            $('#tab-buttons a[href="' + href + '"].nav-link').tab('show');
        });
//        .find('a[data-toggle="switch-tab"]').addClass('disabled');

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
});
