class AddGroupToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :group, foreign_key: true
  end
end
