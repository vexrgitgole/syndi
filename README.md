Syndi
=====

_A modern, elegant, extensible multi-protocol chat bot&mdash;reloaded._

**Formerly known as Auto.**

**Version**:            0.1.0 "Phoenix"  
[![Build Status](https://travis-ci.org/syndibot/syndi.png?branch=master)](https://travis-ci.org/syndibot/syndi)
[![Dependency Status](https://gemnasium.com/syndibot/syndi.png)](https://gemnasium.com/syndibot/syndi)
[![Code Climate](https://codeclimate.com/github/syndibot/syndi.png)](https://codeclimate.com/github/syndibot/syndi)

+ [Homepage](http://syndibot.com) (lots of information)
+ [RubyGems](https://rubygems.org/gems/syndi)
+ [Wiki](https://github.com/syndibot/syndi/wiki)
+ [Mailing List](https://groups.google.com/group/syndibot)
+ [Issue Hub](https://github.com/syndibot/syndi/issues)


Our official IRC channel is [#syndi on irc.freenode.net](irc://irc.freenode.net/#syndi).

### Is it Production-Ready&trade;?

Not yet. Syndi 4's a fairly sizable project. We're getting close though.

Synopsis
--------

Syndi is automated chat bot software, developed per this philosophy:

* _Friendly_ to users, and to developers.
* _Simple_, _smart_, and _clean_.
* _Minimal_ but _extensible_.

It is a reboot of Auto, an old IRC bot which, though featureful, suffered of design flaws.

Installation
------------

Please read the [Syndi Handbook](https://github.com/syndibot/syndi/wiki/Handbook).

**Compiling from source:**

```shell
$ git clone git://github.com/syndibot/syndi.git syndi
$ cd syndi/
```
Use a [specific version](https://github.com/syndibot/syndi/tags):

```shell
$ git checkout v4.0.0.alpha.1
```

Or the cutting-edge HEAD:

```shell
$ git checkout master
```

```shell
$ bundle install
$ rake
$ rake install
```

Syndi is currently known to function on these operating systems:

+ Microsoft Windows
+ Mac OS X
+ Linux
+ BSD flavors

Using these Ruby virtual machines:

+ MRI/YARV (official) 2.0.0

Support
-------

If you should find yourself in need of support, please foremost consult with the
documentation on the [wiki](https://github.com/syndibot/syndi/wiki).

If the wiki fails to address your needs, please either:

1. Post to the [syndibot](https://groups.google.com/group/syndibot)
   group under the _support_ category, **or**
2. Join the official IRC chatroom at 
[#syndi on irc.freenode.net](http://webchat.freenode.net/?randomnick=1&channels=#syndi&prompt=1)

**Bugs** should be reported on the [issue management hub](https://github.com/syndibot/syndi/issues).

Authors
-------

Syndi 4 was rewritten from scratch by Autumn Perrault (noxgirl) in Ruby and C,
and is actively developed by the core team.

Legal
-----

Copyright (c) 2009-2013, Autumn Perrault. All rights reserved.

Syndi is free, open-source software, distributed per the terms of the two-clause
("FreeBSD") license, the full terms of which are in [**LICENSE**](LICENSE).
