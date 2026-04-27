OPUS_BITRATE := 256k

OGGS := ARENA0/ARENA0.ogg ARENA1/ARENA1.ogg ARENA2/ARENA2.ogg ARENA4/ARENA4.ogg END/END.ogg
ZIPS := mod_files/ARENA0.zip mod_files/ARENA1.zip mod_files/ARENA2.zip mod_files/ARENA4.zip mod_files/END.zip
# ZIPS += mod_files/ARENA3.zip

.PHONY: all convert zip clean

all: convert zip

convert: $(OGGS)

zip: $(ZIPS)

ARENA0/ARENA0.ogg: ARENA0/Shady\ Monk\ -\ Stadium\ Remix\ [m1].flac
	ffmpeg -y -i "$<" -c:a libopus -b:a $(OPUS_BITRATE) \
	    -metadata LOOPSTART=2040000 -metadata LOOPEND=11605334 "$@"

ARENA1/ARENA1.ogg: ARENA1/DeBisco\ -\ Arena\ 1\ (Danger\ Room)\ [24-Bit\ Master].flac
	ffmpeg -y -i "$<" -c:a libopus -b:a $(OPUS_BITRATE) "$@"

ARENA2/ARENA2.ogg: ARENA2/DeBisco\ -\ Arena\ 2\ (Power\ Plant)\ [24-Bit\ Master].flac
	ffmpeg -y -i "$<" -c:a libopus -b:a $(OPUS_BITRATE) "$@"

ARENA4/ARENA4.ogg: ARENA4/One\ Must\ Fall\ 2097\ -\ Shady\ Monk\ Desert\ Remix\ (mastered)\ [longer\ alt.\ loop].flac
	ffmpeg -y -i "$<" -c:a libopus -b:a $(OPUS_BITRATE) "$@"

END/END.ogg: END/DeBisco\ -\ Ending\ [OST\ Version]\ [24-Bit\ Master]\ V3.flac
	ffmpeg -y -i "$<" -c:a libopus -b:a $(OPUS_BITRATE) \
	    -metadata LOOPSTART=960000 -metadata LOOPEND=7344000 "$@"

# ARENA3/ARENA3.ogg: ARENA3/<TBD-shady-monk-fire-pit>.flac
# 	ffmpeg -y -i "$<" -c:a libopus -b:a $(OPUS_BITRATE) "$@"

mod_files/ARENA0.zip: ARENA0/ARENA0.ogg ARENA0/manifest.ini ARENA0/LICENSE.txt
	mkdir -p mod_files
	rm -f $@
	zip -j $@ $^

mod_files/ARENA1.zip: ARENA1/ARENA1.ogg ARENA1/manifest.ini ARENA1/LICENSE.txt
	mkdir -p mod_files
	rm -f $@
	zip -j $@ $^

mod_files/ARENA2.zip: ARENA2/ARENA2.ogg ARENA2/manifest.ini ARENA2/LICENSE.txt
	mkdir -p mod_files
	rm -f $@
	zip -j $@ $^

mod_files/ARENA4.zip: ARENA4/ARENA4.ogg ARENA4/manifest.ini ARENA4/LICENSE.txt
	mkdir -p mod_files
	rm -f $@
	zip -j $@ $^

mod_files/END.zip: END/END.ogg END/manifest.ini END/LICENSE.txt
	mkdir -p mod_files
	rm -f $@
	zip -j $@ $^

# mod_files/ARENA3.zip: ARENA3/ARENA3.ogg ARENA3/manifest.ini ARENA3/LICENSE.txt
# 	mkdir -p mod_files
# 	rm -f $@
# 	zip -j $@ $^

clean:
	rm -rf $(OGGS) mod_files
