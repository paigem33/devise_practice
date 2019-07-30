class SkateboardsController < ApplicationController
  before_action :set_skateboard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /skateboards
  # GET /skateboards.json
  def index
    @skateboards = Skateboard.all
  end

  # GET /skateboards/1
  # GET /skateboards/1.json
  def show
  end

  # GET /skateboards/new
  def new
    @skateboard = Skateboard.new
  end

  # GET /skateboards/1/edit
  def edit
  end

  # POST /skateboards
  # POST /skateboards.json
  def create
    @skateboard = current_user.skateboards.new(skateboard_params)

    respond_to do |format|
      if @skateboard.save
        format.html { redirect_to @skateboard, notice: 'Skateboard was successfully created.' }
        format.json { render :show, status: :created, location: @skateboard }
      else
        format.html { render :new }
        format.json { render json: @skateboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skateboards/1
  # PATCH/PUT /skateboards/1.json
  def update
    respond_to do |format|
      if @skateboard.update(skateboard_params)
        format.html { redirect_to @skateboard, notice: 'Skateboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @skateboard }
      else
        format.html { render :edit }
        format.json { render json: @skateboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skateboards/1
  # DELETE /skateboards/1.json
  def destroy
    @skateboard.destroy
    respond_to do |format|
      format.html { redirect_to skateboards_url, notice: 'Skateboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skateboard
      @skateboard = Skateboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skateboard_params
      params.require(:skateboard).permit(:design, :board_type, :user_id)
    end
end
