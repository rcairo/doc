= class Cairo::QuartzImageSurface

((*Since 1.6*))

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::QuartzImageSurface

== Class Methods

--- Cairo::QuartzImageSurface.new(surface)

     指定したイメージサーフェスを参照するCGImageRefがバック
     エンドのQuartzサーフェスを作成します。作成したサーフェ
     スをCairo::QuartzSurfaceに描画するソースとして使うと高
     速に描画できます。もし、イメージサーフェスのデータが更
     新されたら、Cairo::QuartzImageSurfaceに対して
     Cairo::Surface#flushを呼び出さなければいけません。これ
     はCGImageRefに更新されたデータを参照させるためです。

     * surface: Cairo::QuartzImageSurfaceでラップする
       Cairo::ImageSurface
     * Returns: 新しく作ったサーフェス

== Instance Methods

--- image

     * Returns: 参照しているCairo::ImageSurface

== See Also

  * Index
  * Cairo::ImageSurface
  * Cairo::QuartzSurface

== ChangeLog

  * 2008-04-12: kou: スタート
