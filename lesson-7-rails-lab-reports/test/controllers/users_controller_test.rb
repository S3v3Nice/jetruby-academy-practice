require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
    assert_select "h1", "Users"
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
    assert_select "h1", @user.full_name
  end

  test "should get new" do
    get new_user_url
    assert_response :success
    assert_select "h1", "New User"
  end

  test "should create user" do
    assert_difference("User.count") do
      puts LabReport.last.inspect
      post users_url, params: { user: { first_name: "Stefan", last_name: "Listaev", email: "stefan@listaev.com" } }
    end
    assert_redirected_to users_url
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
    assert_select "h1", "Edit User"
  end

  test "should update user" do
    patch user_url(@user), params: { user: { first_name: "Updated Name" } }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal "Updated Name", @user.first_name
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end
end
