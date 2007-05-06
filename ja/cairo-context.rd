= class Cairo::Context

Cairo::Contextはrcairoで描画するときに使用する主要なオブジェ
クトです。rcairoで描画するためには、まず、描画対象となるサー
フェスを設定したCairo::Contextを作ります。それから、描画オプ
ションを設定し、((<Cairo::Context#move_to>))、
((<Cairo::Context#line_to>))などで形を作り、その形を
((<Cairo::Context#stroke>))か((<Cairo::Context#fill>))で描画
します。

Cairo::Contextの持っている描画情報は
((<Cairo::Context#save>))でスタックに積むことができます。そ
のため、現在の状態を失うことなく描画情報を安全に変更できます。
((<Cairo::Context#restore>))を呼べば保存した状態を復元するこ
とができます。

  context.save
  ...
  context.restore

よりRubyらしく書くなら、ブロックつきで
((<Cairo::Context#save>))を使用します。

  context.save do
    ...
  end

この場合は、ブロックを抜けた時点で自動的に
((<Cairo::Context#restore>))が呼び出されます。

Cairo::Contextには、いくつかrcairoが拡張している機能もありま
す。

== Object Hierarchy

* Object
  * Cairo::Context

== Included Modules

  * ((<Cairo::Context::Blur>))
  * ((<Cairo::Context::Circle>))
  * ((<Cairo::Context::Color>))
  * ((<Cairo::Context::Path>))
  * ((<Cairo::Context::Rectangle>))

== Class Methods

--- Cairo::Context.new(target)

    全ての状態がデフォルト値に設定され、描画対象のサーフェス
    が((|target|))に設定された新しい((<Cairo::Context>))を作
    成します。描画対象のサーフェスはバックエンド依存の方法で
    作成します。例えば、画像用のサーフェスは
    ((<Cairo::ImageSurface.new>))で作成し、PDF用のサーフェス
    は((<Cairo::PDFSurface.new>))で作成します。

     * target: 描画対象のサーフェス
       （((<Cairo::ImageSurface>))など）
     * Returns: ((<Cairo::Context>))

== Instance Methods

--- antialias

    現在設定されている、形状に対するアンチエイリアスのモード
    を返します。これは((<Cairo::Context#antialias=>))で設定で
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
    ころ、どのバックエンドも((<Cairo::ANTIALIAS_SUBPIXEL>))
    をサポートしていません。

    このオプションはテキストのレンダリングには影響を与えない
    ことに注意してください。テキストのレンダリングには代わり
    に((<Cairo::FontOptions#antialias=>))を見てください。

     * antialias: :defaultや:noneなどCairo::ANTIALIAS_*から
       「Cairo::ANTIALIAS_」をのぞいた部分。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "default"のように指定することもできます。

--- append_path(path)

    ((|path|))を現在のパス上に追加します。((|path|))は
    ((<Cairo::Context#copy_path>))または
    ((<Cairo::Context#copy_path_flat>))で取得します。


    Append the path onto the current path. The path may be either the return value from one of cairo_copy_path() or cairo_copy_path_flat() or it may be constructed manually. See cairo_path_t for details on how the path data structure should be initialized, and note that path->status must be initialized to CAIRO_STATUS_SUCCESS.

     * Returns: self

--- arc

     * Returns: self

--- arc_negative

     * Returns: self

--- clip

     * Returns: self

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

  * ((<Index>))

== ChangeLog


