class AddUserLevelDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :level, from: nil, to: 0)
  end
end
