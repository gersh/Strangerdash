class VideosController < ApplicationController
  def index()
    @video = Video.new()
    @video.save()
  end
  def next()
    @video =Video.find(params[:id])
    @video.strangerConnect()
  end
end
