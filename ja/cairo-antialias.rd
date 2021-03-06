= module Cairo::Antialias

テキストや形を描画するときに使うアンチエイリアスの種類を指定
します。

== Constants

--- DEFAULT

     サブシステムと対象装置のデフォルトのアンチエイリアスを
     使います。

--- GRAY

     1色のアンチエイリアスを実行します。（例えば、白い背景
     上の黒いテキストには灰色の陰を使います。）

--- NONE

     2層のアルファマスクを使います。

--- SUBPIXEL

     LCDパネルのような装置上のサブピクセル要素の順序で適して
     いるアンチエイリアスを実行します。

== See Also

  * Index

== ChangeLog

  * 2007-05-20: kou: スタート。
