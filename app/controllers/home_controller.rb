class HomeController < ApplicationController
  require 'json'

  def index
    session[:page] = params[:page] ? params[:page] : 1
    @vehicles = Vehicle.all
    @vehicles = @vehicles.paginate(:page => session[:page], :per_page => 10) if @vehicles.present?
  end

  def show_damage
    @vehicle = Vehicle.find(params[:id])
    @damage = @vehicle.damage
  end

  def edit_damage
    @vehicle = Vehicle.find(params[:id])
    @damage = @vehicle.damage.present? ? @vehicle.damage : Damage.new
  end

  def save_damage
    vehicle = Vehicle.find(params[:id])
    if vehicle.damage
      @damage = vehicle.damage
      if @damage.update damage_params
        redirect_to root_path
      else
        render edit_damage_path vehicle
      end
    else
      create_damage vehicle
    end
  end

  private

  def damage_params
    params.require(:damage).permit(:data, :vehicle_id)
  end

  def create_damage(vehicle)
    params[:damage][:vehicle_id] = params[:id]
    @damage = Damage.new damage_params
    if @damage.save
      vehicle.update damage: @damage
      redirect_to root_path
    else
      render edit_damage_path vehicle
    end
  end
end
