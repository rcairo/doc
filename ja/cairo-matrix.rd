= class Cairo::Matrix

拡大・回転・剪断とそれらを組み合わせた変換であるアフィン変換
を持つオブジェクトです。点(x, y)は以下のように変換されます。

  x_new = xx * x + xy * y + x0
  y_new = yx * x + yy * y + y0

== Object Hierarchy

* Object
  * Cairo::Matrix

== Class Methods

--- Cairo::Matrix.identity

     恒等変換をする行列を生成します。

     * Returns: 単位行列のCairo::Matrixオブジェクト。

--- Cairo::Matrix.new(xx, yx, xy, yy, x0, y0)

     対応する成分を設定した行列を生成します。

     * xx: アフィン変換のxx成分。
     * yx: アフィン変換のyx成分。
     * xy: アフィン変換のxy成分。
     * yy: アフィン変換のyy成分。
     * x0: アフィン変換のX平行移動成分。
     * y0: アフィン変換のY平行移動成分。
     * Returns: Cairo::Matrixオブジェクト。

--- Cairo::Matrix.rotate(radians)

     ((|radians|))回転する変換を行う行列を返します。

     * radians: 回転する角度（ラジアン）。正の角度は軸から正
       のY軸に進む方向に回転します。cairoのデフォルトの軸の
       方向と同じように、正の角度は時計回りに回転します（？
       FIXME: 逆じゃない？）。
     * Returns: Cairo::Matrixオブジェクト。

--- Cairo::Matrix.scale(sx, sy)

     X方向に((|sx|))、Y方向に((|sy|))拡大する行列を返します。

     * sx: X方向の拡大率。
     * sy: Y方向の拡大率。
     * Returns: Cairo::Matrixオブジェクト。

--- Cairo::Matrix.translate(tx, ty)

     X方向に((|tx|))、Y方向に((|ty|))平行移動を行う行列を返
     します。

     * tx: X方向の平行移動量。
     * ty: Y方向の平行移動量。
     * Returns: Cairo::Matrixオブジェクト。

== Instance Methods

--- xx

     アフィン変換のxx成分を返します。

     * Returns: アフィン変換のxx成分。

--- xx=(xx)
--- set_xx(xx)

     アフィン変換のxx成分を設定します。

     * xx: アフィン変換のxx成分。

--- yx

     アフィン変換のyx成分を返します。

     * Returns: アフィン変換のyx成分。

--- yx=(yx)
--- set_yx(yx)

     アフィン変換のyx成分を設定します。

     * yx: アフィン変換のyx成分。

--- xy

     アフィン変換のxy成分を返します。

     * Returns: アフィン変換のxy成分。

--- xy=(xy)
--- set_xy(xy)

     アフィン変換のxy成分を設定します。

     * xy: アフィン変換のxy成分。

--- yy

     アフィン変換のyy成分を返します。

     * Returns: アフィン変換のyy成分。

--- yy=(yy)
--- set_yy(yy)

     アフィン変換のyy成分を設定します。

     * yy: アフィン変換のyy成分。

--- x0

     アフィン変換のX平行移動成分を返します。

     * Returns: アフィン変換のX平行移動成分。

--- x0=(x0)
--- set_x0(x0)

     アフィン変換のX平行移動成分を設定します。

     * x0: アフィン変換のX平行移動成分。

--- y0

     アフィン変換のY平行移動成分を返します。

     * Returns: アフィン変換のY平行移動成分。

--- y0=(y0)
--- set_y0(y0)

     アフィン変換のY平行移動成分を設定します。

     * y0: アフィン変換のY平行移動成分。

--- clone

     複製を返します。((|self|))が凍結されているオブジェクト
     なら複製されたオブジェクトも凍結されています。

     * Returns: Cairo::Matrixオブジェクト。

--- dup

     複製を返します。

     * Returns: Cairo::Matrixオブジェクト。

--- identity!

     単位行列にします。

--- invert

     逆行列を返します。全ての変換行列が逆行列を持っているわ
     けではありません。行列が点をつぶすなら（退化という
     （FIXME））逆行列がなく、Cairo::InvalidMatrixError例外
     が発生します。

     * Returns: Cairo::Matrixオブジェクト。

--- invert!

     Cairo::Matrix#invertの破壊的なバージョンです。

--- *(other)
--- multiply(other)

     Cairo::Matrix#multiplyの別名です。
     ((|self|))と((|other|))の積を返します。結果として最初
     に((|self|))の変換を行い、次に((|other|))の変換を行う新
     しい変換を返します。

     * other: Cairo::Matrixオブジェクト。
     * Returns: Cairo::Matrixオブジェクト。

--- multiply!(other)

     Cairo::Matrix#multiplyの破壊的なバージョンです。

     * other: Cairo::Matrixオブジェクト。

