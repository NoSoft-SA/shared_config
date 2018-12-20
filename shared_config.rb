#!/usr/bin/env ruby

# frozen_string_literal: true

require 'drb/drb'
require 'dotenv'

require './config_engine'

Dotenv.load('.env.local', '.env')

object = ConfigEngine.new

DRb.start_service("druby://#{ENV.fetch('SHARED_CONFIG_HOST_PORT')}", object)
puts 'Started...'
DRb.thread.join

# TODO: add:
# - README
# x VERSION
# - git
# - .env for host and port
# - Gemfile
# x Auto-start service
# - clean shutdown on interrupt
# - capistrano deploy
# - on deploy, rewrite wrapper and service files with appropriate paths
#   (symlinks an issue? for systemd?)
