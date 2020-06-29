class ProjectsController < ApplicationController
  before_action :login_required, only: %i[new create]
  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = current_user.projects.has_group
    @projects_total = current_user.projects.has_group.sum(:amount)
  end

  def external
    @projects = current_user.projects.no_group
    @projects_total_external = current_user.projects.no_group.sum(:amount)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      edirect_to user_path(@user)
    else
      flash[:alert] = @project.errors.full_messages
      redirect_to new_project_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :amount, :group_id, :author_id)
  end
end
