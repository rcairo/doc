= class Cairo::SolidPattern

単色のパターンです。

== Object Hierarchy

* Object
  * ((<Cairo::Pattern>))
    * Cairo::SolidPattern

== Class Methods

--- Cairo::SolidPattern.new(color)
--- Cairo::SolidPattern.new(red, green, blue, alpha=1.0)
--- Cairo::SolidPattern.new([red, green, blue, alpha=1.0])

     指定した色のパターンを生成します。色の要素はそれぞれ0か
     ら1の範囲で指定します。もしその範囲を越えていたら強制的
     に範囲内に収められます。

     * color: Cairo::Color.parseで対応している色

     * red: 色の赤成分
     * green: 色の緑成分
     * blue: 色の青成分
     * alpha: 色のアルファ成分

     * Returns: 新しいCairo::SolidPatternオブジェクト。

== Instance Methods

--- color

     色をCairo::Color::RGBオブジェクトとして返します。

     * Returns: Cairo::Color::RGBオブジェクト

--- rgba

     色をRGBA値を返します。

     * Returns: (({[red, green, blue, alpha]}))
       * red: 色の赤成分
       * green: 色の緑成分
       * blue: 色の青成分
       * alpha: 色のアルファ成分

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
