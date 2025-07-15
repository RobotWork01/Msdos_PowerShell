@echo off
:start
rem *-----------------------------------------------------------------------------------------------*
rem * サクラエディタのgrep検索をコマンドラインで実行 
rem *
rem * 参考URL：https://denor.jp/サクラエディタのgrep置換をコマンドラインで実行
rem * 使用環境：
rem * このMSDOSバッチファイルは対象ファイルと同じフォルダに置いて下さい
rem *"C:\Program Files (x86)\sakura\sakura.exe" -GREPMODE -GCODE=99 -GOPT=U -GKEY="山" -GREPR="海" -GFILE="*.txt" -GFOLDER="C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\"
rem *
rem * 実行方法：
rem * cd "C:\Users\midor\開発技術\MSDOS（エムエスドス）"
rem * ./サクラエディタGREP検索.bat
rem *-----------------------------------------------------------------------------------------------*
rem ■カレントパスを退避する
set PWD=%~dp0
echo カレントパス:%PWD%

rem ■サクラエディタ起動ＥＸＥ
rem set SKR="%ProgramFiles(x86)%\sakura\sakura.exe"
set SKR="C:\Program Files (x86)\sakura\sakura.exe"
echo サクラエディタ起動ＥＸＥ:%SKR%

:main
rem ■対象のファイルの拡張子指定
set TYP="*.txt"
rem set TYP="test2.txt"
echo 対象のファイルの拡張子:%TYP%

rem ■SRCに変更前の文字列をセットします
set SRC="太陽"

rem ■DSTに変更後の文字列をセットします
set DST="海"

rem コマンドラインからgrepを実行するには、-GREPMODE（Grep実行モード）オプションで起動します。
rem サクラエディタでgrep置換をコマンドラインから実行するには、
rem sakura.exe -GREPMODE <ファイル名> <検索文字列> <置換文字列> のように、
rem サクラエディタの実行ファイルに`-GREPMODE`オプションとファイル名、検索文字列、置換文字列を渡します.?
rem 詳細:
rem 1. コマンドラインでサクラエディタを起動:
rem    コマンドプロンプト（DOSコマンド）を開きます.
rem    サクラエディタの実行ファイル（sakura.exe）を呼び出します.
rem 2. -GREPMODEオプションを使用:
rem    sakura.exe -GREPMODE をコマンドの先頭に記述します.
rem 3. ファイル名、検索文字列、置換文字列を指定:
rem    sakura.exe -GREPMODE <ファイル名> <検索文字列> <置換文字列> のように、
rem    <ファイル名> に、置換対象のファイル名を指定します.
rem    <検索文字列> に、置換する文字列を指定します.
rem    <置換文字列> に、置換後の文字列を指定します.
rem 4. 例:
rem    sakura.exe -GREPMODE "C:\Users\User\Documents\test.txt" "old_text" "new_text" のように指定します.?
rem

rem*---------------------------------------------------------------------------------*
rem*参考URL：https://sakura-editor.github.io/help/HLP000109.html
rem*---------------------------------------------------------------------------------*
rem -GREPMODE と同時に指定します
rem -GREPMODE	Grep実行モードで起動
rem -GKEY=	Grepの検索文字列
rem "'で囲む。条件中の'"'は二つの連続した'"'にする
rem (例) -GKEY="printf("        「printf(」を検索
rem (例) -GKEY="printf( ""%s"    「printf( "%s」を検索
rem -GREPR=	Grepの置換文字列 (sakura:2.2.0.0以降)
rem これを指定すると置換になる
rem '"'で囲む。条件中の'"'は二つの連続した'"'にする
rem -GFILE=	Grepの検索対象のファイル
rem '"'で囲む。条件中の'"'は二つの連続した'"'にする
rem -GFOLDER=	Grepの検索対象のフォルダー
rem '"'で囲む。条件中の'"'は二つの連続した'"'にする
rem -GREPDLG	サクラエディタが起動すると同時にGrepダイアログを表示します。
rem -GCODE=	Grepでの文字コードを指定します。
rem -CODEと同じように数字で指定します。
rem -GOPT=	Grepの検索条件    例：-GOPT=SRK
rem [S][L][R][P][W][1|2|3][K][F][B][G][X][C][O][U][H]
rem 
rem -GOPTのオプション
rem S	サブフォルダーからも検索
rem L	大文字と小文字を区別
rem R	正規表現
rem P	該当行を出力／未指定時は該当部分だけ出力
rem W	単語単位で探す
rem 1|2|3	結果出力形式。1か2か3のどれかを指定します。
rem (1=ノーマル、2=ファイル毎、3=結果のみ)
rem K	-GCODE=99と同じ意味です。
rem 互換性のためだけに残されています。
rem F	ファイル毎最初のみ
rem B	ベースフォルダー表示
rem G	フォルダー毎に表示
rem X	Grep実行後カレントディレクトリを移動しない
rem C	(置換)クリップボードから貼り付け (sakura:2.2.0.0以降)
rem O	(置換)バックアップ作成 (sakura:2.2.0.0以降)
rem U	標準出力に出力し、Grep画面にデータを表示しない
rem コマンドラインからパイプやリダイレクトを指定することで結果を利用できます。(sakura:2.2.0.0以降)
rem H	ヘッダー・フッターを出力しない(sakura:2.2.0.0以降)
rem 

echo %DATE% %TIME% ***********************************************************************************
echo %DATE% %TIME% * 変更前の文字列 SRC=%SRC%
echo %DATE% %TIME% * 変更後の文字列 DST=%DST%
echo %DATE% %TIME% ***********************************************************************************
echo (sakura:2.2.0.0以降)
echo %DATE% %TIME% %SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY=%SRC% -GREPR=%DST% -GFILE=%TYP% -GFOLDER="%PWD%"
echo (sakura:2.2.0.0以前)
echo %DATE% %TIME% %SKR% -GREPMODE "%TYP%"  "%SRC%" "%DST%" -GFOLDER="%PWD%"
rem sakura.exe -GREPMODE <ファイル名> <検索文字列> <置換文字列> 
pause

echo ■置換は出来ないです（GREP検索のみ）
%SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY=%SRC% -GREPR=%DST% -GFILE=%TYP% -GFOLDER="%PWD%"
rem %SKR% -GREPMODE "test1.txt" "山" "海" 
rem %SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY="山" -GREPR="海" -GFILE="%TYP%" -GFOLDER="%PWD%"


rem □検索条件  "山"
rem 検索対象   "*.txt"
rem フォルダ   C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\
rem     (サブフォルダを検索しない)
rem     (英大文字小文字を区別しない)
rem     (文字コードセットの自動判別)
rem     (一致した箇所のみ出力)
rem C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\test1.txt(1,22)  [SJIS]: 山
rem C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\test1.txt(2,4)  [SJIS]: 山
rem C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\test2.txt(1,22)  [SJIS]: 山
rem C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\test2.txt(2,4)  [SJIS]: 山
rem C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\test3.txt(1,22)  [SJIS]: 山
rem C:\Users\midor\開発技術\MSDOS（エムエスドス）\out\test3.txt(2,4)  [SJIS]: 山
rem 6 個が検索されました。

rem --------------------------------------------------------------------------------------------------
rem 複数回置換したい場合set SRCから%SKR%までの3行をコピペで追記して下さい
rem 具体例
rem set SRC="○変更前の文字列○"
rem set DST="◎◎◎変更後の文字列●●●"
rem %SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY=%SRC% -GREPR=%DST% -GFILE=%TYP% -GFOLDER="%PWD%"
rem --------------------------------------------------------------------------------------------------
pause