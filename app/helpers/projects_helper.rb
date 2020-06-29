module ProjectsHelper
  def has_group_total
    @current_user.project.has_group.group(group_id: params[:group_id]).sum(:amount)
  end

  def no_group_total
    @current_user.project.no_group.sum(:amount)
  end
end
