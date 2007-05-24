= module Cairo::Color

((*Since 1.5?*)): 色をパースする機能と、有名な色の
Cairo::Color::RGBオブジェクトを提供するモジュールです。

cairoにはないrcairoでの拡張です。

== Included Modules

  * Cairo::Color::X11

== Module Functions

--- Cairo::Color.parse([r, g, b, a=1.0])
--- Cairo::Color.parse([:rgb, r, g, b, a=1.0])
--- Cairo::Color.parse([:rgba, r, g, b, a=1.0])

    RGB形式の色を生成します。

     * Returns: Cairo::Color::RGBオブジェクト

--- Cairo::Color.parse([:cmyk, c, m, y, k, a=1.0])
--- Cairo::Color.parse([:cmyka, c, m, y, k, a=1.0])

    CMYK形式の色を生成します。

     * Returns: Cairo::Color::CMYKオブジェクト

--- Cairo::Color.parse([:hsv, h, s, v, a=1.0])
--- Cairo::Color.parse([:hsva, h, s, v, a=1.0])

    HSV形式の色を生成します。

     * Returns: Cairo::Color::HSVオブジェクト

--- Cairo::Color.parse("#RGB")
--- Cairo::Color.parse("#RGBA")
--- Cairo::Color.parse("#RRGGBB")
--- Cairo::Color.parse("#RRGGBBAA")
--- Cairo::Color.parse("#RRRRGGGGBBBB")
--- Cairo::Color.parse("#RRRRGGGGBBBBAAAA")

    16進数の文字列で表現されたRGB形式から対応する色を生成し
    ます。"#"からはじまるのに、上記以外のフォーマットの場合
    はArgumentErrorが発生します。

     * Returns: Cairo::Color::RGBオブジェクト

--- Cairo::Color.parse(color_name, robust=false)

    名前から色を生成します。使える色の名前は
    Cairo::Colorモジュールに定義されている定数名と対応
    します。大文字小文字、"-"や"_"や空白は区別されません。

    例えば、Cairo::Color::PEACH_YELLOWを使いたい場合は
    以下のどの書き方でも有効です。

# start-pre
       Cairo::Color.parse(:peach_yellow)
       Cairo::Color.parse("peach-yellow")
       Cairo::Color.parse("peach yellow")
       Cairo::Color.parse("Peach Yellow")
       Cairo::Color.parse("PEACH_YELLOW")
       Cairo::Color.parse("PEACH     Yellow")
# end-pre

     * color_name: 色の名前。文字列またはシンボル。
     * Returns: Cairo::Color::RGBオブジェクト

--- Cairo::Color.parse(color)

    色（Cairo::Color::Baseのサブクラスのオブジェクト）
    を指定した場合は、その色の複製を返します。

     * color: Cairo::Color::Baseのサブクラスのオブジェクト
     * Returns: colorの複製

--- Cairo::Color.parse(value, robust=false)

    robustがtrueの場合はArgumentErrorが発生します。そうでな
    い場合は、valueをそのまま返します。

     * value: 上記以外のオブジェクト
     * Returns: value

--- Cairo::Color.parse_hex_color(value)

    "#..."形式のRGB値から色を生成する。
    Cairo::Color.parseを使ってください。

     * value: "#..."形式の文字列
     * Returns: Cairo::Color::RGBオブジェクト

== Constants

