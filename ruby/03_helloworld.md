## Hello Worldを書いてみる
1. 好きな場所に`hello.rb`を作成する。（ファイル名は何でも良い。Javaのようにクラス名と対応させる必要はない）
2. 以下のように書いて保存。
3. 
   ```ruby:hello.rb
   puts("Hello World!");
   ```
   （putsメソッドはJavaでいうsysoutのようなもの）
4. コマンドプロンプトから実行
   ```dos
   > ruby hello.rb
   Hello World!
   ```

### どういうこと？
Rubyではトップレベルに書いた処理がmainメソッドの中身として処理される。（正確には少し違うけれど）

簡単なプログラムなら、クラスもmainメソッドも無く、おもむろに処理を書き始めることが可能。


## Rubyらしく書く
Hello Worldを書くとき、正確に書くと`puts("Hello World!");`が正しいが、通常は少し省略して書く。
* 行末のセミコロンは省略可能
  （大抵は２つの処理を1行にまとめて書く場合に使用。`puts("Hello");puts("World")`）
* 引数のかっこが省略可能

よって以下のような方法が「Rubyっぽい書き方」になる。
```ruby:hello.rb
puts "Hello World!"
```

----
[クラスとメソッドを作ってみる](04_class_method.md)