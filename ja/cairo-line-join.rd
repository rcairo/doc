= module Cairo::LineJoin

描きのとき、ふたつの線の結合点をどのように描画するかを指定し
ます。

== Constants

--- BEVEL

     切断結合を使います。この結合は結合点から線幅の半分の部
     分で切断します。

--- MITER

     尖った（角度の付いた）角を使います。
     Cairo::Context#set_miter_limitを見てください。

--- ROUND

     丸い結合を使います。円の中心は結合点です。

== See Also

  * Index

== ChangeLog

  * 2007-05-20: kou: スタート。
