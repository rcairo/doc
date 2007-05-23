= class Cairo::RadialPattern

放射グラデーション用のパターンです。

== Object Hierarchy

* Object
  * ((<Cairo::Pattern>))
    * ((<Cairo::GradientPattern>))
      * Cairo::RadialPattern

== Class Methods

--- Cairo::RadialPattern.new(cx0, cy0, radius0, cx1, cy1, radius1)

     (((|cx0|)), ((|cy0|)), ((|radius0|)))と(((|cx1|)),
     ((|cy1|)), ((|radius1|)))で定義されるふたつの円の間の放
     射グラデーション用のパターンを生成します。このグラデー
     ションパターンを使う前に、
     Cairo::GradientPattern#add_color_stopを使ってたくさんの
     カラーストップを定義してください。

     注: 座標はパターン空間になります。新しいパターンはユー
     ザ空間と同じになっていますが、ふたつの空間の関係は
     Cairo::Pattern#set_matrixで変更できます。

     * cx0: 開始円の中心のX座標
     * cy0: 開始円の中心のY座標
     * radius0: 開始円の半径
     * cx1: 終了円の中心のX座標
     * cy1: 終了円の中心のY座標
     * radius1: 終了円の半径
     * Returns: 新しく作成したCairo::GradientPatternオブジェク
       ト。

== Instance Methods

--- circles

     放射グラデーションの2つの円を返します。それぞれ中心座標
     と半径で特定されます。

     * Returns: (({[[x0, y0, r0], [x1, y1, r1]]}))
       * x0: 1つめの円の中心のX座標
       * y0: 1つめの円の中心のY座標
       * r0: 1つめの円の半径
       * x1: 2つめの円の中心のX座標
       * y1: 2つめの円の中心のY座標
       * r1: 2つめの円の半径

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
