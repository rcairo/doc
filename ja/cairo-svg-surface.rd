= class Cairo::SVGSurface

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::SVGSurface

== Class Methods

--- Cairo::SVGSurface.new(stream, width_in_points, height_in_points)
--- Cairo::SVGSurface.new(filename, width_in_points, height_in_points)

     ポイントで指定されたサイズのSVG用サーフェスを生成します。

     第1引数に(({write}))メソッドを持ったオブジェクトを指定
     した場合はSVG形式のデータが順次(({stream.write}))で書き
     出されます。

     (({write}))メソッドを持っていない場合はファイル名として
     扱われます。SVG形式のデータはファイル名((|filename|))の
     ファイルに出力されます。

     * stream: (({write}))メソッドを持つオブジェクト。
     * filename: 結果を出力するファイル名。
     * width_in_points: ポイントで指定した幅。（1ポイント =
       1/72.0インチ）
     * height_in_points: ポイントで指定した高さ。（1ポイント =
       1/72.0インチ）

     * Returns: 生成したCairo::SVGSurfaceオブジェクト。

--- Cairo::SVGSurface.version_to_string(version)

     ((|version|))の文字列表現を返します。

     * version: "1_1"や"1_2"などCairo::SVGVersionに定義
       されている定数名から「VERSION_」をのぞいたもの。"_"の
       代わりに"."を使って"1.1"や"1.2"と書くともできます。も
       ちろん、Cairo::SVGVersionに定義されている定数を指定す
       ることもできます。
     * Returns: ((|version|))の文字列表現

--- Cairo::SVGSurface.versions

     サポートしているバージョンのリストを返します。

     * Returns: サポートしているバージョンの配列

--- Cairo::SVGSurface.versions_as_string

     サポートしているバージョンの文字列表現のリストを返しま
     す。

     * Returns: サポートしているバージョンの文字列表現の配列

== Instance Methods

--- restrict_to_version(version)

     生成するSVGファイルのバージョンを((|version|))に制限し
     ます。

     このメソッドはすべての描画操作の前にだけ呼び出すべきで
     す。サーフェスを作ってすぐに呼び出すのが簡単な方法です。

     * version: "1_1"や"1_2"などCairo::SVGVersionに定義
       されている定数名から「VERSION_」をのぞいたもの。"_"の
       代わりに"."を使って"1.1"や"1.2"と書くともできます。も
       ちろん、Cairo::SVGVersionに定義されている定数を指定す
       ることもできます。

== Constants

--- VERSION_1_1
--- VERSION_1_2

== See Also

  * Index

== ChangeLog

  * 2007-05-23: kou: スタート。

