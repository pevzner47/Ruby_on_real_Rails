class AddAnswersQuestionIdForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :answers, index: true, foreign_key: true
  end
end
