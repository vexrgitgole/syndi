# Auto 4
# Copyright (c) 2013, Auto Project
# Distributed under the terms of the FreeBSD license (LICENSE.md).

module Auto
  module IRC
    module State
      
      # A state-management class which records the various capabilities of the
      # IRC daemon.
      #
      # @!attribute cap
      #   @return [Array<String>] A list of enabled capabilities.
      #
      # @!attribute :sasl_method
      #   @return [Symbol] Method of SASL authentication (+:plain+ or +:dh_blowfish+).
      class Support

        attr_accessor :cap, :sasl_method

        def initialize
          @cap         = []
          @sasl_method = nil
        end

      end # class Support

    end # module State

  end # module IRC

end # module Auto

# vim: set ts=4 sts=2 sw=2 et:
