= module Cairo::Hint Style

フォントの輪郭に対する指示の種類を指定します。指示とは結果の
外観を向上させるために輪郭をピクセルの格子に合わせる処理です。
輪郭に指示を与えるということは輪郭を壊すということなので、元
の輪郭の形への忠実さを減少します。全てのフォントバックエンド
で全ての輪郭指示スタイルがサポートされているわけではありま
せん。

== Constants

--- DEFAULT

     フォントバックエンドと対象装置のデフォルトの指示スタイ
     ルを使います。

--- FULL

     輪郭を最大限引き立たせる指示を与えます。

--- MEDIUM

     元の形への忠実さと引き立たせ具合の間での中程度の妥協点を
     使うように指示を与えます。

--- NONE

     輪郭へ指示を与えません。

--- SLIGHT

     わずかに輪郭を引き立たせるように指示を与えます。元の形
     への高い忠実さを保ちます。

== See Also

  * Index

== ChangeLog

  * 2007-05-20: kou: スタート。