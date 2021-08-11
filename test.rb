require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '2000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/exercice', WEBrick::HTTPServlet::ERBHandler, 'exercice.html.erb')
server.mount('/goya_4.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya_4.rb')
server.start