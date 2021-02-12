class CodesChannel < ApplicationCable::Channel
  # def self.broadcast(code)
  #   broadcast_to code, code:
  #     CodesController.render(file: 'C:/Users/ThePreciousAigbe/Downloads/Destiny/maney/app/views/codes/index.html.erb', locals: { code: code })
  # end
  

  def subscribed
    # code = Code.find_by_hashid(params[:id])
    # stream_for code
    stream_from 'codes_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
end
