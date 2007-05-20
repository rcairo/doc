= class Cairo::FontOptions

フォントを描画するときに使われる全てのオプションを含んだオブ
ジェクトです。

Cairo::FontOptionsのそれぞれの機能は以下のようなメソッドで設
定できます。

  Cairo::FontOptions#機能名
  Cairo::FontOptions#set_機能名

例えば、Cairo::FontOptions#antialiasや
Cairo::FontOptions#set_antialiasです。

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

     * Returns: Cairo::ANTIALIAS_*のどれか。

--- antialias=(antialias)
--- set_antialias(antialias)

     アンチエイリアスのモードを設定します。これはテキストを
     描画するときに使われるアンチエイリアスの種類を指定しま
     す。

     * antialias: :defaultや:noneなどCairo::ANTIALIAS_*から
       「Cairo::ANTIALIAS_」をのぞいた部分。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "default"のように指定することもできます。もちろん、
       Cairo::ANTIALIAS_*を指定することもできます。

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
     Cairo::HINT_METRICS_DEFAULTなどCairo::HINT_METRICS_*を
     見てください。

     * Returns: Cairo::HINT_METRICS_*のどれか。

--- hint_metrics=

     * Returns: self

--- hint_style

     * Returns: self

--- hint_style=

     * Returns: self

--- merge

     * Returns: self

--- set_antialias

     * Returns: self

--- set_hint_metrics

     * Returns: self

--- set_hint_style

     * Returns: self

--- set_subpixel_order

     * Returns: self

--- subpixel_order

     * Returns: self

--- subpixel_order=

     * Returns: self

== See Also

  * Index

== ChangeLog


