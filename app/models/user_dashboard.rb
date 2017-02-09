class UserDashboard
  def initialize(details = {})
    @_user = details[:user]
  end

  def fullname
    "#{@_user.first_name} #{@_user.last_name}"
  end

  def email
    @_user.email
  end

  def used_space_percent
    "25%"
  end

  def two_step_status
    "Disabled"
  end
end