module Support
  module PolicyAssertions
    # Manually check users authorization by instantiating policy based on test class name and calling the action on it.
    # policy(user).index?
    def policy(user=@user, record=record_class)
      policy = self.class_name.sub("Test", "").constantize
      policy.new(@user, record)
    end
  
    def record_class
      self.class_name.sub("PolicyTest", "").sub("Admin::", "").constantize
    end

    # Easier way to test a user authorization by passing the user and assuming the name of the test is the action to check against.
    # pundit_policy(user)
    def pundit_policy(user)
      action = self.name.sub(/test_/, '').to_sym
      policy(user).send action
    end
    
  end
end