module PaperCup
  class Client
    attr_accessor :options

    def initialize(opts)
      @options = opts
    end

    def url
      options.fetch(:url)
    end

    def headers
      options[:headers] || {}
    end

    def params
      options[:params] || {}
    end

    def merged_opts_for_request(opts)
      _method  = opts[:method] || :get
      _url     = File.join(url, opts.fetch(:path).to_s)
      _headers = headers.merge(opts[:headers] || {})
      _params  = params.merge(opts[:params] || {})

      { method: _method, url: _url, headers: _headers, params: _params }
    end

    PaperCup::METHODS.each do |method|
      define_method(method) do |path, opts = {}|
        opts = merged_opts_for_request(
          method: method,
          path:   path,
          **opts
        )
        Request.new(opts).exec
      end
    end

    def endpoint(path, opts = {})
      opts = merged_opts_for_request opts.merge(path: path)
      opts.reject! do |k,v|
        k == :method
      end

      return self.class.new(opts)
    end
  end
end
