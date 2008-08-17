= class Cairo::TextExtents

ひとつのグリフか複数のグリフの範囲をユーザ空間座標で表します。
テキストの範囲がユーザ空間座標なので、多くの場合、現在の変換
行列に依存していません。(({context.scale(2.0, 2.0)}))を呼んだ
ら、テキストは2倍の大きさで描画されませうが、報告されるテキス
トの範囲は2倍になっていません。範囲はヒントで少し変わるかもし
れません（そのため、メトリックスが変換行列に依存していると仮
定できません）が、それ以外の場合は変わりません。

== Object Hierarchy

* Object
  * Cairo::TextExtents

== Class Methods

--- Cairo::TextExtents.new

     ((*Since 1.7*)): 新しくCairo::TextExtentsオブジェ
     クトを生成します。以下のように値が設定されています。
       * x_bearing: 0.0
       * y_bearing: -1.0
       * width: 0.0
       * height: 1.0
       * x_advance: 1.0
       * y_advance: 0.0

     * Returns: 新しく生成されたCairo::TextExtentsオブジェクト。

== Instance Methods

--- height

     表示されるグリフの高さを返します。

     * Returns: 高さ

--- height=(height)
--- set_height(height)

     ((*Since 1.7*))

     * height: 高さ

--- width

     表示されるグリフの幅を返します。

     * Returns: 幅

--- width=(width)
--- set_width(width)

     ((*Since 1.7*))

     * width: 幅

--- x_advance

     グリフを描画した後にX方向に進める距離を返します。

     * Returns: X方向に進める距離

--- x_advance=(x_advance)
--- set_x_advance(x_advance)

     ((*Since 1.7*))

     * x_advance: X方向に進める距離

--- y_advance

     グリフを描画した後にY方向に進める距離を返します。東アジ
     アの言語に見られる縦書きテキストレイアウトをのぞけば、
     普通は0になります。

     * Returns: Y方向に進める距離

--- y_advance=(y_advance)
--- set_y_advance(y_advance)

     ((*Since 1.7*))

     * y_advance: Y方向に進める距離

--- x_bearing

     表示するグリフのもっとも左側の部分の基点からの水平方
     向の距離を返します。グリフが完全に基点より右にある場合
     は正の値です。

     * Returns: 基点からの水平方向の距離

--- x_bearing=(x_bearing)
--- set_x_bearing(x_bearing)

     ((*Since 1.7*))

     * x_bearing: 基点からの水平方向の距離

--- y_bearing

     表示するグリフのもっとも左側の部分の基点からの垂直方
     向の距離を返します。グリフが完全に基点より下にある場合
     は正の値です。

     * Returns: 基点からの垂直方向の距離

--- y_bearing=(y_bearing)
--- set_y_bearing(y_bearing)

     ((*Since 1.7*))

     * y_bearing: 基点からの垂直方向の距離

--- to_s

     * Returns: Cairo::TextExtentsの文字列表現

== See Also

  * Index
  * Cairo::UserFontFace#on_render_glyph

== ChangeLog

  * 2008-08-17: kou: rcairo 1.7対応。
  * 2007-05-22: kou: スタート
