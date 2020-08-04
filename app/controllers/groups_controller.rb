class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :group_member?, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
  end

  def edit
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    
    if @group.save
      redirect_to group_url(@group), notice: "グループ「#{@group.name}」を作成しました"
    else
      render :new
    end
  end

  def update 
    if @group.update(group_params)
      redirect_to group_url(@group), notice: "グループ「#{@group.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: "グループ「#{@group.name}」を削除しました。"
  end

  private

  def group_params
    params.require(:group).permit(:name, :image, user_ids: [] )
  end

  def set_group 
    @group = Group.find(params[:id])
  end

  def group_member?
    redirect_to root_path unless @group.user_ids.include?(current_user.id)
  end

end