--- ALICE_BLUE
--- ALIZARIN_CRIMSON
--- AMARANTH
--- AMBER
--- AMETHYST
--- APRICOT
--- AQUA
--- AQUAMARINE
--- ASPARAGUS
--- AZURE
--- BEIGE
--- BISTRE
--- BLACK
--- BLAZE_ORANGE
--- BLUE
--- BONDI_BLUE
--- BRIGHT_GREEN
--- BRIGHT_TURQUOISE
--- BROWN
--- BUFF
--- BURGUNDY
--- BURNT_ORANGE
--- BURNT_SIENNA
--- BURNT_UMBER
--- CAMOUFLAGE_GREEN
--- CARDINAL
--- CARMINE
--- CARNATION
--- CARROT_ORANGE
--- CELADON
--- CERISE
--- CERULEAN
--- CERULEAN_BLUE
--- CHARTREUSE
--- CHARTREUSE_YELLOW
--- CHESTNUT
--- CHOCOLATE
--- CINNAMON
--- COBALT
--- COPPER
--- COPPER_ROSE
--- CORAL
--- CORAL_RED
--- CORN
--- CORNFLOWER_BLUE
--- CREAM
--- CRIMSON
--- CYAN
--- DARK_BLUE
--- DARK_POWDER_BLUE
--- DENIM
--- DODGER_BLUE
--- EGGPLANT
--- EMERALD
--- FALU_RED
--- FERN_GREEN
--- FLAX
--- FOREST_GREEN
--- FRENCH_ROSE
--- FUCHSIA
--- GAMBOGE
--- GOLD
--- GOLDENROD
--- GRAY
--- GRAY_ASPARAGUS
--- GREEN
--- GREEN_YELLOW
--- HARLEQUIN
--- HELIOTROPE
--- HEX_RE
--- HOLLYWOOD_CERISE
--- HOT_MAGENTA
--- HOT_PINK
--- INDIGO
--- INTERNATIONAL_KLEIN_BLUE
--- INTERNATIONAL_ORANGE
--- IVORY
--- JADE
--- KHAKI
--- KHAKI_X11
--- LAVENDER
--- LAVENDER_BLUE
--- LAVENDER_BLUSH
--- LAVENDER_GRAY
--- LAVENDER_PINK
--- LAVENDER_ROSE
--- LEMON
--- LEMON_CHIFFON
--- LILAC
--- LIME
--- LINEN
--- MAGENTA
--- MALACHITE
--- MAROON
--- MAUVE
--- MEDIUM_CARMINE
--- MEDIUM_LAVENDER
--- MEDIUM_PURPLE
--- MIDNIGHT_BLUE
--- MINT_GREEN
--- MOSS_GREEN
--- MOUNTBATTEN_PINK
--- MUSTARD
--- NAVAJO_WHITE
--- NAVY_BLUE
--- OCHRE
--- OLD_GOLD
--- OLD_LACE
--- OLD_LAVENDER
--- OLD_ROSE
--- OLIVE
--- OLIVE_DRAB
--- ORANGE
--- ORANGE_COLOR_WHEEL
--- ORANGE_PEEL
--- ORANGE_WEB
--- ORCHID
--- PAPAYA_WHIP
--- PASTEL_GREEN
--- PASTEL_PINK
--- PEACH
--- PEACH_ORANGE
--- PEACH_YELLOW
--- PEAR
--- PERIWINKLE
--- PERSIAN_BLUE
--- PERSIAN_GREEN
--- PERSIAN_INDIGO
--- PERSIAN_PINK
--- PERSIAN_RED
--- PERSIAN_ROSE
--- PINE_GREEN
--- PINK
--- PINK_ORANGE
--- POMEGRANATE
--- POWDER_BLUE_WEB
--- PRUSSIAN_BLUE
--- PUCE
--- PUMPKIN
--- PURPLE
--- RAW_UMBER
--- RED
--- RED_VIOLET
--- ROBIN_EGG_BLUE
--- ROSE
--- ROYAL_BLUE
--- RUSSET
--- RUST
--- SAFETY_ORANGE
--- SAFFRON
--- SALMON
--- SANDY_BROWN
--- SANGRIA
--- SAPPHIRE
--- SCARLET
--- SCHOOL_BUS_YELLOW
--- SEASHELL
--- SEA_GREEN
--- SELECTIVE_YELLOW
--- SEPIA
--- SHOCKING_PINK
--- SILVER
--- SLATE_GRAY
--- SMALT
--- SPRING_GREEN
--- STEEL_BLUE
--- SWAMP_GREEN
--- TAN
--- TANGERINE
--- TAUPE
--- TAWNY
--- TEAL
--- TEA_GREEN
--- TENNE
--- TERRA_COTTA
--- THISTLE
--- TURQUOISE
--- ULTRAMARINE
--- VERMILION
--- VIOLET
--- VIOLET_EGGPLANT
--- VIRIDIAN
--- WHEAT
--- WHITE
--- WISTERIA
--- YELLOW
--- ZINNWALDITE

== See Also

  * Cairo::Color::RGB
  * Cairo::Color::CMYK
  * Cairo::Color::HSV
  * Cairo::Color::X11
  * Index

== ChangeLog

  * 2007-04-26: kou: スタート。

