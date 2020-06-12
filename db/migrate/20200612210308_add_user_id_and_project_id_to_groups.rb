class AddUserIdAndProjectIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :user_id, :integer
    add_column :groups, :project_id, :integer
  end
end
