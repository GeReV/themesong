class User < ApplicationRecord
  belongs_to :user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |identity|
      user = identity.user || identity.build_user

      user.email = auth.info.email
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image

      user.save!
    end
  end
end
