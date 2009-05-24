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
  * Cairo::Context::Triangle

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

--- Cairo::Context.new(target) {|context| ...}

     ((*Since 1.7*))ブロック無しでCairo::Context.newを呼び出
     した場合と異なるのは、ブロックが終了した時点で
     Cairo::Context#destroyが呼ばれることです。

     * target: 描画対象のサーフェス
       （Cairo::ImageSurfaceなど）
     * context: Cairo::Context

== Instance Methods

--- antialias

     現在設定されている、形状に対するアンチエイリアスのモード
     を返します。これはCairo::Context#antialias=で設定で
     きます。

     * Returns: Cairo::Antialiasに定義されている定数のどれか。

--- antialias=(antialias)
--- set_antialias(antialias)

     形状を描画するために使われるラスタライザ（cairoで使われ
     ているベクタベースの描画情報をラスタ（画素）ベースの描画
     情報に変換する機能）のアンチエイリアスのモードを設定しま
     す。この値はヒントとして使われます。あるバックエンドでは
     ある値をサポートしているかもしれませんが、別のバックエン
     ドではその値をサポートしていないかもしれません。現在のと
     ころ、どのバックエンドもCairo::Antialias::SUBPIXEL
     をサポートしていません。

     このオプションはテキストのレンダリングには影響を与えない
     ことに注意してください。テキストのレンダリングには代わり
     にCairo::FontOptions#antialias=を見てください。

     * antialias: :defaultや:noneなどCairo::Antialiasに定義
       されている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "default"のように指定することもできます。もちろん、
       Cairo::Antialiasに定義されている定数を指定するこ
       ともできます。

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

--- circle(center_x, center_y, radius)

     Cairo::Context::Circle#circleを見てください。

--- clip(preserve=false)
--- clip(preserve=false) {|self| ...}

     現在の切り取り範囲と現在のパスから作る範囲の両方に含まれ
     ている範囲が新しい切り取り範囲になります（intersect、交
     差）。現在のパスの範囲は、現在の塗りつぶし規則
     （Cairo::Context#set_fill_ruleを見てください）にしたがっ
     てCairo::Context#fillで塗りつぶされる箇所になります。

     ((|preserve|))が偽の場合、Cairo::Context#clipのあとは、
     コンテキストから現在のパスは消去されます。

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

     ブロックを指定した場合は、Cairo::Context#new_pathで新し
     いパスをはじめてからブロックを呼び出します。以下のよう
     に使います。

       context.clip do
         context.rectangle(20, 20, 40, 40)
       end

     これは以下と等価です。

       context.new_path
       context.rectangle(20, 20, 40, 40)
       context.clip

     * preserve: 真の場合はパスを消去しない

--- clip_extents

     現在の切り取り範囲を含む最小の箱（バウンディングボック
     ス、境界線で作った四角）をユーザ座標で計算します。

     * Returns: (({[x1, y1, x2, y2]}))
       * x1: 切り取り範囲の左
       * y1: 切り取り範囲の上
       * x2: 切り取り範囲の右
       * y2: 切り取り範囲の下

--- clip_preserve
--- clip_preserve {|self| ...}

     Cairo::Context#clipを以下のように呼び出すことと同じです。

       context.clip(true)
       context.clip(true) { ... }

--- clip_rectangle_list

     現在の切り取り範囲をユーザ座標の四角の配列として返しま
     す。

     切り取り範囲がユーザ座標の四角の配列として表現できない
     場合はCairo::ClipNotRepresentableErrorが発生します。

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
     ひとつもCairo::Path::CURVE_TOが無いことが保証されます。
     Cairo::Path::CURVE_TOはCairo::Path::LINE_TOに置き換えられ
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
       * offset: 補正値

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


     Cairo::Context#set_fill_ruleも見てください。

     * preserve: 真の場合はパスを消去しない

--- fill_extents

     現在のパスと塗りつぶしパラメータでCairo::Context#fillを
     呼び出したときに影響がある範囲を覆うユーザ空間のバウン
     ディングボックスを計算します。現在のパスが空なら空の四
     角(0,0, 0,0)を返します。サーフェスの大きさと切り取り領
     域は関係ありません。

     以下も見てください。
       * Cairo::Context#fill
       * Cairo::Context#set_fill_rule

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

     * Returns: Cairo::FillRuleに定義されている定数のどれか。

--- fill_rule=(fill_rule)
--- set_fill_rule(fill_rule)

     コンテキスト中の現在の塗りつぶしルールを設定します。塗
     りつぶし規則は領域が複雑な（自身で交差している可能性のあ
     る）パスの内側にあるか外側にあるかを判断するために使わ
     れます。現在の塗りつぶし規則はCairo::Context#fillと
     Cairo::Context#clipの両方に影響を与えます。有効な塗りつ
     ぶし規則のそれぞれの意味の詳細は
     Cairo::FillRuleを見てください。

     * fill_rule: :windingや:even_oddなどCairo::FillRuleに定
       義されている定数名と同じもの。大文字小文字は関係あり
       ません。また、シンボルではなくて文字列で"winding"のよ
       うに指定することもできます。もちろん、
       Cairo::FillRuleに定義されている定数を指定すること
       もできます。

--- font_extents

     現在選択しているフォントの範囲を返します。

     * Returns: Cairo::FontExtentsオブジェクト

--- font_face

     現在のフォントフェイスを返します。

     メモリがたりない場合はNoMemoryError例外が発生します。

     * Returns: 現在のCairo::FontFaceオブジェクト。

--- font_face=(font_face)
--- set_font_face(font_face)

     コンテキストの現在のCairo::FontFaceオブジェクトを
     ((|font_face|))で置き換えます。

     * font_face: Cairo::FontFaceオブジェクト。(({nil}))の場
       合はデフォルトのフォントに戻します。

--- font_matrix

     現在のフォント用行列を返します。
     Cairo::Context#set_font_matrixも見てください。

     * Returns: フォント用行列をCairo::Matrixオブジェクトで
       返します。

