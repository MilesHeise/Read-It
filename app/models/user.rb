class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  before_save :downcase_email, if: :email_present?
  before_save :capitalize_name, if: :name_present?
  before_save { self.role ||= :member }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: 'password_digest.nil?'
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  enum role: %i[member admin]

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  private

  def capitalize_name
    self.name = name.split.map(&:capitalize).join(' ')
  end

  def name_present?
    name.present?
  end

  def downcase_email
    self.email = email.downcase
  end

  def email_present?
    email.present?
  end
end
