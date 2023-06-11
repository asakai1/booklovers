require "test_helper"

class Public::FindBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_find_books_new_url
    assert_response :success
  end

  test "should get index" do
    get public_find_books_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_find_books_edit_url
    assert_response :success
  end
end