--- font_matrix=(matrix)
--- set_font_matrix(matrix)

     ((|matrix|))を現在のフォント用行列に設定します。フォン
     ト用行列はフォントのデザイン空間（この空間ではemの四角
     は1単位 x 1単位です）からユーザ空間への変換方法になりま
     す。通常は単純な拡大・縮小が使われます
     （Cairo::Context#set_font_sizeを見てください）。しかし、
     フォントを剪断（斜めに傾ける）したり長さの異なる平行な
     ふたつの軸に対して（？FIXME）伸縮させたりなど、複雑なフォ
     ント用行列を使うこともできます。

     * matrix: 現在のフォントに適用する変換行列

--- font_options

     Cairo::Context#set_font_optionsで設定したフォント描画オ
     プションを返します。返されるオプションにはコンテキスト
     の下にあるサーフェスから得られたオプションは含まれませ
     ん。つまり、このオプションはそのまま
     Cairo::Context#set_font_optionsに渡すことができます。

     * Returns: Cairo::FontOptionsオブジェクト

--- font_options=(options)
--- set_font_options(options)

     コンテキストにフォント描画オプションを設定します。描画
     オプションはコンテキストの下にあるサーフェスから得たオ
     プションとマージされます。つまり、もし、((|options|))が
     （Cairo::Antialias::DEFAULTのような）デフォルト値を持っ
     ている場合は、サーフェスから得た値を使います。

     * options: Cairo::FontOptionsオブジェクト

--- font_size=(size)
--- set_font_size(size)

     現在のフォント用行列を((|size|))倍に拡大する行列に設定
     します。以前にCairo::Context#set_font_sizeあるいは
     Cairo::Context#set_font_matrixで設定したフォント用行列
     は置き換えられます。((|size|))のフォントサイズはユーザ
     空間の単位になります。（より正確にいうと、この行列はフォ
     ントのem正方形をユーザ空間での((|size|)) x ((|size|))の
     正方形にします。）

     * size: ユーザ空間の単位での新しいフォントサイズ

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

--- glyph_path(glyphs)

     現在のパスにグリフの閉じたパスを追加します。
     生成されたパスを塗りつぶすと、
     Cairo::Context#show_glyphsのような効果を実現できます。

     * glyphs: 表示するグリフ（Cairo::Glyph）の配列

--- group_target

     一番最後に呼んだCairo::Context#push_groupまたは
     Cairo::Context#push_with_contentではじまった現在のグルー
     プ用の対象サーフェスを返します。

     もし全てのグループ描画ブロックの外で呼んだ場合は
     (({nil}))を返します。（つまり、最後のつりあった
     Cairo::Context#pop_groupあるいは
     Cairo::Context#pop_group_to_surfaceのあとに(({nil}))が
     返ります。（そんなことあるかなぁ））

     * Returns: 対象グループサーフェス。もしなければ
       (({nil}))。

--- identity_matrix

     現在の変換行列（CTM）をリセットして単位行列にします。つ
     まり、ユーザ空間と装置空間の軸が揃い、1ユーザ空間単位は
     1装置空間単位に変換されます。

--- in_fill?(x, y)
--- in_fill?(x, y) {|self| ...}

     指定された点がCairo::Context#fill操作で影響がある範囲の
     中にあるかどうかをテストします。その際、現在のパスと現
     在の塗りつぶしパラメータが使われます。サーフェスの面積
     と切り取り範囲は関係ありません。

     ブロックを指定するとブロックを抜けた時点の状態をテスト
     します。ブロックを指定するとパスが消去されることに注意
     してください。

     以下のメソッドも見てください。
       * Cairo::Context#fill
       * Cairo::Context#set_fill_rule
       * Cairo::Context#fill_preserve

     * x: テストする点のX座標
     * y: テストする点のY座標
     * Returns: 点が内側にあれば(({true}))。外にあれば
       (({false}))。

--- in_stroke?(x, y)
--- in_stroke?(x, y) {|self| ...}

     指定された点がCairo::Context#stroke操作で影響がある範囲
     の中にあるかどうかをテストします。その際、現在のパスと
     現在の描きパラメータが使われます。サーフェスの面積と切り
     取り範囲は関係ありません。

     ブロックを指定するとブロックを抜けた時点の状態をテスト
     します。ブロックを指定するとパスが消去されることに注意
     してください。

     以下のメソッドも見てください。
       * Cairo::Context#stroke
       * Cairo::Context#set_line_with
       * Cairo::Context#set_line_join
       * Cairo::Context#set_line_cap
       * Cairo::Context#set_dash
       * Cairo::Context#stroke_preserve

     * x: テストする点のX座標
     * y: テストする点のY座標
     * Returns: 点が内側にあれば(({true}))。外にあれば
       (({false}))。

--- line_cap

     Cairo::Context#set_line_capで設定した現在のラインキャッ
     プスタイル（終点を描画する方法）を返します。

     * Returns: 現在のラインキャップスタイル。
       Cairo::LineCapに定義されている定数のどれか。

--- line_cap=(line_cap)
--- set_line_cap(line_cap)

     コンテキスト中の現在のラインキャップスタイルを設定しま
     す。どのようにラインキャップスタイルが描画されるかは
     Cairo::LineCapを見てください。

     他の描きパラメータと同じように、現在のラインキャップスタ
     イルはCairo::Context#stroke,
     Cairo::Context#stroke_extents
#     , Cairo::Context#stroke_to_path
     で参照されますが、パスを作っているときはまったく影響を
     与えません。

     * line_cap: :roundや:buttなどCairo::LineCapに定義されて
       いる定数名と同じもの。大文字小文字は関係ありません。
       また、シンボルではなくて文字列で"round"のように指定す
       ることもできます。もちろん、
       Cairo::LineCapに定義されている定数を指定することもできます。

--- line_join

     Cairo::Context#set_line_joinで設定した現在の結合点スタ
     イル（線分中の点を描画する方法）を返します。

     * Returns: 現在の結合点スタイル。
       Cairo::LineJoinに定義されている定数のどれか。

