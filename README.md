Pan & Tilt Controller
================================

This code is part of my internet controlled pan and tilt system project.

Pan & Tilt Controller connects to [Pan & Tilt Server](https://github.com/Pranas/pan_tilt_server) using [Socket.IO](http://socket.io/) client library by [@lyondhill](https://github.com/lyondhill/socket.io-ruby-client). It listens for commands from server, translates them and sends them to [Pan & Tilt Driver](https://github.com/Pranas/pan_tilt_driver) over serial port.

It's written in Ruby language.

## Prerequisites

You need to have Ruby (tested on 1.9.3) and Bundler installed on your system.

You can use [RVM](http://rvm.io/), [rbenv](http://github.com/sstephenson/rbenv) or your package manager to install Ruby.

Once you have Ruby installed, run

    $ gem install bundler

to install Bundler. You might need to use ``sudo`` depending on the way you installed Ruby.

## Run

Install dependencies:

    $ bundle install

Start the controller:

    $ bundle exec controller.rb <Pan&Tilt server url> <Pan&Tilt driver serial port>
