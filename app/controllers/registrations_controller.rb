class RegistrationsController < Devise::RegistrationsController

private 

def sign_up_params
	params[:user].permit(:username, :gender, :email, :password, :password_confirmation)
end

end