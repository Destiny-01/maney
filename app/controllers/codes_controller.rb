class CodesController < ApplicationController
  before_action :check_quota, only: [:create]
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all
  end

  # GET /codes/1
  # GET /codes/1.json
  def show
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit 
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = current_user.codes.build(code_params)
    # @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
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
    def check_quota
      if Code.count >= 5
        @quota_warning = "code limit reached."
      end
    end

    def set_code
      # Rails.logger.info params[:hashid]
      @code = Code.find_by_hashid(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def code_params
      params.require(:code).permit(:title, :body, :language)
    end
end
