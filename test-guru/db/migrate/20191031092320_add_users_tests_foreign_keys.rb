class AddUsersTestsForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_tests, :user, foreign_key: true
    add_reference :users_tests, :test, foreign_key: true
  end
end
