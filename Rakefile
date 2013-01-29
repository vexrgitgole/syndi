# Copyright (c) 2013, Autumn Perrault, et al. All rights reserved.
# This free software is distributed under the FreeBSD license (see LICENSE).

# import the gemspec
GEMSPEC    = 'Auto.gemspec'
$gemspec ||= eval(File.read(GEMSPEC), binding, GEMSPEC)

def perform t
  Rake::Task[t].invoke
end

# Directives for Ruby Make (rake)
# to test/compile Auto 4, and optionally
# push to RubyGems

# load all of the tasks
Dir["tasks/**/*.rake"].each do |t|
  load File.expand_path t
end

# groups
task :default => %i[compile test]
task :full    => %i[clean default gem install]
task :build   => %i[compile native gem install]

# vim: set ts=4 sts=2 sw=2 et:
