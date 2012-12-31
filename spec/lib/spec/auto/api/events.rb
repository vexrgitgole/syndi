# Auto 4
# Copyright (c) 2013, Auto Project
# Distributed under the terms of the FreeBSD license (LICENSE.md).

module Spec
  module Auto
    module API
      class Events
        def initialize
          [:call,:on,:del].each do |x|
            define_singleton_method(x) { |*args| nil }
          end
        end
      end
    end
  end
end

# vim: set ts=4 sts=2 sw=2 et:
