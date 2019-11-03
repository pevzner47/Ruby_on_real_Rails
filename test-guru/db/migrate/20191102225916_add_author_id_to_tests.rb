class AddAuthorIdToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, foreign_key: true
    rename_column :tests, :user_id, :author
  end
end