--- line_join=(line_join)
--- set_line_join(line_join)

     コンテキスト中の現在の結合点スタイルを設定します。どの
     ように結合点スタイルが描画されるかは
     Cairo::LineJoinを見てください。

     他の描きパラメータと同じように、現在の結合点スタイルは
     Cairo::Context#stroke,
     Cairo::Context#stroke_extents
#     , Cairo::Context#stroke_to_path
     で参照されますが、パスを作っているときはまったく影響を
     与えません。

     * line_join: :roundや:bevelなどCairo::LineJoinに定義さ
       れている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "round"のように指定することもできます。もちろん、
       Cairo::LineJoinに定義されている定数を指定することもで
       きます。

--- line_to(x, y)

     現在の点からユーザ空間座標で(((|x|)), ((|y|)))の点まで
     の線分をパスに追加します。呼び出した後は現在の点は
     (((|x|)), ((|y|)))になります。

     呼び出す前に現在の点がない場合は、呼び出し前に
     (({context.move_to(x, y)}))としたように振る舞います。

     * x: 新しい線分の終点のX座標
     * y: 新しい線分の終点のY座標

--- line_width

     Cairo::Context#set_line_widthで設定した値と正確に同じ現
     在の線幅を返します。この値はたとえ
     Cairo::Context#set_line_widthと
     Cairo::Context#line_widthの呼び出しの間にCTMを変えたと
     しても変わりません。

     * Returns: 現在の線幅。

--- line_width=(width)
--- set_line_width(width)

     コンテキスト中の現在の線幅を設定します。線幅の値はユー
     ザ空間での丸いペンの直径を指定します。（にもかかわらず
     装置空間でのペンはふつうは楕円です。これはCTMによる拡
     大・縮小・剪断・回転のためです。）

     注: 上記の説明でユーザ空間とCTMにふれたとき、ユーザ空間
     とCTMは描き操作のときに影響があり、
     Cairo::Context#set_line_widthのときには影響がないといい
     ました。もっとも単純な使用法はふたつの空間を等しくする
     ことです。つまり、もしCairo::Context#set_line_widthと描
     き操作の間にCTMを変更しなければ、単純にユーザ空間の値を
     Cairo::Context#set_line_widthに渡すことができ、この注は
     無視することができます。

     他の描きパラメータと同じように、現在の線幅は
     Cairo::Context#stroke,
     Cairo::Context#stroke_extents
#     , Cairo::Context#stroke_to_path
     で参照されますが、パスを作っているときはまったく影響を
     与えません。

     デフォルトの線幅は(({2.0}))です。

     * width: 線幅

--- mask(pattern)
--- mask(surface, x, y)

     ((|pattern|))（または((|surface|))）のアルファチャンネル
     をマスクとして使って現在のソースを塗る描画操作です。
     （((|pattern|))（または((|surface|))）の不透明部分（ア
     ルファチャンネルが0より大きい部分）を現在のソースで塗り
     ます。透明な部分（アルファチャンネルが0の部分）は塗られ
     ません。）

     * pattern: Cairo::Patternをスーパークラスに持つオブジェ
       クト

     * surface: Cairo::Surfaceをスーパークラスに持つオブジェ
       クト
     * x: ((|surface|))を置く基点のX座標
     * y: ((|surface|))を置く基点のY座標

--- matrix

     現在の変換行列（CTM）を返します。

     * Returns: Cairo::Matrixオブジェクト

--- matrix=(matrix)
--- set_matrix(matrix)

     現在の変換行列（CTM）を((|matrix|))に変更します。

     * matrix: Cairo::Matrixオブジェクト

--- miter_limit

     Cairo::Context#set_miter_limitで設定した現在の留め継ぎ
     限界を返します。

     * Returns: 留め継ぎ限界値

--- miter_limit=(limit)
--- set_miter_limit(limit)

     コンテキストの中に現在の留め継ぎ限界を設定します。

     現在の結合点スタイルがCairo::LineJoin::MITERの場合は
     （Cairo::Context#est_line_joinを見てください）、線分を
     留め継ぎの代わりに斜角で結合するべきかどうかを判断
     するために設定した留め継ぎ限界を使います。

       留め継ぎ:
         \__/
       斜角:
         \/

     cairoは留め継ぎの長さを線幅で割ります。その結果が留め
     継ぎ限界よりも大きい場合は、斜角スタイルを使います。

     他の描きパラメータと同じように、現在の留め継ぎ限界は
     Cairo::Context#stroke,
     Cairo::Context#stroke_extents
#     , Cairo::Context#stroke_to_path
     で参照されますが、パスを作っているときはまったく影響を
     与えません。

     * limit: 留め継ぎ限界

--- move_to(x, y)

     新しいサブパスを始めます。呼び出した後は現在の点は
     (((|x|)), ((|y|)))になります。

     * x: 新しい位置のX座標
     * y: 新しい位置のY座標

--- new_path

     現在のパスを消去します。呼び出した後はパスも現在の点も
     なくなります。

--- new_sub_path

      新しいサブパスを始めます。既存のパスには影響を与えない
      ことに注意してください。呼び出した後は現在の点はなくな
      ります。

      多くの場合、この呼び出しは必要ありません。なぜなら新し
      いサブパスの多くはCairo::Context#move_toで始めるからで
      す。

      Cairo::Context#new_sub_pathは新しいサブパスを
      Cairo::Context#arcで始める場合に特に役立ちます。これは
      物事を簡単にします。もう手動でCairo::Context#move_toを
      呼び出すための円弧の初期座標を計算する必要がないのです。

--- operator

     現在の合成操作を返します。

     * Returns: Cairo::Operatorに定義されている定数のどれか。

--- operator=(operator)
--- set_operator(operator)

     全ての描画操作で使われる合成操作を設定します。利用可能
     な各合成操作の意味の詳細はCairo::Operatorを見てください。

     * operator: :overや:sourceなどCairo::Operatorに定義され
       ている定数名と同じもの。大文字小文字は関係ありません。
       また、シンボルではなくて文字列で"over"のように指定す
       ることもできます。もちろん、Cairo::Operatorに定義され
       ている定数を指定することもできます。

