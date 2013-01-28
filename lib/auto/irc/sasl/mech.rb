# Copyright (c) 2013, Autumn Perrault, et al. All rights reserved.
# This free software is distributed under the FreeBSD license (see LICENSE).

module Auto
  module IRC
    module SASL
      module Mech
        autoload :DHBlowfish, 'auto/irc/sasl/mech/dh_blowfish'
        autoload :Plain,      'auto/irc/sasl/mech/plain'
      end
    end
  end
end

# vim: set ts=4 sts=2 sw=2 et:
