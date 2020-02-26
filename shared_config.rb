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
