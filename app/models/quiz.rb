class Quiz < ApplicationRecord
  has_many :questions
  before_save :default_values

  def default_values
    self.name = 'Unnamed Quiz' if self.name.nil?
  end
  
end