--- paint
--- paint(alpha)

     現在のソースを現在の切り取り範囲全体に塗る描画操作です。
     ((|alpha|))を指定すると、指定したアルファ値で塗られます。

     * alpha: アルファ値。0（透明）〜1（不透明）の間。

--- pop_group(to_source=false)

     Cairo::Context#push_groupではじめた出力先の変更を終了し
     ます。グループに実行した全ての描画操作の結果を含んだ新
     しいパターンを返します。

     Cairo::Context#pop_groupはCairo::Context#restoreを呼び
     出します（Cairo::Context#push_groupが呼び出した
     Cairo::Context#saveに対応します）。グループ内で行ったグ
     ラフィックス状態の変更はグループの外側には見えません。

     ((|to_source|))が真の場合は以下と同じ動作になります。

       group = context.pop_group(false)
       context.set_source(group)

     * to_source: グループをコンテキストのソースに設定するか
       どうか。
     * Returns: ((|to_source|))が真の場合は(({nil}))。偽の場
       合は新しく作られた（サーフェス）パターン。パターンは
       グループに実行した全ての描画操作の結果を含んでいます。

--- pop_group_to_source

     以下と同じです。詳しくはCairo::Context#pop_groupを見て
     ください。

       context.pop_group(true)

--- push_group(context=nil)
--- push_group(context=nil, pop_to_source=true) {|self| ...}

     一時的にグループとして知られている中間サーフェスに描画
     の出力先を変更します。出力先の変更は
     Cairo::Context#pop_groupでグループを終了するまで続きま
     す。Cairo::Context#pop_groupはグループに対する全ての描
     画の結果をパターンとして返します（パターンオブジェクト
     そのものを返すか、ソースパターンに設定します）。

     グループ機能は中間合成を行うのに便利です。グループの一
     般的な使いかたのひとつは、グループの中に不透明なオブジェ
     クトを描画し、その結果を本当の描画先上に透明度つきで混
     ぜ合わせるというものです。

     グループは任意の深さで入れ子にすることができます。この
     ためには釣り合いの取れたCairo::Context#push_groupと
     Cairo::Context#pop_groupのペアを使います。各push/popは
     新しい対象グループをスタックの上に置くあるいは取り除き
     ます。

     Cairo::Context#push_groupはCairo:Context#saveを呼ぶので、
     いかなるグラフィックス状態の変更もグループの外には見え
     ません。（Cairo::Context#pop_groupは
     Cairo::Context#restoreを呼びます。）

     デフォルトでは中間グループの中身の種類は
     Cairo::Content::COLOR_ALPHAになります。他の種類を選ぶに
     は((|content|))を指定します。

     ブロックを指定すると、ブロックを抜けた時点で自動的に
     Cairo::Context#pop_groupを呼び出します。
     ((|pop_to_group|))が真または(({nil}))の場合は、ポップし
     たときにグループをソースに設定します。

     以下は、描きの下にある塗りを見せることなく、半透明の塗
     りと描きを行う例です。（グループを使わずに半透明を指定
     して塗り・描きを行うと半透明で描いた縁の部分が透けて、
     その下にある塗りつぶした部分が見えてしまいます。）

       context.push_group do
         context.set_source(fill_pattern)
         context.fill(true)
         context.set_source(stroke_pattern)
         context.stroke
       end
       context.paint(alpha)

     * context: :colorや:color_alphaなどCairo::Contentに定義
       されている定数名と同じもの。大文字小文字は関係ありま
       せん。また、シンボルではなくて文字列で"color"のように
       指定することもできます。もちろん、Cairo::Contentに定
       義されている定数を指定することもできます。

     * pop_to_source: 真あるいは(({nil}))ならブロックを抜け
       るときに(({context.pop_group(false)}))ではなく、
       (({context.pop_group(true)}))を使います（違いは
       Cairo::Context#pop_groupを見てください）。ブロックが指
       定されていない場合は何の影響もありません。

--- rectangle(x, y, width, height)

     指定された大きさの閉じた四角いサブパスを現在のパスに追
     加します。四角はユーザ空間座標で(((|x|)), ((|y|)))の位
     置に作られます。角を丸くしたい場合は
     Cairo::Context#rounded_rectangleを使ってください。

     論理的には以下と等しいです。

        context.move_to(x, y)
        context.rel_line_to(width, 0)
        context.rel_line_to(0, height)
        context.rel_line_to(-width, 0)
        context.close_path

     * x: 四角の左上の点のX座標
     * y: 四角の左上の点のY座標
     * width: 四角の幅
     * height: 四角の高さ

--- rounded_rectangle(x, y, width, height, x_radius, y_radius=nil)

     Cairo::Context::Rectangle#rounded_rectangleを見てくださ
     い。

--- rel_curve_to(dx1, dy1, dx2, dy2, dx3, dy3)

     Cairo::Context#curve_toの相対座標版です。全ての
     値は現在の点からの相対的な値になります。現在の点から相
     対点(((|dx3|)), ((|dy3|)))（(現在の点のX座標 +
     ((|dx3|)), 現在の点のY座標 + ((|dy3|)))の点のこと）まで
     の3次のベジエスプライン曲線をパスに追加します。制御点に
     は相対点(((|dx1|)), ((|dy1|)))と(((|dx2|)), ((|dy2|)))
     を使います。呼び出した後は現在の点は相対点(((|dx3|)),
     ((|dy3|)))になります。

     現在の点を(((|x|)), ((|y|)))とすると以下のふたつは論理
     的に等しいです。

       context.rel_curve_to(dx1, dy1, dx2, dy2, dx3, dy3)
       context.curve_to(x + dx1, y + dy1,
                        x + dx2, y + dy2,
                        x + dx3, y + dy3)

     現在の点がない場合はCairo::NoCurrentPointErrorが発生し
     ます。

     * dx1: 最初の制御点のX方向の補正値
     * dy1: 最初の制御点のY方向の補正値
     * dx2: 2番目の制御点のX方向の補正値
     * dy2: 2番目の制御点のY方向の補正値
     * dx3: 曲線の終点のX方向の補正値
     * dy3: 曲線の終点のY方向の補正値

