
class UserMailer <  ApplicationMailer

  default :from => "gamberg1001@outlook.com"

  def account_activation(user)
    @user = user
    mail(to: @user.email, subject: "Account activation")
  end

  def password_reset(user)
    @user = user
    mail to: @user.email, subject: "Password reset"
  end
end
