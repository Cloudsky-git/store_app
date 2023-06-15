class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # enum role: { user: 'user', moderator: 'moderator', admin: 'admin' }        
  # enum role: [:user, :moderator, :admin].index_with(&:itself) -> to samo co na gorze
         
  # skrocony zapis powszechnie uzywany       
  enum role: %w[user moderator admin].index_with(&:itself)

  def full_name 
    "#{first_name} #{last_name}"
  end


end
