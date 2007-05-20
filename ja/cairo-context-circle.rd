= module Cairo::Context::Circle

円に関する便利なメソッドをCairo::Contextに提供するモ
ジュールです。

cairoにはないrcairoでの拡張です。

== Instance Methods

--- circle(center_x, center_y, radius)

     現在のパスに円を追加します。以下のように
     Cairo::Context#arcを呼び出したのと同じです。

       context.arc(center_x, center_y, radius, 0, 2 * Math::PI)

     * center_x: 円の中心のx座標
     * center_y: 円の中心のy座標
     * radius: 円の半径

== See Also

  * Cairo::Context
  * Index

== ChangeLog

  * 2007-04-30: kou: スタート。
