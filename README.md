# sample-icecast-noaa
A sample docker setup for streaming NOAA radio from a USB RTL-SDR dongle to Icecast, so you can listen to it as an m3u stream.

## Setup

It should be straightforward to get this going, assuming you have Docker and compose setup:

1. Clone this repo
2. In your local copy, update the following:
    - `ezstream.xml` (specifically the `hostname` and `password` fields). More examples can be found [in the `ezstream` repo](https://github.com/xiph/ezstream/tree/develop/examples).
    - `icecast.xml` (specifically the `authentication`, `location`, `admin`, `hostname`, and `listen-socket` sections). More details [in the Icecast docs](https://icecast.org/docs/icecast-latest/config-file.html).
    - Edit [line 14](https://github.com/zacs/sample-icecast-noaa/blob/main/start_noaa.sh#L14) in `start_noaa.sh` so that it is tuned to your local station's frequency (it's set to 162.550mhz by default)
3. Move to the repo's directory and `docker-compose up -d`.
4. Point your browser to your Docker host's IP at port 8000 and login using the Icecast admin credentials. You should see something like this, click the m3u link in the upper right and enjoy. 

![image](https://user-images.githubusercontent.com/27705/130721608-12659586-d384-4ee0-8b71-bdc971952174.png)


## Notes

- Find your area's frequency: https://www.weather.gov/nwr/station_listing
- The `-d 0` in [line 14](https://github.com/zacs/sample-icecast-noaa/blob/main/start_noaa.sh#L14) indicates the first RTL-SDR dongle. If you want to add another docker image to stream another station, you'll need to change it to `-d 1` (etc) in the new image. 
- If you hear a bunch of static, you may have an antenna that is not tuned for the FM bands, or your placement may be bad. Experiement a bit. 
