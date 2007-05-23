= class Cairo::Path

パスを持つオブジェクトです。Cairo::Context#copy_pathあるいは
Cairo::Context#copy_path_flatで取得できます。また、
Cairo::Context#append_pathの入力値としても使えます。

== Object Hierarchy

* Object
  * Cairo::Path

== Included Modules

  * Enumerable

== Class Methods

--- Cairo::Path.new

     新しくパスを生成します。

     * Returns: Cairo::Pathオブジェクト。

== Instance Methods

--- [](index)

     ((|index|))番目のパスデータを返します。((|index|))番目
     のパスデータがない場合は(({nil}))を返します。

     * Returns: Cairo::PathDataオブジェクトまたは(({nil}))。

--- arc(center_x, center_y, radius, angle1, angle2)

     Cairo::Context#arcを見てください。

--- arc_negative(center_x, center_y, radius, angle1, angle2)

     Cairo::Context#arc_negativeを見てください。

--- circle(center_x, center_y, radius)

     Cairo::Context#circleを見てください。

--- close

     Cairo::Context#close_pathを見てください。

--- curve_to(x1, y1, x2, y2, x3, y3)

     Cairo::Context#curve_toを見てください。

--- each {|data| ...}

    各パスデータ毎にブロックを呼び出します。

--- empty?

     ひとつもパスデータがない場合は真を返します。

     * Returns: パスデータがない場合は(({true}))、そうでない
       場合は(({false}))。

--- line_to(x, y)

     Cairo::Context#line_toを見てください。

--- move_to(x, y)

     Cairo::Context#move_toを見てください。

--- new_path

     Cairo::Context#new_pathを見てください。

--- new_sub_path

     Cairo::Context#new_sub_pathを見てください。

--- rectangle(x, y, width, height)

     Cairo::Context#rectangleを見てください。

--- rel_curve_to(dx1, dy1, dx2, dy2, dx3, dy3)

     Cairo::Context#rel_curve_toを見てください。

--- rel_line_to(dx, dy)

     Cairo::Context#rel_line_toを見てください。

--- rel_move_to(dx, dy)

     Cairo::Context#rel_move_toを見てください。

--- rounded_rectangle(x, y, width, height, x_radius, y_radius=nil)

     Cairo::Context#rounded_rectangleを見てください。

--- size
--- length

     持っているパスデータの数を返します。

     * Returns: パスデータの数。

== Constants

--- CLOSE_PATH

     Cairo::PathDataType::CLOSE_PATHを見てください。

--- CURVE_TO

     Cairo::PathDataType::CURVE_TOを見てください。

--- LINE_TO

     Cairo::PathDataType::LINE_TOを見てください。

--- MOVE_TO

     Cairo::PathDataType::MOVE_TOを見てください。

== See Also

  * Index

== ChangeLog

  * 2007-05-22: kou: スタート。
