class VideosController < ApplicationController
  def index()
    @video = Video.new()
    @video.save()
  end
  def next()
    @video =Video.find(params[:id])
    @video.active=1
    @video.connected_to = nil
    @video.save()
    @video.strangerConnect()
  end
end
