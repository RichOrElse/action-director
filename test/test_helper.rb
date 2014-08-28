require 'bundler/setup'
require 'action_director'
require 'minitest/unit'
require 'minitest/autorun'
require 'minitest/pride'
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]