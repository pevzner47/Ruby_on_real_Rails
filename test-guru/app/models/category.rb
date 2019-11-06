class Category < ApplicationRecord
  default_scope { order(name: :ASC)}

  has_many :tests, dependent: :nullify # при удалении категрии информация о ней в тесте обнуляется
end