--- rel_line_to(dx, dy)

     Cairo::Context#line_toの相対座標版です。現在の点から相
     対点(((|dx|)), ((|dy|)))（(現在の点のX座標 +
     ((|dx|)), 現在の点のY座標 + ((|dy|)))の点のこと）までの
     線分を追加します。相対点はユーザ空間を用います。呼び出
     した後は現在の点は相対点(((|dx|)), ((|dy|)))になります。

     現在の点を(((|x|)), ((|y|)))とすると、以下のふたつは論
     理的に等しいです。

       context.rel_line_to(dx, dy)
       context.line_to(x + dx, y + dy)

     現在の点がない場合はCairo::NoCurrentPointErrorが発生し
     ます。

     * dx: 新しい線分の終点のX方向の補正値
     * dy: 新しい線分の終点のY方向の補正値

--- rel_move_to(dx, dy)

     新しいサブパスを始めます。呼び出した後は現在の点は相
     対点(((|dx|)), ((|dy|)))（(現在の点のX座標 +
     ((|dx|)), 現在の点のY座標 + ((|dy|)))の点のこと）になり
     ます。

     現在の点を(((|x|)), ((|y|)))とすると、以下のふたつは論
     理的に等しいです。

       context.rel_move_to(dx, dy)
       context.move_to(x + dx, y + dy)

     現在の点がない場合はCairo::NoCurrentPointErrorが発生し
     ます。

     * dx: 新しい位置のX方向の補正値
     * dy: 新しい位置のY方向の補正値

--- reset_clip

     現在の切り取り領域を元のなにも制限されていない状態に戻
     します。つまり、切り取り領域を対象サーフェスを含む無限
     に大きな形に設定するということです。もし無限を理解する
     ことが難しいなら、切り取り領域を対象サーフェスの境界と
     まったく同じ大きさに設定しなおすと考えても同じことです。

     コードを再利用可能にしたいなら、
     Cairo::Context#reset_clipを呼ばないように注意してくださ
     い。そうしないとCairo::Context#clipを呼んでいる高レベル
     なコードが予期しない結果になるでしょう。一時的に切り取
     り領域を制限するより堅牢な方法はCairo::Context#saveと
     Cairo::Context#restoreでCairo::Context#clipを囲むことで
     す。

--- restore

     ひとつ前のCairo::Context#saveで保存した状態を復元します。
     復元された状態はスタックから削除されます。

--- rotate(angle)

     ((|angle|))ラジアンだけユーザ空間の軸を回転するように、
     現在の変換行列（CTM）を変更します。すでに存在するユーザ
     空間の変換のあとに軸の回転を行います。正の角度の回転方向
     は正のX軸から正のY軸に向かう方向です。

     * angle: ユーザ空間の軸を回転させる角度（ラジアン）

--- save
--- save {|self| ...}

     現在の状態のコピーを作成し、保存された状態の内部スタッ
     クに保存します。Cairo::Context#restoreが呼ばれたときは、
     保存された状態を復元します。複数のCairo::Context#saveと
     Cairo::Context#restoreが入れ子にできます。各
     Cairo::Context#restoreは対応するCairo::Context#saveが保
     存した状態を復元します。

     ブロックを指定した場合はブロックを抜けるときに自動的に
     Cairo::Context#restoreを呼び出します。

--- scale(sx, sy)

     ユーザ空間のX軸とY軸をそれぞれ((|sx|))と((|sy|))で拡大す
     るように現在の変換行列を変更します。すでに存在するユー
     ザ空間の変換のあとに軸の拡大を行います。

     * sx: X方向の拡大率
     * sy: Y方向の拡大率

--- scaled_font

     コンテキストに現在設定されているCairo::ScaledFontを返し
     ます。

     メモリがたりない場合はNoMemoryError例外が発生します。

     * Returns: 現在のCairo::ScaledFont

--- scaled_font=(font)
--- set_scaled_font(font)

     現在のフォントフェイス、フォント用行列、フォントオプショ
     ンを指定した((|font|))の値で置き換えます。いくつかの変
     換をのぞいて、コンテキストの現在のCTMは((|font|))のCTM
     と同じであるべきです。((|font|))のCTMには
     Cairo::ScaledFont#ctmでアクセスできます。

     * font: Cairo::ScaledFontオブジェクト

--- select_font_face(family=nil, slant=nil, weight=nil)

     注: このメソッドはcairoの設計者が「おもちゃのような」テ
     キストAPIと呼んでいるものの一部です。小さなデモや単純な
     プログラムには便利ですが、まじめにテキストを使うアプリ
     ケーションに十分な能力があることは期待されていません。

     フォント名、傾き、重みという単純化した記述からフォント
     ファミリーとスタイルを選択します。cairoはシステムで利用
     可能な全てのフォントの一覧を返すなどというような操作は
     提供しません。（このAPIは「おもちゃ」であることを思いだ
     してください。）しかし、CSS2の仕様にある標準的なファミ
     リー名（"serif", "sans-serif", "cursive", "fantasy",
     "monospace"）は期待通りに動きます。

     利用可能なフォント一覧のような「本当の」フォント対応が
     必要な場合は、下位にあるフォントシステムを直接呼び出す
     必要があるでしょう。（例えばfontconfやfreetype）

     多くのアプリケーションはcairoに加えてより包括的なフォント
     処理とテキスト配置ライブラリを使う必要があるでしょう。
     （例えばPango）

     Cairo::Context#select_font_faceまたは
     Cairo::Context#font_face=やCairo::Context#scaled_font=
     のような関連するフォント選択APIを呼び出さずにテキストを
     描画した場合は、プラットフォーム依存のデフォルトのフォ
     ントファミリーが使われます。これは本質的には
     "sans-serif"です。デフォルトの傾きは
     Cairo::FontSlant::NORMALで重みは
     Cairo::FontWeight::NORMALです。

     このメソッドはCairo::ToyFontFace.newで作成したフォント
     フェイスをCairo::Context#font_face=で設定することと等価
     です。

     * family: "serif"のようなUTF-8で符号化されたフォントファ
       ミリー名。(({nil}))や空文字列の場合はプラットフォーム
       依存のフォンファミリー名が使われます。

     * slant: フォントの傾き。:normalや:italicなど
       Cairo::FontSlantに定義されている定数名と同じもの。
       大文字小文字は関係ありません。また、シンボル
       ではなくて文字列で"normal"のように指定することもでき
       ます。もちろん、Cairo::FontSlantに定義されている定数
       を指定することもできます。(({nil}))の場合はデフォルト
       値としてCairo::FontSlant::NORMALが使われます。

     * weight: フォントの重み。:normalや:boldなど
       Cairo::FontWeightに定義されている定数名と同じもの。
       大文字小文字は関係ありません。また、シンボルではなく
       て文字列で"normal"のように指定することもできます。も
       ちろん、Cairo::FontWeightを指定することもできます。
       (({nil}))の場合はデフォルト値として
       Cairo::FontWeight::NORMALが使われます。

