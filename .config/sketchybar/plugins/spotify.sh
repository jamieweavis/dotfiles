#!/bin/bash

# spotify.sh - Sketchybar plugin for displaying Spotify track info

# Check if Spotify is running
if ! pgrep -x "Spotify" > /dev/null; then
    sketchybar --set spotify label="" icon=""
    exit 0
fi

# Get Spotify track info using AppleScript
spotify_info=$(osascript -e '
tell application "Spotify"
    if player state is playing then
        set track_name to name of current track
        set artist_name to artist of current track
        return artist_name & " - " & track_name
    else
        return ""
    end if
end tell
' 2>/dev/null)

# Handle the case where Spotify is not playing or AppleScript fails
if [ -z "$spotify_info" ] || [ "$spotify_info" = " - " ]; then
    echo "Spotify is not playing or no track info available."
else
    # Truncate if too long (optional - adjust length as needed)
    if [ ${#spotify_info} -gt 50 ]; then
        spotify_info="${spotify_info:0:47}..."
    fi
    
    sketchybar --set spotify label="$spotify_info"
fi
