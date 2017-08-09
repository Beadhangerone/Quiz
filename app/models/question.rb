class Question < ApplicationRecord
  has_many :variants
  has_one :answer
end
