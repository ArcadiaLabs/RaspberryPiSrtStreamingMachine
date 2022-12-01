# Install the right FFmpeg binary on the Raspberry Pi

In order to capture and re-send the stream, we are using FFmpeg. However, we could not just install FFmpeg using apt because it won't come with SRT support. So we have to use a special build.

### Download the right FFmpeg build
If you are using a Raspberry Pi 4 with Raspberry OS 64 bits (recommended !) :

    $ wget https://github.com/ArcadiaLabs/raspberry_srt_relay_to_twitch/raw/main/ffmpeg_static_releases/ffmpeg-release-arm64-static.tar.xz

If you are using a Raspberry Pi 4 with Raspberry OS 32 bits :

    $ wget https://github.com/ArcadiaLabs/raspberry_srt_relay_to_twitch/raw/main/ffmpeg_static_releases/ffmpeg-release-armhf-static.tar.xz

### Unpack the build
    $ tar xvf ffmpeg-release-<VERSION>-static.tar.xz` (replace <VERSION> with either arm64 or armhf)

Now you have a `ffmpeg-<VERSION>-static` directory :

    $ ls
    ffmpeg-5.1.1-arm64-static  ffmpeg-release-arm64-static.tar.xz
    $ ls ffmpeg-5.1.1-arm64-static
    ffmpeg  ffprobe  GPLv3.txt  manpages  model  qt-faststart  readme.txt

### Install the build
To globally install it you need to move the binary into your shell's path. "PATH" is a variable in your environment set to a list of colon seperated directories the shell uses to locate binaries. Here's my own system's path :

    $ echo $PATH
    /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

Before moving the ffmpeg binary into the shell's path, check to see if an older version of ffmpeg is already installed :

    $ whereis ffmpeg 
    ffmpeg: /usr/bin/ffmpeg

There's a FFmpeg binary already installed in /usr/bin, so I have to either uninstall it using `sudo apt remove ffmpeg` or delete it using `sudo rm -rf /usr/bin/ffmpeg`

Now the older FFmpeg binary has been removed, move the static binaries ffmpeg and ffprobe into the shell's path :

    $ sudo cp ffmpeg-5.1.1-arm64-static/ffmpeg ffmpeg-5.1.1-arm64-static/ffprobe /usr/bin/

Now the SRT enabled ffmpeg is globally installed !

