@echo off

:start

::����һ�����ֶ����뱣��·�����˴�����ע�ͣ�����·��д��ΪD:\user\Downloads\YouTube
::set /p dir=�����뱣��·����
set dir=D:\user\Downloads\YouTube

::��dir�е�/�޸�Ϊ\
set dir=%dir:/=\%

pushd %dir%

::�ж�·���Ƿ�Ϸ�
if /i not %dir%==%cd% goto :start

echo ����·����%cd%

:download

set /p input=��������Ƶ���ӣ�
set input=%input:&=^^^&%

::��ѯ�����б�--proxy����������������ַ��һ�㶼��127.0.0.1���ϴ���˿�
yt-dlp -F %input% --proxy socks5://127.0.0.1:10808

if errorlevel 1 goto :download

::����һ�����ֶ�������Ƶ��ʽ��ţ��˴�����ע�ͣ�Ĭ��ѡ����õ���Ƶ���
::set /p code=��������Ƶ��ʽ��ţ�
::������Ƶ��ʽ�������
::yt-dlp -f %code% %input% --proxy socks5://127.0.0.1:10808

::Download the best mp4 video available, or the best video if no mp4 available
::������������MP4��ʽ��Ƶ+��Ƶ�����û��MP4��ʽ������������ʽ����������Ƶ
::yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" %input% --proxy socks5://127.0.0.1:10808
::������Ƶ�����ȼ�Ϊ�ֱ���>����չ�ԣ��ڷֱ��ʲ�ͬʱ���طֱ�����ߵ���Ƶ���ֱ�����ͬʱ������չ����ǿ����Ƶ(mp4>webm>flv>other)
yt-dlp -S quality,ext %input% --proxy socks5://127.0.0.1:10808

goto :download