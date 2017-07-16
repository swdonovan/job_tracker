class Contact < ApplicationRecord
  # validates :name, :position, presence: true

  belongs_to :company

  # belongs_to :job_contacts, polymorphic: true
  # has_many :contacts, as: :job_contacts
end
