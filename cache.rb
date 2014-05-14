module ImageProxy

  class Options
    def source
      @hash['source']
    end
  end

  class Cache

    @@cache_dir = '/tmp';

    def self.cache_dir
      @@cache_dir
    end

    def self.cache_dir=(dir)
      @@cache_dir = dir
    end

    def initialize(app)
      @app = app
    end

    def call(env)

      status, headers, response = @app.call(env)

      return [ status, headers, response ] unless response.is_a?(Tempfile)

      tmp_file   = response
      request    = Rack::Request.new(env)
      options    = Options.new(request.path_info, request.params)
      cache_name = Digest::MD5.hexdigest(env['QUERY_STRING']) + File.extname(options.source)

      FileUtils.cp(tmp_file.path, @@cache_dir + '/' + cache_name)
      FileUtils.chmod(0755, @@cache_dir + '/' + cache_name, :verbose => true)

      response = Rack::Response.new
      response.redirect('/cache/' + cache_name)

      response.finish

    end
  end
end
