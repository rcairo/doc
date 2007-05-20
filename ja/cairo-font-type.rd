= module Cairo::FontType

フォントフェイスまたはスケールフォントの種類を表すために使わ
れます。cairoの中ではフォントの種類はフォントバックエンドと
もいいます。

フォントフェイスは作成方法で決定されます。（rcairoではフォン
トの作成はサポートしていません。）

スケールフォントの種類はCiaro::ScaledFont.newに渡したフォン
トフェイスで決まります。

将来、新しい種類が追加されるかもしれません。

== Constants

--- ATSUI

     ATSUIのフォント。

--- FT

     FreeTypeのフォント。

--- TOY

     cairoのおもちゃのフォントAPIで作成されたフォント。

--- WIN32

     Win32のフォント。

== See Also

  * Index

== ChangeLog

  * 2007-05-20: kou: スタート。
