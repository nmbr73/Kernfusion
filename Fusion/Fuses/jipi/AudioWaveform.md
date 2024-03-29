
# Audio Waveform Fuse by JiPi

![Screen Shot 02-15-23 at 11 03 PM](https://user-images.githubusercontent.com/78935215/219181767-2f73ac6c-aa53-4a4f-85bf-c588596f9403.PNG)


The AudioWaveform.fuse is intended for visualizing audio data in Fusion. There are three functions:
1) Waveform of a wav file
2) Spectrum of a Wav file
3) Spectrum output via an additional output for shader fuses

For the first two functions there is still the possibility to generate one or three value(s) (elongation), which can be used via "Connect to" for parameters in other nodes.

By default, the fuse works in function 1 (waveform display)
To switch to 2, you have to switch to the Spectrum Page and select the Spectrum check mark there (this will lock some parameters on the Control page).
Function 3 is switched on via the "Shadertoy Audio" checkbox in the Control page, which automatically switches to the spectrum calculation. If you switch off the spectrum checkbox, the shadertoy audio is also switched off.

First, an audio file must be loaded in the Control page via Wave File. Wave files (RIFF WAVE) PCM 16-bit with 44100 Hz and 48000 Hz, mono and stereo are processed. These can easily be generated in Davinci Resolve.
After loading, either the waveform of the loaded file appears at the position of the current frame or an error message.
The following errors are detected and reported:
1) Special characters in the file name (or folder, e.g. ä,ö,ü)
2) File too large (larger than 50 Mb)
3) Unsupported format
4) Unsupported bit depth (e.g. 24 bit)

# Function1: waveform display

![Screen Shot 02-17-23 at 11 33 AM](https://user-images.githubusercontent.com/78935215/219621708-e31b1580-41ed-4af8-9e19-0ce482687968.PNG)

The parameters for this are in the Control page.

The play point is set in the middle of the picture.
There are three parameters for setting the waveform's timing:
Proxy, Zoom and Resolution

1) Proxy: This multiplies the sample pool without increasing the number of pixels shown
2) Zoom: This also multiplies the sample pool, but all values ​​are also displayed (as far as can be displayed)
3) Resolution: Acts as a divisor for the displayable pixels -> Resolution = 2 with HD -> 1920/2

The stereo signal (Both) is generated by maximum formation of the two channels.

There is a setting for the amplitude and 4 different ways to display the envelope. A crosshair can be displayed and the signal can be filtered before it is displayed. There are three filter ranges, low pass (20-300Hz) band pass (300-3kHz) and high pass 3-20kHz)

The waveform/spectrum and crosshair colors can be customized in the Layout page. A background image can also be displayed via the iChannel0 input.

# Function2: Spectrum
![Screen Shot 02-15-23 at 11 06 PM](https://user-images.githubusercontent.com/78935215/219183866-722d148f-2b8e-4132-8214-37b85a743716.PNG)

The number of values to be used can be set with the FFT setting, but it should be noted that large values also require high performance.
The smooth factor indicates by how much falling values are delayed in the display.
Scale is just a multiplier for the values. With LogK you can influence the calculation of the logarithm.
There are 5 different settings available for display
- Rough (raw display, the values are directly connected)
- Bars (value is kept at the value until the next)
- Smoth (A rounding takes place)
- Smooth filling (The area under the curve is filled)
- Needles (there is no connection of the values in the X-direction)

In the representation with equidistant sections, the values are converted evenly to the X-axis. Steps is taken as the power of two for the divider of the FFT values.
With Limitation you can limit the values, whereby the type of limitation can be influenced with Compression.
With the Decompress setting, the DC component can be lowered or raised.
With Slope, an increase can be achieved via a corner frequency.

When FrequencyVisualization is switched on, a shaderfuse is used for display. There are other parameters for this.

# Function3: AudioData for shader fuses

![Screen Shot 02-17-23 at 11 28 AM](https://user-images.githubusercontent.com/78935215/219622455-0d0e3523-ef52-4eab-8a60-95efea2b4ea7.PNG)

Setting the "Shadertoy Audio" checkbox switches to spectrum mode and packs the values into an image ( 512*2 pixels ). This image is available at output2 of the AudioWaveform.fuse and can then be used with shader fuses.

# Elongation (connect to function)

1) If function1: waveform representation

![Screen Shot 02-17-23 at 11 48 AM](https://user-images.githubusercontent.com/78935215/219624775-6580e53a-0413-47d1-a4e8-36174a08c9df.PNG)

The operator for calculating the elongation value can be selected between Max, Average or Median.
Amplify and offset are adjustable. The current value of the elongation is represented graphically by a red block and displayed as a value under the checkbox

2) If Function2: Spectrum representation

![Screen Shot 02-17-23 at 11 49 AM](https://user-images.githubusercontent.com/78935215/219625316-8c471780-deae-426f-a27b-4eb8909586d3.PNG)

The parameters mentioned above also exist for the spectrum display, but three different elongation values can be defined here (e.g. one for bass, one for medium frequencies and one for high tones)
Here, too, the ranges used are shown graphically and the values are displayed.


![Screen Shot 02-17-23 at 11 23 AM](https://user-images.githubusercontent.com/78935215/219625563-9ba20e3b-78fd-40a6-ab6e-efd0de62329d.PNG)

A so-called Schmidt trigger can be defined via the page elongation. An output value can be set using the switch-on and switch-off threshold. The current value is displayed. The min/max values displayed are calculated continuously, i.e. if a smaller or larger value is detected in a frame, the min/max is reset. Resetting is done by switching the hysteresis on/off.

## See also:

- [Fuses by JiPi](README.md)
- [Comps by JiPi](../../Comp/jipi/README.md)
