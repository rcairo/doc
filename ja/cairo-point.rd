= class Cairo::Point

点を表します。

rcairoの拡張です。

== Object Hierarchy

* Object
  * Cairo::Point

== Class Methods

--- Cairo::Point.new(x, y)

     点(((|x|)), ((|y|)))を生成します。

     * x: 点のX座標
     * y: 点のY座標
     * Returns: 点。

== Instance Methods

--- distance(other)

     ((|self|))と((|other|))との距離を計算します。

     * other: Cairo::Pointオブジェクト
     * Returns: 距離。

--- to_a
--- to_ary

     配列貸します。

     * Returns: (({[x, y]}))
       * x: 点のX座標
       * y: 点のY座標

--- x

     点のX座標を返します。

     * Returns: X座標。

--- y

     点のY座標を返します。

     * Returns: Y座標。

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
