class ApplicationHelperTest < ActionView::TestCase
  test "returns success notice" do
    flash[:success] = "saved successfully"
    assert_dom_equal '<div class="alert alert-success">
  saved successfully
</div>', success_notice 
  end

  test "does not return success notice" do
    assert_dom_equal nil, success_notice
  end

  test "returns error notice" do
    flash[:error] = "saved usuccessfully"
    assert_dom_equal '<div class="alert alert-danger">
  saved usuccessfully
</div>', error_notice 
  end
end