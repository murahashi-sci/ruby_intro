## Ruby紹介
今日の内容

* Rubyについて簡単に紹介
* ハンズオン

### Rubyとは
[まつもとゆきひろ（通称Matz）](http://ja.wikipedia.org/wiki/%E3%81%BE%E3%81%A4%E3%82%82%E3%81%A8%E3%82%86%E3%81%8D%E3%81%B2%E3%82%8D)が作成したスクリプト言語。  
Webアプリ作成に限定した言語ではないが、「Rubyを使う」＝「Ruby on RailsでWeb作成」と捉えられることが多い。

Ruby on Rails（通称Rails）とはRubyのWebアプリケーション用フレームワーク。  
Railsの紹介は次回に。

日本製の言語なので、リファレンスも日本語（ http://docs.ruby-lang.org/ja/2.2.0/doc/index.html ）。

[地域ごとのコミュニティ](https://github.com/ruby-no-kai/official/wiki/RegionalRubyistMeetUp)が多いのが特徴。（[Doorkeeperを見るとかなり多い](https://www.doorkeeper.jp/%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88/ruby)）

毎週、上野付近にRubyコミッタが集まって[勉強会](http://qwik.jp/asakusarb/#ed03973c7da342136fcb8b6e46bc2640)をしているとか。

Ruby界の有名人：
* 角谷 信太郎さん（アジャイルサムライを翻訳した人）
* そらは（福森匠大）さん（[中学卒業後にクックパッドに入社した](http://gihyo.jp/lifestyle/serial/01/shukatsu_joshi/0001)人）

など。

日本人フレンドリーな言語だが、**[Railsは外国製](http://rubyonrails.org/)**なところに注意。

### Ruby(on Rails)が使用されているところ
* Twitter(現在はJava)
* Github(現在はC#？)
* 楽天
* 食べログ
* クックパッド
* 某百貨店のECサイトとか
* 某社の販売管理システムとか
* 某庁の警報システムとか。

### Rubyのいいところ
* とにかく簡単。覚えることは少ないしコーディング量も少なくて済む。
* 数値もnil（null）もtrueもfalseもすべてがオブジェクト。型の情報をあまり気にしない。そもそも変数に型がない。（値には型はある）
* オープンクラス（メソッドの上書きやクラスの拡張が自由自在。例えばStringクラスにメソッドをガンガン追加できる。）
* ライブラリの追加が簡単。aptやyumのような仕組みがありコマンドを叩くだけ。

#### 型がないとは？
```ruby
foo = 100 # 数値を入れる。この時点でfooはFixnumクラスとして扱われる
foo = "Hello" # 文字列を再代入。Javaならこの時点でエラーのはず。
foo = Object.new # よく分からないオブジェクトも入る。
```

### Rubyのわるいところ
* 遅い（と言われていたが、今はそんなことはない。早くなった。）
* EclipseのようなリッチなIDEがない。多少はコマンドを叩く必要がある
  （書くだけならサクラエディタでも可能）
* 仕様変更が多い（特にRails）ので、言語のバージョンアップに伴いWebアプリ自体を継続的にメンテしていく必要がある。
  （Rails2→3へのアップグレードに苦労したプロジェクトも多いとか。）

----

[まずは導入へ。](02_install.md)


