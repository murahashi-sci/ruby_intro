# coding: sjis

class User
  FIRST_NAME_MALE   = ["Taro", "Jiro", "Saburo"]
  FIRST_NAME_FEMALE = ["Hanako", "Masako", "Ryoko", "Yoko"]
  FAMILY_NAME = ["Yamada", "Sato", "Tanaka"]
  GENDER = {male: "�j��", female: "����", all: "�w��Ȃ�"}
  
  attr_accessor :first_name, :family_name, :gender_type
  
  def self.random_build(number, gender = :all)
    puts "#{GENDER[gender]}�̖��O��#{number}�������܂��B"
    users = []
    number.times do |n|
      users << self.new(gender)
    end
    return users
  end
  
  def full_name
    @first_name + " " + @family_name
  end
  
  private
  
  def initialize(gender)
    @first_name  = ""
    @family_name = ""
    if gender == :male
      @first_name = FIRST_NAME_MALE[rand FIRST_NAME_MALE.size]
    elsif gender == :female
      @first_name = FIRST_NAME_FEMALE[rand FIRST_NAME_FEMALE.size]
    else # if :all
      first_names = FIRST_NAME_MALE + FIRST_NAME_FEMALE
      @first_name = first_names[rand first_names.size]
    end
    @family_name = FAMILY_NAME[rand FAMILY_NAME.size]
  end
end

user_list = User.random_build(5, :female)

user_list.each do |user|
  puts user.full_name
end