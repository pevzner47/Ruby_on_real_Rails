class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy # при удаении вопроса удаляется ответ

  validates :text, presence: true

end
