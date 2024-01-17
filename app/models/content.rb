class Content < ApplicationRecord
  validates :question, presence: true
  validates :optional_answers, presence: true
  validates :answer, presence: true
  
end