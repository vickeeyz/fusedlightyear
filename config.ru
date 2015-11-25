use Rack::Static,
  :urls => ["/js", "/css", "/less"],
  :root => "public"

  run Proc.new { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=6400'
    },
    File.open( 'public' + env['PATH_INFO'], File::RDONLY)
  ]
}
