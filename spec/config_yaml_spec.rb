# Auto 4
# Copyright (c) 2013, Auto Project
# Distributed under the terms of the three-clause BSD license.
require 'bacon'
require 'spec/test_helpers'

ORIGINAL_CONF = <<EOF
---
# This is a comment; unicorns are lovely
foo:

  cat:
  - meow
  - purr

  cow:
  - moo

  dinosaur:
  - rawr

EOF

NEW_CONF = <<EOF
---
# This is a comment; unicorns are lovely
foo:

  cat:
  - meow
  - purr

  cow:
  - moo

  dinosaur:
  - rawr

  bunny:
  - unimaginable cuteness that forces you to coo

EOF

BAD_CONF = <<EOF
THIS ARE RUBBISH

THAT W!LL F41L

...0R SHOULD
EOF

HASH_ORIGINAL = {
                  'foo' => {
                            'cat'      => ['meow', 'purr'],
                            'cow'      => ['moo'],
                            'dinosaur' => ['rawr']
                           }
                }

HASH_NEW      = {
                  'foo' => {
                            'cat'      => ['meow', 'purr'],
                            'cow'      => ['moo'],
                            'dinosaur' => ['rawr'],
                            'bunny'    => ['unimaginable cuteness that forces you to coo']
                           }
                }

require 'auto/config'

describe "A configuration using YAML" do

  before do
    File.open('.temp.yaml_config.yml', 'w') do |io|
      io.write ORIGINAL_CONF
    end
    
    @conf = Auto::Config.new('.temp.yaml_config.yml')
  end

  it 'should have a type of YAML' do
    @conf.type.should.equal :yaml
  end

  it 'should have @conf, a Hash' do
    @conf.conf.class.should.equal Hash
  end

  it 'should have #x, a pointer to @conf' do
    @conf.x.should.equal @conf.conf
  end

  it 'should point [x] to @conf[x]' do
    @conf['foo'].should.equal @conf.conf['foo']
  end

  it 'should have correctly processed data' do
    @conf.x.should.equal HASH_ORIGINAL
  end

  it 'should rehash on rehash!()' do
    File.open('.temp.yaml_config.yml', 'w') do |io|
      io.write NEW_CONF
    end
    @conf.rehash!
    @conf.x.should.equal HASH_NEW
  end

  it 'should fail on rehash!() if data is bad' do
    File.open('.temp.yaml_config.yml', 'w') do |io|
      io.write BAD_CONF
    end
    @conf.rehash!.should.equal 0
  end

  it 'should should revert to old data if rehash!() fails' do
    File.open('.temp.yaml_config.yml', 'w') do |io|
      io.write BAD_CONF
    end
    @conf.rehash!
    @conf.x.should.equal HASH_ORIGINAL
  end

  after do
    File.delete('.temp.yaml_config.yml')
  end

end
