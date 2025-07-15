#echo off
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#
#
# PowerShell_全置換.ps1 （処理説明）複数ファイルの内容を検索して全置換（サクラエディタGREP置換代替）
#
# 実行方法1：
#  1) Windows PowerShellプロンプトを起動する
#  2) エクスプローラで、PowerShell_全置換.ps1を選択して右クリックし、編集を選択すると
#     パワーシェル上のでプロンプト編集モードが起動する。
#  3) PowerShell -ExecutionPolicy RemoteSigned .\PowerShell_全置換.ps1　と入力する
#
#  ※注）エクスプローラでPowerShell_全置換.ps1をダブルクリックしても起動出来ません。
#  参考URL：
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::#

# 置換前の文字列
#$oldString = "置換前の文字列"
#$oldString = "星"
$oldString = $args[0]

# 置換後の文字列
#$newString = "置換後の文字列"
#$newString = "太陽"
$newString = $args[1]

$msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "シェルスクリプト「PowerShell_全置換.ps1 」start...>=========="
echo $msgString
echo "================<引数>================"
$argsString1 ="置換前の文字列:"+$oldString
$argsString2 ="置換後の文字列:"+$newString
echo $argsString1
echo $argsString2


#--------------------------------------------------------------------------------------------------------------------#
#                                    置換するファイルの一覧
#--------------------------------------------------------------------------------------------------------------------#
#Get-ChildItem コマンドレットに -Recurse パラメータを指定しない限り、$files にはサブフォルダは含まれません。
#つまり、foreach ループ内で Get-ChildItem の戻り値をループする際に、サブフォルダは処理されないように設計されています。
#$files = Get-ChildItem -Path "." -Filter *.txt -Recurse
$files = Get-ChildItem -Path "." -Filter *.txt


IF ($files.count -eq 0) {
    echo "対象ファイルがありません!!"
    #goto last    ---->PowerShell には GOTO コマンドがありません。 
    $msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "シェルスクリプト「PowerShell_全置換.ps1 」end!!>=========="
    echo $msgString
    # パワーシェルアプリ終了
    Stop-Process -Name "powershell"
    exit
}
#=======================================================#
#             置換前の確認
#=======================================================#
$msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "■置換前の確認>=========="
echo $msgString
#type *.txt     #シフトJIS
Get-ChildItem *.txt | ForEach-Object {
    #---------------------------------------------------------#
    #補足：
    #typeコマンドだけだとファイル内容のみが表示されます。
    #ファイル名と内容の両方を表示するには、
    #Get-ChildItemコマンドレットと
    #typeコマンドをパイプで繋げる必要があります。
    #---------------------------------------------------------#
    Write-Host $_.Name # ファイル名を表示
    type $_.FullName # ファイル内容を表示
}

#cat -n  *.txt #UTF-8

#----------------------------------------------------------------------------#
#                    各ファイルを処理(検索・置換)
#----------------------------------------------------------------------------#
$msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "各ファイルを処理(検索・置換) start...>=========="
echo $msgString

foreach ($file in $files) {
    try {
        # ファイルのコンテンツを読み込む
        $content = Get-Content $file.FullName

        #対象ファイル名
        echo $file.FullName

        # 各行を処理し、置換する
        $newContent = $content | ForEach-Object { $_ -replace $oldString, $newString }

        # ファイルに書き戻す
        $newContent | Out-File $file.FullName
    }
    catch {
        Write-Host "各ファイルを処理(検索・置換)　An Error Occured" -ForegroundColor RED
        Write-Host "Error message is 「" $_.Exception.Message "」" -ForegroundColor RED
        echo "置換に失敗しました。"
        $msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "シェルスクリプト「PowerShell_全置換.ps1 」end!!>=========="
        echo $msgString
        # パワーシェルアプリ終了
        Stop-Process -Name "powershell"
        exit
    }
    finally {
        #------------------------------------------------------------------------------------------------------#
        #PowerShellのfinallyブロックは、スクリプトの終了時、または現在のスコープから出るときに必ず実行されます。
        #エラーが発生した場合でも、tryやcatchブロックの実行に関わらず、必ず実行されます。﻿
        #PowerShellのTry-Catch-Finally構造において、catchブロックで終了を指示した場合、finallyブロックは必ず実行されます。
        #exitコマンドや他の終了方法（例: コントロール+C）を使用した場合でも同様です。
        #finallyブロックは、スクリプトが正常に終了する場合、またはエラーが発生した場合、catchブロックで例外が処理された後、
        #最終的に実行されるブロックです。
        #------------------------------------------------------------------------------------------------------#
        $Error.Clear()
    }
}

# 処理完了
$msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "各ファイルを処理(検索・置換) end!!>=========="
echo $msgString
echo "置換に成功しました。"


#=======================================================#
#             置換後の確認
#=======================================================#
$msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "■置換後の確認>=========="
echo $msgString
#type *.txt     #シフトJIS
Get-ChildItem *.txt | ForEach-Object {
#---------------------------------------------------------#
#補足：
#typeコマンドだけだとファイル内容のみが表示されます。
#ファイル名と内容の両方を表示するには、
#Get-ChildItemコマンドレットと
#typeコマンドをパイプで繋げる必要があります。
#---------------------------------------------------------#
Write-Host $_.Name # ファイル名を表示
type $_.FullName # ファイル内容を表示
}

#cat -n  *.txt #UTF-8

# 終了メッセージ
#$ws.popup("処理が終わりました！！")
$msgString = "================<"+(Get-Date).ToString('yyyy-MM-dd hh:mm:ss') + "シェルスクリプト「PowerShell_全置換.ps1 」end!!>=========="
echo $msgString
echo "処理が終わりました！！"


# パワーシェルアプリ終了
Stop-Process -Name "powershell"
exit


/*
   ＜　実行結果の例　＞
PS C:\Users\midor\開発技術\MSDOS（エムエスドス）> PowerShell -ExecutionPolicy RemoteSigned .\PowerShell_全置換.ps1
■置換前の確認
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCDERROR@@@
###ERROR$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
abcdefg 
C:\Users\midor\開発技術\MSDOS（エムエスドス）\input.txt
C:\Users\midor\開発技術\MSDOS（エムエスドス）\logfile1.txt
C:\Users\midor\開発技術\MSDOS（エムエスドス）\logfile2.txt
C:\Users\midor\開発技術\MSDOS（エムエスドス）\output.txt
C:\Users\midor\開発技術\MSDOS（エムエスドス）\test1.txt
C:\Users\midor\開発技術\MSDOS（エムエスドス）\test2.txt
C:\Users\midor\開発技術\MSDOS（エムエスドス）\tmp.txt
置換処理が完了しました。
■置換後の確認
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCDERROR@@@
###ERROR$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
12345あああ999\\\ABCD星@@@
###星$$$$$$$$$$$$$$$$$$$$$
abcdefg 

PS C:\Users\midor\開発技術\MSDOS（エムエスドス）> 

*/