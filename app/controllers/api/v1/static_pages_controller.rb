class Api::V1::StaticPagesController < ApiController
  def home
      microposts = Micropost.paginate(page: params[:page])
      @micropost  = Micropost.new 
      render json: microposts
  end

  def about
  end

  def help
  end
end