--- rotate(radians)

     ((|radians|))回転する変換を適用した新しい行列を返します。
     この結果、最初に((|radians|))回転し、次に((|self|))を適
     用する変換になります。

     * radians: 回転する角度（ラジアン）。正の角度は軸から正
       のY軸に進む方向に回転します。cairoのデフォルトの軸の
       方向と同じように、正の角度は時計回りに回転します（？
       FIXME: 逆じゃない？）。
     * Returns: Cairo::Matrixオブジェクト。

--- rotate!(radians)

     Cairo::Matrix#rotateの破壊的なバージョンです。

     * radians: 回転する角度（ラジアン）。正の角度は軸から正
       のY軸に進む方向に回転します。cairoのデフォルトの軸の
       方向と同じように、正の角度は時計回りに回転します（？
       FIXME: 逆じゃない？）。

--- scale(sx, sy)

     X方向に((|sx|))、Y方向に((|sy|))拡大する変換を適用した
     新しい行列を返します。この結果、最初に((|sx|)),
     ((|sy|))だけ拡大し、次に((|self|))を適用する変換になり
     ます。

     * sx: X方向の拡大率。
     * sy: Y方向の拡大率。
     * Returns: Cairo::Matrixオブジェクト。

--- scale!(sx, sy)

     Cairo::Matrix#scaleの破壊的なバージョンです。

     * sx: X方向の拡大率。
     * sy: Y方向の拡大率。

--- set(xx, yx, xy, yy, x0, y0)

     対応する成分を設定します。

     * xx: アフィン変換のxx成分。
     * yx: アフィン変換のyx成分。
     * xy: アフィン変換のxy成分。
     * yy: アフィン変換のyy成分。
     * x0: アフィン変換のX平行移動成分。
     * y0: アフィン変換のY平行移動成分。

--- to_a

     各成分を配列として返します。

     * Returns: (({[xx, yx, xy, yy, x0, y0]}))
       * xx: アフィン変換のxx成分。
       * yx: アフィン変換のyx成分。
       * xy: アフィン変換のxy成分。
       * yy: アフィン変換のyy成分。
       * x0: アフィン変換のX平行移動成分。
       * y0: アフィン変換のY平行移動成分。

--- to_s

     文字列に変換します。

     * Returns: 文字列表現のCairo::Matrixオブジェクト。

--- transform_distance(dx, dy)

     距離ベクトル(((|dx|)), ((|dy|)))を((|self|))で変換しま
     す。Cairo::Matrix#transform_pointと似ていますが、平行移
     動成分を無視するところが違います。返るベクトルは以下の
     ように計算されます。

       dx2 = dx * a + dy * c;
       dy2 = dx * b + dy * d;

     アフィン変換は位置不変です。同じベクトルはいつも同じベ
     クトルに変換されます。もし、(x1, y1)が(x2, y2)に変換さ
     れるなら、どんなx1, x2に対しても(x1 + ((|dx|)), y1 +
     ((|dy|)))は(x1 + ((|dx2|)), y1 + ((|dy2|)))に変換されま
     す。

     * dx: 距離ベクトルのX成分。
     * dy: 距離ベクトルのY成分。
     * Returns: (({[dx2, dy2]}))
       * dx2: 変換された距離ベクトルのX成分。
       * dy2: 変換された距離ベクトルのY成分。

--- transform_point(x, y)

     点(((|x|)), ((|y|)))を((|self|))で変換します。

     * x: X座標。
     * y: Y座標。
     * Returns: (({[x2, y2]}))
       * x2: 変換されたX座標。
       * y2: 変換されたY座標。

--- translate(tx, ty)

     X方向に((|tx|))、Y方向に((|ty|))平行移動を行う行列を返
     します。この結果、最初に((|tx|)), ((|ty|))平行移動し、次
     に((|self|))を適用する変換になります。

     * tx: X方向の平行移動量。
     * ty: Y方向の平行移動量。
     * Returns: Cairo::Matrixオブジェクト。

--- translate!(tx, ty)

     Cairo::Matrix#translateの破壊的なバージョンです。

     * tx: X方向の平行移動量。
     * ty: Y方向の平行移動量。

--- ==(other)

     ((*Since 1.7*)): ((|other|))がCairo::Matrixオブ
     ジェクトで、xx, yx, xy, yy, x0, y0それぞれが(({==}))だっ
     た場合に(({true}))を返します。

     * other: 比較対象のオブジェクト。
     * Returns: (({self}))と(({other}))が等しければ
     (({true}))、そうでなければ(({false}))。

== See Also

  * Index

== ChangeLog

  * 2008-08-17: kou: rcairo 1.7対応。
  * 2007-05-21: kou: スタート。
