#/usr/bin/env bash
PROJECT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && cd .. && pwd )

DATA_DIR=$(realpath "$PROJECT_DIR/data")
SHOWS_FILE=$(realpath "$PROJECT_DIR/.shows")

# Determine if we are in CI or local
if [ $CI ]; then
  # CI: The SHOWS environment variable must be provided
  if [ $SHOWS ]; then
    # Try to write the SHOWS environment variable to the .shows file
    echo "$SHOWS" > $SHOWS_FILE
  else
    echo "CI detected but SHOWS is not set. Please configure the SHOWS repository variable!"
    exit 1
  fi
# Local: The .shows file must be provided
elif [ ! -f $SHOWS_FILE ]; then
  echo "Could not find .shows file or SHOWS environment variable!"
  exit 1
fi

# Determine the correct ffmpeg preset
FFMPEG_PRESET=h264-lossless
if ffmpeg -hide_banner -encoders 2>/dev/null | grep -i nvenc &> /dev/null; then
  FFMPEG_PRESET=h264-nvidia-lossless
fi

# Iterate the show urls
while IFS="" read -r SHOW || [ -n "$SHOW" ]; do
  # Download the show
  crunchy archive \
    --ffmpeg-preset $FFMPEG_PRESET \
    -a de-DE -a ja-JP \
    -s de-DE \
    -o "$DATA_DIR/{series_name}/Season {season_number}/{series_name} S{season_number}E{episode_number}.mkv" \
    $SHOW
done < $SHOWS_FILE
