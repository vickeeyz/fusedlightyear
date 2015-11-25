use Rack::Static,
  :urls => ["/js", "/css", "/less"],
  :root => "public"

  map url do
    run Proc.new { |env|
      [
        200,
        {
          'Content-Type'  => 'text/html',
          'Cache-Control' => 'public, max-age=6400'
        },
        File.open('public' + url, File::RDONLY)
      ]
    }
  end
