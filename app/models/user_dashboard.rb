class UserDashboard
  def initialize(details = {})
    @_user = details[:user]
  end

  def user
    @_user
  end

  def fullname
    "#{first_name} #{last_name}"
  end

  def first_name
    user.first_name
  end

  def last_name
    user.last_name
  end

  def email
    user.email
  end

  def used_space_percent
    "25%"
  end

  def two_step_status
    "Disabled"
  end
end