= class Cairo::FontFace

Cairo::FontFaceはサイズとフォント用行列以外の全てのフォントの
外観を指定します。（フォント用行列はフォントを素直に歪ませた
り、ふたつの異なった方向に拡大するために使われます。）コンテ
キストにフォントフェイスを指定するには
Cairo::Context#set_font_faceを使います。サイズとフォント用行
列はCairo::Context#set_font_sizeと
Cairo::Context#set_font_matrixで指定します。

フォントフェイスには多くの種類が有り、使用しているフォントバッ
クエンドに依存します。フォントフェイスの種類はクラスでわかり
ます。

rcairoではCairo::FontFaceの生成をサポートしていません。

== Object Hierarchy

* Object
  * Cairo::FontFace

== See Also

  * Index

== ChangeLog

  * 2007-05-19: kou: スタート。
