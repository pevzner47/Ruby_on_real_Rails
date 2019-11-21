class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy # при удаении вопроса удаляется ответ
  has_many :test_passages, foreign_key: "current_question_id", dependent: :nullify 

  validates :text, presence: true

end
