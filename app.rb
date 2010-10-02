require 'rubygems'
require 'sinatra'
require 'itunes_mac'

$itunes = Itunes.new

get '/' do
  ['name', 'artist', 'album'].each { |attribute| (eval "@#{attribute} = $itunes.current(attribute)") } if $itunes.launched?

  haml :index 
end

post '/musicplayer' do
  params.each { |method, value| $itunes.send(method) if $itunes.respond_to?(method) }
  redirect '/'
end
