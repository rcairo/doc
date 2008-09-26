= class Cairo::FontOptions

フォントを描画するときに使われる全てのオプションを含んだオブ
ジェクトです。

Cairo::FontOptionsのそれぞれの機能は、Cairo::FontOptions#antialias
やCairo::FontOptions#set_antialiasのようにアクセスできます。

将来、新しい機能がCairo::FontOptionsに追加されるかもしれませ
ん。

== Object Hierarchy

* Object
  * Cairo::FontOptions

== Class Methods

--- Cairo::FontOptions.new

     全てのオプションがデフォルト値に初期化された新しい
     Cairo::FontOptionsオブジェクトを作成します。

     * Returns: 新しく作成したCairo::FontOptionsオブジェクト。

== Instance Methods

--- antialias

     アンチエイリアスのモードを返します。

     * Returns: Cairo::Antialiasに定義されている定数のどれか。

--- antialias=(antialias)
--- set_antialias(antialias)

     アンチエイリアスのモードを設定します。これはテキストを
     描画するときに使われるアンチエイリアスの種類を指定しま
     す。

     * antialias: :defaultや:noneなどCairo::Antialiasに定義
       されている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "default"のように指定することもできます。もちろん、
       Cairo::Antialiasに定義されている定数を指定するこ
       ともできます。

--- dup

     コピーします。

     * Returns: コピーされたCairo::FontOptionsオブジェクト。

--- eql?(other)

     ((|self|))と((|other|))の等価性を比較します。

     * Returns: 全てのオプションの値が等しければ(({true}))を
       返します。

--- hash

     ハッシュ値を計算します。

     * Returns: ハッシュ値。

--- hint_metrics

     メトリクスのヒントモードを返します。詳細は
     Cairo::HintMetricsを見てください。

     * Returns: Cairo::HintMetricsに定義されている定数のどれか。

--- hint_metrics=(hint_metrics)
--- set_hint_metrics(hint_metrics)

     メトリクスのヒントモードを設定します。これはメトリック
     スを装置単位の整数値に量子化するかどうかを制御します。

     * hint_metrics: :defaultや:onなどCairo::HintMetricsに定義
       されている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "default"のように指定することもできます。もちろん、
       Cairo::HintMetricsに定義されている定数を指定するこ
       ともできます。

--- hint_style

     フォントの輪郭のヒントスタイルを返します。詳細は
     Cairo::HintStyleを見てください。

     * Returns: Cairo::HintStyleに定義されている定数のどれか。

--- hint_style=(hint_style)
--- set_hint_style(hint_style)

     フォントの輪郭のヒントスタイルを設定します。これはフォ
     ントの輪郭をピクセルの格子に合わせるかどうか、忠実さや
     コントラストを最適化するかどうかなどを制御します。詳細は
     Cairo::HintStyleを見てください。

     * hint_style: :defaultや:noneなどCairo::HintStyleに定義
       されている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "default"のように指定することもできます。もちろん、
       Cairo::HintStyleに定義されている定数を指定するこ
       ともできます。

--- merge(other)

     Cairo::FontOptions#merge!を以下のように使うのと同じです。

       options.dup.merge!(other)

     * Returns: ((|self|))に((|other|))をマージした新しい
       Cairo::FontOptionsオブジェクト。

--- merge!(other)
--- update(other)

     ((|other|))のデフォルトではないオプションを((|self|))に
     マージします。破壊的な動作になります。この操作は
     ((|other|))をCairo::Operator::OVERで((|self|))の上に合
     成したのと同じように考えることができます。

     * Returns: self

--- subpixel_order

     サブピクセルの並びかたを返します。詳細は
     Cairo::SubpixelOrderを見てください。

     * Returns: Cairo::SubpixelOrderに定義されている定数のど
       れか。

--- subpixel_order=(subpixel_order)
--- set_subpixel_order(subpixel_order)

     サブピクセルの並びかたを設定します。サブピクセルの並び
     かたは、アンチエイリアスモードを
     Cairo::Antialias::SUBPIXELに設定しディスプレイ装置に描
     画するときの各ピクセルの色要素の順番を指定します。詳細は
     Cairo::SubpixelOrderを見てください。

     * subpixel_order: :defaultや:rgbなど
       Cairo::SubpixelOrderに定義されている定数名と同じもの。
       大文字小文字は関係ありません。また、シンボルではなく
       て文字列で"default"のように指定することもできます。も
       ちろん、Cairo::SubpixelOrderに定義されている定数を指定
       することもできます。

== See Also

  * Index
  * Cairo::Antialias

== ChangeLog

  * 2008-08-16: kou: 1.8.0対応。LCDFilter削除。
  * 2008-08-16: kou: 1.7.4対応。
  * 2007-05-24: kou: スタート。
