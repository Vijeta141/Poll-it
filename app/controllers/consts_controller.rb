class ConstsController < ApplicationController
  before_action :set_const, only: [:show, :update, :destroy]

  # GET /consts
  # GET /consts.json
  def index
    @consts = Const.all
  end

  # GET /consts/1
  # GET /consts/1.json
  def show
  end

  # POST /consts
  # POST /consts.json
  def create
    @const = Const.new(const_params)

    if @const.save
      render :show, status: :created, location: @const
    else
      render json: @const.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consts/1
  # PATCH/PUT /consts/1.json
  def update
    if @const.update(const_params)
      render :show, status: :ok, location: @const
    else
      render json: @const.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consts/1
  # DELETE /consts/1.json
  def destroy
    @const.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_const
      @const = Const.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def const_params
      params.fetch(:const, {})
    end
end
