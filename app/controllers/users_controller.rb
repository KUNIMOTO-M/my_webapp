class UsersController < ApplicationController
  before_action :correct_user, only: %i[edit update]

  def show_notice
    profile_show
    @notices = @user.notices.paginate(page: params[:page])
    render :show
  end

  def show_microposts
    profile_show
    @microposts = @user.microposts.paginate(page: params[:page])
    render :show
  end

  def show_files
    profile_show
    @files = @user.fileas
    render :show
  end

  def index
    @indeies = User.all
  end

  def edit
    @user = User.find_by(id: current_user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'プロフィールを編集しました'
      redirect_to show_notice_user_path(@user)
    else
      render 'edit'
    end
  end

  def search
    if params[:area]
      @users = User.where(area: params[:area])
    elsif params[:search]
      unless params[:search].blank?
        @users = User.where('name LIKE ? OR introduction LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
      end
    elsif params[:reason]
      @states = State.where(reason: params[:reason])
      @users = @states.map do |state|
        User.find_by(id: state.user_id)
      end
    end
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def message
    @message = current_user.entries
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :file, :area, :introduction,
                                   :reason)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user == @user
    end

    def profile_show
      @user = User.find_by(id: params[:id])
      # プロフィール画面で掲示板投稿を表示
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      room
    end
end
