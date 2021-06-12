class Api::V1::NoticesController < ApiController
before_action :correct_user,   only: :destroy

	def create
		@notice = current_user.notices.build(notice_params)
		if @notice.save
			flash[:success] = "投稿しました"
			redirect_to notices_url
		else
			flash[:danger] = "投稿できませんでした"
			redirect_to notices_url
		end
	end

	def show
		@notice = Notice.find_by(id: params[:id])
		
		@user = @notice.user
		@currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    room
	end

	def search
		if params[:area]
			@notices = Notice.where(area: params[:area])
			@notices = @notices.paginate(page: params[:page])
		elsif params[:search]
			if !params[:search].blank?
				@notices = Notice.where("notice_title LIKE ? OR notice_body LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
				@notices = @notices.paginate(page: params[:page])
			end
		else
		end
	end
	
	

	def destroy
		@notice = current_user.notices.find_by(id: params[:id])
		@notice.destroy
		flash[:success] = "投稿を削除しました"
		redirect_to notices_url
	end

	def index
		notices = Notice.joins(:user).select("notices.*,users.*")
		#同じページに投稿formを作る
		@notice = Notice.new	
		render json: notices
	end

	private

	def notice_params
    params.require(:notice).permit(:notice_title, :notice_body, :area, :search)
	end

	def correct_user
		@notice = current_user.notices.find_by(id: params[:id])
		redirect_to(root_url) if @notice.nil?
	end
	
end
