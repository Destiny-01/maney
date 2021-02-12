class HomeController < ApplicationController
  def index
  end

  def home
    @code
    ActionCable.server.broadcast(
      'code_channel',
      {
        id: @code.id,
        title: @code.title,
        body: @code.body
      }
    )
  end
end
