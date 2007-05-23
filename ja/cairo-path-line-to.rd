= class Cairo::PathLineTo

直線を描く操作を表すパスデータです。

== Object Hierarchy

* Object
  * ((<Cairo::PathData>))
    * Cairo::PathLineTo

== Class Methods

--- Cairo::PathLineTo.new(x, y)
--- Cairo::PathLineTo.new(point)

     現在の点から(((|x|)), ((|y|)))あるいは((|point|))の点ま
     での線分をパスに追加するパスデータを生成します。

     * x: 線分の終点のX座標
     * y: 線分の終点のY座標
     * point: 線分の終点
     * Returns: Cairo::PathLineToオブジェクト

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
