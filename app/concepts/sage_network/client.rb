# frozen_string_literal: true

require 'net/http'
require 'openssl'
require 'uri'
require 'socket'

module SageNetwork
  # The client class to perform API calls
  class Client
    # Set the bearer token
    def self.bearer_token=(token)
      RequestStore.store[:lockstep_bearer_token] = token
      RequestStore.store[:lockstep_api_key] = nil

      true
    end

    # Get the bearer token
    def self.bearer_token
      RequestStore.store[:lockstep_bearer_token]
    end

    ##
    # Construct a new Lockstep API client targeting the specified server.
    #
    # @param env [string] Either "sbx", "prd", or the URI of the server, ending in a slash (/)
    def initialize(env)
      @version = '2022.4.32.0'
      @env = case env
             when 'sbx'
               'https://api.sbx.lockstep.io/'
             when 'prd'
               'https://api.lockstep.io/'
             else
               env
             end
    end

    ##
    # Configure this API client to use JWT Bearer Token authentication
    #
    # @param bearer_token [string] The [JWT Bearer Token](https://developer.lockstep.io/docs/jwt-bearer-tokens) to use for authentication
    def with_bearer_token(token)
      self.class.bearer_token = token

      self
    end

    def bearer_token
      self.class.bearer_token
    end

    ##
    # Configure this API to use an application name
    #
    # @param app_name [string] The name of the application
    def with_app_name(app_name)
      @app_name = app_name
    end

    ##
    # Send a request to the API and return the results
    #
    # Sends a request to the
    def request(method, path, body, params)
      uri = URI(@env + path)
      uri.query = URI.encode_www_form(params) unless params.nil?

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = "Net::HTTP::#{method.to_s.capitalize}".constantize.new(uri)

      # Set headers and body for request
      request['Accept'] = 'application/json'
      request['Content-Type'] = 'application/*+json'
      request['SdkType'] = 'Ruby'
      request['SdkVersion'] = '2022.4.32.0'
      request['MachineName'] = Socket.gethostname
      body = body.to_json unless body.is_a?(String)
      request.body = body

      # If there is an application name
      request['ApplicationName'] = @app_name unless @app_name.nil?
      request['Authorization'] = "Bearer #{bearer_token}" if bearer_token.present?

      # Send the request
      http.request(request)
    end

    def get(path, params: {})
      request(:get, path, nil, params)
    end

    def post(path, body: {}, params: {})
      request(:post, path, body, params)
    end

    def patch(path, body: {}, params: {})
      request(:patch, path, body, params)
    end

    def put(path, body: {}, params: {})
      request(:put, path, body, params)
    end

    def delete(path, body: {})
      request(:delete, path, body, {})
    end

    def with_logger(&block)
      block.call
    end
  end
end
