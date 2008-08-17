= module Cairo::LCDFilter

((*Since 1.7*)): Cairo::LCDFilterに定義されている定数は、
Cairo::Antialias::SUBPIXELアンチエイリアスモードでLCD（液晶ディ
スプレイ）に最適化されたビットマップを生成する時に適用するロー
パスフィルタ（low-pass filter）を指定します。

== Constants

--- DEFAULT

     フォントバックエンドと対象装置のデフォルトLCDフィルタを
     使います。

--- FIR3

     周辺3x3ピクセル（あってる？FIXME: with a 3x3 kernel）で
     有限インパルス応答フィルタ（FIRフィルタ）を使います。

--- FIR5

     周辺5x5ピクセル（あってる？FIXME: with a 5x5 kernel）で
     有限インパルス応答フィルタ（FIRフィルタ）を使います。

--- INTRA_PIXEL

     ピクセル内フィルタ（あってる？FIXME: intra-pixel filter）
     を使います。

--- NONE

     LCDフィルタを実行しません。

== See Also

  * Cairo::Antialias::SUBPIXEL

== ChangeLog

  * 2008-08-17: kou: スタート。

