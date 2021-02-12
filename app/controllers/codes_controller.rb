class CodesController < ApplicationController

  # before_action :set_code, only: [:show, :edit, :update, :destroy]
  before_action :set_code, only: %I[show edit update destroy]
  before_action :authenticate_user!, only: %I[create edit update destroy]
  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all
  end

  # HardWorker.perform_at(2.mins.from.created_at) if current_user.role == "user"

  # GET /codes/1
  # GET /codes/1.json
  def show
  end

  # GET /codes/new
  def new
    @code = current_user.codes.build
  end

  # GET /codes/1/edit
  def edit 
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = current_user.codes.build(code_params)
    # @codes = Code.all/
    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
        # CodesChannel.broadcast(@code)
        ActionCable.server.broadcast(
          'code_channel',
         {
           id: code.id,
           title: code.title,
           body: code.body
         }
        )
        # ActionCable.server.broadcast(Code.all, title: @code.title, body: @code.body)
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codes/1
  # PATCH/PUT /codes/1.json
  def update
    respond_to do |format|
      if @code.update(code_params)
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { render :show, status: :ok, location: @code }
      else
        format.html { render :edit }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to codes_url, notice: 'Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

# Use callbacks to share common setup or constraints between actions.
  def set_code
    # Rails.logger.info params[:hashid]
    @code = Code.find_by_hashid(params[:id])
    @codes = Code.all
  end

  # Only allow a list of trusted parameters through.
  def code_params
    params.require(:code).permit(:title, :body, :language)
  end
end
