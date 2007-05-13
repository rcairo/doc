= module Cairo::Context::Color

色に関する便利なメソッドをCairo::Contextに提供するモ
ジュールです。

cairoにはないrcairoでの拡張です。

== Instance Methods

--- set_source_color(color)

     ソースの色を((|color|))にします。
     Cairo::Context#set_source_rgbaよりも便利です。

     * color: Cairo::Color.parseでパースできるオブジェ
       クト

== See Also

  * Cairo::Context
  * Index

== ChangeLog

  * 2007-04-30: kou: スタート。
