ffmpeg -i in.mp4 -vf drawbox=c=black:t=fill:enable='between(t,60,90)+between(t,300,345)' -c:a copy out.mp4