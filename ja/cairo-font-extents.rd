= class Cairo::FontExtents

フォントのメトリック（距離）情報を持つクラスです。現在のユー
ザ空間座標システムでの値になります。

フォント・メトリックがユーザ空間座標なので、全てではありませ
んが、多くの場合、現在の変換行列とは独立しています。もし、
(({context.scale(2.0, 2.0)}))とすると、テキストは2倍の大きさ
で描画されますが、取得されたテキストの範囲は2倍になっていませ
ん。範囲はヒント（Cairo::HintMetricsのこと）によって少し変
わる（そのため、メトリックが変換行列から独立していると仮定す
ることはできません）でしょうが、そうでなければ変わらないでしょ
う。

== Object Hierarchy

* Object
  * Cairo::FontExtents

== Class Methods

--- Cairo::FontExtents.new

     ((*Since 1.7*)): 新しくCairo::FontExtentsオブジェ
     クトを生成します。以下のように値が設定されています。
       * ascent: 1.0
       * descent: 0.0
       * height: 1.0
       * max_x_advance: 1.0
       * max_y_advance: 0.0

     * Returns: 新しく生成されたCairo::FontExtentsオブジェクト。

== Instance Methods

--- ascent

     フォントがベースラインより上に広げる距離。この値が常に
     フォントの全てのグリフの範囲の最大値と同じになるわけで
     はないことに注意してください。そうではなくて、どのよう
     にフォントをベースライン上の要素と並べるべきかというフォ
     ントデザイナの意図を表現するために取り出します。

     * Returns: フォントがベースラインより上に広げる距離。

--- ascent=(ascent)
--- set_ascent(ascent)

    ((*Since 1.7*))

     * ascent: フォントがベースラインより上に広げる距離。

--- descent

     フォントがベースラインより下に広げる距離。多くのフォン
     トはベースラインの下の部分を含みますが、そのようなフォ
     ントではこの値は正になります。この値が常にフォントの全
     てのグリフの範囲の最大値と同じになるわけではないことに
     注意してください。そうではなくて、どのようにフォントを
     ベースラインより下の要素と並べるべきかというフォントデ
     ザイナの意図を表現するために取り出します。

     * Returns: フォントがベースラインより下に広げる距離。

--- descent=(descent)
--- set_descent(descent)

    ((*Since 1.7*))

     * descent: フォントがベースラインより下に広げる距離。

--- height

     指定したフォントでテキストの連続的な線を設定したときに
     推奨される縦方向のベースライン間の距離です。この値は行
     ピッチや行間（external leading）として知られる量のおか
     げで(({ascent + descent}))よりも大きいです。空白がとて
     も需要が多い場合、多くのフォントは線の間の(({ascent +
     descent}))の距離だけが設定されます。

     * Returns: 高さ

--- height=(height)
--- set_height(height)

    ((*Since 1.7*))

     * height: 高さ

--- max_x_advance

     X方向の最大の距離。基点はフォントの中の全てのグリフによっ
     進化します。

     * Returns: X方向の最大の距離。

--- max_x_advance=(max_x_advance)
--- set_max_x_advance(max_x_advance)

    ((*Since 1.7*))

     * max_x_advance: X方向の最大の距離。

--- max_y_advance

     Y方向の最大の距離。基点はフォントの中の全てのグリフによっ
     進化します。普通のフォントを横書きにする場合は0になりで
     しょう。（東アジアの文字はときどき縦書きになります。）

     * Returns: Y方向の最大の距離。

--- max_y_advance=(max_y_advance)
--- set_max_y_advance(max_y_advance)

    ((*Since 1.7*))

     * max_y_advance: Y方向の最大の距離。

--- to_s

     * Returns: このCairo::FontExtentsの文字列表現。

== See Also

  * Index
  * Cairo::UserFontFace#on_init

== ChangeLog

  * 2008-08-17: kou: rcairo 1.7対応
  * 2007-04-16: kou: スタート
