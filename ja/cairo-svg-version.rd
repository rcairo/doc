= module Cairo::SVGVersion

生成するSVGファイルが従うSVG仕様のバージョンを表すために使い
ます。

== Module Functions

--- Cairo::SVGVersion.list

     Cairo::SVGVersion#restrict_to_versionで指定するバージョ
     ンの配列を返す。

     * Returns: サポートしているバージョンの配列

--- Cairo::SVGVersion.names

     Cairo::SVGVersion#restrict_to_versionが返すバージョンそ
     れぞれを文字列で表現した配列を返す。

     * Returns: サポートしているバージョンの文字列表現の配列

== Constants

--- VERSION_1_1

     SVG仕様のバージョン1.1。

--- VERSION_1_2

     SVG仕様のバージョン1.2。

== See Also

  * Index

== ChangeLog

  * 2008-04-11: kou: Module Functions追加。
  * 2007-05-22: kou: スタート。
