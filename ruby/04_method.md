## メソッドを作ってみる

例として、引数に数値を取り、値を2倍して返すメソッドを作成する。

新規にファイル`calculation.rb`を作成する。

```ruby
def calc_double(number)
  return number * 2
end

puts calc_double(100)
```

コマンドプロンプトから実行してみる。

```dos
> ruby calculation.rb
200
```
倍の値が返り、結果が表示された。

### Rubyっぽく書く
#### 括弧の省略
メソッドを作成する際、メソッドの実行時と同じく括弧を省略することができる。

```ruby
def calc_double number
  return number * 2
end
```
…が、読みづらくなるのでメソッドの定義では括弧を付けたままにする人が多い。

#### returnの省略
Rubyではreturnすら省略することができる。

また省略したからといって、戻り値が無くなるなるわけではない。
```ruby
def calc_double(number)
  number * 2
end
```
メソッドの中で、最後に処理した値が戻り値として扱われる。よって、このメソッドはreturnを書かずとも計算結果の数値を返す。

文字列を返すことも可能
```ruby
def calc_double(number)
  result = number * 2
  "計算結果は" + result + "です。"
end
```
returnを書く派、書かない派は人によって結構分かれる。自分はどっちでもいい派ですが。

[teratailの広告](https://teratail.com/questions/2350)でたまに見る、このコードのような書き方もできる。
```ruby
# 円の面積を求める
def en r
  return r * r * PI
end
```
ちなみに、「なぜか動かない！助けて！teratailで聞いてみよう。」という広告だが、単に`PI`が定義されていないだけ。

### 引数に数値以外を入れた場合

Rubyではメソッドの引数に値の型を指定できない。（numberを数値に限定できない。よってオーバーロードの概念もない）

他の言語に慣れた人に、`calc_double`の実行時、引数に文字列が入ったらどうするのか？と聞かれることがある。

大抵のRubyistは「実装元を見て、メソッドを使う人が気をつけろ」と言うが、それが許されない場合は仕方なく型チェックを実装する。  
（例なので細かいチェックはしない）


```ruby
def calc_double(number)
  return nil unless number.integer?
  number * 2
end
```

引数に整数以外が指定された場合はnilを返し、整数の場合は値を2倍して返すようにした。

#### 解説
* `integer?`は値が整数型かどうかを判定するメソッド。true/falseを返す。
* Rubyでは単なる整数もオブジェクト。単なる数値`100`もFixnumクラスのインスタンスとして扱われる。  
  つまりインスタンスメソッドを持っている（今回は`integer?`）
* お約束として、真偽値を返すメソッドの名前には、末尾に`?`を付ける。Javaで`isInteger`という名前を付けるようなもの。
* 1行のみの条件判定・実行は条件式を後ろに書く。

  ```ruby
  return nil unless number.integer?
  ```
  
  Javaでは条件式を先に書く。
  ```java
  if(!isInteger(number)) return null;
  ```

* `if`の反対は`unless`
  以下のように書いても良いのだが、「判定結果がfalseのとき」に何かをしたいとき、`!`を付けて反転させるより`unless`の使用を好む人が多い。
  ```ruby
  return nil if !number.integer?
  ```
今回は整数値以外が入った場合`nil`を返すようにしたが、例外を発生させても良いと思う。
```ruby
raise ArgumentError unless number.integer?
```

----

[クラスを作ってみる](05_class.md)
