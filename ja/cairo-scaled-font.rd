= class Cairo::ScaledFont

好みのサイズと装置解像度に拡大・縮小したフォントです。
Cairo::ScaledFontは低レベルのフォント使用でもっとも役に立ちま
す。例えば、メトリックスの計算を高速化するために拡大・縮小し
たフォントをキャッシュしたいライブラリやアプリケーションには
役に立ちます。

Cairo::ScaledFontにはフォントバックエンドに依存したいくつか
の種類があります。ただし、rcairoではサポートしていません。

== Object Hierarchy

* Object
  * Cairo::ScaledFont

== Class Methods

--- Cairo::ScaledFont.new

     * Returns: self

== Instance Methods

--- ctm

     * Returns: self

--- extents

     * Returns: self

--- font_face

     * Returns: self

--- font_matrix

     * Returns: self

--- font_options

     * Returns: self

--- glyph_extents

     * Returns: self

--- text_extents

     * Returns: self

== See Also

  * Index

== ChangeLog


