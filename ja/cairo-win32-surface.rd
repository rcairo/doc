= class Cairo::Win32Surface

((*Since 1.4*)): Microsoft Windows用のサーフェスです。
Windowsのウィジェットに描画するために使用します。

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::Win32Surface

== Class Methods

--- Cairo::Win32Surface.new(hdc)

     ((|hdc|))用のサーフェスを生成します。サーフェイスの大き
     さは指定されたデバイスコンテキストが切り取っている（ク
     リップしている）範囲になります。

     * hdc: サーフェスを生成するデバイスコンテキストハンドル。
       （HDC）
     * Returns: 新しく生成したCairo::Win32Surface

--- Cairo::Win32Surface.new(width, height)
--- Cairo::Win32Surface.new(format, width, height)
--- Cairo::Win32Surface.new(hdc, width, height)
--- Cairo::Win32Surface.new(hdc, format, width, height)

     幅が((|width|))で高さが((|height|))のデバイス非依存のビッ
     トマップサーフェスを生成します。((|format|))を省略した
     場合はCairo::Format::ARGB32が指定されたものと扱われます。
     ((|hdc|))を指定した場合はそのデバイスコンテキストと互換
     性のあるサーフェスを生成します。

     * hdc: サーフェスを生成するデバイスコンテキストハンドル。
       （HDC）
     * format: サーフェスのピクセルの形式。（Cairo::Format）
     * width: サーフェスの幅。（ピクセル）
     * height: サーフェスの高さ。（ピクセル）
     * Returns: 新しく生成したCairo::Win32Surface

== Instance Methods

--- hdc

     サーフェスに関連付けられているデバイスコンテキストハン
     ドル（HDC）を返します。関連付けられていない場合はnilを
     返します。

     * Returns: デバイスコンテキストハンドル（HDC）あるいはnil

--- image

     サーフェスがデバイス非依存のビットマップ（DIB）の場合は
     そのビットマップを使用しているCairo::ImageSurfaceを返し
     ます。そうでない場合はnilを返します。

     * Returns: Cairo::ImageSurfaceあるいはnil

== See Also

  * Cairo::Surface
  * Index

== ChangeLog

  * 2008-01-11: kou: スタート
