= class Cairo::UserFontFace

((*Since 1.7*)): ユーザが独自のフォントを使うためのフォント
フェイス。

on_XXXメソッドでコールバックを登録する方法と
Cairo::UserFontFaceを継承して、そのクラスにコールバック用のメ
ソッドを定義する方法があります。

継承した場合のコールバック用メソッドの名前はon_XXXメソッドか
ら「on_」を除いた部分です。例えば、on_initに対応するメソッド
名はinitです。引数は同じです。以下は継承する例です。
render_glyph以外は定義しなくてもかまいません。

# start-pre
  class CustomUserFontFace < Cairo::UserFontFace
    def init(scaled_font, context, font_extents)
    end

    def render_glyph(scaled_font, glyph, context, text_extents)
    end

    def text_to_glyphs(scaled_font, utf8, data)
    end

    def unicode_to_glyph(scaled_font, unicode)
    end
  end
# end-pre

== Object Hierarchy

* Object
  * ((<Cairo::FontFace>))
    * Cairo::UserFontFace

== Class Methods

--- Cairo::UserFontFace.new

     ((*Since 1.7*)): 新しくCario::UserFontFaceオブジェクト
     を生成します。

     オブジェクトを生成したら、on_XXXメソッドでコールバック
     を登録してください。必須のコールバックは
     Cairo::UserFontFace#on_render_glyphです。それ以外のコー
     ルバックは省略可能です。

     継承して利用する場合、そのクラスのメソッドよりもon_XXX
     メソッドで登録したコールバックの方が優先されます。

     * Returns: 新しく生成したCario::UserFontFaceオブジェク
       ト。

== Instance Methods

--- on_init {|scaled_font, context, font_extents| ...}

     ((*Since 1.7*)): 拡大・縮小したフォントを初期化するコー
     ルバックを登録します。このコールバックは省略可能です。

     ((|context|))は呼び出し元では使われませんが、フォント空
     間ように準備されています。これは
     Cairo::UserFontFace#on_render_glyphで登録するコールバッ
     クに渡される((|context|))と同様です。コールバック中では
     このCairo::Contextをフォントの範囲を計算するために使う
     ことができます。

     ((|font_extents|))には((|scaled_font|))用のフォントの範
     囲を設定します。座標はフォント空間です。そのため、多く
     の場合はCairo::FontExtents#ascentと
     Cairo::FontExtents#descentに1.0を足す必要があります。
     ((|font_extents|))は以下のように初期化されています。
       * ascent: 1.0
       * descent: 0.0
       * height: 1.0
       * max_x_advance: 1.0
       * max_y_advance: 0.0

     このコールバックを指定しなかった場合は上記のデフォルト
     のフォントの範囲が使われます。

     注: ((|scaled_font|))はこの時点では完全には初期化されて
     いません。そのため、コールバック中でテキスト操作を行う
     とデッドロックするでしょう。

     コールバック中で問題が発生した場合は
     Cairo::UserFontError例外、あるいは問題に対応する例外を
     発生させてください。

     * scaled_font: 生成中の拡大・縮小したフォント。
       （Cairo::ScaledFont）
     * context: Cairo::Context。座標はフォント空間。
     * font_extents: 設定するフォントの範囲
       （Cairo::FontExtents）。座標はフォント空間。

--- on_render_glyph {|scaled_font, glyph, context, text_extents| ...}

     ((*Since 1.7*)): グリフ描画コールバックを登録します。こ
     のコールバックが唯一必須のコールバックです。

     コードが((|glyph|))のグリフを((|context|))に描画してく
     ださい。((|context|))はグリフ描画がフォント空間の座標で
     行われるように準備されています。つまり、((|context|))に
     設定されている変換行列は((|scaled_font|))の拡大・縮小行
     列です。

     ((|text_extents|))には((|scaled_font|))のフォントの範囲
     を設定してください。しかし、もし、ユーザ空間座標で描画
     したい場合は((|context|))の変換行列を設定してください。
     すべての((|context|))に対する操作は許可されていますが、
     もし、((|context|))のデフォルトソース以外のソースが使わ
     れた場合の動作は未定義です。つまり、グリフのビットマッ
     プはCairo::Context#paintではなくCairo::Context#maskで描
     画するべきだということです。

     他のデフォルトではない((|context|))の設定は以下の通り
     です。
       * フォントサイズが1.0である（座標がフォント空間に設定
         されているため）
       * フォントオプションの設定が((|scaled_font|))に対応し
         ている

     ((|text_extents|))は以下のように設定されています。
       * x_bearing: 0.0
       * y_bearing: -font_extents.ascent
       * width: 0.0
       * height: font_extents.ascent + font_extents.descent
       * x_advance: font_extents.max_x_advance
       * y_advance: 0.0

     多くの場合、設定しなければいけない項目はx_advanceだけで
     す。もし、コールバックの後でもwidthが0（デフォルト値）
     のままだった場合は、グリフの範囲は((|context|))への描画
     操作を元に自動的に計算されます。多くの場合、これは望ま
     れた動作です。しかし、もし、コールバックがグリフの範囲
     を設定する理由がある場合は、インクで塗る部分のグリフの
     範囲を設定してください。また、その範囲はコールバック中
     で((|context|))に描画したものすべてを含むようにしてくだ
     さい。

     コールバック中で問題が発生した場合は
     Cairo::UserFontError例外、あるいは問題に対応する例外を
     発生させてください。

     * scaled_font: ユーザ用の拡大・縮小したフォント。
       （Cairo::ScaledFont）
     * glyph: 描画するグリフコード（Integer）
     * context: Cairo::Context。座標はフォント空間。
     * text_extents: 設定するグリフの範囲
     （Cairo::TextExtents）。座標はフォント空間。

