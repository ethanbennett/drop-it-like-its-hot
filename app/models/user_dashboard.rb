class UserDashboard
  def initialize(details = {})
    @_user = details[:user]
  end

  def fullname
    "#{@_user.first_name} #{@_user.last_name}"
  end
end