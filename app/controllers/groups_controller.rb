class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @group_projects = Group.all_projects(@group)
    @projects_grouped = Group.all_projects(@group).sum(:amount)
  end

  def index
    @groups = current_user.groups
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      redirect_to new_project_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
