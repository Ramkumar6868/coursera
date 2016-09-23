class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, :inclusion => {:in => ['male','female']}
  validate :first_or_last
  validate :gender_name_check

  def first_or_last
    if first_name.nil? && last_name.nil?
      errors.add(:first_name,"specify first or last name")
    end
  end

  def gender_name_check
    if gender == 'male' && first_name == 'Sue'
      errors.add(:first_name,"can not a boy with name sue")
    end
  end

  def self.get_all_profiles(start_year,test_year)
    Profile.where(:birth_year => start_year..test_year).order('birth_year asc')
  end
end
