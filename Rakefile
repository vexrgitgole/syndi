# Copyright (c) 2013, Autumn Perrault, et al. All rights reserved.
# This free software is distributed under the FreeBSD license (see LICENSE).

# import the gemspec
GEMSPEC    = 'syndi.gemspec'
$gemspec ||= eval(File.read(GEMSPEC), binding, GEMSPEC)

def perform t
  Rake::Task[t].invoke
end

# Directives for Ruby Make (rake)
# to test/compile Syndi 4, and optionally
# push to RubyGems

# load all of the tasks
Dir["tasks/**/*.rake"].each do |t|
  load File.expand_path t
end

# groups
if ENV['CI']
  task :default => %i[compile spec]
else
  task :default => %i[compile native gem]
end
task :typical => %i[compile spec]
task :full    => %i[clean typical gem install]

# vim: set ts=4 sts=2 sw=2 et:
