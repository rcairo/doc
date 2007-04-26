= class Cairo::Color::Base

((*Since 1.5?*)): より便利で簡単に色を扱うためのクラスです。
RGBで指定していたものはすべてこのクラスのオブジェクトで指定
する事もできます。実際に使うときは((<Cairo::Color::RGB>))な
どこのクラスのサブクラスを使います。

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

--- alpha=
--- a=

     アルファ値を設定します。

== See Also

  * ((<Cairo::Color::RGB>))
  * ((<Cairo::Color::CMYK>))
  * ((<Cairo::Color::HSV>))
  * ((<Index>))

== ChangeLog

  * 2007-04-26: kou: スタート。