--- set_dash(dashes, offset=0)

     Cairo::Context#strokeで使われるダッシュのパターンを設定
     します。ダッシュのパターンは正の値の配列として
     ((|dashes|))で指定します。それぞれの値は描かれるときに
     交互にon/offになる部分（線を描く部分と描かない部分）の
     長さを表します。((|offset|))は描きが始まるときのパター
     ンの補正値を指定します。

     それぞれのonの部分は、その部分がサブパスでわかれて
     いるようにキャップを持つことになります。特に、パスに沿っ
     て丸・四角を分散させるために
     Cairo::LineCap::ROUND/Cairo::LineCap::SQUAREを設定して
     0.0の長さのonを使う場合は有効です。

     注: 長さの値は描きのときに評価されたユーザ空間の単位で
     す。つまり、Cairo::Context#set_dashのときにユーザ空間を
     合わせる必要はありません。

     もし((|dashes|))が(({nil}))または空配列ならダッシュは無
     効になります。

     もし、((|dashes|))が数値、あるいはひとつの数値だけを含
     む配列の場合は対照的なパターンであるとみなされ、onとoff
     の部分が指定されたサイズで交互に繰り返されます。

     もし、((|dashes|))のなかに負の値がある、またはすべての
     値が0の場合はCairo::InvalidDashErrorが発生します。

     * dashes: on/offになる描きの部分の長さを交互に指定する
       配列。つまり、(({[描く長さ, 描かない長さ, 描く長さ,
       描かない長さ, ...]}))という配列です。(({nil}))または
       (({[]}))を指定するとダッシュは無効になります。数値を
       指定することと(({[数値]}))を指定することは同じことで
       す。
     * offset: ダッシュパターンを描きを始めるべき位置を補正
       する値。

--- set_source(source)

    コンテキストのソースパターンを((|source|))に設定します。
    このパターンは新しいソースパターンを指定するまでその後の
    すべての描画操作に使われます。

    注: パターンの変換行列はCairo::Context#set_sourceを使っ
    た時点のユーザ空間の効果に固定されます。これは、さらに現
    在の変換行列を変更してもソースパターンには影響はないとい
    うことです。Cairo::Pattern#set_matrixを見てください。

     * source: 今後の描画操作で仕様するCairo::Patternオブジェ
       クト。

--- set_source_rgb(red, green, blue)
--- set_source_rgba(red, green, blue, alpha=1.0)

     コンテキストのソースパターンの色を指定します。
     ((|alpha|))を指定することによって半透明にすることもでき
     ます。この色は新しいソースパターンが設定されるまで、この
     後の全ての描画操作に使われます。

     色とアルファ値は0から1までの浮動小数点です。もし、この範
     囲におさまらなかった場合は強制的にこの範囲におさめます。

     より簡単に色を指定したい場合は
     Cairo::Context#set_source_colorを使ってください。

     * red: 色の赤の部分
     * green: 色の緑の部分
     * blue: 色の青の部分
     * alpha: 色のアルファチャンネルの部分

--- set_source_color(color)

     Cairo::Context::Color#set_source_colorを見てください。

--- show_glyphs(glyphs)

     グリフの配列から形を生成する描画操作です。描画には現在の
     フォントフェイス、フォントサイズ（フォント用変換行列）、
     フォントオプションを使います。

     * glyphs: Cairo::Glyphの配列。

--- show_page

     現在のページを発行して消去します。これは複数ページをサポー
     トしているバックエンドのためです。もし、現在のページを
     消去したくないのであればCairo::Context#copy_pageを使っ
     てください。

--- show_text(utf8)

     UTF-8文字列から形を生成する描画操作です。描画には現在の
     フォントフェイス、フォントサイズ（フォント用変換行列）、
     フォントオプションを使います。

     このメソッドははじめにテキストの文字列のためのグリフ一
     式を計算します。最初のグリフは現在の点を基準に配置され
     ます。それ以降のグリフの基準は前のグリフが進めた基準点
     からの補正値になります。（？FIXME）

     呼び出した後は現在の点は同じように次のグリフを配置した
     ときに基準にする点に移動します。つまり、現在の点は最後
     のグリフが進めた値で相殺された最後のグリフの基準点とな
     ります。（？FIXME）これはひとつの論理的な文字列を複数の
     Cairo::Context#show_textで簡単に表示できるようにします。

     注: Cairo::Context#show_textはcairoの設計者がおもちゃの
     テキストAPIと呼んでいるものの一部です。短いデモや簡単な
     プログラムには便利ですが、真剣にテキストを使おうとして
     いるアプリケーションには適していないでしょう。cairoの本
     当のテキスト表示APIはCairo::Context#show_glyphsを見てく
     ださい。

     * utf8: UTF-8で符号化されたテキスト。

