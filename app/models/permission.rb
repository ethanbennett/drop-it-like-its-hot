class Permission

  def initialize(user, controller, action)
    @_user = user || User.new
    @_controller = controller
    @_action = action
  end

  def authorized?
    if user.admin?
      return true
    elsif user.registered?
      return true if controller == "users" && action.in?(%w(edit update))
      return true if controller == "sessions" && action == "destroy"
      return true if controller == "home" && action.in?(%w(index show))
      return true if controller == "account" && action == "index"
      return true if controller == "repos" && action.in?(%w(create show destroy))
      return true if controller == "folders" && action.in?(%w(create show destroy))
      return true if controller == "downloads" && action.in?(%w(index show))
      return true if controller == "landing" && action == "show"
    else
      return true if controller == "landing" && action == "show"
      return true if controller == "users" && action.in?(%w(new create))
      return true if controller == "oauths" && action == "create"
      return true if controller == "sessions" && action.in?(%w(new create))
      return true if controller == "password_resets" && action.in?(%w(new create edit update)) 
      return true if controller == "phone_verifications" && action.in?(%w(new create))
      return true if controller == "downloads" && action.in?(%w(index show))
    end
  end

  private
    def user
      @_user
    end

    def controller
      @_controller
    end

    def action
      @_action
    end
end