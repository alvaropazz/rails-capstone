class AddAuthorIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :projects, :users, column: :author_id
  end
end