--- source

     現在のソースパターンを返します。

     * Returns: Cairo::Patternオブジェクト。

--- stroke(preserve=false)
--- stroke(preserve=false) {|self| ...}

     現在のパスを現在の線幅、結合点、キャップ、ダッシュの設
     定にしたがって描く描画操作です。((|preserve|))が偽の場
     合は呼び出した後は現在のパスは消去されます。以下も見て
     ください。

       * Cairo::Context#set_line_width
       * Cairo::Context#set_line_join
       * Cairo::Context#set_line_cap
       * Cairo::Context#set_dash

     ブロックを指定した場合は、Cairo::Context#new_pathで新し
     いパスをはじめてからブロックを呼び出します。以下のよう
     に使います。

       context.stroke do
         context.rectangle(20, 20, 40, 40)
       end

     これは以下と等価です。

       context.new_path
       context.rectangle(20, 20, 40, 40)
       context.stroke

     注: 退化した（？FIXME）線分とサブパスは特別扱いされ、便
     利な結果を提供します。それらはふたつの異なった状況にな
     ります。

       (1) Cairo::Context#set_dashで設定された長さ0のon線分。
           もし、キャップスタイルがCairo::LineCap::ROUNDか
           Cairo::LineCap::SQUAREならそれらの線分はそれぞれ
           丸い点あるいは四角として描画されます。
           Cairo::LineCap::SQUAREの場合は四角の方向はその下
           にあるパスの方向によって決まります。

       (2) Cairo::Context#move_toとその後の
           Cairo::Context#close_pathあるいは最初の
           Cairo::Context#move_toと同じ座標に対する1回以上の
           Cairo::Context#line_toで作られたサブパス。キャッ
           プスタイルがCairo::LineCap::ROUNDならサブパスは丸
           い点として描画されるでしょう。
           Cairo::LineCap::SQUAREの場合は退化したサブパスは
           全く描画されないことに注意してください。（なぜな
           ら正しい向きが決定できないから。）

     Cairo::LineCap::BUTTなら退化した線分やサブパスの場合は
     何も描画されません。

     * preserve: 真の場合はパスを消去しない

--- stroke_extents

     現在のパスと描きパラメータでCairo::Context#strokeを呼び
     出したときに影響がある範囲を覆うユーザ空間のバウンディ
     ングボックスを計算します。現在のパスが空なら空の四
     角(0,0, 0,0)を返します。サーフェスの大きさと切り取り領
     域は関係ありません。

     以下も見てください。
       * Cairo::Context#cairo_stroke
       * Cairo::Context#set_line_width
       * Cairo::Context#set_line_join
       * Cairo::Context#set_line_cap
       * Cairo::Context#set_dash

     * Returns: (({[x1, y1, x2, y2]})):
       * x1: バウンディングボックスの左
       * y1: バウンディングボックスの上
       * x2: バウンディングボックスの右
       * y2: バウンディングボックスの下

--- stroke_preserve
--- stroke_preserve {|self| ...}

     Cairo::Context#strokeを以下のように呼び出すことと同じです。

       context.stroke(true)
       context.stroke(true) { ... }

--- target

     Cairo::Context.newに渡されたコンテキストの対象とするサー
     フェスを返します。

     * Returns: 対象のサーフェス。Cairo::Surfaceのサブクラス
       のオブジェクト。

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

--- text_path(utf8)

     テキストの閉じたパスを現在のパスに追加します。生成され
     たを塗りつぶすとCairo::Context#show_textと同じような効
     果が得られます。

     テキストの変換と配置はCairo::Context#show_textと同じよ
     うに行われます。

     Cairo::Context#show_textのように、呼び出した後、現在の点
     は同じように次のグリフを配置したときに基準にする点に移
     動します。つまり、現在の点は最後のグリフが進めた値で相殺
     された最後のグリフの基準点となります。（？FIXME）このた
     め、現在の点を設定しないで複数の
     Cairo::Context#text_pathを連続で呼び出せるようになりま
     す。

     注: Cairo::Context#text_pathはcairoの設計者がおもちゃの
     テキストAPIと呼んでいるものの一部です。短いデモや簡単な
     プログラムには便利ですが、真剣にテキストを使おうとして
     いるアプリケーションには適していないでしょう。cairoの本
     当のテキスト表示APIはCairo::Context#glyph_pathを見てく
     ださい。

     * utf8: UTF-8で符号化れたテキスト。

--- tolerance

     Cairo::Context#set_toleranceで設定した現在の許容値を返します。

     * Returns: 現在の許容値。

--- tolerance=(tolerance)
--- set_tolerance(tolerance)

     パスを台形に変換するときに使う許容値を設定します。パス
     の円弧の部分は、元のパスとポリゴン近似の最大偏差が
     ((|tolerance|))より小さくなるまで再分割されます。デフォ
     ルト値は0.1です。大きな値はよりパフォーマンスがよくなる
     でしょうし、小さい値ならよりより見栄えになるでしょう。
     （デフォルト値0.1から減らしてもそれほど見栄えは改善され
     ないでしょう。）

     * tolerance: 装置単位（普通はピクセル）での許容値。

--- transform(matrix)

     追加の変換として((|matrix|))を適用して現在の変換行列
     （CTM）を変更します。ユーザ空間の新しい変換はすべての既
     存の変換の後に行われます。

--- transform_path(path) {|x, y| ...}

     Cairo::Context::Path#transform_pathを見てください。

--- translate(tx, ty)

     ユーザ空間の基準点を(((|tx|)), ((|ty|)))に動かすことに
     より現在の変換行列（CTM）を変更します。この補正値
     （(((|tx|)), ((|ty|)))）はCairo::Context#translateを適
     用する前のCTMにしたがってユーザ空間座標として解釈されま
     す。言い替えると、ユーザ空間の基準点の移動はすべての既
     存の変換の後に行われます。

     * tx: X方向への移動量
     * ty: Y方向への移動量

