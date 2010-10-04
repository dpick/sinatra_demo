require 'rubygems'
require 'sinatra'
require 'itunes_mac'

$itunes = Itunes.new

get '/' do
  @name = $itunes.current('name')
  @artist = $itunes.current('artist')
  @album = $itunes.current('album')

  haml :index 
end

get '/:name' do |param|
  halt "Invalid Parameter #{param}" if not ['name', 'artist', 'album'].include?(param)
  eval "@#{params[:name]} = $itunes.current('#{params[:name]}')" 

  haml :index
end

post '/musicplayer' do
  params.keys.each { |method| $itunes.send(method) if $itunes.respond_to?(method) }
  redirect '/'
end
