require 'test_helper'

class OwnershipTest < ActiveSupport::TestCase
  test "Should Initialize new Ownership instance" do
    ownership = Ownership.new

    assert_not ownership.save, "Saved the article without a title"
  end
  # test "the truth" do
  #   assert true
  # end
end
