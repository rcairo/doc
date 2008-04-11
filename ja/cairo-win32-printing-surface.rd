= class Cairo::Win32PrintingSurface

((*Since 1.6*))

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::Win32PrintingSurface

== Class Methods

--- Cairo::Win32PrintingSurface.new(hdc)

     ((|hdc|))用のサーフェスを生成します。サーフェイスの大き
     さは指定されたデバイスコンテキストが切り取っている（ク
     リップしている）範囲になります。((|hdc|))は印刷用のDCで
     なければいけません。つまり、アンチエイリアスは無視され、
     サーフェスへの描画はできるだけGDIを使います。

     正しく複雑な描画動作をするために、生成されたサーフェス
     はページサポート付きのサーフェスでラップされます。つま
     り、正しい結果を得るためにCairo::Surface#show_pageと関連
     するメソッドを使う必要があります。

     * hdc: サーフェスを生成するデバイスコンテキストハンドル。
       （HDC）
     * Returns: 新しく生成したCairo::Win32PrintingSurface

== Instance Methods

--- hdc

     サーフェスに関連付けられているデバイスコンテキストハン
     ドル（HDC）を返します。関連付けられていない場合はnilを
     返します。

     * Returns: デバイスコンテキストハンドル（HDC）あるいはnil

== See Also

  * Index
  * Cairo::Surface
  * Cairo::Win32Surface

== ChangeLog

  * 2008-04-12: kou: スタート。
