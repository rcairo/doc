= class Cairo::Color::RGB

((*Since 1.5?*)): RGB（赤、緑、青）で色を表現します。

cairoにはないrcairoでの拡張です。

== Object Hierarchy

* Object
  * ((<Cairo::Color::Base>))
    * Cairo::Color::RGB

== Class Methods

--- Cairo::Color::RGB.new(r, g, b, a=1.0)

    RGBで表現した色を生成します。

     * r: 赤
     * g: 緑
     * b: 青
     * a: アルファ値
     * Returns: 生成した色

== Instance Methods

--- red
--- r

     赤の値を返します。

     * Returns: 赤の値

--- red=(value)
--- r=(value)

     赤の値を設定します。

     * value: 新しい赤の値

--- green
--- g

     緑の値を返します。

     * Returns: 緑の値

--- green=(value)
--- g=(value)

     緑の値を設定します。

     * value: 新しい緑の値

--- blue
--- b

     青の値を返します。

     * Returns: 青の値

--- blue=(value)
--- b=(value)

     青の値を設定します。

     * value: 新しい青の値

--- to_a
--- to_ary

     [red, green, blue, alpha]を返します。

     * Returns: 赤、緑、青、アルファ値の配列

--- to_cmyk

     CMYK形式に変換した色を返します。

     * Returns: Cairo::Color::CMYKオブジェクト

--- to_hsv

     HSV形式に変換した色を返します。

     * Returns: Cairo::Color::HSVオブジェクト

--- to_rgb

     複製を返します。

     * Returns: 自分自身の複製

--- to_s

     "#RRGGBBAA"という文字列を返します。RRは赤を、GGは緑を、
     BBは青を、AAはアルファ値を、それぞれ16進数2桁で表現した
     ものになります。

     例えば、赤は"#FF0000FF"に、黒は"#FFFFFFFF"に、白は
     "#000000FF"になります。

     * Returns: #RRGGBBAA形式の文字列

== See Also

  * Cairo::Color::Base
  * Cairo::Color::CMYK
  * Cairo::Color::HSV
  * Index

== ChangeLog

  * 2007-04-26: kou: スタート。
