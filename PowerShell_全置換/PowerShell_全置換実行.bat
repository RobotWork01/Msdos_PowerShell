@echo off
rem *----------------------------------------------------------------------------*
rem * PowerShell_全置換実行.bat
rem *
rem *  前提条件：
rem *    下記のファイルを同じ場所に格納すること。
rem *    1)MSDOSバッチプログラム「PowerShell_全置換実行.bat」
rem *    2)PowerShellスクリプト 「PowerShell_全置換.ps1」
rem *    3)拡張子「txt」のテキストファイル群
rem *
rem *  引数：
rem *    引数１　置換前の文字
rem *    引数２　置換後の文字
rem *
rem *  処理説明：
rem *    シェルスクリプト「PowerShell_全置換.ps1」を実行して
rem *    拡張子「txt」のテキストファイルを全置換する。
rem *
rem *  実行方法:
rem *    エクスプローラ上で「PowerShell_全置換実行.bat」をダブルクリック
rem *----------------------------------------------------------------------------*

rem カレントパスを退避する
set PWD=%~dp0
cd %PWD%

rem パワーシェルアプリ起動とシェルスクリプト「PowerShell_全置換.ps1」実行
rem %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned .\PowerShell_全置換.ps1 "★" "東京都"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned .\PowerShell_全置換.ps1 "東京都" "◎"
rem パワーシェルスクリプト実行
rem PowerShell -ExecutionPolicy RemoteSigned .\PowerShell_全置換.ps1

pause
exit
