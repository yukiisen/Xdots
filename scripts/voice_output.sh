#!/bin/sh

# Start PipeWire stuff (only if not already running)
pgrep pipewire >/dev/null || pipewire &
pgrep pipewire-pulse >/dev/null || pipewire-pulse &
pgrep wireplumber >/dev/null || wireplumber &

sleep 1 # wait for it to spawn

# Create a virtual sink
pactl unload-module module-null-sink 2>/dev/null
pactl load-module module-null-sink sink_name=VirtualSink

pactl set-default-sink VirtualSink # Make it the default

# Move all active sink inputs to VirtualSink
for INPUT in $(pactl list sink-inputs short | awk '{print $1}'); do
    pactl move-sink-input "$INPUT" VirtualSink
done

# Set the mic source to VirtualSink.monitor
pactl set-default-source VirtualSink.monitor

echo "🐱 Audio streaming to SoundWire is set up!"

soundwire-server &

sleep 2

xdotool search --name "SoundWire Server" windowunmap
