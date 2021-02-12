class WallChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "wall_channel"
    code = Code.find_by_hashid(params[:id])
    stream_for code
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
