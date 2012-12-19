require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 2
    assert_select '#main .entry', 4
    assert_select 'h3', 'The Pragmatic Programmer - From journeyman to master'
    assert_select '.price', /[,\d]+ kr/
  end
end
