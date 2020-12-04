require 'test_helper'

class InsumoTest < ActiveSupport::TestCase
  test "Should Initialize new Ownership instance" do
    insumo = Insumo.new

    assert_not insumo.save, "Saved the article without a title"
  end
  # test "the truth" do
  #   assert true
  # end
  # test "the truth" do
  #   assert true
  # end
end
