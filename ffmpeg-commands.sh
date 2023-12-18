#Запись экрана:
ffmpeg -f x11grab -y -r 30 -s 1600x900 -i :0.0 -vcodec huffyuv out.avi

#Перевод в другой формат, с другими кодеками:
ffmpeg -i out.avi -c:v vp9 -b:v 100K Triangle.mp4

#Видеомонтаж
ffmpeg -i Tok2.mp4 -lavfi '[0:v]scale=ih*16/9:-1,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,crop=h=iw*9/16' -vb 800K TriangleTok2.mp4

#Обьединение файлов из списка:
ffmpeg -f concat -safe 0 -i list.txt -c copy OUTTriangle.mp4

#Прямая тренсляция файла
ffmpeg -i OUTTriangle.mp4 -f flv rtmp://a.rtmp.youtube.com/live2/5wkv-15m3-3zme-zb2u

#Прямая трансляция чужого потока:
ffmpeg -i $(youtube-dl -f best --get-url https://youtu.be/5qap5aO4i9A) -f flv rtmp://a.rtmp.youtube.com/live2/5wkv-15m3-3zme-zb2u