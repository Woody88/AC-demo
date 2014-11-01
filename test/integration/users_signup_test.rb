require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
   test "invalid signup information" do
   	get signup_path
   	assert_difference 'User.count', 1 do
   		 post_via_redirect users_path, user: { name: "woodson",
   		 									   username: "hello773",
				   							   email: "user@example.com",
				   							   password:    "password",
				   							   password_confirmation: "password" }
 		end
 		assert_template 'users/show'
	end

	test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example",
      										username: "Hell1111",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
  
end