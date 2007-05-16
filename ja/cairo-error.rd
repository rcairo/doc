= class Cairo::Error

cairo特有の例外のためのスーパークラスです。Rubyが標準で提供し
ている例外に関連している例外はその例外クラスのサブクラスになっ
ていますが、そうでない例外はCairo::Errorのサブクラスになりま
す。Rubyが標準で提供している例外を使用している例外クラスは、
Cairo::InvalidMatrixErrorやCairo::ReadErrorなどです。
Cairo::InvalidMatrixErrorは入力が不正な場合の例外で
ArgumentErrorのサブクラスになっています。Cairo::ReadErrorは
入出力が失敗した場合の例外でIOErrorのサブクラスになっていま
す。

== Object Hierarchy

* Object
  * Exception
    * StandardError
      * Cairo::Error

== See Also

  * Index

== ChangeLog


