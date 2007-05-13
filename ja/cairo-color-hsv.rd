= class Cairo::Color::HSV

((*Since 1.5?*)): HSV（色相、彩度、明度）で色を表現します。

cairoにはないrcairoでの拡張です。

== Object Hierarchy

* Object
  * ((<Cairo::Color::Base>))
    * Cairo::Color::HSV

== Class Methods

--- Cairo::Color::HSV.new(h, s, v, a=1.0

    HSVで表現した色を生成します。

     * h: 色相
     * s: 彩度
     * v: 明度
     * a: アルファ値
     * Returns: 生成した色

== Instance Methods

--- hue
--- h

     色相の値返します。

     * Returns: 色相の値

--- hue=(value)
--- h=(value)

     色相の値を設定します。

     * value: 新しい色相の値

--- saturation
--- s

     彩度の値を返します。

     * Returns: 彩度の値

--- saturation=(value)
--- s=(value)

     彩度の値を設定します。

     * value: 新しい彩度の値

--- value
--- v

     明度の値を返します。

     * Returns: 明度の値

--- value=(value)
--- v=(value)

     明度の値を設定します。

     * value: 新しい明度の値

--- to_a
--- to_ary

     [hue, saturation, value, alpha]を返します。

     * Returns: 色相、彩度、明度、アルファ値の配列

--- to_cmyk

     CMYK形式に変換した色を返します。

     * Returns: Cairo::Color::CMYKオブジェクト

--- to_hsv

     複製を返します。

     * Returns: 自分自身の複製

--- to_rgb

     RGB形式に変換した色を返します。

     * Returns: Cairo::Color::RGBオブジェクト

== See Also

  * Cairo::Color::Base
  * Cairo::Color::RGB
  * Cairo::Color::CMYK
  * Index

== ChangeLog

  * 2007-04-26: kou: スタート。
