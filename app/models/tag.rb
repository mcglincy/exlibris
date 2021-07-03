class Tag < ApplicationRecord
  has_and_belongs_to_many :entries
  belongs_to :tag_category

  validates :name, :tag_category, presence: true
  validates :short_description, presence: {if: -> { tag_category&.short_description_required }}

  has_rich_text :description

  scope :containing, ->(query) { where("to_tsvector('en', tags.name) @@ websearch_to_tsquery(unaccent(:query))", query: query) }
  scope :with_includes, -> { includes(:rich_text_description, entries: [:links, :rich_text_description, tags: :rich_text_description, cover_attachment: :blob]) }

  default_scope { order(name: :asc) }
end
