class Admin::PostPolicy < ApplicationPolicy
  def index?
    user.role? :Administrator
  end

  alias show? index?
  alias new? index?
  alias create? index?
  alias edit? index?
  alias update? index?
  alias destroy? index?
end
