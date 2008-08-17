= class Cairo::Surface

画像を表します。描画操作の対象となったり他のサーフェス上に描
画するときのソースになったりします。サーフェスに描画するため
には、Cairo::Context.newに対象にしたいサーフェスを渡してコン
テキストを作ります。

サーフェスには異なる描画バックエンドのために異なる種類があり
ます。例えば、Cairo::ImageSurface.newはメモリ上にビットマッ
プ画像を作ります。

== Object Hierarchy

* Object
  * Cairo::Surface

== Instance Methods

--- clone
--- dup

     例外NotImplementedErrorが発生します。

--- content

     サーフェスが色・アルファ情報を持っているかを示す内容の
     種類を返します。Cairo::Contentを見てください。

     * Returns: Cairo::Contentに定義されている定数のどれか。

--- create_similar(content, width, height)

     ((|self|))とできるだけ互換性のある新しいサーフェスを生
     成します。例えば、新しいサーフェスは((|self|))と同じフォー
     ルバック解像度とフォントオプションを持っています。通常、
     新しいサーフェスはできるだけ((|self|))と同じバックエンド
     を使います。

     最初はサーフェスの内容はすべて0です。（透明度を持ってい
     れば透明、そうでなければ黒です。）

     * content: :colorや:color_alphaなどCairo::Contentに定義
       されている定数名と同じもの。大文字小文字は関係ありま
       せん。また、シンボルではなくて文字列で"color"のように
       指定することもできます。もちろん、Cairo::Contentに定
       義されている定数を指定することもできます。
     * width: 新しいサーフェスの幅（装置空間単位）
     * height: 新しいサーフェスの高さ（装置空間単位）

     * Returns: 新しく生成したサーフェス。

--- device_offset

     前にCairo::Surface#set_device_offsetで設定した装置補正
     値を返します。

     * Returns: (({[x_offset, y_offset]}))
       * x_offset: X方向の補正値（装置空間単位）
       * y_offset: Y方向の補正値（装置空間単位）

--- finish

     サーフェスを終了し、全ての外部資源を開放します。このメ
     ソッドを呼んだ後は、サーフェスに対して何の操作もできま
     せん。描画操作は効果がなく、代わりに例外
     Cairo::SurfaceFinishedErrorが発生します。

     rcairoではサーフェスがGCされると自動的に
     Cairo::Surface#finishが呼ばれます。

--- flush

     サーフェスに対する保留中の描画を行い、さらにcairoが持っ
     ている一時的な変更をサーフェスの状態に還元します。この
     メソッドはcairo経由での描画から直接その出力先のAPIを使っ
     ての描画に切り替える前に呼ばなければ行けません。もし、
     サーフェスが直接アクセスをサポートしていない場合はこの
     メソッドはなにもしません。

--- font_options

     サーフェスのデフォルトフォント描画オプションを返します。
     画面サーフェスから正しいサブピクセル並びを取得すること
     もできます。戻り値はCairo::ScaledFont.newの引数に使うこ
     ともできます。

     * Returns: Cairo::FontOptionsオブジェクト。

--- mark_dirty

     cairoにcairo以外の方法でサーフェスへの描画が終わったこ
     とを教えます。また、キャッシュしている範囲を再読み込み
     する必要があることも教えます。事前に
     Cairo::Surface#flushを呼ぶ必要があります。

--- set_device_offset(x_offset, y_offset)

     サーフェスに描画するときにCTMで決定する装置座標に補正値
     を追加します。このメソッドは例えばこんなサーフェスを作
     りたいときに使えます。それは画面上のサーフェスの一部と
     して描かれているものを画面上にはない別のサーフェスに転
     送するサーフェスです。ある意味で、これは完全にcairoの
     APIのユーザには見えないところです。
     Cairo::Context#transformで変換を設定することでは十分で
     はありません。なぜならCairo::Context#device_to_userのよ
     うなメソッドが隠れた補正値を外に出してしまうからです。

     補正値はソースパターンとしてサーフェスを使ってサーフェ
     スを描画したときにも影響があることに注意してください。

     * x_offset: X方向の補正値（装置空間単位）
     * y_offset: Y方向の補正値（装置空間単位）

--- fallback_resolution

     ((*Since 1.7*)): Cairo::Surface#set_fallback_resolution
     で設定した代替解像度を返します。もし、まだ設定されていな
     い場合はデフォルトの代替解像度を返します。

     * Returns: (({[x_pixels_per_inch, y_pixels_per_inch]}))
       * x_pixels_per_inch: 水平方向の1インチあたりのピクセル数
       * y_pixels_per_inch: 垂直方向の1インチあたりのピクセル数

--- set_fallback_resolution(x_pixels_per_inch, y_pixels_per_inch)

     代替画像の水平方向と垂直方向の解像度を設定します。

     バックエンドがサポートしていない特定の操作を行う場合、
     cairoは画像（Cairo::ImageSurface）に対して描画操作を行い、
     その画像を出力します。ベクトル系のバックエンドは、このメ
     ソッドで設定した解像度をその代替画像を生成するときに使
     います。（大きな値だと詳細な画像になりますが、ファイル
     サイズが大きくなります。）

     PostScript, PDF, SVGバックエンドがベクトル系のバックエ
     ンドです。

     ラスタ系のバックエンドでも代替画像を使うことはできます
     が、それらのバックエンドでは常にそのバックエンドの装置
     解像度を使います。そのため、ラスタ系のバックエンドでは
     このメソッドは意味がありません。

     注: 代替解像度はページを完成させるとき
     （Cairo::Context#show_pageかCairo::Context#copy_page）に
     使います。そのため、現在は各ページにひとつの代替解像度
     しか使えません。

     代替解像度のデフォルト値は水平・垂直方向とも1インチあた
     り300ピクセルです。

     * x_pixels_per_inch: 水平方向の1インチあたりのピクセル
       数
     * y_pixels_per_inch: 垂直方向の1インチあたりのピクセル
       数

--- write_to_png(stream)
--- write_to_png(filename)

     サーフェスの内容をPNG画像として書き出します。

     引数がwriteメソッドを持っている場合はそのオブジェクトの
     writeメソッドを使ってPNG画像を出力します。形式のデータを
     取得します。ない場合は引数をファイル名として扱い、その
     ファイルへPNG画像を出力します。

--- copy_page

     ((*Since 1.6*)): 複数ページに対応しているバックエンドで
     は現在のページを発行します。ただし、現在の描画内容は消
     しません。現在のページの内容は次のページでもそのままで
     す。発行後に空のページにしたい場合は
     Cairo::Surface#show_pageを使ってください。

--- show_page

     ((*Since 1.6*)): 複数ページに対応しているバックエンドで
     は現在のページを発行します。発行後に空のページにしたく
     ない場合はCairo::Surface#copy_pageを使ってください。

--- destroy

     ((*Since 1.7*)): Cairo::Surfaceを破棄します。この
     Cairo::Surfaceはもう使えません。

     通常はRubyのGC時に破棄されるので、このメソッドを意識す
     る必要はありません。

     コンストラクタ（Cairo::ImageSurface.newなど）をブロック
     付きで呼ぶことも検討してみてください。

== See Also

  * Index
  * Cairo::ImageSurface

== ChangeLog

  * 2008-08-17: kou: 1.7.4対応。
  * 2008-04-11: kou: 1.6対応。
  * 2007-05-23: kou: スタート。
