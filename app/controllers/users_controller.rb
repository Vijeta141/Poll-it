class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.to_a
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def opinion
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    agendas = @post.agendas
    if params[:opinion] = 'support'
      @post.support_no = @post.support_no + 1
      agendas.each do |a|
        a.support_no = a.support_no + 1
        a.save
      end
    else
      @post.oppose_no = @post.oppose_no + 1
      agendas.each do |a|
        a.oppose_no = a.oppose_no + 1
        a.save
      end
    end
    @post.save
    rel = UserToPost.new
    rel.from_node = @user
    rel.to_node = @post
    rel.opinion = params[:opinion]
    rel.save

    render json: rel

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {}).permit(:name,:age,:religion,:caste,:education,:eco_strata)
    end
end
