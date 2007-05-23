= class Cairo::PDFSurface

PDFを生成するサーフェスです。

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::PDFSurface

== Class Methods

--- Cairo::PDFSurface.new(stream, width_in_points, height_in_points)
--- Cairo::PDFSurface.new(filename, width_in_points, height_in_points)

     ポイントで指定されたサイズのPDF用サーフェスを生成します。

     第1引数に(({write}))メソッドを持ったオブジェクトを指定
     した場合はPDF形式のデータが順次(({stream.write}))で書き
     出されます。

     (({write}))メソッドを持っていない場合はファイル名として
     扱われます。PDF形式のデータはファイル名((|filename|))の
     ファイルに出力されます。

     * stream: (({write}))メソッドを持つオブジェクト。
     * filename: 結果を出力するファイル名。
     * width_in_points: ポイントで指定した幅。（1ポイント =
       1/72.0インチ）
     * height_in_points: ポイントで指定した高さ。（1ポイント =
       1/72.0インチ）

     * Returns: 生成したCairo::PDFSurfaceオブジェクト。

== Instance Methods

--- set_size(width_in_points, height_in_points)

     現在（とそれ以降の）ページのサイズを変更します。

     現在のページに何も描画していないときにだけ呼び出せます。
     単純な方法は、サーフェスを作成した直後か、
     Cairo::Context#show_pageかCairo::Context#copy_pageでペー
     ジを完了した直後に呼び出すことです。

     * width_in_points: ポイントで指定した新しい幅。（1ポイ
       ント = 1/72.0インチ）
     * height_in_points: ポイントで指定した新しい高さ。（1ポ
       イント = 1/72.0インチ）

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
