= class Cairo::ImageSurface

ラスタ画像を生成するためのサーフェスです。PNG形式で出力したり、
PNG形式の画像を読み込むこともできます。

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::ImageSurface

== Class Methods

--- Cairo::ImageSurface.from_png(stream)
--- Cairo::ImageSurface.from_png(filename)

     PNG形式のデータから新しいCairo::ImageSurfaceオブジェク
     トを生成します。

     引数がreadメソッドを持っている場合はそのオブジェクトの
     readメソッドを使ってPNG形式のデータを取得します。そうで
     ない場合は引数をファイル名として扱い、そのファイルから
     PNG形式のデータを取得します。

     * stream: PNG形式のデータを読み出すオブジェクト。
     * filename: PNG形式のデータが保存されているファイル名。

     * Returns: PNG形式のデータから生成した
       Cairo::ImageSurfaceオブジェクト。

--- Cairo::ImageSurface.new(width, height)
--- Cairo::ImageSurface.new(format, width, height)

     指定された形式と大きさのCairo::ImageSurfaceオブジェクト
     を作ります。全ての色とアルファチャンネルは0になります。
     （ただし、指定された((|format|))に関係のないビットに関し
     ては未定義です。）

     * width: サーフェスの幅。（ピクセル）
     * height: サーフェスの高さ。（ピクセル）
     * format: サーフェスのピクセルの形式。（Cairo::Format）
     * Returns: 新しく生成したCairo::ImageSurfaceオブジェク
       ト。

--- Cairo::ImageSurface.new(data, format, width, height, stride)

     指定された((|data|))でCairo::ImageSurfaceオブジェクトを
     作ります。各ピクセルはそのピクセルデータで初期化されま
     す。

     * data: 画像データ。
     * width: ((|data|))に含まれている画像の幅。（ピクセル）
     * height: ((|data|))に含まれている画像のの高さ。（ピクセル）
     * format: ((|data|))に含まれているのピクセルの形式。（Cairo::Format）
     * stride: ((|data|))に含まれる画像の各行が何バイト離れ
       ているか。((|width|))と別に指定できるため、行の後に詰
       物をいれたり、大きな画像の一部を書き込んだりできます。
     * Returns: 新しく生成したCairo::ImageSurfaceオブジェク
       ト。

== Instance Methods

--- data

     画像データを返します。

     * Returns: 画像データ。

--- format

     ピクセルのフォーマットを返します。

     * Returns: Cairo::Formatに定義されている定数のどれか。

--- height

     ピクセルで高さを返します。

     * Returns: 高さ。（ピクセル）

--- stride

     ある行の初めから次の行の始めまでの距離をバイト数で返し
     ます。

     * Returns: 1行の長さ。（バイト）

--- width

     ピクセルで幅を返します。

     * Returns: 幅。（ピクセル）

== See Also

  * Index

== ChangeLog

  * 2007-05-20: kou: スタート。
