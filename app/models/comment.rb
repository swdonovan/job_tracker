class Comment < ApplicationRecord
  validates :body, :created_at, presence: true


  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
