class Contact < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true


def self.ransackable_attributes(auth_object = nil)
  ["body", "created_at", "id", "title", "updated_at"]
end
end
