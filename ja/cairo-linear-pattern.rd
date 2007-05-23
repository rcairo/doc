= class Cairo::LinearPattern

線形グラデーション用のパターンです。

== Object Hierarchy

* Object
  * ((<Cairo::Pattern>))
    * ((<Cairo::GradientPattern>))
      * Cairo::LinearPattern

== Class Methods

--- Cairo::LinearPattern.new(x0, y0, x1, y1)

     ((({x0})), (({y0})))と((({x1})), (({y1})))で定義される
     線に沿った新しい線形グラデーション用のパターンを作りま
     す。グラデーションパターンを使う前に、
     Cairo::GradientPattern#add_color_stopを使ってたくさんの
     カラーストップを定義してください。

     注: 座標はパターン空間になります。新しいパターンはユー
     ザ空間と同じになっていますが、ふたつの空間の関係は
     Cairo::Pattern#set_matrixで変更できます。

     * x0: 始点のX座標
     * y0: 始点のY座標
     * x1: 終点のX座標
     * y1: 終点のY座標
     * Returns: 新しく作成したCairo::LinearPatternオブジェク
       ト。

== Instance Methods

--- points

     線形グラデーションのグラデーション終点を返します。

     * Returns: (({[x0, y0, x1, y1]}))
       * x0: 始点のX座標
       * y0: 始点のY座標
       * x1: 終点のX座標
       * y1: 終点のY座標

== See Also

  * Index

== ChangeLog

  * 2007-05-21: kou: スタート。
