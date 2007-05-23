= class Cairo::GradientPattern

グラデーション用のパターン。使うときはCairo::LinearPatternか
Cairo::RadialPatternを使う。

== Object Hierarchy

* Object
  * ((<Cairo::Pattern>))
    * Cairo::GradientPattern

== Instance Methods

--- add_color_stop(offset, color)
--- add_color_stop(offset, red, green, blue, alpha=1.0)
--- add_color_stop(offset, rgb)
--- add_color_stop(offset, rgba)

     グラデーションパターンにカラーストップを追加します。
     ((|offset|))はグラデーションの制御ベクトルに沿った位置
     を指定します。例えば、線形グラデーションの制御ベクトル
     は(x0, y0)から(x1, y1)までです。放射グラデーションの制
     御ベクトルは開始円の任意の場所から終端円の対応する点ま
     でです。

     色はCairo::Context#set_source_colorや
     Cairo::Context#set_source_rgb、
     Cairo::Context#set_source_rgbaと同じ方法で指定します。

     * offset: 範囲[0.0 .. 1.0]間の補正値。
     * color: Cairo::Color.parseで認識できる色。
     * red: 色の赤の値。
     * green: 色の緑の値。
     * blue: 色の青の値。
     * alpha: 色のアルファ値。
     * rgb: (({[red, green, blue]}))
     * rgba: (({[red, green, blue, alpha]}))

--- add_color_stop_rgb(offset, red, green, blue)

     Cairo::GradientPattern#add_color_stopを以下のように呼び
     出したのと同じです。

       pattern.add_color_stop(offset, red, green, blue)

--- add_color_stop_rgba(offset, red, green, blue, alpha)

     Cairo::GradientPattern#add_color_stopを以下のように呼び
     出したのと同じです。

       pattern.add_color_stop(offset, red, green, blue, alpha)

--- color_stop_count

     カラーストップの数を返します。

     * Returns: カラーストップの数。

--- get_color_stop_rgba(index)

     指定された((|index|))の色と補正値の情報を返します。

     * Returns: (({[offset, red, green, blue, alpha]}))
       * offset: 指定されたカラーストップの補正値。
       * red: 色の赤の値。
       * green: 色の緑の値。
       * blue: 色の青の値。
       * alpha: 色のアルファ値。

--- get_color_stop_color(index)

     指定された((|index|))の色と補正値の情報を返します。
     Cairo::GradientPattern#get_color_stop_rgbaと違い
     Cairo::Color::RGBオブジェクトとして返します。

     * Returns: (({[offset, color]}))
       * offset: 指定されたカラーストップの補正値。
       * color: Cairo::Color::RGBオブジェクト。

== See Also

  * Index
  * Cairo::LinearPattern
  * Cairo::RadialPattern

== ChangeLog

  * 2007-05-20: kou: スタート。
