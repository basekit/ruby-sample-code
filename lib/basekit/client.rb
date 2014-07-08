require 'addressable/uri'
require 'typhoeus'
require 'json'
require 'oauth'
require 'oauth/request_proxy/typhoeus_request'

module BaseKit
  class Client

    attr_accessor :api_base_url, :consumer_key, :consumer_secret, :access_token, :access_secret

    def initialize(options = {})
      options.each do |key, value|
        send(:"#{key}=", value)
      end

      @oauth_consumer = OAuth::Consumer.new(
        consumer_key,
        consumer_secret,
        :site => api_base_url
      )
    end

    def get(path)
      request = create_request(:get, path, nil)
      response = request.run
      JSON.parse(response.body)
    end

    def post(path, parameters)
      request = create_request(:post, path, parameters)
      request.run
    end

    private

    def create_request(method, path, body)
      request_token = @oauth_consumer.get_request_token(:oauth_callback => '')
      token = OAuth::Token.new(access_token, access_secret)
      oauth_params = {
        :consumer => @oauth_consumer,
        :token => token,
      }

      url = api_base_url + path

      request = Typhoeus::Request.new(url, {
        method: method,
        headers: { "Content-Type" => "application/json" },
        body: body.to_json
      })

      oauth_helper = OAuth::Client::Helper.new(request, oauth_params.merge(:request_uri => url))
      request.options[:headers]["Authorization"] = oauth_helper.header
      request
    end

  end
end
