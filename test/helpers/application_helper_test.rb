require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'returns alert notice' do
    flash[:alert] = 'some info'
    assert_dom_equal '<div class="alert alert-info">
  some info
</div>', alert_notice 
  end

  test 'does not return alert notice' do
    assert_nil alert_notice
  end

  test 'returns success notice' do
    flash[:success] = 'saved successfully'
    assert_dom_equal '<div class="alert alert-success">
  saved successfully
</div>', success_notice 
  end

  test 'does not return success notice' do
    assert_nil success_notice
  end

  test 'returns error notice' do
    flash[:error] = 'saved usuccessfully'
    assert_dom_equal '<div class="alert alert-danger">
  saved usuccessfully
</div>', error_notice 
  end

  test 'does not return error notice' do
    assert_nil error_notice
  end

  test 'returns long date format' do
    assert_equal time_stamp.strftime("%A %d %B %Y - %H:%M %p"), long_date(time_stamp)
  end

  test 'long date returns nil if invalid object' do
    assert_nil long_date('str')
  end

  test 'returns medium date format' do
    assert_equal time_stamp.strftime("%m/%d/%Y at %H:%M %p"), medium_date(time_stamp)
  end

  test 'medium date returns nil if invalid object' do
    assert_nil medium_date(123)
  end

  test 'returns medium date 2 format' do
    assert_equal time_stamp.strftime("%d %B %Y"), medium_date2(time_stamp)
  end

  test 'medium date 2 returns nil if invalid object' do
    assert_nil medium_date(123)
  end

  test 'returns medium date 3 format' do
    assert_equal time_stamp.strftime("%B %d, %Y"), medium_date3(time_stamp)
  end

  test 'medium date 3 returns nil if invalid object' do
    assert_nil medium_date3(:str)
  end

  test 'returns short date format' do
    assert_equal time_stamp.strftime("%Y-%m-%d"), short_date(time_stamp)
  end

  test 'short date returns nil if invalid object' do
    assert_nil short_date(nil)
  end

  test 'returns US date format' do
    assert_equal time_stamp.strftime("%m/%d/%Y at %H:%M %p"), us_date(time_stamp)
  end

  test 'US date returns nil if invalid object' do
    assert_nil us_date({})
  end

  test "returns 'Yes' if boolean value is true" do
    assert_equal 'Yes', boolean_to_text(true)
  end

  test "returns 'No' if boolean value is false" do
    assert_equal 'No', boolean_to_text(false)
  end
  
  test 'returns the object if not valid' do
    assert_equal 'str', boolean_to_text('str')
  end

  def time_stamp
    @time_stamp = Time.zone.now
  end
  
end
