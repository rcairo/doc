= class Cairo::PathData

Cairo::Pathの中にあるパスデータを表します。実際に使うのはサ
ブクラスのCairo::PathMoveTo, Cairo::PathLineTo,
Cairo::PathCurveTo, Cairo::PathClosePathでしょう。

パスはCairo::PathDataの配列として表現されます。

== Object Hierarchy

* Object
  * Cairo::PathData

== Included Modules

  * Enumerable

== Class Methods

--- Cairo::PathData.new(type, points)

     Cairo::PathDataオブジェクトを作成します。通常はサブクラ
     スのオブジェクトを作成します。

     * type: :move_toや:line_toなどCairo::PathDataTypeに定義
       されている定数名と同じもの。大文字小文字は関
       係ありません。また、シンボルではなくて文字列で
       "move_to"のように指定することもできます。もちろん、
       Cairo::PathDataTypeに定義されている定数を指定するこ
       ともできます。
     * points: Ciaro::Pointの配列。
     * Returns: 新しく作成したCairo::PathDataオブジェクト。

== Instance Methods

--- close_path?

     パスを閉じる操作なら真を返します。

     * Returns: パスを閉じる操作なら(({true}))、それ以外は(({false}))。

--- curve_to?

     曲線を描く操作なら真を返します。

     * Returns: 曲線を描く操作なら(({true}))、それ以外は(({false}))。

--- each {|point| ...}

     各点毎にブロックを呼び出します。

--- line_to?

     直線を描く操作なら真を返します。

     * Returns: 直線を描く操作なら(({true}))、それ以外は(({false}))。

--- move_to?

     移動する操作なら真を返します。

     * Returns: 移動する操作なら(({true}))、それ以外は(({false}))。

--- points

     操作に必要な点を返します。

     * Returns: Cairo::Pointの配列。

--- to_a
--- to_ary

    配列化します。

     * Returns: (({[type, points]}))
       * type: 操作の種類。
       * points: Cairo::Pointの配列。

--- type

     操作の種類を返します。

     * Returns: Cairo::PathDataTypeに定義されている定数のど
       れか。あるいはそれの文字列表現。

== See Also

  * Index
  * Cairo::PathMoveTo
  * Cairo::PathLineTo
  * Cairo::PathCurveTo
  * Cairo::PathClosePath

== ChangeLog

  * 2007-05-22: kou: スタート。
