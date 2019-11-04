class Category < ApplicationRecord
  has_many :tests, dependent: :nullify # при удалении категрии информация о ней в тесте обнуляется
end
