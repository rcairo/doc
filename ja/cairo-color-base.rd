= class Cairo::Color::Base

((*Since 1.5?*)): 簡単に色を扱うためのクラスです。RGBで指定し
ていたものはすべてこのクラスのオブジェクトで指定する事もでき
ます。実際に使うときはCairo::Color::RGBなどこのクラスの
サブクラスを使います。

cairoにはないrcairoでの拡張です。

== Object Hierarchy

* Object
  * Cairo::Color::Base

== Class Methods

--- Cairo::Color::Base.new(alpha)

     普通は使いません。

== Instance Methods

--- alpha
--- a

     アルファ値を返します。

     * Returns: アルファ値

--- alpha=(value)
--- a=(value)

     アルファ値を設定します。

     * value: 新しいアルファ値

== See Also

  * Cairo::Color::RGB
  * Cairo::Color::CMYK
  * Cairo::Color::HSV
  * Index

== ChangeLog

  * 2007-04-26: kou: スタート。
