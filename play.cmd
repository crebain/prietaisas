#ffplay -i stream.sdp -protocol_whitelist "file,udp,rtp" -probesize 32 -sync ext
ffplay tcp://prietaisas.lan:1935 -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop

