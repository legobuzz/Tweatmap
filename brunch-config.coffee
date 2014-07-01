exports.config =

  modules:
    definition: false
    wrapper:    false

  conventions:
    # wrap bower_components into commonjs
    vendor: -> false

	 paths:
    watched: [
      'app'
    ]

  files:
    javascripts:
      joinTo:
        'js/app.js':    /^app/
        'js/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo: 'app.css'
    templates:
      joinTo:
        'js/templates.js': /^.+\.jade$/

  plugins:
    jade:
      options:
        pretty: yes
    static_jade:
      extension: '.html.jade'
      asset:     'public'