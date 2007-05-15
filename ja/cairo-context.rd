= class Cairo::Context

Cairo::Contextはrcairoで描画するときに使用する主要なオブジェ
クトです。rcairoで描画するためには、まず、描画対象となるサー
フェスを設定したCairo::Contextを作ります。それから、描画オプ
ションを設定し、Cairo::Context#move_to、
Cairo::Context#line_toなどで形を作り、その形を
Cairo::Context#strokeかCairo::Context#fillで描画
します。

Cairo::Contextの持っている描画情報は
Cairo::Context#saveでスタックに積むことができます。そ
のため、現在の状態を失うことなく描画情報を安全に変更できます。
Cairo::Context#restoreを呼べば保存した状態を復元するこ
とができます。

  context.save
  ...
  context.restore

よりRubyらしく書くなら、ブロックつきで
Cairo::Context#saveを使用します。

  context.save do
    ...
  end

この場合は、ブロックを抜けた時点で自動的に
Cairo::Context#restoreが呼び出されます。

Cairo::Contextには、いくつかrcairoが拡張している機能もありま
す。

== Object Hierarchy

* Object
  * Cairo::Context

== Included Modules

  * Cairo::Context::Blur
  * Cairo::Context::Circle
  * Cairo::Context::Color
  * Cairo::Context::Path
  * Cairo::Context::Rectangle

== Class Methods

--- Cairo::Context.new(target)

    全ての状態がデフォルト値に設定され、描画対象のサーフェス
    が((|target|))に設定された新しいCairo::Contextを作
    成します。描画対象のサーフェスはバックエンド依存の方法で
    作成します。例えば、画像用のサーフェスは
    Cairo::ImageSurface.newで作成し、PDF用のサーフェス
    はCairo::PDFSurface.newで作成します。

     * target: 描画対象のサーフェス
       （Cairo::ImageSurfaceなど）
     * Returns: Cairo::Context

== Instance Methods

--- antialias

    現在設定されている、形状に対するアンチエイリアスのモード
    を返します。これはCairo::Context#antialias=で設定で
    きます。

     * Returns: Cairo::ANTIALIAS_*のどれか

--- antialias=(antialias)
--- set_antialias(antialias)

    形状を描画するために使われるラスタライザ（cairoで使われ
    ているベクタベースの描画情報をラスタ（画素）ベースの描画
    情報に変換する機能）のアンチエイリアスのモードを設定しま
    す。この値はヒントとして使われます。あるバックエンドでは
    ある値をサポートしているかもしれませんが、別のバックエン
    ドではその値をサポートしていないかもしれません。現在のと
    ころ、どのバックエンドもCairo::ANTIALIAS_SUBPIXEL
    をサポートしていません。

    このオプションはテキストのレンダリングには影響を与えない
    ことに注意してください。テキストのレンダリングには代わり
    にCairo::FontOptions#antialias=を見てください。

     * antialias: :defaultや:noneなどCairo::ANTIALIAS_*から
       「Cairo::ANTIALIAS_」をのぞいた部分。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "default"のように指定することもできます。

--- append_path(path)

    ((|path|))を現在のパス上に追加します。((|path|))は
    Cairo::Context#copy_pathまたは
    Cairo::Context#copy_path_flatで取得します。あるい
    は、Cairo::Path.newで一から作成することもできます。

     * path: Cairo::Pathオブジェクト

--- arc(center_x, center_y, radius, angle1, angle2)

     現在のパス上に指定された半径の円弧を追加します。円弧の
     中心は(((|center_x|)), ((|center_y|)))で、角度
     ((|angle1|))からはじまり、角度が増える方向に
     ((|angle2|))まで進みます。もし((|angle2|))が
     ((|angle1|))よりも小さい場合は((|angle1|))より大きくな
     るまで(({2 * Math::PI}))を足します。

     もし現在の点があるなら、最初の線分は現在の点と円弧の開
     始点がつながるようにパスに追加されます。


     角度の単位はラジアンです。角度0.0は（ユーザ空間で）正の
     X軸方向になります。角度(({Math::PI / 2}))（90度）は（ユー
     ザ空間で）正のY軸方向になります。角度は（ユーザ空間で）
     正のX軸方向から正のY軸方向に増加します。つまり、デフォル
     トの変換行列では角度は時計回り方向に増加します。

     （度数をラジアンに変換するには(({度数 * (Math::PI /
     180)}))を使ってください。）

     このメソッドは角度が増加する方向の円弧を描きます。角度
     が減少する方向の円弧を描きたい場合は
     Cairo::Context#arc_negativeを見てください。

     円弧はユーザ空間の円になります。楕円を描くためにはX方向
     とY方向の値が異なった変換行列で拡大・縮小してください。
     例えば、((|x|)), ((|y|)), ((|width|)), ((|height|))の箱
     の中に楕円を描く場合は以下のようになります。

       context.save do
         context.translate(x + width / 2.0, y + height / 2.0)
         context.scale(width / 2.0, height / 2.0)
         context.arc(0.0, 0.0, 1.0, 0.0, 2 * Math::PI)
       end

     * center_x: 円弧の中心のX座標
     * center_y: 円弧の中心のY座標
     * radius: 円弧の半径
     * angle1: 開始角度（ラジアン）
     * angle2: 終端角度（ラジアン）

