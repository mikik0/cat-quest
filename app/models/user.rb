class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if name = conditions.delete(:name)
      where(conditions).where(username: username).first
    else
      where(conditions).first
    end
  end

# No use email
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
