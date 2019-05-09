class WorkLog < ApplicationRecord

  belongs_to :employee

  private

  def set_user
    self.user = user || User.current
  end
end
