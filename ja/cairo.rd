= module Cairo

== Module Functions

--- Cairo.bindings_version

     rcairoのバージョンを以下のフォーマットの文字列で返しま
     す。

       メジャー番号.マイナー番号.マイクロ番号

     以下のようにタグが付くこともあります。

       メジャー番号.マイナー番号.マイクロ番号-タグ

     * Returns: rcairoのバージョン

--- Cairo.normalize_const_name

     内部で使っているメソッドです。

== Constants

--- ANTIALIAS_DEFAULT
--- ANTIALIAS_GRAY
--- ANTIALIAS_NONE
--- ANTIALIAS_SUBPIXEL
--- BINDINGS_VERSION

     rcairoのバージョンを示す(({[major, minor, micro,
     tag]}))という配列です。((|tag|))は(({nil}))のことがあり
     ます。

--- BUILD_VERSION

     rcairoをビルドするのに使用したcairoのバージョンを示す
     (({[major, minor, micro]}))という配列です。

--- CONTENT_ALPHA
--- CONTENT_COLOR
--- CONTENT_COLOR_ALPHA
--- EXTEND_NONE
--- EXTEND_PAD
--- EXTEND_REFLECT
--- EXTEND_REPEAT
--- FILL_RULE_EVEN_ODD
--- FILL_RULE_WINDING
--- FILTER_BEST
--- FILTER_BILINEAR
--- FILTER_FAST
--- FILTER_GAUSSIAN
--- FILTER_GOOD
--- FILTER_NEAREST
--- FONT_SLANT_ITALIC
--- FONT_SLANT_NORMAL
--- FONT_SLANT_OBLIQUE
--- FONT_WEIGHT_BOLD
--- FONT_WEIGHT_NORMAL
--- FORMAT_A1
--- FORMAT_A8
--- FORMAT_ARGB32
--- FORMAT_RGB24
--- HINT_METRICS_DEFAULT
--- HINT_METRICS_OFF
--- HINT_METRICS_ON
--- HINT_STYLE_DEFAULT
--- HINT_STYLE_FULL
--- HINT_STYLE_MEDIUM
--- HINT_STYLE_NONE
--- HINT_STYLE_SLIGHT
--- LINE_CAP_BUTT
--- LINE_CAP_ROUND
--- LINE_CAP_SQUARE
--- LINE_JOIN_BEVEL
--- LINE_JOIN_MITER
--- LINE_JOIN_ROUND
--- MAJOR_VERSION

     現在rcairoと一緒に使用しているcairoのメジャーバージョン
     を示す整数です。

--- MICRO_VERSION

     現在rcairoと一緒に使用しているcairoのマイナーバージョン
     を示す整数です。

--- MINOR_VERSION

     現在rcairoと一緒に使用しているcairoのマイクロバージョン
     を示す整数です。

--- OPERATOR_ADD
--- OPERATOR_ATOP
--- OPERATOR_CLEAR
--- OPERATOR_DEST
--- OPERATOR_DEST_ATOP
--- OPERATOR_DEST_IN
--- OPERATOR_DEST_OUT
--- OPERATOR_DEST_OVER
--- OPERATOR_IN
--- OPERATOR_OUT
--- OPERATOR_OVER
--- OPERATOR_SATURATE
--- OPERATOR_SOURCE
--- OPERATOR_XOR
--- PATH_CLOSE_PATH
--- PATH_CURVE_TO
--- PATH_LINE_TO
--- PATH_MOVE_TO
--- SUBPIXEL_ORDER_BGR
--- SUBPIXEL_ORDER_DEFAULT
--- SUBPIXEL_ORDER_RGB
--- SUBPIXEL_ORDER_VBGR
--- SUBPIXEL_ORDER_VRGB
--- SVG_VERSION_1_1
--- SVG_VERSION_1_2
--- VERSION

     現在rcairoと一緒に使用しているcairoのバージョンを示す
     (({[major, minor, micro]}))という配列です。

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
