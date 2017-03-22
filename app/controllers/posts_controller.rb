class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    response = []
    @posts = Post.all
    @posts.each do |post|
      p = {}
      candidate = post.candidate
      political_party = candidate.political_party
      constituency = candidate.const
      agendas = post.agendas
      p = post.as_json
      party = {}
      party['name'] = political_party.name
      party['logo'] = political_party.logo
      party['constituency'] = constituency.as_json
      party['candidate'] = candidate.as_json
      p['agendas'] = agendas
      p['political_party'] = party
      response << p
    end

    render json: response
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      render :show, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {})
    end
end
