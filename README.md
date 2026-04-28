# Soundtracks

Tracks by [**Shady Monk**](https://linktr.ee/shadymonk) (Shay.) and [**DeBisco**](https://www.debiscomusic.com/).

## Tracks

| Dir | Artist | Title | Length |
|---|---|---|---|
| ARENA0 | Shady Monk | Arena 0 (Stadium) | 4:01 |
| ARENA1 | DeBisco | Arena 1 (Danger Room) | 2:12 |
| ARENA2 | DeBisco | Arena 2 (Power Plant) | 2:08 |
| ARENA4 | Shady Monk | Desert | 3:45 |
| END | DeBisco | Ending | 2:53 |

## Building

Requirements: `ffmpeg` (with libopus), `flac`, `zip`, and `git-lfs` (the flac
sources are stored via LFS).

Cloning:

```
git lfs install     # one-time per user
git clone <repo>
```

Build everything:

```
make                # encode flac → ogg in each mod dir, then bundle mod zips
```

Targets:

- `make convert` — encode each `<DIR>/*.flac` → `<DIR>/audio/music/<DIR>.ogg`
  (with LOOPSTART/LOOPEND tags for ARENA0 and END)
- `make zip` — package each mod's `manifest.ini`, `LICENSE.txt`, and
  `audio/music/<DIR>.ogg` into `mod_files/<DIR>.zip`
- `make clean` — remove generated `audio/` dirs and the `mod_files/` directory

The zips in `mod_files/` are the distributable mods. Each contains
`manifest.ini` and `LICENSE.txt` at the root, plus the encoded ogg under
`audio/music/<DIR>.ogg`.

## Loop points

Some tracks have an intro followed by a loopable section. When playback reaches
the loop end, it should jump back to the loop start (not to 0:00).

### ARENA0 — Stadium (Shady Monk)

- File: `ARENA0/Shady Monk - Stadium Remix [m1].flac`
- Intro: 0:00 – 0:42
- Loop start: ~0:42
- Loop end: end of file

Artist note (Shady Monk): Intro runs from 0:00 to 0:42. From 0:42/0:43 (the
exact frame is tempo-dependent) until the end of the file is the loopable
portion — once playback reaches the end of the file it should loop back to the
0:42 mark.

### END — Ending (DeBisco)

- File: `END/DeBisco - Ending [OST Version] [24-Bit Master] V3.flac`
- Intro: 0:00 – 0:20
- Loop start: 0:20
- Loop end: 2:33 (file fades out at 2:34)

Artist note (DeBisco): The OST version fades out at 2:34. To loop indefinitely,
set loop points at 0:20 and 2:33 so the main section loops; 0:00–0:20 is used
as the intro. Only the OST version was submitted (no separate non-fading
master).

## Licenses

Each track's license is included in its directory as `LICENSE.txt`.
