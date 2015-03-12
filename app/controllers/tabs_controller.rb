class TabsController < ApplicationController
  before_action :set_tab, only: [:show, :edit, :update, :destroy, :tab_user]
  before_action :authenticate_user!
  load_and_authorize_resource

	respond_to :html

  def index
  	@tabs = Tab.order("id Desc")
  end

  def tab_user
    @user = User.find(params[:user][:tab_id])
    @user.update_attributes(:tab_id => @tab.id)
    flash[:notice] = "successfully Assigned" if @user.save
    @user.assign_role_tab
    respond_with(@tab)
  end

  def new
  	@tab = Tab.new
  end

  def create
    @tab = Tab.new(tab_params)
    @tab.save
    respond_with(@tab)
  end

  def update
    @tab.update(tab_params)
    respond_with(@tab)
  end

  def destroy
    @tab.destroy
    respond_with(@tab)
  end

  private
    def set_tab
      @tab = Tab.find(params[:id])
      @tab_entries = @tab.user.customers if @tab.user.present?
    end

    def tab_params
      params.require(:tab).permit(:name, :tab_code)
    end
end
