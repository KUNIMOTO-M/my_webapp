class MicropostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :correct_user, only: [:destroy]
  def index
    @microposts = Micropost.joins(:user).select('microposts.*, users.name, users.image')
    @microposts.map do |micropost|
      micropost.image = micropost.user.image.url if micropost.image
    end
    respond_to do |format|
      format.html
      format.json { render json: @microposts }
    end
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:notice] = 'マイクロポストを投稿しました'
    else
      flash[:danger] = '投稿できませんでした'
    end
    redirect_to microposts_url
  end

  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    @micropost.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to microposts_url
  end

  def search
    if params[:search] && !params[:search].blank?
      @microposts = Micropost.where('content LIKE ?', "%#{params[:search]}%")
      @microposts = @microposts.paginate(page: params[:page])
    end
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to(root_url) if @micropost.nil?
    end
end
