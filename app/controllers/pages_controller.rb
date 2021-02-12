class PagesController < ApplicationController
  def index
    WallChannel.broadcast_to(@code, body: "test")
  end
end
