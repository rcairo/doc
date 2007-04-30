= module Cairo::Context::Color

色に関する便利なメソッドを((<Cairo::Context>))に提供するモ
ジュールです。

cairoにはないrcairoでの拡張です。

== Instance Methods

--- set_source_color(color)

     ソースの色を((|color|))にします。
     ((<Cairo::Context#set_source_rgba>))よりも便利です。

     * color: ((<Cairo::Color.parse>))でパースできるオブジェ
       クト

== See Also

  * ((<Cairo::Context>))
  * ((<Index>))

== ChangeLog

  * 2007-04-30: kou: スタート。
