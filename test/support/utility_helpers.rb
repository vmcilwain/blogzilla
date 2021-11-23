module Support
  module UtilityHelpers
    def add_user_to_role(user, role)
      role.users << user
    end
    
    def admin_user
      role = Role.where(name: 'Administrator').first || create(:role, name: 'Administrator')
      user = create :user
      add_user_to_role user, role
      user
    end
  
    def words(number = 5, separator = "\s")
      @words ||= Faker::Lorem.words(number: number).join(separator)
    end
    
    def paragraphs(number = 5, separator = "\n")
      @paragraphs ||= Faker::Lorem.paragraphs(number: number).join(separator)
    end

    def _post
      @post ||= create :post
    end
  end
end
