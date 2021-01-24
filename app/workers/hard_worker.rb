class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    def destroy
      @code.destroy
      respond_to do |format|
        format.html { redirect_to codes_url, notice: 'Code was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
end
