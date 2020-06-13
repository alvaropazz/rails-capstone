class AddKeysToGrouping < ActiveRecord::Migration[6.0]
  def change
    add_reference :groupings, :project, foreign_key: true
    add_reference :groupings, :group, foreign_key: true
  end
end
