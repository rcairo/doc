= module Cairo::Context::Blur

((*Since 1.5?*)): 実験的な「ぼかし」効果の実装です。APIは変更
される可能性があります。

cairoにはないrcairoでの拡張です。

== Instance Methods

--- pseudo_blur(radius=3) {|self| ...}

    ブロック内で描画した内容に対して「ぼかし」効果を適用しま
    す。一般的なガウス分布を使ったものではなく、描画内容にア
    ルファ値を加えたものを少しずつ動かして色を混ぜることによ
    りぼかします。遅いです。

     * radius: ユーザ空間でどのくらいの半径の範囲で動かすか

== See Also

  * Cairo::Context
  * Index

== ChangeLog

  * 2007-04-30: kou: スタート。
