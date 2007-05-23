= class Cairo::PathCurveTo

曲線を描く操作を表すパスデータです。

== Object Hierarchy

* Object
  * ((<Cairo::PathData>))
    * Cairo::PathCurveTo

== Class Methods

--- Cairo::PathCurveTo.new(x1, y1, x2, y2, x3, y3)
--- Cairo::PathCurveTo.new(point1, point2, point3)

     現在の点から(((|x3|)), ((|y3|)))あるいは((|point3|))まで
     の3次のベジエスプライン曲線をパスに追加するパスデータを
     生成します。制御点には(((|x1|)), ((|y1|)))と(((|x2|)),
     ((|y2|)))あるいは((|point1|))と((|point2|))を使います。

     * x1: 最初の制御点のX座標
     * y1: 最初の制御点のY座標
     * x2: 2番目の制御点のX座標
     * y2: 2番目の制御点のY座標
     * x3: 曲線の終点のX座標
     * y3: 曲線の終点のY座標

     * point1: 最初の制御点
     * point2: 2番目の制御点
     * point3: 曲線の終点

     * Returns: Cairo::PathCurveToオブジェクト。

== See Also

  * Index

== ChangeLog

  * 2007-05-21: kou: スタート。
