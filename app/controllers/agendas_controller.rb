class AgendasController < ApplicationController
  before_action :set_agenda, only: [:show, :update, :destroy]

  # GET /agendas
  # GET /agendas.json
  def index
    @agendas = Agenda.all
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
  end

  # POST /agendas
  # POST /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)

    if @agenda.save
      render :show, status: :created, location: @agenda
    else
      render json: @agenda.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agendas/1
  # PATCH/PUT /agendas/1.json
  def update
    if @agenda.update(agenda_params)
      render :show, status: :ok, location: @agenda
    else
      render json: @agenda.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    @agenda.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_params
      params.fetch(:agenda, {})
    end
end
