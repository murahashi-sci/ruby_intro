
### まとめ？

紹介した要素を使ったプログラム。

予め用意した苗字・名前を組み合わせ、指定した人数・性別のフルネームを生成する。

```ruby
# coding: utf-8

class User
  # 定数（配列）
  FIRST_NAME_MALE   = ["Taro", "Jiro", "Saburo"]
  FIRST_NAME_FEMALE = ["Hanako", "Masako", "Ryoko", "Yoko"]
  FAMILY_NAME = ["Yamada", "Sato", "Tanaka"]
  # 定数（ハッシュ）
  GENDER = {male: "男性", female: "女性", all: "指定なし"}
  
  # getterは一行で書ける
  attr_reader :first_name, :family_name
  
  # 人名のオブジェクトを作成する
  # （メソッド名に self. を付けるとstaticなメソッドになる）
  # [引数]
  # number: 生成する人数
  # gender: 生成する性別（:all, :male, :female）
  # [戻り値] User配列
  def self.random_build(number, gender = :all)
    puts "#{GENDER[gender]}の名前を#{number}個生成します。"
    users = [] # 空の配列
    number.times do |n|
	  # 配列に生成した人間を追加していく
      users << self.new(gender)
    end
    return users
  end
  
  private # と書くと、これより下はプライベートなメソッドになる
  
  # コンストラクタ
  def initialize(gender)
    # @が付くのはインスタンス変数
    @first_name  = ""
    @family_name = ""
	
	# "male"(String) ではなく :male(Symbol) とした方がRubyっぽい
    if gender == :male
	  # 男性名をランダムで取得
	  # 例：rand(10)で0～9をランダムで取得
      @first_name = FIRST_NAME_MALE[rand FIRST_NAME_MALE.size]
    elsif gender == :female
	  # 女性名をランダムで取得
      @first_name = FIRST_NAME_FEMALE[rand FIRST_NAME_FEMALE.size]
    else # if :all
	  # 男性または女性名をランダムで取得
	  # 配列同士は + で結合できる
      first_names = FIRST_NAME_MALE + FIRST_NAME_FEMALE
      @first_name = first_names[rand first_names.size]
    end
	# 苗字をランダムで取得
    @family_name = FAMILY_NAME[rand FAMILY_NAME.size]
  end
end

# 5人の女性を生成
user_list = User.random_build(5, :female)

# 生成された人間の名前を順に出力する
user_list.each do |user|
  puts user.first_name + " " + user.family_name
end
```
