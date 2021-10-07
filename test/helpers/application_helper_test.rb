class ApplicationHelperTest < ActionView::TestCase
  test 'returns alert notice' do
    flash[:alert] = 'some info'
    assert_dom_equal '<div class="alert alert-info">
  some info
</div>', alert_notice 
  end

  test 'does not return alert notice' do
    assert_dom_equal nil, alert_notice
  end

  test 'returns success notice' do
    flash[:success] = 'saved successfully'
    assert_dom_equal '<div class="alert alert-success">
  saved successfully
</div>', success_notice 
  end

  test 'does not return success notice' do
    assert_dom_equal nil, success_notice
  end

  test 'returns error notice' do
    flash[:error] = 'saved usuccessfully'
    assert_dom_equal '<div class="alert alert-danger">
  saved usuccessfully
</div>', error_notice 
  end

  test 'does not return error notice' do
    assert_dom_equal nil, error_notice
  end
end
