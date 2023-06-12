require "test_helper"

class Public::SuggestBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_suggest_books_new_url
    assert_response :success
  end

  test "should get show" do
    get public_suggest_books_show_url
    assert_response :success
  end

  test "should get index" do
    get public_suggest_books_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_suggest_books_edit_url
    assert_response :success
  end
end
