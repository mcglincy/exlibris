class Tag < ApplicationRecord
  has_and_belongs_to_many :entries

  validates :name, presence: true

  scope :containing, ->(query) { where("tags.name ILIKE ?", "%#{query}%") }
  scope :with_includes, -> { includes(entries: [:links, :tags, :rich_text_description, cover_attachment: :blob]) }
end
