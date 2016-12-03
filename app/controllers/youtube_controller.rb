class YoutubeController < ApplicationController
  def index
    @videos = Yt::Collections::Videos.new
      .where(q: params[:q], order: :relevance)
      .take(15)

    render json: @videos
  end
end
