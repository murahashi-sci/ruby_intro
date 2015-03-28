## クラスを作ってみる

### クラスの作り方例
`calculation.rb`を拡張し、ちゃんとしたクラスにしたい。

```ruby
class Calculator
  # コンストラクタ
  def initialize(number)
    raise ArgumentError unless number.integer?
    @input_number = number
  end

  def calc_double
    @input_number * 2
  end
end

calculator = Calculator.new(100)
puts calculator.calc_double
```

**実行**

```dos
> ruby calculation.rb
200
```

#### 解説
* コンストラクタは`initialize`という名前にする必要がある。
* インスタンス変数は、`@input_number`のように先頭に`@`を付ける。
* Javaのように、インスタンス変数を使う前にメソッドの外で予め宣言しておく必要はない。
* 
```java
public class Foo {
    private int number; // ← これ
    public void anyMethod(){...}
}
```

### setter/getterを作ってみる
Rubyの世界では、一般的にはアクセスメソッドに`setXxx` `getXxx`という名前は付けない。

```ruby
# setter
def input_number=(number) # イコールまでがメソッド名
  @input_number = number
end

# getter
def input_number
  @input_number # 暗黙的にreturnするだけ
end
```

Rubyでは、メソッド使用時に括弧を省略できる。

また、特定の記号を含むメソッドでは使用時に記号の前にスペースを入れることが可能。

つまり・・・setter/getterを用いてインスタンス変数をあたかもpublicであるかのように扱うことができる。

```ruby
calculator = Calculator.new(100) # コンストラクタで@input_numberに値をセット
calculator.input_number = 200 # setterで値を再代入。calculator.input_number=(200)の省略形
puts calculator.input_number #=> 200 getterで@input_numberを取得
```

### 一般的なアクセサの作り方
`input_number=` `input_number`というsetter/getterを作成したが、簡単にこれを実装してくれる機能がある。

クラス内の適当な場所（大抵はコンストラクタの上あたり）に次のように書いておけばよい。
```ruby
attr_accessor :input_number
```

この1行で、自動的に`input_number=` `input_number`の2つのメソッドを定義してくれる。

setterのみ実装したい場合は`attr_writer`、getterのみ実装したい場合は`attr_reader`とすればよい。

### シンボル
`:input_number`のように、先頭にコロンを付けた文字列はシンボルという型になる。

シンボルとは、Stringと似ているが文字列を内部的に数値として扱うクラス。

・・・なのだが、理解が難しいものなので、「この場面では文字列ではなくシンボルを使う」という覚え方をする程度で良いと思う。

詳しくは[リファレンス](http://docs.ruby-lang.org/ja/2.2.0/class/Symbol.html)参照。

Stringと似たようなものなので、
```ruby
attr_accessor :input_number
```
を
```ruby
attr_accessor "input_number"
```
としても同様に動作する。

ここまでを纏めて修正したものが以下になる。
```ruby
class Calculator
  attr_accessor :input_number
  # コンストラクタ
  def initialize(number)
    raise ArgumentError unless number.integer?
    @input_number = number
  end

  def calc_double
    @input_number * 2
  end
end

calculator = Calculator.new(100)
# コンストラクタの引数でセットした値 => 100
puts calculator.calc_double
# setterで再代入
calculator.calc_double = 200
# getterで確認 => 200
puts calculator.calc_double
```


----

[コレクションとループについて](06_collection_loop.md)
