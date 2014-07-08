#!/usr/bin/env ruby

require "pathname"
$:.unshift File.expand_path("./lib")
require "basekit"

client = BaseKit::Client.new({
  :api_base_url    => "http://rest.basekit.almost",
  :consumer_key    => "",
  :consumer_secret => "",
  :access_token    => "",
  :access_secret   => "",
})

client.post("/users", {
  :brandRef     => "1",
  :username     => "test",
  :email        => "test@example.org",
  :firstName    => "John",
  :lastName     => "Doe",
  :languageCode => "en",
  :password     => "swordfish",
})

