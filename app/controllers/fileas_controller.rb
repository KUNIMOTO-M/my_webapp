class FileasController < ApplicationController

  def new
    @file = Filea.new
  end

  def create
    @file = current_user.fileas.build(filea_params)
    if @file.save
      flash[:success] = "投稿しました"
			redirect_to show_files_user_path(current_user)
    else
      flash[:danger] = "投稿できませんでした"
			redirect_to show_files_user_path(current_user)
    end
  end

  def destroy
    @file = current_user.fileas.find_by(id: params[:id])
		@file.destroy
		flash[:success] = "投稿を削除しました"
		redirect_to show_files_user_path(current_user)
  end

  private

  def filea_params
    params.require(:filea).permit(:title, :content, :file)
  end
end
