@echo off
:start
rem *-----------------------------------------------------------------------------------------------*
rem * �T�N���G�f�B�^��grep�������R�}���h���C���Ŏ��s 
rem *
rem * �Q�lURL�Fhttps://denor.jp/�T�N���G�f�B�^��grep�u�����R�}���h���C���Ŏ��s
rem * �g�p���F
rem * ����MSDOS�o�b�`�t�@�C���͑Ώۃt�@�C���Ɠ����t�H���_�ɒu���ĉ�����
rem *"C:\Program Files (x86)\sakura\sakura.exe" -GREPMODE -GCODE=99 -GOPT=U -GKEY="�R" -GREPR="�C" -GFILE="*.txt" -GFOLDER="C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\"
rem *
rem * ���s���@�F
rem * cd "C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j"
rem * ./�T�N���G�f�B�^GREP����.bat
rem *-----------------------------------------------------------------------------------------------*
rem ���J�����g�p�X��ޔ�����
set PWD=%~dp0
echo �J�����g�p�X:%PWD%

rem ���T�N���G�f�B�^�N���d�w�d
rem set SKR="%ProgramFiles(x86)%\sakura\sakura.exe"
set SKR="C:\Program Files (x86)\sakura\sakura.exe"
echo �T�N���G�f�B�^�N���d�w�d:%SKR%

:main
rem ���Ώۂ̃t�@�C���̊g���q�w��
set TYP="*.txt"
rem set TYP="test2.txt"
echo �Ώۂ̃t�@�C���̊g���q:%TYP%

rem ��SRC�ɕύX�O�̕�������Z�b�g���܂�
set SRC="���z"

rem ��DST�ɕύX��̕�������Z�b�g���܂�
set DST="�C"

rem �R�}���h���C������grep�����s����ɂ́A-GREPMODE�iGrep���s���[�h�j�I�v�V�����ŋN�����܂��B
rem �T�N���G�f�B�^��grep�u�����R�}���h���C��������s����ɂ́A
rem sakura.exe -GREPMODE <�t�@�C����> <����������> <�u��������> �̂悤�ɁA
rem �T�N���G�f�B�^�̎��s�t�@�C����`-GREPMODE`�I�v�V�����ƃt�@�C�����A����������A�u���������n���܂�.?
rem �ڍ�:
rem 1. �R�}���h���C���ŃT�N���G�f�B�^���N��:
rem    �R�}���h�v�����v�g�iDOS�R�}���h�j���J���܂�.
rem    �T�N���G�f�B�^�̎��s�t�@�C���isakura.exe�j���Ăяo���܂�.
rem 2. -GREPMODE�I�v�V�������g�p:
rem    sakura.exe -GREPMODE ���R�}���h�̐擪�ɋL�q���܂�.
rem 3. �t�@�C�����A����������A�u����������w��:
rem    sakura.exe -GREPMODE <�t�@�C����> <����������> <�u��������> �̂悤�ɁA
rem    <�t�@�C����> �ɁA�u���Ώۂ̃t�@�C�������w�肵�܂�.
rem    <����������> �ɁA�u�����镶������w�肵�܂�.
rem    <�u��������> �ɁA�u����̕�������w�肵�܂�.
rem 4. ��:
rem    sakura.exe -GREPMODE "C:\Users\User\Documents\test.txt" "old_text" "new_text" �̂悤�Ɏw�肵�܂�.?
rem

rem*---------------------------------------------------------------------------------*
rem*�Q�lURL�Fhttps://sakura-editor.github.io/help/HLP000109.html
rem*---------------------------------------------------------------------------------*
rem -GREPMODE �Ɠ����Ɏw�肵�܂�
rem -GREPMODE	Grep���s���[�h�ŋN��
rem -GKEY=	Grep�̌���������
rem "'�ň͂ށB��������'"'�͓�̘A������'"'�ɂ���
rem (��) -GKEY="printf("        �uprintf(�v������
rem (��) -GKEY="printf( ""%s"    �uprintf( "%s�v������
rem -GREPR=	Grep�̒u�������� (sakura:2.2.0.0�ȍ~)
rem ������w�肷��ƒu���ɂȂ�
rem '"'�ň͂ށB��������'"'�͓�̘A������'"'�ɂ���
rem -GFILE=	Grep�̌����Ώۂ̃t�@�C��
rem '"'�ň͂ށB��������'"'�͓�̘A������'"'�ɂ���
rem -GFOLDER=	Grep�̌����Ώۂ̃t�H���_�[
rem '"'�ň͂ށB��������'"'�͓�̘A������'"'�ɂ���
rem -GREPDLG	�T�N���G�f�B�^���N������Ɠ�����Grep�_�C�A���O��\�����܂��B
rem -GCODE=	Grep�ł̕����R�[�h���w�肵�܂��B
rem -CODE�Ɠ����悤�ɐ����Ŏw�肵�܂��B
rem -GOPT=	Grep�̌�������    ��F-GOPT=SRK
rem [S][L][R][P][W][1|2|3][K][F][B][G][X][C][O][U][H]
rem 
rem -GOPT�̃I�v�V����
rem S	�T�u�t�H���_�[���������
rem L	�啶���Ə����������
rem R	���K�\��
rem P	�Y���s���o�́^���w�莞�͊Y�����������o��
rem W	�P��P�ʂŒT��
rem 1|2|3	���ʏo�͌`���B1��2��3�̂ǂꂩ���w�肵�܂��B
rem (1=�m�[�}���A2=�t�@�C�����A3=���ʂ̂�)
rem K	-GCODE=99�Ɠ����Ӗ��ł��B
rem �݊����̂��߂����Ɏc����Ă��܂��B
rem F	�t�@�C�����ŏ��̂�
rem B	�x�[�X�t�H���_�[�\��
rem G	�t�H���_�[���ɕ\��
rem X	Grep���s��J�����g�f�B���N�g�����ړ����Ȃ�
rem C	(�u��)�N���b�v�{�[�h����\��t�� (sakura:2.2.0.0�ȍ~)
rem O	(�u��)�o�b�N�A�b�v�쐬 (sakura:2.2.0.0�ȍ~)
rem U	�W���o�͂ɏo�͂��AGrep��ʂɃf�[�^��\�����Ȃ�
rem �R�}���h���C������p�C�v�⃊�_�C���N�g���w�肷�邱�ƂŌ��ʂ𗘗p�ł��܂��B(sakura:2.2.0.0�ȍ~)
rem H	�w�b�_�[�E�t�b�^�[���o�͂��Ȃ�(sakura:2.2.0.0�ȍ~)
rem 

echo %DATE% %TIME% ***********************************************************************************
echo %DATE% %TIME% * �ύX�O�̕����� SRC=%SRC%
echo %DATE% %TIME% * �ύX��̕����� DST=%DST%
echo %DATE% %TIME% ***********************************************************************************
echo (sakura:2.2.0.0�ȍ~)
echo %DATE% %TIME% %SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY=%SRC% -GREPR=%DST% -GFILE=%TYP% -GFOLDER="%PWD%"
echo (sakura:2.2.0.0�ȑO)
echo %DATE% %TIME% %SKR% -GREPMODE "%TYP%"  "%SRC%" "%DST%" -GFOLDER="%PWD%"
rem sakura.exe -GREPMODE <�t�@�C����> <����������> <�u��������> 
pause

echo ���u���͏o���Ȃ��ł��iGREP�����̂݁j
%SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY=%SRC% -GREPR=%DST% -GFILE=%TYP% -GFOLDER="%PWD%"
rem %SKR% -GREPMODE "test1.txt" "�R" "�C" 
rem %SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY="�R" -GREPR="�C" -GFILE="%TYP%" -GFOLDER="%PWD%"


rem ����������  "�R"
rem �����Ώ�   "*.txt"
rem �t�H���_   C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\
rem     (�T�u�t�H���_���������Ȃ�)
rem     (�p�啶������������ʂ��Ȃ�)
rem     (�����R�[�h�Z�b�g�̎�������)
rem     (��v�����ӏ��̂ݏo��)
rem C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\test1.txt(1,22)  [SJIS]: �R
rem C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\test1.txt(2,4)  [SJIS]: �R
rem C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\test2.txt(1,22)  [SJIS]: �R
rem C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\test2.txt(2,4)  [SJIS]: �R
rem C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\test3.txt(1,22)  [SJIS]: �R
rem C:\Users\midor\�J���Z�p\MSDOS�i�G���G�X�h�X�j\out\test3.txt(2,4)  [SJIS]: �R
rem 6 ����������܂����B

rem --------------------------------------------------------------------------------------------------
rem ������u���������ꍇset SRC����%SKR%�܂ł�3�s���R�s�y�ŒǋL���ĉ�����
rem ��̗�
rem set SRC="���ύX�O�̕�����"
rem set DST="�������ύX��̕����񁜁���"
rem %SKR% -GREPMODE -GCODE=99 -GOPT=U -GKEY=%SRC% -GREPR=%DST% -GFILE=%TYP% -GFOLDER="%PWD%"
rem --------------------------------------------------------------------------------------------------
pause