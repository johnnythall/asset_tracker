class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         enum role: [:orson_follower, :orson_select, :ta, :admin]
          after_initialize :set_default_role, :if => :new_record?

          def set_default_role
            self.role ||= :orson_follower
          end

          has_many :rentals
          
          def name
            "#{self.first_name} #{self.last_name}"
          end
end

