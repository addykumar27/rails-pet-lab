class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.new(owner_params)
    if owner.save
      redirect_to_owner_path(owner)
    else
      flash[:error] = owner.errors.full_messages.join(", ")
      redirect_to_owner_path
    end
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    @owner = Owner.find_by(id: owner_id)
  end

  def update
    owner_id = params [:id]
    @owner = Owner.find_by(id: owner_id)
    if owner.update(owner_params)
      redirect_to_owner_path(owner)
    else
      flash[:error]= owner.errors.full_messages.join(", ")
      redirect_to_owner_path(owner)
    end
  end

  def destroy
    owner_id = params[:id]
    owner = Owner.find_by(id: owner_id)
    owner.destroy
    redirect_to_owner_path
  end

  # TODO: add custom appointments action for convenience

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end
