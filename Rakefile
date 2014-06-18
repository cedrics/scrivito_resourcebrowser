#!/usr/bin/env rake

require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'jasmine'
load 'jasmine/tasks/jasmine.rake'
load File.expand_path('../spec/dummy/Rakefile', __FILE__)
Rake::Task['jasmine:server'].enhance ['assets:clobber', 'assets:precompile']
