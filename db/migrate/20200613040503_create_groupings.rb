class CreateGroupings < ActiveRecord::Migration[6.0]
  def change
    create_table :groupings, &:timestamps
  end
end
