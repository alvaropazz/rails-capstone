class ProjectsController < ApplicationController
  before_action :login_required, only: %i[new create]
  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to groups_path
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
