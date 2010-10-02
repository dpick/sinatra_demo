require 'rubygems'
require 'sinatra'
require 'itunes_mac'

$itunes = Itunes.new

get '/' do
  ['name', 'artist', 'album'].each { |attribute| (eval "@#{attribute} = $itunes.current(attribute)") } if $itunes.launched?

  haml :index 
end

post '/musicplayer' do
  params.keys.each { |method| $itunes.send(method) if $itunes.respond_to?(method) }
  redirect '/'
end
