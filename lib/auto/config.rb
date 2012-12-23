# Auto 4
# Copyright (c) 2013, Auto Project
# Distributed under the terms of the three-clause BSD license.
autoload :JSON, 'json'
autoload :YAML, 'yaml'

# Namespace: Auto
module Auto

  # A class which provides a functional, simple configuration interface. It is
  # very useful, as it supports both YAML and JSON for configuration. It
  # determines which is appropriate by looking at file extensions.
  #
  # @api Auto
  # @since 4.0.0
  # @author noxgirl
  # @author swarley
  #
  # @!attribute x
  #   @return [Hash{}] This is the hash which contains the data parsed from
  #     the configuration file.
  #
  # @!attribute type
  #   @return [Symbol] Type of configuration: +:yaml+ or +:json+.
  class Config
    
    attr_reader :x, :type

    # Produce a new instance, and attempt to parse.
    #
    # @param [String] filepath Path to configuration file.
    #
    # @raise [ConfigError] If the file extension is not recognized (should be +.yml+ or +.json+).
    def initialize(filepath)

      $m.debug("Trying to initialize configuration from '#{filepath}'...")

      # Set path to file.
      @path = filepath
      
      # Determine the type: YAML or JSON.
      if filepath =~ /\.yml$/
        @type = :yaml
      elsif filepath =~ /\.json$/
        @type = :json
      else
        raise ConfigError, "Unknown file type on #{filepath}."
      end

      # Process the configuration.
      parse!
    
    end

    # Rehash the configuration.
    #
    # If an error occurs, it will revert the configuration to its prior state
    # so that everything can continue to function.
    def rehash!
      
      $m.debug("Configuration file is rehashing.")

      # Keep the old configuration in case of issues.
      oldconf = @x
      @x = {}

      # Rehash.
      begin
        parse!
      rescue => e
        $m.error("Failed to rehash the configuration file! Reverting to old configuration.", false, e)
        @x = oldconf
        return
      end

      # Ensure it really succeeded.
      if @x.empty?
        # Nope. Restore old configuration.
        @x = oldconf
        $m.error("Failed to rehash the configuration file (parser produced empty config)! Reverting to old configuration.")
        return
      end
      
      # bot:onRehash
      $m.events.call('bot:onRehash')

    end

    #######
    private
    #######

    # Parse the configuration file, and output the data to {#x}.
    #
    # @raise [ConfigError] If the file does not exist.
    # @raise [ConfigError] If the file cannot be processed.
    def parse!

      # Ensure foremost that the configuration file exists.
      unless File.exists? @path
        raise ConfigError, "Configuration file '#@path' does not exist!"
        return
      end

      # Get the data from the file.
      f = File.open(@path)
      data = f.read
      f.close

      conf = {}
      # JSON
      if @type == :json

        # Strip comments out of the data.
        data.gsub!(/(#[^"\n\r]*(?:"[^"\n\r]*"[^"\n\r]*)*[\r\n]|\/\*([^*]|\*(?!\/))*?\*\/)(?=[^"]*(?:"[^"]*"[^"]*)*$)/, '')

        # Process the JSON.
        begin
          conf = JSON.parse!(data)
        rescue => e
          raise ConfigError, "Failed to process the JSON in '#@path'", e
        end

      else # Must be YAML
        
        # Process the YAML.
        begin
          y = YAML.parse(data)
          conf = y.to_ruby
        rescue => e
          raise ConfigError, "Failed to process the YAML in '#@path'", e
        end

      end

      @x = conf

    end # def parse

  end # class Config

end # module Auto

# vim: set ts=4 sts=2 sw=2 et: