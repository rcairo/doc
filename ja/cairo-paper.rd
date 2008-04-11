= class Cairo::Paper

((*Since 1.6*)): 用紙を表すクラスです。

cairoにはないrcairoの拡張です。

== Object Hierarchy

* Object
  * Cairo::Paper

== Class Methods

--- Cairo::Paper.default_unit

     単位を省略した場合に使用する単位を返します。初期値はポ
     イントです。

     * Returns: デフォルトの単位

--- Cairo::Paper.default_unit=(unit)

     単位を省略した場合に使用する単位を設定します。

     * unit: 単位を表す文字列（"inch"や"pt"など）
     * Returns: ((|unit|))

--- Cairo::Paper.new(width, height, unit=nil, name=nil)

     指定した大きさの用紙を作ります。unitがnilの場合は
     Cairo::Paper.default_unitを使用します。

     nameは人間のためのものです。省略しても問題ありません。

     * width: 用紙の幅
     * height: 用紙の高さ
     * unit: width/heightの単位
     * name: 用紙の名前
     * Returns: 新しいCairo::Paperオブジェクト

--- Cairo::Paper.parse(paper)
--- Cairo::Paper.parse(name)
--- Cairo::Paper.parse(description)

     様々なオブジェクトから対応するCairo::Paperオブジェクト
     を生成します。paperが指定された場合でも、指定された
     paperと同じ内容のCairo::Paperオブジェクトを新しく生成し
     ます。

     * paper: Cairo::Paper
     * name: 用紙名（例: "a4", :a4, "b0 landscape", "Japanese-postalcard"）
     * description: 用紙表現: "#{WIDTH}#{UNIT}x#{HEIGHT}#{UNIT}\##{NAME}"
       "#{UNIT}"と最後の"\##{NAME}"は省略可能。"#{UNIT}"を省
       略した場合はCairo::Paper.default_unitが使われる。

       例: "100x200", "200mmx4inch", "841mmx1189mm#A0"
     * Returns: 対応する新しいCairo::Paperオブジェクト

--- Cairo::Paper.register_unit_resolver(from_units, to_units, &resolver) {|size| ...}

     異なる単位間で値を変換する方法を登録します。以下はイン
     チをポイントに変換する方法を登録しています。ここでは、イ
     ンチの単位として"in", "inch"を、ポイントの単位として
     "pt"を登録しています。

       Cairo::Paper.register_unit_resolver(["in", "inch"], "pt") do |size|
         size * 72
       end

     * from_units: 変換元の単位の文字列の配列。文字列を指定
       した場合はその文字列だけの配列が指定されたものとして
       扱われる。（"pt" => ["pt"]）
     * to_units: 変換先の単位の文字列の配列。文字列を指定
       した場合はその文字列だけの配列が指定されたものとして
       扱われる。（"pt" => ["pt"]）
     * resolver: 変換対象のサイズを受け取って、変換したサイ
       ズを返すブロック

--- Cairo::Paper.resolve_unit(size, from_unit, to_unit)

     from_unit単位のsizeをto_unit単位のサイズに変換します。

     * size: 変換対象のサイズ
     * from_unit: 変換元の単位（文字列。nilを指定した場合は
       Cairo::Paper.default_sizeを使用）
     * to_unit: 変換先の単位（文字列。nilを指定した場合は
       Cairo::Paper.default_sizeを使用）
     * Returns: 変換後のサイズ

== Instance Methods

--- width(unit=nil)

     指定した単位での幅を返します。unitがnilのときはその用紙
     の単位を使います。

     * unit: 単位
     * Returns: 指定した単位での幅

--- width=(width)

     幅を設定します。

     * width: 幅

--- height(unit=nil)

     指定した単位での高さを返します。unitがnilのときはその用紙
     の単位を使います。

     * unit: 単位
     * Returns: 高さ

--- height=(height)

     高さを設定します。

     * height: 高さ

--- size(unit=nil)

     指定した単位での幅と高さを返します。unitがnilのときはそ
     の用紙の単位を使います。

     * unit: 単位
     * Returns: 指定した単位での幅と高さの配列: [width, height]

--- unit

     * Returns: 単位

--- unit=(unit)

     単位を設定します。

     * unit: 単位

--- name

     * Returns: 名前

--- name=(name)

     名前を設定します。

     * name: 名前

--- to_s

     以下の形式の用紙の文字列表現を返します。

       "#{WIDTH}#{UNIT}x#{HEIGHT}#{UNIT}\##{NAME}"

     "#{UNIT}"および"\##{NAME}"はない場合があります。

     Cairo::Paper.parseの入力にすることができます。

     * Returns: 用紙の文字列表現

--- ==(other)

     selfとotherが等しいかどうかを返します。

     * Returns: otherと同じ用紙の場合はtrue

== Constants

--- A0

     A0の用紙

--- A0_LANDSCAPE

     A0横置きの用紙

--- A1

     A1の用紙

--- A1_LANDSCAPE

     A1横置きの用紙

--- A2

     A2の用紙

--- A2_LANDSCAPE

     A2横置きの用紙

--- A3

     A3の用紙

--- A3_LANDSCAPE

     A3横置きの用紙

--- A4

     A4の用紙

--- A4_LANDSCAPE

     A4横置きの用紙

--- A5

     A5の用紙

--- A5_LANDSCAPE

     A5横置きの用紙

--- A6

     A6の用紙

--- A6_LANDSCAPE

     A6横置きの用紙

--- A7

     A7の用紙

--- A7_LANDSCAPE

     A7横置きの用紙

--- A8

     A8の用紙

--- A8_LANDSCAPE

     A8横置きの用紙

--- A9

     A9の用紙

--- A9_LANDSCAPE

     A9横置きの用紙

--- A10

     A10の用紙

--- A10_LANDSCAPE

     A10横置きの用紙

--- B0

     B0の用紙

--- B0_LANDSCAPE

     B0横置きの用紙

--- B1

     B1の用紙

--- B1_LANDSCAPE

     B1横置きの用紙

--- B2

     B2の用紙

--- B2_LANDSCAPE

     B2横置きの用紙

--- B3

     B3の用紙

--- B3_LANDSCAPE

     B3横置きの用紙

--- B4

     B4の用紙

--- B4_LANDSCAPE

     B4横置きの用紙

--- B5

     B5の用紙

--- B5_LANDSCAPE

     B5横置きの用紙

--- B6

     B6の用紙

--- B6_LANDSCAPE

     B6横置きの用紙

--- B7

     B7の用紙

--- B7_LANDSCAPE

     B7横置きの用紙

--- B8

     B8の用紙

--- B8_LANDSCAPE

     B8横置きの用紙

--- B9

     B9の用紙

--- B9_LANDSCAPE

     B9横置きの用紙

--- B10

     B10の用紙

--- B10_LANDSCAPE

     B10横置きの用紙

--- JAPANESE_POSTCARD

     日本の官製はがき

--- JAPANESE_POSTCARD_LANDSCAPE

     日本の官製はがきの横置き

--- LEGAL

     法律文書用サイズ

--- LEGAL_LANDSCAPE

     法律文書用サイズの横置き

--- LETTER

     便箋

--- LETTER_LANDSCAPE

     便箋の横置き

--- TABLOID

     新聞

--- TABLOID_LANDSCAPE

     新聞の横置き

== See Also

  * Index

== ChangeLog

  * 2008-04-11: kou: スタート。
