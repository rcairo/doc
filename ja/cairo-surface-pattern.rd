= class Cairo::SurfacePattern

サーフェスを使ったパターンです。

== Object Hierarchy

* Object
  * ((<Cairo::Pattern>))
    * Cairo::SurfacePattern

== Class Methods

--- Cairo::SurfacePattern.new(surface)

     指定された((|surface|))用のパターンを生成します。

     * surface: Cairo::Surfaceのサブクラスのオブジェクト。

     * Returns: 新しく生成したCairo::SurfacePatternオブジェ
       クト。

== Instance Methods

--- surface

     パターンが使っているサーフェスを返します。

     * Returns: Cairo::Surfaceのサブクラスのオブジェクト。

== See Also

  * Index

== ChangeLog

  * 2007-05-23: kou: スタート。
