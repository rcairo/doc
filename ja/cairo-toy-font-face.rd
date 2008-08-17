= class Cairo::ToyFontFace

((*Since 1.7*)): おもちゃのような（少ない機能の）フォントフェイス。

== Object Hierarchy

* Object
  * ((<Cairo::FontFace>))
    * Cairo::ToyFontFace

== Class Methods

--- Cairo::ToyFontFace.new(family=nil, slant=nil, weight=nil)

     フォントのファミリーと傾きと重みからフォントフェイスを
     作ります。このフォントフェイスはCairo::Contextの「おも
     ちゃのような」フォントAPIを実装するために使われます。

     ((|family|))が(({nil}))や空文字列の場合はプラットフォー
     ム依存のデフォルトのフォントファミリーが使われます。デ
     フォルトのフォントファミリーはCairo::ToyFontFace#family
     で取得できます。

     ((|slant|))が(({nil}))の場合はCairo::FontSlant::NORMAL
     が使われます。

     ((|weight|))が(({nil}))の場合は
     Cairo::FontWeight::NORMALが使われます。

     Cairo::ToyFontFaceの制限については
     Cairo::Context#select_font_faceの説明を見てください。

     * family: UTF-8で符号化されたフォントファミリー名。
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
     * Returns: 新しく生成したCairo::ToyFontFaceオブジェクト。

== Instance Methods

--- family

     ((*Since 1.7*)): ファミリー名を返します。

     * Returns: ファミリー名。

--- slant

     ((*Since 1.7*)): 傾きを返します。

     * Returns: 傾き（Cairo::FontSlant）

--- weight

     ((*Since 1.7*)): 重みを返します。

     * Returns: 傾き（Cairo::FontWeight）

== See Also

  * Cairo::Context#select_font_face
  * Cairo::FontSlant
  * Cairo::FontWeight

== ChangeLog

  * 2008-08-16: kou: スタート。


