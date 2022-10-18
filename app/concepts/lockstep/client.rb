require 'net/http'
require 'openssl'
require 'uri'
require 'socket'

module Lockstep
  class Client


    def self.set_bearer_token(token)
      RequestStore.store[:lockstep_bearer_token] = token
      RequestStore.store[:lockstep_api_key] = nil

      true
    end

    def self.bearer_token
      RequestStore.store[:lockstep_bearer_token]
    end

    def self.set_api_key(key)
      RequestStore.store[:lockstep_api_key] = key
      RequestStore.store[:lockstep_bearer_token] = nil

      true
    end

    def self.api_key
      RequestStore.store[:lockstep_api_key]
    end

    def self.set_internal_service_key(key)
      RequestStore.store[:internal_service_key] = key
    end

    def internal_service_key
      RequestStore.store[:internal_service_key]
    end

    ##
    # Construct a new Lockstep API client targeting the specified server.
    #
    # @param env [string] Either "sbx", "prd", or the URI of the server, ending in a slash (/)
    def initialize(env)
      @version = "2022.4.32.0"
      @env = case env
             when "sbx"
               "https://api.sbx.lockstep.io/"
             when "prd"
               "https://api.lockstep.io/"
             else
               env
             end
    end

    ##
    # Configure this API client to use API key authentication
    #
    # @param api_key [string] The [Lockstep Platform API key](https://developer.lockstep.io/docs/api-keys) to use for authentication
    def with_api_key(api_key)
      self.class.set_api_key(api_key)

      self
    end

    ##
    # Configure this API client to use JWT Bearer Token authentication
    #
    # @param bearer_token [string] The [JWT Bearer Token](https://developer.lockstep.io/docs/jwt-bearer-tokens) to use for authentication
    def with_bearer_token(token)
      self.class.set_bearer_token(token)

      self
    end

    def bearer_token
      self.class.bearer_token
    end

    def api_key
      self.class.api_key
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

      url = URI(@env + path)
      if !params.nil?
        url.query = URI.encode_www_form(params)
      end

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = case method
                when :get
                  Net::HTTP::Get.new(url)
                when :post
                  Net::HTTP::Post.new(url)
                when :patch
                  Net::HTTP::Patch.new(url)
                when :put
                  Net::HTTP::Put.new(url)
                when :delete
                  Net::HTTP::Delete.new(url)
                end

      # Set headers and body for request
      request["Accept"] = 'application/json'
      request["Content-Type"] = 'application/*+json'
      request["SdkType"] = 'Ruby'
      request["SdkVersion"] = '2022.4.32.0'
      request["MachineName"] = Socket.gethostname
      request["LS-InternalService"] = internal_service_key if internal_call?
      body = body.to_json unless body.is_a?(String)
      request.body = body

      # If there is an application name
      if @app_name != nil
        request["ApplicationName"] = @app_name
      end

      # Which authentication are we using?
      if api_key != nil
        request["Api-Key"] = api_key
      end
      if bearer_token != nil
        request["Authorization"] = 'Bearer ' + bearer_token
      end

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

    def delete(path)
      request(:delete, path, {}, {})
    end

    def post_magic_link(path, body: {}, params: {})
      @internal_call = true
      request(:post, path, body, params)
    end

    def internal_call?
      !!internal_call
    end

    def with_logger(&block)
      block.call
    end
  end
end