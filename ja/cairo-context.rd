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
    に切り取り範囲を制限することができます。他の切り取り範囲
    の領域を増やす唯一の方法はCairo::Context#reset_clipです。

--- clip_extents

     * Returns: self

--- clip_preserve

     * Returns: self

--- clip_rectangle_list

     * Returns: self

--- close_path

     * Returns: self

--- copy_page

     * Returns: self

--- copy_path

     * Returns: self

--- copy_path_flat

     * Returns: self

--- current_point

     * Returns: self

--- curve_to

     * Returns: self

--- dash

     * Returns: self

--- dash_count

     * Returns: self

--- device_to_user

     * Returns: self

--- device_to_user_distance

     * Returns: self

--- fill

     * Returns: self

--- fill_extents

     * Returns: self

--- fill_preserve

     * Returns: self

--- fill_rule

     * Returns: self

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


