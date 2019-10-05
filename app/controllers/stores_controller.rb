class StoresController < ApplicationController

  def new
    @store = Store.new
  end

  def create
    binding.pry
    @store = Store.new(store_params)
    if @store.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def store_params
    params.require(:store).permit(:name, :visit_day, :image).merge(user_id: current_user.id)
  end

end
