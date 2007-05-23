= module Cairo::Extend

パターンの外側の領域をどのように描画するかを表します。

== Constants

--- NONE

     ソースパターンの外側のピクセルは完全に透過します。

--- PAD

     パターンの外側のピクセルはソースにもっとも近いピクセル
     を使います。（Cairo::SurfacePatternでは実装されていませ
     ん。）

--- REFLECT

     パターンを端で反射して敷き詰めます。
     （Cairo::SurfacePatternでは実装されていません。）

--- REPEAT

     パターンを繰り返して敷き詰めます。

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
