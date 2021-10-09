module Support
  module UtilityHelpers
    def add_user_to_role(user, role)
      role.users << user
    end
    
  end
end
