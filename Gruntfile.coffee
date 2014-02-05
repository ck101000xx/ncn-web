module.exports = (grunt) ->
  grunt.initConfig
    browserify:
      build:
        files:
          'build/js/toilets.js': 'src/app/toilets.coffee'
        options:
          transform: ['coffeeify', 'reactify/undoubted']
          shim: grunt.file.readYAML('shim.yaml')
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.registerTask 'dev', ['browserify']
