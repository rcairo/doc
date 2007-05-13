= class Cairo::Color::CMYK

((*Since 1.5?*)): CMYK（シアン、マゼンタ、黄色、キー・プレー
ト）で色を表現します。

cairoにはないrcairoでの拡張です。

== Object Hierarchy

* Object
  * ((<Cairo::Color::Base>))
    * Cairo::Color::CMYK

== Class Methods

--- Cairo::Color::CMYK.new(c, m, y, k, a=1.0)

    CMYKで表現した色を生成します。

     * c: シアン
     * m: マゼンタ
     * y: 黄色
     * k: キー・プレート（黒）
     * a: アルファ値
     * Returns: 生成した色

== Instance Methods

--- cyan
--- c

     シアンの値を返します。

     * Returns: シアンの値

--- cyan=(value)
--- c=(value)

     シアンの値を設定します。

     * value: 新しいシアンの値

--- magenta
--- m

     マゼンタの値を返します。

     * Returns: マゼンタの値

--- magenta=(value)
--- m=(value)

     シアンの値を設定します。

     * value: 新しいマゼンタの値

--- yellow
--- y

     黄色の値を返します。

     * Returns: 黄色の値

--- yellow=(value)
--- y=(value)

     黄色の値を設定します。

     * value: 新しい黄色の値

--- key_plate
--- k

     キー・プレートの値を返します。

     * Returns: キー・プレートの値

--- key_plate=(value)
--- k=(value)

     キー・プレートの値を設定します。

     * value: 新しいキー・プレートの値

--- to_a
--- to_ary

     [cyan, magenta, yellow, key_plate, alpha]を返します。

     * Returns: シアン、マゼンタ、黄色、キー・プレート、アル
       ファ値の配列

--- to_cmyk

     複製を返します。

     * Returns: 自分自身の複製

--- to_hsv

     HSV形式に変換した色を返します。

     * Returns: Cairo::Color::HSVオブジェクト

--- to_rgb

     RGB形式に変換した色を返します。

     * Returns: Cairo::Color::RGBオブジェクト

== See Also

  * Cairo::Color::Base
  * Cairo::Color::RGB
  * Cairo::Color::HSV
  * Index

== ChangeLog

  * 2007-04-26: kou: スタート。
