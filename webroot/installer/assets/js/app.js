jQuery(function ($) {
  'use strict';

  function runSteps(queue, steps, $list) {
    steps.forEach(function (step) {
      var $listItem = $('<li></li>');
      var $icon = $('<i class="fa fa-spin fa-spinner"></i>');
      var listContent = ' ' + step.title;
      var ajaxOptions = {};

      if (step.ajaxOptions) {
        ajaxOptions = step.ajaxOptions();
      }

      $.ajaxq(queue, $.extend(ajaxOptions, {
        url: step.uri, cache: false,

        beforeSend: function (jqXHR, settings) {
          $listItem
            .append($icon)
            .append(listContent)
            .appendTo($list);

          if (step.beforeSend) {
            step.beforeSend(jqXHR, settings);
          }
        },

        complete: function (response) {
          if (response.status === 200) {
            $icon
              .removeClass('fa-spin fa-spinner')
              .addClass('fa-check text-success');

            if (step.success) {
              step.success(response.responseJSON);
            }
          } else {
            $icon
              .removeClass('fa-spin fa-spinner')
              .addClass('fa-cross text-danger');

            if (step.failure) {
              step.failure(response.responseJSON);
            }
          }
        },
      }));
    });
  }

  function installCompleted() {
    var $list = $('#install-croogo').find('.list');
    var steps = [
      {
        title: 'Site configuration',
        uri: '/installer/scripts/siteConfiguration.php',
        ajaxOptions: function () {
          var databaseData = $('#database-config').find('form').serializeArray();
          var siteData = $('#site-details').find('form').serializeArray();
          var allData = databaseData.concat(siteData);
          return {
            data: allData, method: 'POST',
          };
        },
      },
      {
        title: 'Database installation',
        uri: '/installer/scripts/databaseInstall.php', ajaxOptions: function () {
          var databaseData = $('#database-config').find('form').serializeArray();
          return {
            data: databaseData, method: 'POST',
          };
      },
      },
      {
        title: 'Move files',
        uri: '/installer/scripts/moveFiles.php',
        success: function () {
          $('#install-croogo .disabled').removeClass('disabled');
        },
      },

//      {
//        title: 'Test installation',
//        uri: '/test-installation',
//      },
    ];

    runSteps('finalise', steps, $list);
  }

  function installDependencies(dependencies) {
    var $list = $('#install-croogo').find('.list');
    var $progress = $('<progress class="progress" value="0" max="100">0%</progress>');
    var $step = $('<span></span>');
    var $wrapper = $('<div></div>');
    var $listItem = $('<li></li>');
    var $icon = $('<i class="fa fa-spin fa-spinner"></i>');
    var currentProgress = 0;
    var uri = '/installer/scripts/installPackage.php';
    var done = 0;
    var total = dependencies.length;
    var step = Math.ceil(100 / total);

    $listItem
      .append($icon)
      .append(' Downloading Croogo files');

    $wrapper
      .append($step)
      .append($progress)
      .appendTo($listItem);

    $listItem.appendTo($list);

    dependencies.forEach(function (dependency) {
      var packageName = dependency.package;
      var version = dependency.version;

      $.ajaxq('downloader', {
        url: uri, data: {
          package: packageName, version: version,
        },

        beforeSend: function () {
          $step.text('Now installing ' + packageName);
        },

        complete: function () {
          currentProgress += step;
          $progress
            .val(parseInt(currentProgress, 10))
            .text(currentProgress + '%');

          done++;

          if (done >= total) {
            $wrapper.remove();
            $icon
              .removeClass('fa-spin fa-spinner')
              .addClass('fa-check text-success');
            installCompleted();
          }
        },
      });
    });
  }

  function croogoInstaller() {
    var $list = $('#install-croogo').find('.list');
    var steps = [
      {
        title: 'Creating initial files',
        uri: '/installer/scripts/createProject.php',
      },
      {
        title: 'Determining dependencies',
        uri: '/installer/scripts/getDependencies.php',
        success: function (response) {
          installDependencies(response);
        },
      },
    ];

    runSteps('installer', steps, $list);
  };

  var $tabButtons = $('#tab-buttons');

  $('#tab-content')
    .on('click', 'button[data-action]', function (e) {
      e.preventDefault();
      var $this = $(this);
      var $currentTab = $tabButtons.find('.active');
      var action = $this.data('action');

      if (action === 'next' && $currentTab.data('next')) {
        $currentTab.parent().next().find('a').tab('show');
      } else {
        if (action === 'previous' && $currentTab.data('previous')) {
          $currentTab.parent().prev().find('a').tab('show');
        }
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
      var target = e.target.href.split('#')[1];
      var allValid = true;

      $('#' + target).find(':input').each(function () {
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
