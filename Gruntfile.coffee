module.exports = (grunt) ->
  grunt.initConfig
    browserify:
      build:
        files:
          'build/js/ncn.js': 'src/ncn.coffee'
          'build/js/toilet-list.js': 'src/toilet-list.coffee'
        options:
          transform: ['coffeeify', 'reactify/undoubted']
          shim:
            riot:
              path: 'bower_components/riotjs/riot.js'
              exports: '$'
            underscore:
              path: 'bower_components/underscore/underscore.js'
              exports: '_'
            q:
              path: 'bower_components/q/q.js'
              exports: 'Q'
            react:
              path: 'bower_components/react/react.min.js'
              exports: 'React'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.registerTask 'dev', ['browserify']