--- user_to_device(x, y)

     ユーザ空間から装置空間へ座標を変換します。変換は与え
     られた点に現在の変換行列（CTM）を乗じることによって行わ
     れます。

     * x: ユーザ空間座標のX値
     * y: ユーザ空間座標のY値
     * Returns: (({[dx, dy]}))
       * dx: 装置空間座標のX値
       * dy: 装置空間座標のY値

--- user_to_device_distance(dx, dy)

     ユーザ空間から装置空間へ距離ベクトルを変換します。
     Cairo::Context#user_to_deviceに似ていますが、(((|dx|)),
     ((|dy|)))を変換するときにCTMの移動成分は無視されます。

     * dx: ユーザ空間の距離ベクトルのX値
     * dy: ユーザ空間の距離ベクトルのY値
     * Returns: (({[ddx, ddy]}))
       * ddx: 装置空間の距離ベクトルのX値
       * ddy: 装置空間の距離ベクトルのY値

--- map_path_onto(path)

     Cairo::Context::Path#map_path_ontoを見てください。

--- pseudo_blur(radius=3) {|self| ...}

     Cairo::Context::Blur#pseudo_blurを見てください。

--- triangle(x1, y1, x2, y2, x3, y3)

     Cairo::Context::Triangle#triangleを見てください。

--- has_current_point?
--- have_current_point?

     ((*Since 1.6*)): 現在のパス上に現在の点が定義されている
     かを返します。「現在の点」の詳細は
     Cairo::Context#current_pointを見てください。

     * Returns: 現在の点が定義されているかどうかの真偽値

--- path_extents

     ((*Since 1.6*)): 現在のパス上の点を服務ユーザ空間座標の
     バウンディングボックスを計算します。もし、現在のパスが空
     であれば空の長方形((0,0), (0,0))を返します。ストロー
     クのパラメータ、塗りつぶし規則、サーフェスの大きさ、ク
     リップされた範囲は考慮しません。

     Cairo::Context#fill_extentsと
     Cairo::Context#stroke_extentsは、対応
     する描画操作で「インクが塗られる」範囲だけを返します。

     Cairo::Context#path_extentsの結果は
     線の太さがほぼ0.0で、Cairo::LINE_CAP_ROUNDの時の
     Cairo::Context#stroke_extentsの境界と等しくなるように定
     義されています。（ただし、線の太さが0.0の時に
     Cairo::Context#stroke_extentsが返す空の長方形には決して
     なりません。）

     厳密に言うと、以下のような領域のないサブパスは結果の範
     囲に影響します。（以下の両方のメソッド呼び出しの座標が
     同じ場合も含む）

       context.move_to(...)
       context.line_to(...)

     しかし、Cairo::Context#move_toだけの場合は
     Cairo::Context#path_extentsの結果には影響がありません。

     * Returns: パスを含むバウンディングボックス。左上の頂点
       が(x1, y1)で右下の頂点が(x2, y2)の長方形を表す配列:
       [x1, y1, x2, y2]

--- destroy

     ((*Since 1.7*)): Cairo::Contextを破棄します。この
     Cairo::Contextはもう使えません。

     通常はRubyのGC時に破棄されるので、このメソッドを意識す
     る必要はありません。Quartzバックエンドを使っているGTK+
     のGtk::Drawable#create_cairo_contextを使っている場合な
     ど、Cairo::ContextまたはこのCairo::Contextが対象として
     いるCairo::Surfaceを明示的に破棄したい場合に利用します。

     Cairo::Context.newをブロック付きで呼ぶことも検討してみ
     てください。

--- has_show_text_glyphs?
--- have_show_text_glyphs?

     ((*Since 1.7*)): 対象のサーフェスが
     Cairo::Context#show_text_glyphsをサポートしているかどう
     かを返します。つまり、Cairo::Context#show_text_glyphsが
     指定したテキストとクラスタデータを実際に使うかどうかで
     す。

     注: もし、このメソッドが(({false}))を返しても、
     Cairo::Context#show_text_glyphsは成功します。単に
     Cairo::Context#show_glyphsと同じように動きます。このメ
     ソッドは対象のサーフェスが
     Cairo::Context#show_text_glyphsをサポートしていない場合
     にUTF-8のテキストとクラスタの対応を計算するコストを避け
     るために利用できます。

     * Returns: 対象のサーフェスが
       Cairo::Context#show_text_glyphsをサポートしている場合
       は(({true}))。そうでない場合は(({false}))。

--- show_text_glyphs(utf8, glyphs, clusters, backward)

     ((*Since 1.7*)): Cairo::Context#show_glyphsのような表示
     効果があります。もし、対象のサーフェスが対応していれば、
     出力に表示するグリフのために、指定されたテキストと埋め
     込まれたテキストへのクラスタ対応を使います。

     ((|utf8|))と((|glyphs|))の対応は((|clusters|))で指定し
     ます。各クラスタはたくさんのテキスト（バイト）とグリフ
     を含みます。隣接しているクラスタは((|utf8|))と
     ((|glyphs|))隣接している範囲を含みます。すべてのクラス
     タを集めるとすべての((|utf8|))と((|glyphs|))を含むべき
     です。

     最初のクラスタは常に((|utf8|))の最初のバイトを含みます。
     もし、((|backward|))が(({false}))なら、最初のクラスタは
     最初の((|glyphs|))も含みます。(({true}))の場合は
     ((|glyphs|))の最後を含み、続くクラスタは後ろ向きに進み
     ます。

     妥当なクラスタのための制約はCairo::TextClusterを見てく
     ださい。

     * utf8: UTF-8で符号化されたString
     * glyphs: 表示するCairo::Glyphの配列
     * clusters: クラスタ対応情報（Cairo::TextCluster）の配
       列
     * backward: テキストからグリフへの対応が後ろ方向かどう
       か

== See Also

  * Index
  * Cairo::Surface
  * Cairo::TextCluster

== ChangeLog

  * 2008-08-16: kou: 1.7.4対応。
  * 2008-04-11: kou: 1.6.0対応。
  * 2007-05-20: kou: 定数の扱いについて更新。
  * 2007-05-19: kou: 初期バージョン完成。