--- on_text_to_glyphs {|scaled_font, utf8, data| ...}

     ((*Since 1.7*)): テキストをグリフに変換するコールバック
     を登録します。このコールバックは省略可能です。

     このコールバックはCairo::Context#show_textのときに使わ
     れます。

     このコールバックを使うとき、ユーザフォントはグリフとそ
     の位置をすべて制御できます。つまり、リガチャ、カーニン
     グといった機能や、アラビア語やインド語のような文字体系
     が要求するような複雑な形を実現できます。

     変換した結果は((|data|))に設定します。

     もし、
     ((<data.need_glyphs?|Cairo::UserFontFace::TextToGlyphsData#need_glyphs?>))
     が(({true}))の場合は
     ((<data.glyphs=|Cairo::UserFontFace::TextToGlyphsData#glyphs=>))
     で計算したグリフのインデックスと位置を設定します。グリ
     フの位置はフォント空間座標です。テキストは起点から表示
     されると仮定しています。

     もし、
     ((<data.need_clusters?|Cairo::UserFontFace::TextToGlyphsData#need_clusters?>))
     が(({true}))の場合は
     ((<data.clusters=|Cairo::UserFontFace::TextToGlyphsData#clusters=>))
     で計算したクラスタ対応情報を設定します。

     もし、このコールバックが省略されているか
     ((<data.glyphs|Cairo::UserFontFace::TextToGlyphsData#glyphs>))
     が(({nil}))の場合は
     Cairo::UserFontFace#on_unicode_to_glyphが呼ばれます。

     注: cairoはグリフのインデックス付けには制限を設けていま
     せんが、いくつかのアプリケーションはグリフのインデック
     スは16ビットの符号無し整数に収まると仮定しています。そ
     のため、ユーザフォントはグリフの範囲を0から65535の範囲
     に収めるようにするとよいでしょう。さらに、いくつかのアプ
     リケーションは0番目のグリフは「グリフがない」という特別
     なグリフと仮定しているかもしれません。ユーザフォントは0
     番目のグリフをそのような目的として使い、他の目的には使
     わない方がよいでしょう。

     コールバック中で問題が発生した場合は
     Cairo::UserFontError例外、あるいは問題に対応する例外を
     発生させてください。

     * scaled_font: ユーザ用の拡大・縮小したフォント。
       （Cairo::ScaledFont）
     * utf8: UTF-8で符号化されたテキスト
     * data: 変換結果を保存するオブジェクト
       （Cairo::UserFontFace::TextToGlyphsData）

--- on_unicode_to_glyph {|scaled_font, unicode| ...}

     ((*Since 1.7*)): Unicodeからグリフへ変換するコールバッ
     クを登録します。このコールバックは省略可能です。

     このコールバックはCairo::Context#show_textで使われます。

     登録したコールバックは((|unicode|))で指定されたUnicode
     のコードポイントに対応するグリフのインデックスを返して
     ください。

     このコールバックはCairo::UserFontFace#on_text_to_glyphs
     で登録するコールバックと同じ機能を提供します。
     on_text_to_glyphsほど出力を制御できませんが、使いやすい
     です。このコールバックを使うということは、各文字はそれ
     ぞれひとつのグリフに対応し、その対応は文脈に依存しない
     という前提があるということです。また、グリフは前のグリ
     フの幅に対応して配置されるという仮定もしています。つま
     り、リガチャやカーニングや複雑な文字体系などはこのコー
     ルバックを使っては実装できないということです。

     このコールバックはCairo::UserFontFace#on_text_to_glyphs
     でコールバックを登録していない場合や、登録したコールバッ
     クがグリフを返せなかった場合にだけ呼ばれます。このコー
     ルバックが登録されていない場合はUnicodeのコードポイ
     ントがそのままグリフのインデックスになっていると仮定さ
     れます。

     注: cairoはグリフのインデックス付けには制限を設けていま
     せんが、いくつかのアプリケーションはグリフのインデック
     スは16ビットの符号無し整数に収まると仮定しています。そ
     のため、ユーザフォントはグリフの範囲を0から65535の範囲
     に収めるようにするとよいでしょう。さらに、いくつかのアプ
     リケーションは0番目のグリフは「グリフがない」という特別
     なグリフと仮定しているかもしれません。ユーザフォントは0
     番目のグリフをそのような目的として使い、他の目的には使
     わない方がよいでしょう。

     コールバック中で問題が発生した場合は
     Cairo::UserFontError例外、あるいは問題に対応する例外を
     発生させてください。

     * scaled_font: ユーザ用の拡大・縮小したフォント。
       （Cairo::ScaledFont）
     * unicode: Unicode文字のコードポイント
     * Block returns: グリフのインデックス

== See Also

  * Cairo::Context#show_text_glyphs
  * Cairo::ScaledFont#text_to_glyphs

== ChangeLog

  * 2008-08-17: kou: スタート。

