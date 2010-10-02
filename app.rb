require 'rubygems'
require 'sinatra'
require 'itunes_mac'

$itunes = Itunes.new

get '/' do
  ['name', 'artist', 'album'].each { |name| (eval "@#{name} = $itunes.current(name)") } if $itunes.launched?

  haml :index 
end

post '/musicplayer' do
  #object.send - calls the passed method
  params.each { |method, value| $itunes.send(method) if $itunes.respond_to?(method) }
  redirect '/'
end
