class User < ActiveRecord::Base
  before_validation :prep_email
  before_save :create_avatar_url
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w.+-]+@([\w]+.)+\w+\z/ }
  has_secure_password

  has_many :filters

  private

  def prep_email
    self.email = email.strip.downcase if email
  end

  def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=100"
  end

end
