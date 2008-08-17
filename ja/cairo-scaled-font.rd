= class Cairo::ScaledFont

好みのサイズと装置解像度に拡大・縮小したフォントです。
Cairo::ScaledFontは低レベルのフォント使用でもっとも役に立ちま
す。例えば、メトリックスの計算を高速化するために拡大・縮小し
たフォントをキャッシュしたいライブラリやアプリケーションには
役に立ちます。

Cairo::ScaledFontにはフォントバックエンドに依存したいくつか
の種類があります。ただし、rcairoではサポートしていません。

== Object Hierarchy

* Object
  * Cairo::ScaledFont

== Class Methods

--- Cairo::ScaledFont.new(font_face, font_matrix, ctm, options)

     フォントフェイスと、フォントサイズと使用環境を表現する
     行列からCairo::ScaledFontオブジェクトを生成します。

     * font_face: Cairo::FontFaceオブジェクト。
     * font_matrix: このフォントのためのフォント空間からユー
       ザ空間への変換行列です。Nポイントのフォントの単純な場
       合だと、この行列は単純にN倍します。しかし、このフォン
       トを剪断したりふたつの軸に付近等に伸縮するのに使うこ
       ともできます。Cairo::Context#set_font_matrixを見てく
       ださい。
     * ctm: フォントが使うユーザ空間から装置空間への変換行列です。
     * options: フォントのメトリックスを取得したりフォントを
       描画するときに使うオプションです。

     * Returns: 生成したCairo::ScaledFontオブジェクト。

== Instance Methods

--- ctm

     ((|self|))を生成するときに指定したCTM（現在の変換行列）
     を返します。

     * Returns: Cairo::Matrixオブジェクト。

--- extents

     メトリックスを返します。

     * Returns: Cairo::FontExtentsオブジェクト。

--- font_face

     ((|self|))を生成するときに指定したフォントフェイスを返
     します。

     * Returns: Cairo::FontFaceオブジェクト。

--- font_matrix

     ((|self|))を生成するときに指定したフォント行列を返しま
     す。

     * Returns: Cairo::Matrixオブジェクト。

--- font_options

     ((|self|))を生成するときに指定したフォントオプションを返
     します。

     * Returns: Cairo::FontOptionsオブジェクト。

--- glyph_extents(glyphs)

     グリフの範囲を返します。範囲はグリフをインクで塗る部分
     を囲む（ユーザ空間での）四角を示しています。（グリフは
     Cairo::Context#show_glyphsで描画できます。）さらに、
     範囲（Cairo::TextExtents）の((|x_advance|))と
     ((|y_advance|))の値はCairo::Context#show_glyphsが進める
     現在の点の合計を示しています。
     （Cairo::Context#show_glyphsはグリフを描画すると、描画
     した分だけ現在の点を進めます。）

     空白のグリフは四角のサイズ（extents.widthと
     extents.height）に貢献しないことに注意してください。

     * glyphs: Cairo::Glyphの配列
     * Returns: グリフの範囲を示すCairo::TextExtentsオブジェ
       クト。

--- text_extents(utf8)

     テキストの範囲を返します。範囲はテキストをインクで塗る
     部分（テキストが描画される部分）を囲む（ユーザ空間での）
     示しています。さらに、範囲（Cairo::TextExtents）の
     ((|x_advance|))と((|y_advance|))の値は
     Cairo::Context#show_glyphsが進める現在の点の合計を示し
     ています。（Cairo::Context#show_textはテキストを描画す
     ると、描画した分だけ現在の点を進めます。）

     空白文字は四角のサイズ（extents.widthとextents.height）
     に貢献しないことに注意してください。空白文字は非空白文
     字の位置を変更することにより間接的に貢献しています。特
     に、テキストの最後の空白文字は四角のサイズには影響を与
     えませんが、((|x_advance|))と((|y_advance|))の値には影
     響を与えます。

     * utf8: UTF-8で符号化されたテキスト。
     * Returns: テキストの範囲を示すCairo::TextExtentsオブジェ
       クト。

--- scale_matrix

     ((*Since 1.7*)): 拡大・縮小用の行列を返します。拡大・縮
     小用行列は、このCairo::ScaledFontのフォント行列と現在の
     変換行列（CTM）の積です。つまり、フォント空間から装置空
     間へ変換する（写像する・mapする）行列です。

     * Returns: 拡大・縮小用の行列。

--- text_to_glyphs(x, y, utf8)

     ((*Since 1.7*)): UTF-8のテキストをグリフの配列とクラス
     タ対応に変換します。これらは後でこのCairo::ScaledFontを
     使って描画するときに使うことができます。

     どのようにクラスタ対応情報が入力のUTF-8のテキストと出力
     のグリフを対応付けるかの詳細については
     Cairo::Context#show_text_glyphsを見てください。

     同じCairo::ScaledFontを使う場合は、戻り値はそのまま
     Cairo::Context#show_text_glyphsや
     Cairo::Context#show_glyphsなど関連するメソッドで使うこ
     とができます。

     * Returns: (({[glyphs, clusters, backward]}))
       * glyphs: グリフ（Cairo::Glyph）の配列。
       * clusters: クラスタ対応情報（Cairo::TextCluster）の
         配列。
       * backward: テキストとグリフの対応が後ろ向きかどうか
         の真偽値。

== See Also

  * Index
  * Cairo::Context
  * Cairo::Glyph
  * Cairo::TextCluster

== ChangeLog

  * 2008-08-17: kou: 1.7.4対応。
  * 2007-05-23: kou: スタート。
