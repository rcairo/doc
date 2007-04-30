= module Cairo::Context::Circle

円に関する便利なメソッドを((<Cairo::Context>))に提供するモ
ジュールです。

cairoにはないrcairoでの拡張です。

== Instance Methods

--- circle(x, y, radius)

     現在のパスに円を追加します。以下と同じです。

       arc(x, y, radius, 0, 2 * Math::PI)

     * x: 円の中心のx座標
     * y: 円の中心のy座標
     * radius: 円の半径

== See Also

  * ((<Cairo::Context>))
  * ((<Index>))

== ChangeLog

  * 2007-04-30: kou: スタート。
