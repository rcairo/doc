= module Cairo::Context::Rectangle

四角いパスに関する便利なメソッドをCairo::Contextに提供
するモジュールです。

cairoにはないrcairoでの拡張です。

== Instance Methods

--- rounded_rectangle(x, y, width, height, x_radius, y_radius=nil)

     角の丸い四角いパスを追加します。角の丸みは
     ((|x_radius|))と((|y_radius|))で決まります。
     ((|x_radius|))は横方向の角の丸の半径になり、
     ((|y_radius|))は縦方向の角の丸の半径になります。
     ((|y_radius|))を省略した場合は((|x_radius|))と同じ値を
     用います。

     * x: 角が丸くないときの四角の左上の角の点のx座標
     * y: 角が丸くないときの四角の左上の角の点のy座標
     * width: 四角の幅
     * height: 四角の高さ
     * x_radius: 角の丸の横方向の半径
     * y_radius: 角の丸の縦方向の半径

== See Also

  * Cairo::Context
  * Index

== ChangeLog

  * 2007-04-30: kou: スタート。
