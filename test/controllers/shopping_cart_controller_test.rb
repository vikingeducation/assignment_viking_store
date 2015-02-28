require 'test_helper'

class ShoppingCartControllerTest < ActionController::TestCase
  test "should get item:string" do
    get :item:string
    assert_response :success
  end

  test "should get quantity:integer" do
    get :quantity:integer
    assert_response :success
  end

  test "should get item_total_cost:decimal" do
    get :item_total_cost:decimal
    assert_response :success
  end

  test "should get grand_total:decimal" do
    get :grand_total:decimal
    assert_response :success
  end

  test "should get checked_out:boolean" do
    get :checked_out:boolean
    assert_response :success
  end

  test "should get customer:string" do
    get :customer:string
    assert_response :success
  end

end
