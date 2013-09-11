class Employee < ActiveRecord::Base


  ROLES = ["manager", "hr"]

  attr_accessible :user_id, :code, :surname, :first_name, :last_name, :birth_date, :join_date, :contact_mobile, :picture,
                  :designation, :role,
                  :user_attributes

  validates_presence_of :code, :surname, :first_name, :last_name, :birth_date, :join_date, :contact_mobile
  validates :code,
            :uniqueness => true,
            :format => {:with => /\A[a-zA-Z0-9]+\z/,
                        :message => "Only letters and numbers are allowed"}
  validates_date :birth_date, :on_or_before => lambda { Date.current }
  validates_date :join_date, :on_or_before => lambda { Date.current }
  validates_date :join_date, :after => :birth_date
  validates :contact_mobile,
            :numericality => {:only_integer => true},
            :format => {:with => /^[0-9]{10,11}$/}

  belongs_to :user, :dependent => :destroy


  accepts_nested_attributes_for :user

  has_attached_file :picture,
                    :styles => {
                      :medium => "140x140",
                      :thumb => "100x100"
                    },
                    :default_url => "/assets/default_picture_:style.png",
                    :path => ":rails_root/public/uploads/:class/:attachment/:id/:basename_:style.:extension",
                    :url => "/uploads/:class/:attachment/:id/:basename_:style.:extension"


  scope :default, includes(:user)

  def display_code
    code.try(:upcase)
  end

  def name
    "#{first_name} #{last_name}".titleize
  end

  def full_name
    "#{surname} #{first_name} #{last_name}".titleize
  end

  def email
    user.email
  end

end
