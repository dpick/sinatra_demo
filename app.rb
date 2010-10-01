require 'rubygems'
require 'sinatra'
require 'itunes_mac'

configure do
  $itunes = Itunes.new
end

get '/' do
  if $itunes.launched?
    @title = $itunes.current_track
    @artist = $itunes.current_artist
    @album = $itunes.current_album

    haml :index
  end

  "Itunes must be running"
end

post '/musicplayer' do
  params.each { |k, v| $itunes.send(k) if $itunes.respond_to?(k) }
  redirect '/'
end
