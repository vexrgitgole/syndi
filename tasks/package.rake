# Copyright (c) 2013, Autumn Perrault, et al. All rights reserved.
# This free software is distributed under the FreeBSD license (LICENSE.md).

require 'rubygems'
require 'rubygems/package_task'

desc 'Package the gem.'
Gem::PackageTask.new($gemspec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

# vim: set ts=4 sts=2 sw=2 et:
