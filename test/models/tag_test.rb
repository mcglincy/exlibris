require "test_helper"

class TagTest < ActiveSupport::TestCase
  context "associations" do
    should have_and_belong_to_many :entries
    should belong_to :tag_category
  end

  context "validations" do
    should validate_presence_of :name
    should validate_presence_of :tag_category
  end

  context ".containing" do
    should "match mork borg cult to cult name" do
      results = Tag.containing("cult")

      assert_includes results, tags(:mork_borg_cult)
    end
  end
end