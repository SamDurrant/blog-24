require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal "Blog 24", full_title
    assert_equal "Help | Blog 24", full_title("Help")
  end
end