--- arc_negative(center_x, center_y, radius, angle1, angle2)

     現在のパス上に指定された半径の円弧を追加します。円弧の
     中心は(((|center_x|)), ((|center_y|)))で、角度
     ((|angle1|))からはじまり、角度が減る方向に
     ((|angle2|))まで進みます。もし((|angle2|))が
     ((|angle1|))よりも大きい場合は((|angle1|))より小さくな
     るまで(({2 * Math::PI}))を引きます。

     詳しくはCairo::Context#arcを見てください。このメソッド
     との違いはふたつの角度の間にある円弧の方向だけです。

     * center_x: 円弧の中心のX座標
     * center_y: 円弧の中心のY座標
     * radius: 円弧の半径
     * angle1: 開始角度（ラジアン）
     * angle2: 終端角度（ラジアン）

--- clip

    現在の切り取り範囲と現在のパスから作る範囲の両方に含まれ
    ている範囲が新しい切り取り範囲になります（intersect、交
    差）。現在のパスの範囲は、現在の塗りつぶし規則
    （Cairo::Context#set_fill_ruleを見てください）にしたがっ
    てCairo::Context#fillで塗りつぶされる箇所になります。

    Cairo::Context#clipのあとは、コンテキストから現在のパス
    は消去されます。

    現在の切り取り範囲は全ての描画操作に影響します。現在の切
    り取り範囲の外にあるサーフェスへの全ての変更は効果的に隠
    されます（マスクされます）。

    Cairo::Context#clipは切り取り範囲を小さくすることしかで
    きません。決して大きくなりません。しかし、現在の切り取り
    範囲はグラフィック状態の一部なので、Cairo::Context#saveと
    Cairo::Context#restoreの間（あるいはCairo::Context#save
    のブロックの中）でCairo::Context#clipを呼ぶことで一時的
    に切り取り範囲を制限することができます。これ以外の、切り
    取り範囲の領域を増やす唯一の方法は
    Cairo::Context#reset_clipです。

--- clip_extents

     現在の切り取り範囲を含む最小の箱（バウンディングボック
     ス、境界線で作った四角）をユーザ座標で計算します。

     * Returns: (({[x1, y1, x2, y2]}))
       * x1: 切り取り範囲の左
       * y1: 切り取り範囲の上
       * x2: 切り取り範囲の右
       * y2: 切り取り範囲の下

--- clip_preserve

     Cairo::Context#clipと違ってパスを消去しません。他は
     Cairo::Context#cilpと同じです。

--- clip_rectangle_list

     現在の切り取り範囲をユーザ座標の四角の配列として返しま
     す。

     切り取り範囲がユーザ座標の四角の配列として表現できない
     場合はCairo::ClipNotRepresentableが発生します。

     * Returns: ユーザ座標の四角の配列として表現した現在の切
       り取り範囲。Cairo::Rectangleの配列。

--- close_path

     現在の点から現在のサブパスの最初の点（一番最後に
     Cairo::Context#move_toに渡した点）までの線分を追加し、
     このサブパスを閉じます。Cairo::Context#close_pathの後は
     現在の点はサブパスの結合終点（？FIXME: joined endpoint）
     にあります。

     ストロークの場合、Cairo::Context#close_pathの振舞は単純
     に同等の座標（サブパスの最初の点）で
     Cairo::Context#line_toを呼んだときとは異なります。閉じ
     られたサブパスが描かれるときは、サブパスの最後にはキャッ
     プ（ふた、線分の端の点のこと）はありません。代わりに、サ
     ブパスの最初と最後を結ぶ線の結合があります。

     もしCairo::Context#close_patbを呼ぶ前に現在の点がない場
     合は、何も起こりません。

--- copy_page

     複数のページをサポートしているバックエンドのために、現
     在のページを発行します。しかし、現在のページの内容は消
     去せずに、次のページのために保持します。発行後は空のペー
     ジにしたい場合はCairo::Context#show_pageを使ってくださ
     い。

