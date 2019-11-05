class Category < ApplicationRecord
  has_many :tests, dependent: :nullify # при удалении категрии информация о ней в тесте обнуляется

  default_scope { order(name: :ASC)}
end
