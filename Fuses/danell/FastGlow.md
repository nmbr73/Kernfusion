# FastGlow

In my Glow fuse I'm using a way to quickly create a gaussian blur using 3 box blurs and doing 9 different sizes of blurs. In total this becomes 54 calls to the DCTL kernel (+ some more for other calculations).

When the kernel is done running the image moves from the GPU to CPU/RAM. In my tests this is the biggest bottle neck, making the fuse waaay slower than if everything would be done in one kernel (6fps vs 24fps)

> FastGlow runs at about 4 frames / sec for Danell; 2.1 secs/frame on nmbr73's 2019 MBP (Core i9, Radeon 560X, see [discord post](https://discord.com/channels/793508729785155594/793510462662639627/989241847098527784)); said to be slow on M1 too.

If any DCTL guru knows a way to leave the created image in the GPUs memory to be accessed again, this would be a game changer for fuses with many kernel calls. I tried to call `_tex2DVec4Write` 27 times in one kernel and the FPS only went down from 24fps to 22fps.

Going thought the Rays.fuse I'm seeing a couple of functions I haven't seen really anywhere else:
- Inside the DCTL I see `make_intensity(float4, compOrder)`. I also found it being used in LearnNowFX's fuse Long Shadow. Do you know what it does?
- Next I see in the processing: `node:SetGlobalSize(math.ceil(numRays / 128) * 128)` and `node:SetWorkSize(128)`. Does anyone know what these do?

Here you can find the source code :)
https://www.steakunderwater.com/wesuckless/viewtopic.php?t=5485
