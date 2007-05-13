= module Cairo::Context::Path

パスに関する便利なメソッドをCairo::Contextに提供するモ
ジュールです。実験的なものでAPIは変更される可能性があります。

cairoにはないrcairoでの拡張です。

== Instance Methods

--- map_path_onto(path)

     コンテキストが持っているパスを((|path|))の上に配置しま
     す。以下のようにすると円上にテキストを配置することがで
     きます。

       cr.circle(100, 100, 50)
       cr.set_source_color(:blue)
       cr.stroke_preserve
       circle_path = cr.copy_path_flat

       cr.new_path
       # cr.move_to(100, 0) # 円上を時計周りに100移動
       cr.text_path("ABCDE")
       cr.map_path_onto(circle_path)
       cr.set_source_color(:red)
       cr.fill

--- transform_path(path) {|x, y| ...}

     ((|path|))の各点をブロックで変換します。Array#collectの
     ようなものです。以下は、パスを縦横それぞれ2倍の大きさに
     する実用的ではない例です。（こういうときは
     Cairo::Context#scaleを使いましょう。）

       transformed_path = cr.transform_path(cr.copy_path) do |x, y|
         [x * 2, y * 2]
       end
       cr.new_path
       cr.append_path(transformed_path)

     * path: 変換対象のパス
     * x: 点のx座標
     * y: 点のy座標
     * Returns: 変換されたパス

== See Also

  * Cairo::Context
  * Index

== ChangeLog

  * 2007-04-30: kou: スタート。
