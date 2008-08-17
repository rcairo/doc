= class Cairo::TextCluster

((*Since 1.8*)): テキストクラスタ情報を持ちます。テキストクラ
スタとは、複数のグリフと対応するUTF-8テキストとの最小の対応で
す。それぞれをグリフ数とテキストのバイト数として持っています。

妥当なクラスタは、バイト数とグリフ数が負ではなく、どちらか一
方は0ではありません。グリフが0のクラスタは普通のクラスタと同
じようにはサポートされていないことに注意してください。例えば、
通常のPDF描画アプリケーションは、PDFテキストが選択されている
ときはそれらのクラスタを無視します。

高度なテキスト操作がどのようにクラスタを使うかは
Cairo::Context#show_text_glyphsを見てください。

== Object Hierarchy

* Object
  * Cairo::TextCluster

== Class Methods

--- Cairo::TextCluster.new(num_bytes, num_glyphs)

     テキストクラスタを生成します。

     * num_bytes: このクラスタが含んでいるUTF-8テキストのバ
       イト数。
     * num_glyphs: このクラスタが含んでいるグリフ数。
     * Returns: 新しく生成したCairo::TextClusterオブジェクト。

== Instance Methods

--- num_bytes

     * Returns: テキストのバイト数。

--- num_bytes=(num_bytes)
--- set_num_bytes(num_bytes)

     * num_bytes: テキストのバイト数

--- num_glyphs

     * Returns: グリフ数。

--- num_glyphs=(num_glyphs)
--- set_num_glyphs(num_glyphs)

     * num_glyphs: グリフ数。

--- to_s

     * Returns: Cairo::TextClusterの文字列表現。

== See Also

  * Cairo::Context#show_text_glyphs
  * Cairo::ScaledFont#text_to_glyphs

== ChangeLog

  * 2008-08-17: kou: スタート。
