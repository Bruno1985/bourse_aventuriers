class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :adventures
  has_many :reviews
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :fullname, presence: true, length: {maximum: 65}
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  def update_without_password(params, *options)
      if params[:password].blank?
        params.delete(:password)
        params.delete(:password_confirmation) if params[:password_confirmation].blank?
      end
      result = update_attributes(params, *options)
      clean_up_passwords
      result
    end
    
    def self.from_omniauth(auth)
 
            user = User.where(email: auth.info.email).first
 
            if user
 
               return user
 
            else
 
                where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
 
                    u.fullname = auth.info.name
 
                    u.provider = auth.provider
 
                    u.uid = auth.uid
 
                    u.email = auth.info.email
 
                    u.image = auth.info.image
 
                    u.password = Devise.friendly_token[0,20]
 
            end
 
       end
 
     end
  
end
