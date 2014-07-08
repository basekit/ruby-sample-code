BaseKit Ruby Sample Code
========================

Sample Ruby client code for BaseKit's REST API. This isn't a gem, but it
illustrates how to sign an API request successfully in Ruby. It's intended as a
point of reference for integrating Ruby-based systems with our API.

Usage
-----

```ruby
client = BaseKit::Client.new({
  :api_base_url    => "http://rest.basekit.almost",
  :consumer_key    => "[your consumer key here]",
  :consumer_secret => "[your consumer secret here]",
  :access_token    => "[your access token here]",
  :access_secret   => "[your access token secret here]",
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
```

Contributing
------------

It'd be awesome to turn this sample code into a fully-fledged gem for easy
installation via your project's Gemfile. Pull requests helping us move in that
direction would be most welcome.

License
-------

This code is released under the [MIT License].

[MIT License]: http://www.opensource.org/licenses/MIT
