class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :category_id, presence: true

  has_many :comments, as: :commentable

  belongs_to :category
  belongs_to :company

end
