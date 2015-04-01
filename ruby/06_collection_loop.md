## コレクションとループ

### ループの書き方

#### whileループ
これは直感的でわかりやすい。whileで10回ループしているだけ。
```ruby
@number = 0
while @number < 10
  puts @number
  @number += 1
end
```

#### 無限ループ
無限ループも専用のものが用意されている。`while(true)`と書いても良いが…
```ruby
loop do
  # 無限ループ
end
```

#### 回数指定のループ
Rubyでは、Javaなどのように
```java
for(int i = 0; i < 10; i++) {
    System.out.println(i);
}
```
と書くことはせず、以下のように書く。
```ruby
10.times do |i|
  puts i #=> 0, 1, 2, ..., 9
end
```
このとき`i`にはループ回数が入る。

もしループ回数を使用する必要がなければ、`|i|`を省略して
```ruby
10.times do
  # 何かを10回実行する
end
```
としてもよい。

また、`do ... end`は`{ ... }`に置き換えることもできる。  
（記述を1行に纏めたいときに使用することが多い）

```ruby
10.times {|i| puts(i) }
```

また、`Integer#times`を好まず、foreachを使用する人もいる。
```ruby
(0..9).each do |i|
  puts i
end
```

`0..9`などと書くと、`Range`という数値の配列のようなオブジェクトが生成される。

いわゆるforeachである`each`を使用して配列から値を1つずつ取り出していると思えば良い。

### 配列
Rubyの配列は型に関わらず何でも入れることができる。

つまり・・・

```ruby
array = [1, 2, "さん！"]
```

のように、数値と文字列を混ぜて代入することが可能。

これを、先ほどの`each`に対し使用することで中身を1つずつ取り出すことが可能。

```ruby
array = [1, 2, "さん！"]
array.each do |num|
  puts num # 1 --> 2 --> さん！
end
```

これでは配列というよりリストでは？と感じる。

配列と銘打ってはいるが、実態はJavaでのLinkedListのようなもの。（ただし何でも入る）

実態はリストなので、後から値の追加や削除も可能。
```ruby
array = [1, 2, "さん！"]
array << 4 # 末尾に追加
array.delete_at(0) # 0番目の値を削除
```

ソートも一発でできる。便利。
```ruby
array = [2, 1, 3, 4]
puts array.sort
```

Railsでよくある使い方

```html
# Controller
@users = User.where(gender: male) # DBからレコードの配列を取得

# View ユーザ名一覧表を作成
<table>
  <% @users.each do |user| %>
  <tr><td>
    <%= user.name %>
  </td></tr>
  <% end %>
</table>
```

### ハッシュ
JavaのHashMapに相当するHashクラスがある。
使い方はとても簡単。

```ruby
hash = {key1: "value1", key2: "value2", key3: "value3"}
# 中身を確認する
puts hash #=> {:key1=>"value1", :key2=>"value2", :key3=>"value3"}

# キーを指定して値を取り出す
puts hash[:key2] #=> value2
```

`hash`に値をセットする際、`key1:`という書き方をしている。

これはキーにシンボルを指定する方法の別記法。以前（Ruby 1.x）は `:key1=>"value1"`のようにシンボルらしい書き方をしていた。

シンボルとStringは似たようなものなので、キーに文字列を使用しても良い。
```ruby
hash = {"key1" => "value1", "key2" => "value2", "key3" => "value3"}
puts hash["key2"] #=> value2
```

もちろん配列のように、内部に複数の型を含めることも可能。
```ruby
hash = {num: 100, str: "Hello", obj: Object.new}
```
便利。

**Railsでよくある使い方**

Web画面にて、送信フォームから値をPOST送信したとき、以下のようなハッシュが生成される。
```ruby
{"utf8"=>"✓", "authenticity_token"=>"・・・", "address"=>"Tokyo", "user_name"=>"Taro Yamada", "controller"=>"sample", "action"=>"index"}
```
puts params["address"] #=> Tokyo

簡単。
