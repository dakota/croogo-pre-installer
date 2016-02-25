jQuery(function ($) {
    'use strict';

    function runSteps(steps, $list)
    {
        steps.forEach(function (step)
        {
            var $listItem = $('<li></li>'),
                icon = $('<i class="fa fa-spin fa-spinner"></i>'),
                listContent = ' ' + step.title,
                ajaxOptions = {};

            if (step.ajaxOptions) {
                ajaxOptions = step.ajaxOptions();
            }

            $.ajaxQueue($.extend(ajaxOptions, {
                url: step.uri,
                dataType: 'json', cache: false,
                beforeSend: function (jqXHR, settings)
                    {
                        $listItem
                            .append(icon)
                            .append(listContent)
                            .appendTo($list);

                        if (step.beforeSend) {
                            step.beforeSend(jqXHR, settings);
                        }
                    }
                }))
                .done(function (response)
                {
                    icon
                        .removeClass('fa-spin fa-spinner')
                        .addClass('fa-check text-success');

                    if (step.success) {
                        step.success(response);
                    }
                });
        });
    }

    function installCompleted()
    {
        var $list = $('#install-croogo').find('.list'),
            steps = [
                {
                    title: 'Site configuration',
                    uri: '/installer/scripts/siteConfiguration.php',
                    ajaxOptions: function () {
                        var siteData = $('#database-config').find('form').serializeArray();
                        $.extend(siteData, $('#site-details').find('form').serializeArray());
                        return {
                            data: siteData,
                            method: 'POST'
                        }
                    }
                },
                {
                    title: 'Database installation',
                    uri: '/installer/scripts/databaseInstall.php'
                },
                {
                    title: 'Move files',
                    uri: '/installer/scripts/moveFiles.php'
                },
                {
                    title: 'Test installation',
                    uri: '/test-installation'
                }
            ];

        runSteps(steps, $list);
    }

    function installDependencies(dependencies)
    {
        var $list = $('#install-croogo').find('.list'),
            $progress = $('<progress class="progress" value="0" max="100">0%</progress>'),
            $step = $('<span></span>'),
            $wrapper = $('<div></div>'),
            $listItem = $('<li></li>'),
            $icon = $('<i class="fa fa-spin fa-spinner"></i>'),
            step = Math.ceil(100 / Object.keys(dependencies).length),
            currentProgress = 0,
            uri = '/installer/scripts/installPackage.php';

        $listItem
            .append($icon)
            .append(' Downloading Croogo files');

        $wrapper
            .append($step)
            .append($progress)
            .appendTo($listItem);

        $listItem.appendTo($list);

        $.each(dependencies, function (package_name, version)
        {
            $.ajaxQueue({
                    url: uri, data: {
                        'package': package_name, 'version': version
                    }, beforeSend: function ()
                    {
                        $step.text('Now installing ' + package_name);
                    }
                })
                .done(function ()
                {
                    currentProgress += step;
                    $progress
                        .val(parseInt(currentProgress, 10))
                        .text(currentProgress + '%');

                    if (currentProgress >= 100) {
                        $wrapper.remove();
                        icon
                            .removeClass('fa-spin fa-spinner')
                            .addClass('fa-check text-success');
                        installCompleted();
                    }
                });
        });
    }

    function croogoInstaller() {
        var $list = $('#install-croogo').find('.list'),
            steps = [
                {
                    title: 'Creating initial files',
                    uri: '/installer/scripts/createProject.php'
                }, {
                    title: 'Determining dependencies',
                    uri: '/installer/scripts/getDependencies.php',
                    success: function (response) {
                        installDependencies(response);
                    }
                }
            ];

        runSteps(steps, $list);
    };

    var $tabButtons = $('#tab-buttons');

    $('#tab-content')
        .on('click', 'button[data-action]', function (e)
        {
            e.preventDefault();
            var
                $this = $(this),
                $currentTab = $tabButtons.find('.active'),
                action = $this.data('action');

            if (action === 'next' && $currentTab.data('next')) {
                $currentTab.parent().next().find('a').tab('show');
            } else if (action === 'previous' && $currentTab.data('previous')) {
                $currentTab.parent().prev().find('a').tab('show');
            }
        });

    $tabButtons
        .on('click', 'a[data-toggle="tab"]', function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            return false;
        })
        .find('a:first').tab('show');

    $tabButtons
        .on('show.bs.tab', 'a[href="#install-croogo"]', croogoInstaller)
        .on('hide.bs.tab', 'a[href="#database-config"],a[href="#site-details"]', function (e) {
            var
                target = e.target.href.split('#')[1],
                allValid = true;

            $('#'+ target).find(':input').each(function () {
                var valid = this.checkValidity();

                $(this)
                    .find('.text-help').remove()
                    .closest('.form-group')
                    .removeClass('has-danger');

                if (!valid) {
                    $(this)
                        .after('<p class="text-help">This field is required</p>')
                        .closest('.form-group')
                        .addClass('has-danger');
                }

                allValid = allValid && valid;
            });

            if (!allValid) {
                e.preventDefault();
            }
        });
});