--- copy_path

     現在のパスのコピーを作成しCairo::Pathオブジェクトとして
     返します。

     以下の場合は例外が発生します。

       (1) パスをコピーするために十分なメモリがない場合は
           NoMemoryError例外が発生します。

       (2) すでに例外が発生したことのあるCairo::Contextに対
           して呼び出した場合は、最後に発生した例外と同じ例
           外が発生します。

     * Returns: 現在のパスのコピー。

--- copy_path_flat

     平坦にした現在のパスのコピーを作成しCairo::Pathオブジェ
     クトとして返します。

     Cairo::Context#copy_pathとほとんど同じです。違いはパス
     中のすべての曲線が区分的に線形な近似値で近似されること
     です（確実に現在の許容値内にします）。つまり、結果には
     ひとつもCairo::PATH_CURVE_TOが無いことが保証されます。
     Cairo::PATH_CURVE_TOはCairo::PATH_LINE_TOに置き換えられ
     ます。

     * Returns: 平坦にした現在のパスのコピー。

--- current_point

     現在のパスの現在の点を返します。概念上はこれまでにパス
     が到達した最後の点になります。

     現在の点はユーザ空間座標システムで返されます。もし、現
     在の点が定義されていないときは(({[0, 0]}))を返します。

     多くのパス構築メソッドは現在の点を変更します。各メソッ
     ドがどのように現在の点に影響を与えるかの詳細は以下を見
     てください。

       * Cairo::Context#new_path
       * Cairo::Context#move_to
       * Cairo::Context#line_to
       * Cairo::Context#curve_to
       * Cairo::Context#arc
       * Cairo::Context#rel_move_to
       * Cairo::Context#rel_line_to
       * Cairo::Context#rel_curve_to
       * Cairo::Context#rel_arc
       * Cairo::Context#text_path
#       * Cairo::Context#stroke_to_path

     * Returns: (({[x, y]})):
       * x: 現在の点のX座標
       * y: 現在の点のY座標

