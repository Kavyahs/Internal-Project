class User < ActiveRecord::Base
  has_secure_password validations: true, :unless => proc{|u| u.provider.present?}

  validates :password, presence: true, :length => {:minimum => 6},
  :unless => proc{|u| u.provider.present?}

  validates :password_confirmation, presence: true,
  :unless => proc{|u| u.provider.present?}

  validates :name, presence: true,
  :format => { with: /\A[a-zA-Z\s]+$\z/ },
  :unless => proc{|u| u.provider.present?}

  validates :email, presence: true, uniqueness: true,
  :format => { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
  :unless => proc{|u| u.provider.present?}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end