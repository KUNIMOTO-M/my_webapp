class StatesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @reason = current_user.states.build(reason_params)
    @reason.save
  end

  def destroy
    @reason = current_user.states.find_by(user_id: params[:id], reason: params[:reason])
    @reason.destroy
  end

  def index
    states = current_user.states.all
    render json: states
  end

  private

  def reason_params
    params.require(:state).permit(:reason)
  end

end
