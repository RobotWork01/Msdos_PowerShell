@echo off
rem *----------------------------------------------------------------------------*
rem * PowerShell_�S�u�����s.bat
rem *
rem *  �O������F
rem *    ���L�̃t�@�C���𓯂��ꏊ�Ɋi�[���邱�ƁB
rem *    1)MSDOS�o�b�`�v���O�����uPowerShell_�S�u�����s.bat�v
rem *    2)PowerShell�X�N���v�g �uPowerShell_�S�u��.ps1�v
rem *    3)�g���q�utxt�v�̃e�L�X�g�t�@�C���Q
rem *
rem *  �����F
rem *    �����P�@�u���O�̕���
rem *    �����Q�@�u����̕���
rem *
rem *  ���������F
rem *    �V�F���X�N���v�g�uPowerShell_�S�u��.ps1�v�����s����
rem *    �g���q�utxt�v�̃e�L�X�g�t�@�C����S�u������B
rem *
rem *  ���s���@:
rem *    �G�N�X�v���[����ŁuPowerShell_�S�u�����s.bat�v���_�u���N���b�N
rem *----------------------------------------------------------------------------*

rem �J�����g�p�X��ޔ�����
set PWD=%~dp0
cd %PWD%

rem �p���[�V�F���A�v���N���ƃV�F���X�N���v�g�uPowerShell_�S�u��.ps1�v���s
rem %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned .\PowerShell_�S�u��.ps1 "��" "�����s"
%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned .\PowerShell_�S�u��.ps1 "�����s" "��"
rem �p���[�V�F���X�N���v�g���s
rem PowerShell -ExecutionPolicy RemoteSigned .\PowerShell_�S�u��.ps1

pause
exit
