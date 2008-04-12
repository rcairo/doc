= module Cairo::Format

画像データのメモリ上のフォーマットを特定するために使われます。

== Module Functions

--- Cairo::Format.stride_for_width(format, width)

     ((*Since 1.6*)): cairoの最適化したイメージ描画処理での
     すべての調整要求を考慮したストライド値を返します。以下
     のように使います。

# start-pre
       stride = Cairo::Format.stride_for_width(format, width)
       data = "\0" * stride * height
       surface = Cairo::ImageSurface.create(data, format, width, height, stride)
# end-pre

     format: Cairo::Format::*のどれか。
     width: Cairo::ImageSurfaceの作成に使いたい幅。
     Returns: 与えられたformatとwidthに適切なストライド値。
     不正なformatや大きすぎるwidthを与えた場合は-1。

== Constants

--- A1

     各ピクセルはアルファ値を保持するために1ビット持っていま
     す。ピクセルは他のピクセルとともに32ビットに詰められま
     す。ビットのならび順はプラットフォームのエンディアンと
     同じです。ビッグエンディアンの計算機では最初のピクセル
     が最上位ビットで、リトルエンディアンの計算機では最下位
     ビットです。

--- A8

     各ピクセルはアルファ値を保持するために8ビット持っていま
     す。

--- ARGB32

     各ピクセルは32ビット持っています。上からアルファ値用に8
     ビット、赤用に8ビット、緑用に8ビット、青用に8ビットです。
     32ビットは環境のデフォルトのエンディアンで保存されます。
     事前にアルファ値を掛けた値が使われます。（つまり、50%透過
     している赤は0x80800000で0x80ff0000ではありません。）

--- RGB24

     各ピクセルは32ビット持っています。上位8ビットは使われま
     せん。赤、緑、青はこの順番で残りの24ビットに保存されま
     す。

== See Also

  * Index

== ChangeLog

  * 2008-04-11: kou: 1.6.0対応。
  * 2007-05-20: kou: スタート。
