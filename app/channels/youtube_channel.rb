require Rails.root.join('lib', 'youtube_dl')

class YoutubeChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'youtube'

    sleep 1
    ActionCable.server.broadcast 'youtube', t: 'hello'
  end

  def receive(data)
    ActionCable.server.broadcast('youtube', data)

    YoutubeDl.download(data["url"]) do |line|
      ActionCable.server.broadcast('youtube', line)
    end
  end
end
