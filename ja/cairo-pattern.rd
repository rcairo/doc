= class Cairo::Pattern

サーフェス上に描画するときのソースを表します。ソースの種類に
よっていくつかサブクラスがあります。例えば、
Cairo::SolidPatternは単色のパターンを作ります。

== Object Hierarchy

* Object
  * Cairo::Pattern

== Class Methods

--- Cairo::Pattern.new

     使えません。

== Instance Methods

--- __extend__

     Object#extendの別名です。

--- extend

    現在の引き延ばしモードを返します。各引き延ばしモードの意
    味の詳細はCairo::Extendを見てください。

     * Returns: Cairo::Extendに定義されている定数のどれか。

--- extend=(extend)
--- set_extend(extend)

     パターンの外側の領域を描画するときに使うモードを指定し
     ます。各引き延ばしモードの意味の詳細はCairo::Extendを見
     てください。

     * extend: :noneや:repeatなどCairo::Extendに定義
       されている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "none"のように指定することもできます。もちろん、
       Cairo::Extendに定義されている定数を指定するこ
       ともできます。

--- filter

     現在のフィルタを返します。各フィルタの詳細は
     Cairo::Filterを見てください。

     * Returns: パターンの大きさを変えるときに使う現在のフィ
       ルタ。

--- filter=(filter)
--- set_filter(filter)

     パターンの大きさを変えるときに使う現在のフィルタを設定
     します。各フィルタの詳細はCairo::Filterを見てください。

     * filter: :fastや:gaussianなどCairo::Filterに定義
       されている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "fast"のように指定することもできます。もちろん、
       Cairo::Filterに定義されている定数を指定するこ
       ともできます。

--- matrix

     パターンの変換行列を返します。

     * Returns: Cairo::Matrixオブジェクト。

--- matrix=(matrix)
--- set_matrix(matrix)

     パターンの変換行列を指定します。この行列はユーザ空間か
     らパターン空間に変換するときに使います。

     パターンを作ったときはいつも単位行列です。これは最初は
     パターン空間はユーザ空間と同じであるということです。

     重要: ユーザ空間からパターン空間への変換行列の方向に注
     意してください。これは、パターンからユーザ空間（そして装
     置空間）という流れの場合、座標はパターン行列の逆行列で
     変換されるということです。

     例えば、2倍の大きさのパターンを作りたいとしたら、以下が
     正しいコードです。

# start-pre
       pattern.matrix = Cairo::Matrix.scale(0.5, 0.5)
# end-pre

     一方、上記のコードで0.5ではなく2.0を使うとパターンは半
     分の大きさになります。

     Cairo::Context#set_sourceのユーザ空間ロック動作の議論に
     も注意してください。

     * matrix: Cairo::Matrixオブジェクト。

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
