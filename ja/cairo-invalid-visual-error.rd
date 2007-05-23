= class Cairo::InvalidVisualError

不正なVisual *（X Window SystemのAPIの型）を入力したときに発
生します。

今のところ、rcairoはX Window System用のサーフェスをサポート
していないので、rcairoでは発生しないはずです。

== Object Hierarchy

* Object
  * Exception
    * StandardError
      * ArgumentError
        * Cairo::InvalidVisualError

== See Also

  * Index

== ChangeLog

  * 2007-05-21: kou: スタート。
