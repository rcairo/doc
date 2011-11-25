= class Cairo::PSSurface

PostScriptを生成するサーフェスです。

== Object Hierarchy

* Object
  * ((<Cairo::Surface>))
    * Cairo::PSSurface

== Class Methods

--- Cairo::PSSurface.new(stream, width_in_points, height_in_points)
--- Cairo::PSSurface.new(filename, width_in_points, height_in_points)

     ポイントで指定されたサイズのPostScript用サーフェスを生成
     します。

     第1引数に(({write}))メソッドを持ったオブジェクトを指定
     した場合はPostScript形式のデータが順次
     (({stream.write}))で書き出されます。

     (({write}))メソッドを持っていない場合はファイル名として
     扱われます。PostScript形式のデータはファイル名
     ((|filename|))のファイルに出力されます。

     各ページのサイズは変更できます。
     Cairo::PSSurface#set_sizeを見てください。

     * stream: (({write}))メソッドを持つオブジェクト。
     * filename: 結果を出力するファイル名。
     * width_in_points: ポイントで指定した幅。（1ポイント =
       1/72.0インチ）
     * height_in_points: ポイントで指定した高さ。（1ポイント =
       1/72.0インチ）

     * Returns: 生成したCairo::PSSurfaceオブジェクト。

== Instance Methods

--- dsc_begin_page_setup

     以降のCairo::PSSurface#dsc_comment呼び出しが直接
     PageSetupセクションのコメントになることを示します。

     このメソッドは最初のページにだけ必要です。
     ただし、全てのCairo::PSSurface#dsc_begin_setupの後で、ま
     だなにも描画されていない場合だけ呼び出してください。

     詳細はCairo::PSSurface#dsc_commentを見てください。

--- dsc_begin_setup

     以降のCairo::PSSurface#dsc_comment呼び出しが直接
     Setupセクションのコメントになることを示します。

     このメソッドは多くても一度だけ呼び出せます。また、全て
     のCairo::PSSurface#dsc_begin_page_setup呼び出しよりも前
     で、さらにまだなにも描画されていない場合でなければいけ
     ません。

     詳細はCairo::PSSurface#dsc_commentを見てください。

--- dsc_comment(comment)

     PostScriptの出力にコメントを発行します。

     コメントはPostScript Language Document Structuring
     Conventions (DSC)を従う必要があります。利用可能なコメン
     トとその意味はマニュアルを見てください。特に、
     %%IncludeFeatureコメントはプリンタの機能を制御する装
     置に依存しない方法です。PostScript Printer Description
     (PPD)ファイルの仕様書も役に立つリファレンスです。

     コメントはパーセント(%)で始まり、最大長が（パーセントを
     含めて）255を越えないようにしなくてはいけません。どちら
     かの条件が破られたらCairo::InvalidDscCommentErrorが発生
     します。このメソッドはこのふたつの条件以外の詳細なコメ
     ントの仕様については強制しません。

     コメントには改行をつけないでください。

     DSCは異なったセクションに詳細なコメントを入れることがで
     きると述べています。このメソッドは3つのセクションに発行
     できます。ヘッダとSetupセクションとPageSetupセクション
     です。最初の2つのセクションに現れたコメントは文書全体に
     適用されます。BeginPageSetupセクションに現れたコメント
     はひとつのページにだけ適用されます。

     ヘッダセクションにコメントを入れるには、サーフェスが作
     られてCairo::PSSurface#begin_setupを呼ぶ前にこのメソッ
     ドを使わなければいけません。

     Setupセクションにコメントを入れるには、
     Cairo::PSSurface#begin_setupを呼んだあとで、
     Cairo::PSSurface#begin_page_setupを呼ぶ前にこのメソッ
     ドを使わなければいけません。

     PageSetupセクションにコメントを入れるには、
     Cairo::PSSurface#begin_page_setupを呼んだあとでこのメソッ
     ドを使わなければいけません。

     Cairo::PSSurface#begin_page_setupが必要なのは最初のペー
     ジだけだということに注意してください。
     Cairo::Context#show_pageとCairo::Context#copy_pageの後
     に呼び出すということは、明示的なコメントを現在のページ
     のPageSetupに入れるということです。しかし、呼び出しコー
     ドをシンプルにする一貫性のために、各ページの始めにこの
     メソッドを呼び出しても害はありません。

     最後の注意です。cairoは自動的にいくつかのコメントを生成
     します。アプリケーションは手動で以下のコメントを生成し
     ないでください。

     ヘッダセクション: %!PS-Adobe-3.0, %%Creator, %%CreationDate, %%Pages,
     %%BoundingBox, %%DocumentData, %%LanguageLevel, %%EndComments.

     Setupセクション: %%BeginSetup, %%EndSetup

     PageSetupセクション: %%BeginPageSetup, %%PageBoundingBox,
     %%EndPageSetup.

     他のセクション: %%BeginProlog, %%EndProlog, %%Page, %%Trailer, %%EOF

     以下はこのメソッドをどのように使うかを示す例です。

       surface = Cairo::PSSurface.new(filename, width, height)
       ...
       surface.dsc_comment("%%Title: My excellent document")
       surface.dsc_comment("%%Copyright: Copyright (C) 2006 Cairo Lover")
       ...
       surface.dsc_begin_setup
       surface.dsc_comment("%%IncludeFeature: *MediaColor White")
       ...
       surface.dsc_begin_page_setup
       surface.dsc_comment("%%IncludeFeature: *PageSize A3")
       surface.dsc_comment("%%IncludeFeature: *InputSlot LargeCapacity")
       surface.dsc_comment("%%IncludeFeature: *MediaType Glossy")
       surface.dsc_comment("%%IncludeFeature: *MediaColor Blue")
       ... ここで最初のページを描く ..
       cr.show_page
       ...
       surface.dsc_comment("%%IncludeFeature: *PageSize A5")
       ...


     * comment: PostScriptの出力に発行するコメント文字列。

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

--- eps?

     ((*Since 1.6*)): このPostScriptサーフェスがEncapsulated
     PostScriptを出力するかどうかを返します。

     * Returns: EPSフォーマットのPostScriptを出力する場合はtrue

--- eps=(eps)

     ((*Since 1.6*)): ((|eps|))がtrueならこのPostScriptサーフェ
     スはEncapsulated PostScriptを出力します。

     このメソッドは現在のページで実行するすべての描画操作よ
     りも前に呼び出してください。これを行うもっとも簡単な方
     法はサーフェスを作った直後にこのメソッドを呼び出すこと
     です。Encapsulated PostScriptファイルは1ページしか含む
     ことができません。

     * Returns: ((|eps|))

--- set_eps(eps)

     ((*Since 1.6*)): Cairo::PSSurface#eps=と同じです。

     * Returns: self

--- restrict_to_level(level)

     ((*Since 1.6*)): 生成するPostScriptファイルのレベルを制
     限します。ここで使用できるレベルの一覧は
     Cairo::PSLevel#listで得られます。

     このメソッドはこのサーフェスへ実行するすべての描画操作
     よりも前にだけ呼び出してください。これを実行するもっと
     も簡単な方法はサーフェスを作った直後にこのメソッドを呼
     び出すことです。

     * level: PostScriptのレベル（Cairo::PSLevel）

== See Also

  * Index
  * Cairo::PSLevel

== ChangeLog

  * 2008-04-11: kou: 1.6対応。
  * 2007-05-22: kou: スタート。
