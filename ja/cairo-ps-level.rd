= module Cairo::PSLevel

((*Since 1.6*)): 生成するPostScriptファイルが従うPostScript
言語リファレンスの言語レベルを表現します。

== Module Functions

--- Cairo::PSLevel.list

     対応しているレベルの配列を返します。
     Cairo::PSSurface#restrict_to_levelを見てください。

     * Returns: 対応しているレベルの配列

--- Cairo::PSLevel.names

     Cairo::PSLevel.listが返すレベルのそれぞれを文字列表現に
     した配列を返します。

     * Returns: 対応しているレベルの文字列表現の配列

== Constants

--- LEVEL_2
--- LEVEL_3

== See Also

  * Index
  * Cairo::PSSurface

== ChangeLog

  * 2008-04-11: kou: スタート。

