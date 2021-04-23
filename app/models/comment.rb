class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :rating, :inclusion => { :in => 0..5, :message => " should be between 0 to 5" }
  validates :rating, :presence => { :message => " cannot be blank" }
end
