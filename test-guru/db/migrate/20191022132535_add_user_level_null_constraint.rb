class AddUserLevelNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :level, false)
  end
end
