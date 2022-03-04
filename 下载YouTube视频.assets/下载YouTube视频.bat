@echo off

:start

::下面一句是手动输入保存路径，此处将其注释，保存路径写死为D:\user\Downloads\YouTube
::set /p dir=请输入保存路径：
set dir=D:\user\Downloads\YouTube

::将dir中的/修改为\
set dir=%dir:/=\%

pushd %dir%

::判断路径是否合法
if /i not %dir%==%cd% goto :start

echo 保存路径：%cd%

:download

set /p input=请输入视频链接：
set input=%input:&=^^^&%

::查询下载列表，--proxy后面跟代理服务器地址，一般都是127.0.0.1跟上代理端口
yt-dlp -F %input% --proxy socks5://127.0.0.1:10808

if errorlevel 1 goto :download

::下面一句是手动输入视频格式编号，此处将其注释，默认选择最好的视频编号
::set /p code=请输入视频格式编号：
::根据视频格式编号下载
::yt-dlp -f %code% %input% --proxy socks5://127.0.0.1:10808

::Download the best mp4 video available, or the best video if no mp4 available
::下载最清晰的MP4格式视频+音频，如果没有MP4格式则下载其他格式的最清晰视频
::yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b" %input% --proxy socks5://127.0.0.1:10808
::下载视频，优先级为分辨率>可扩展性，在分辨率不同时下载分辨率最高的视频，分辨率相同时下载扩展性最强的视频(mp4>webm>flv>other)
yt-dlp -S quality,ext %input% --proxy socks5://127.0.0.1:10808

goto :download