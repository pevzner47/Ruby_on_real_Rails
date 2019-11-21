class AddUsersTestsCurrentQuestionAndCorrectQuestionsColumn < ActiveRecord::Migration[6.0]
  # def change
  #   add_reference :users_tests, :current_question, foreign_key: { to_table: :questions}
  #   add_column :users_tests, :correct_questions, :integer
  #   change_column_default(:users_tests, :correct_questions, from: nil, to: 0)
  # end
end
