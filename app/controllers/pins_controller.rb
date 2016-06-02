class PinsController < ApplicationController
  # before_action :authenticate_user!
  before_action :load_user
  before_action :authenticate_user!, only: [:new, :create,:destroy]

  def index
    @pins = @user.present? ? @user.pins : Pin.all
    # selects pins that are left without a user, db trash
  end

  def new
    @pin = Pin.new
  end

  def create
    current_user.pins.create(pin_params)
    redirect_to user_pins_path
  end

  def destroy
    @pin = @user.pins.find(params[:id]);
    @pin.destroy
    redirect_to root_path
  end

  private
  def pin_params
    params.require(:pin).permit(:title, :url)
  end

  def load_user
    if params[:user_id].present?
      begin
        @user = User.find(params[:user_id])
      rescue ActiveRecord::RecordNotFound
        @user = nil
      end
    else
      @user = current_user
    end
  end

end
