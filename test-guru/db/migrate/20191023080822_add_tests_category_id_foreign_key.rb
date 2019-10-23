class AddTestsCategoryIdForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :categories, index: true, foreign_key: true
  end
end