--- curve_to(x1, y1, x2, y2, x3, y3)

     現在の点から(((|x3|)), ((|y3|)))（ユーザ空間座標）までの
     3次のベジエスプライン曲線をパスに追加します。制御点には
     (((|x1|)), ((|y1|)))と(((|x2|)), ((|y2|)))を使います。
     このメソッドを呼び出した後は現在の点は(((|x3|)),
     ((|y3|)))になります。

     もし、呼び出し前に現在の点が無い場合は、事前に
     (({context.move_to(x1, y1}))が呼ばれたように動きます。

     * x1: 最初の制御点のX座標
     * y1: 最初の制御点のY座標
     * x2: 2番目の制御点のX座標
     * y2: 2番目の制御点のY座標
     * x3: 曲線の終点のX座標
     * y3: 曲線の終点のY座標

--- dash

     現在のダッシュの配列を返します。

     * Returns: (({[dashes, offset]})):
       * dashes: ダッシュの配列
       * offset: オフセット

--- dash_count

     ダッシュの配列の長さを返します。（ダッシュが使われてい
     ない場合は0）

     Cairo::Context#set_dashとCairo::Context#dashも見てくだ
     さい。

     * Returns: ダッシュの配列の長さ。ダッシュの配列が設定さ
       れていない場合は0。

--- device_to_user(x, y)

     装置空間からユーザ空間へ座標を変換します。与えられた点
     に現在の変換行列（CTM）の逆行列を乗じて変換します。

     * x: 装置空間のX座標
     * y: 装置空間のY座標
     * Returns: (({[user_x, user_y]})):
       * user_x: ユーザ空間に変換されたX座標
       * user_y: ユーザ空間に変換されたY座標

--- device_to_user_distance(dx, dy)

     装置空間からユーザ空間へ距離ベクトルを変換します。この
     メソッドはCairo::Context#device_to_userに似ています。違
     いはCTMの逆行列の平行移動成分が無視されるということです。

     * dx: 装置空間の距離ベクトルのX座標
     * dy: 装置空間の距離ベクトルのY座標
     * Returns: (({[user_dx, user_dy]})):
       * user_dx: ユーザ空間に変換された距離ベクトルのX座標
       * user_dy: ユーザ空間に変換された距離ベクトルのY座標

--- fill(preserve=false)
--- fill(preserve=false) {|self| ...}

     現在の塗りつぶし規則にしたがって現在のパスを塗りつぶす
     描画操作です。（塗りつぶす前に各サブパスは暗黙のうちに
     閉じられます。）((|preserve|))が偽の場合は
     Cairo::Context#fillを呼び出した後、現在のパスがコンテキ
     ストから消去されます。

     ブロックを指定した場合は、Cairo::Context#new_pathで新し
     いパスをはじめてからブロックを呼び出します。以下のよう
     に使います。

       context.fill do
         context.rectangle(20, 20, 40, 40)
       end

     これは以下と等価です。

       context.new_path
       context.rectangle(20, 20, 40, 40)
       context.fill


     Cairo::Context#set_fill_ruleと
     Cairo::Context#fill_preserveも見てください。

     * preserve: 真の場合はパスを消去しない

--- fill_extents

     現在のパスと塗りつぶしパラメータでCairo::Context#fillを
     呼び出したときに影響がある範囲を覆うユーザ空間のバウン
     ディングボックスを計算します。現在のパスが空なら空の四
     角(0,0, 0,0)を返します。サーフェスの大きさと切り取り領
     域は関係ありません。

     Cairo::Context#fill、Cairo::Context#set_fill_rule、
     Cairo::Context#fill_preserveも見てください。

     * Returns: (({[x1, y1, x2, y2]})):
       * x1: バウンディングボックスの左
       * y1: バウンディングボックスの上
       * x2: バウンディングボックスの右
       * y2: バウンディングボックスの下

--- fill_preserve
--- fill_preserve {|self| ...}

     Cairo::Context#fillを以下のように呼び出すことと同じです。

       context.fill(true)
       context.fill(true) { ... }

--- fill_rule

     現在の塗りつぶし規則を返します。塗りつぶし規則は
     Cairo::Context#set_fill_ruleで設定します。

     * Returns: Cairo::FILL_RULE_*

--- fill_rule=

     * Returns: self

--- font_extents

     * Returns: self

--- font_face

     * Returns: self

--- font_face=

     * Returns: self

--- font_matrix

     * Returns: self

--- font_matrix=

     * Returns: self

--- font_options

     * Returns: self

--- font_options=

     * Returns: self

--- font_size=

     * Returns: self

--- glyph_extents

     * Returns: self

--- glyph_path

     * Returns: self

--- group_target

     * Returns: self

--- identity_matrix

     * Returns: self

--- in_fill?

     * Returns: self

--- in_stroke?

     * Returns: self

--- line_cap

     * Returns: self

--- line_cap=

     * Returns: self

--- line_join

     * Returns: self

--- line_join=

     * Returns: self

--- line_to

     * Returns: self

--- line_width

     * Returns: self

--- line_width=

     * Returns: self

--- mask

     * Returns: self

--- matrix

     * Returns: self

--- matrix=

     * Returns: self

--- miter_limit

     * Returns: self

--- miter_limit=

     * Returns: self

--- move_to

     * Returns: self

--- new_path

     * Returns: self

--- new_sub_path

     * Returns: self

--- operator

     * Returns: self

--- operator=

     * Returns: self

--- paint

     * Returns: self

--- pop_group

     * Returns: self

--- pop_group_to_source

     * Returns: self

--- push_group

     * Returns: self

--- rectangle

     * Returns: self

--- rel_curve_to

     * Returns: self

--- rel_line_to

     * Returns: self

--- rel_move_to

     * Returns: self

--- reset_clip

     * Returns: self

--- restore

     * Returns: self

--- rotate

     * Returns: self

--- save

     * Returns: self

--- scale

     * Returns: self

--- scaled_font

     * Returns: self

--- scaled_font=

     * Returns: self

--- select_font_face

     * Returns: self

--- set_dash

     * Returns: self

--- set_fill_rule

     * Returns: self

--- set_font_face

     * Returns: self

--- set_font_matrix

     * Returns: self

--- set_font_options

     * Returns: self

--- set_font_size

     * Returns: self

--- set_line_cap

     * Returns: self

--- set_line_join

     * Returns: self

--- set_line_width

     * Returns: self

--- set_matrix

     * Returns: self

--- set_miter_limit

     * Returns: self

--- set_operator

     * Returns: self

--- set_scaled_font

     * Returns: self

--- set_source

     * Returns: self

--- set_source_rgb

     * Returns: self

--- set_source_rgba

     * Returns: self

--- set_tolerance

     * Returns: self

--- show_glyphs

     * Returns: self

--- show_page

     * Returns: self

--- show_text

     * Returns: self

--- source

     * Returns: self

--- stroke

     * Returns: self

--- stroke_extents

     * Returns: self

--- stroke_preserve

     * Returns: self

--- target

     * Returns: self

--- text_extents

     * Returns: self

--- text_path

     * Returns: self

--- tolerance

     * Returns: self

--- tolerance=

     * Returns: self

--- transform

     * Returns: self

--- translate

     * Returns: self

--- user_to_device

     * Returns: self

--- user_to_device_distance

     * Returns: self

== See Also

  * Index

== ChangeLog


