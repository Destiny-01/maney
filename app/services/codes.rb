  class Codes
  
    def initialize(:title, :body)
      @title    = title
      @body  = body
    end
  
    def create
      code = Code.create!(title: @title, body: @body)
  
      ActiveCable.server.broadcast(
        "code_channel",
        {
          id: code.id,
          title: code.title,
          body: code.body
        }
      )
    end
  end