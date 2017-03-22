class PoliticalPartiesController < ApplicationController
  before_action :set_political_party, only: [:show, :update, :destroy]

  # GET /political_parties
  # GET /political_parties.json
  def index
    @political_parties = PoliticalParty.all
  end

  # GET /political_parties/1
  # GET /political_parties/1.json
  def show
  end

  # POST /political_parties
  # POST /political_parties.json
  def create
    @political_party = PoliticalParty.new(political_party_params)

    if @political_party.save
      render :show, status: :created, location: @political_party
    else
      render json: @political_party.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /political_parties/1
  # PATCH/PUT /political_parties/1.json
  def update
    if @political_party.update(political_party_params)
      render :show, status: :ok, location: @political_party
    else
      render json: @political_party.errors, status: :unprocessable_entity
    end
  end

  # DELETE /political_parties/1
  # DELETE /political_parties/1.json
  def destroy
    @political_party.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_political_party
      @political_party = PoliticalParty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def political_party_params
      params.fetch(:political_party, {})
    end
end
