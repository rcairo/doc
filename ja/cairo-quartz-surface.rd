= class Cairo::QuartzSurface

((*Since 1.4*))

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::QuartzSurface

== Class Methods

--- Cairo::QuartzSurface.new(width, height)
--- Cairo::QuartzSurface.new(format, width, height)

     CGBitmapがバックエンドのサーフェスを生成します。
     ((|format|))を省略した場合はCairo::Format::ARGB32が指定
     されたものと扱われます。

     * format: サーフェスのピクセルの形式。（Cairo::Format）
     * width: サーフェスの幅。（ピクセル）
     * height: サーフェスの高さ。（ピクセル）
     * Returns: 新しく生成したCairo::QuartzSurface

--- Cairo::QuartzSurface.new(context, width, height)

     指定された((|context|))をラップするサーフェスを生成しま
     す。((|context|))はQuickDraw座標系（原点が左上でY軸は下
     にいくほど増加する）であると仮定されます。もし、
     ((|context|))がQuartz座標系（原点が左下）の場合は渡す前
     に反転させてください。

     例（間違っているかもしれない）:
       context.translateCTM(0.0, height)
       context.scaleCTM(1.0, -1.0)

     ほんの少しの描画操作は失敗します。もし、それらの操作が
     成功しなければいけないのであれば、OSX::CGContextRefを指
     定せずにCairo::QuartzSurfaceを作成し、その結果を
     OSX::CGContextRefにコピーしてください。

     * context: OSX::CGContextRef。
     * width: サーフェスの幅。（ピクセル）
     * height: サーフェスの高さ。（ピクセル）
     * Returns: 新しく生成したCairo::QuartzSurface

== Instance Methods

--- cg_context

     サーフェスが使用しているOSX::CGContextRefを返します。

     * Returns: OSX::CGContextRef

== See Also

  * Cairo::Surface
  * Index

== ChangeLog

  * 2008-01-11: kou: スタート
