class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :token_authenticatable #, :validatable:, registerable
  attr_accessible :first_name, :last_name, :email, :institution, :password, :password_confirmation, :remember_me, :user_kind, :notes, :institution_id
  
  belongs_to :institution
  has_many :answers
  has_many :events
  
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  with_options :if => :should_validate_password? do |v|
    v.validates_presence_of :password
    v.validates_confirmation_of :password
    v.validates_length_of :password, :within => 6..128
  end

  before_save :ensure_authentication_token
  #validates_format_of :email, :with => Configuration::EMAIL_CHECK
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable

  # Setup accessible (or protected) attributes for your model
  
  def user_kind
    UserKind.find(user_kind_id)
  end
  
  def user_kind=(uk)
    self.user_kind_id = UserKind.find(uk).id if UserKind.find(uk)
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def access_rights
    return AccessRight.where(:user_kind_id => user_kind_id) if user_kind_id.present?
    return []
  end
  
  def should_validate_password?
    new_record? or not password.blank?
  end
  
  def to_s
    full_name
  end
end
