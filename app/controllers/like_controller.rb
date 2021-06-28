class LikeController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    render json: Like.filter_by_post(params[:micropost_id]).select(:id, :user_id, :micropost_id)
    # like.rbにスコープを指定。
    # Like.where(micropost_id: params[:micropost_id]).select(:id, :user_id, :micropost_id )
  end

  def create
    current_user.likes.create!(likes_params)
    head :created
  end

  def destroy
    current_user.likes.find(params[:id]).destroy!
    head :ok
  end

  def userid
    @user = current_user.id
    render json: @user
  end

  private

    def likes_params
      params.require(:like).permit(:micropost_id)
    end
end
