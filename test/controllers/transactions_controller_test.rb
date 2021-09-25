require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get transactions_create_url
    assert_response :success
  end

  test "should get index" do
    get transactions_index_url
    assert_response :success
  end

  test "should get spend" do
    get transactions_spend_url
    assert_response :success
  end
end
