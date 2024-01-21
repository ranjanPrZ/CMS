class Content < ApplicationRecord
  paginates_per 10

  validates :question, presence: true
  validates :optional_answers, presence: true
  validates :answer, presence: true
  
end