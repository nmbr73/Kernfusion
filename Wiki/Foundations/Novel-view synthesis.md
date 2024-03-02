---
aliases:
- novel view
- novel views
tags:
- 3D-Scan
- Research
- Glossary
---

View synthesis takes a pictures (or a number of pictures) of a subject and aims to create new views, or so to say novel views, of that subject. 3D reconstruction, the creation of three-dimensional models from a set of images, is a view synthesis that tries to reverse the process of obtaining 2D images from 3D scenes. The task of generating new images that render a subject from a different viewpoint than the one given is called a novel view synthesis.

Approaches to synthesize novel views are for example NeRF and Photogrammetry.

- [The Difference Between NeRF And Photogrammetry 3D Scan](https://youtu.be/m9JyKQTxTY4)

## Photogrammetry 3D Scan

 ...


## SDF

Single Distance Functions


## Neural Graphics Primitives (NGP)

NeRFs, SDFs, neural images, neural volumes ... are all NGPs

Paper: [Instant Neural Graphics Primitives with a Multiresolution Hash Encoding](https://arxiv.org/abs/2201.05989)
Project Page: https://nvlabs.github.io/instant-ngp/
GitHub: https://github.com/NVlabs/instant-ngp

Installation: [Instant-NGP Windows Installation Tutorial](https://youtu.be/kq9xlvz73Rg)

Neural Scene Flow Fields

...

## Radiance Fields

...

- Apple: [Learning to Generate Radiance Fields of Indoor Scenes](https://machinelearning.apple.com/research/learning-to-generate-radiance-fields)

### Plenoxels

Radiance Fields without Neural Networks

https://alexyu.net/plenoxels/


## Neural Radiance Fields (NeRFs)

Awesome List: [Awesome Neural Radiance Fields](https://github.com/awesome-NeRF/awesome-NeRF) - A curated list of awesome neural radiance fields papers
Die Studie: https://www.matthewtancik.com/nerf
gut erklärt: https://www.youtube.com/watch?v=CRlN-cYFxTk
weniger gut erklärt, aber trotzdem: https://youtu.be/WSfEfZ0ilw4
Die Geschichte, Varianten, etc. https://youtu.be/IDMiMKWucaI
Mal angucken: [Jon Barron - Understanding and Extending Neural Radiance Fields](https://youtu.be/HfJpQCBTqZs)

### novel SOTA in Ultra High Resolution NeRF

SOTA?

4K resolution interactive NeRF rendering support is now possible via work by Alibaba's research team:
https://github.com/frozoul/4K-NeRF

LinkedIn post about it:
https://www.linkedin.com/feed/update/urn:li:activity:7008109018070044674/

Clips in 4K:
https://github.com/frozoul/4K-NeRF/blob/main/4K_results/horns_compare.mp4

The research paper itself:
http://arxiv.org/pdf/2212.04701.pdf



### ADOP

Approximate Differentiable One-Pixel Point Rendering, a novel point-based, differentiable neural rendering pipeline.

Video: [ADOP: Approximate Differentiable One-Pixel Point Rendering](https://youtu.be/WJRyu1JUtVw)
Video: [AI Creates Smooth Videos from Images!](https://www.youtube.com/watch?v=Jfph7Vld_Nw)
Paper: https://arxiv.org/abs/2110.06635
GitHub: https://github.com/darglein/ADOP



### Instant NeRF

Instant NeRF by NVIDIA (see https://developer.nvidia.com/blog/getting-started-with-nvidia-instant-nerfs/, and https://www.nvidia.com/en-us/on-demand/session/siggraph2022-sigg22-s-16/)



### Direct Voxel Grid Optimization

Direct Voxel Grid Optimization (short: DVGO; aka DirectVoxGO).
Super-fast Convergence for Radiance Fields Reconstruction.

GitHub: https://github.com/sunset1995/DirectVoxGO
Page: https://sunset1995.github.io/dvgo/
Video: [Direct Voxel Grid Optimization: Super-fast Convergence for Radiance Fields Reconstruction](https://youtu.be/gLmujfjRVGw)



### Stereo Radiance Fields (SRF)

Stereo Radiance Fields (SRF) is neural view synthesis approach that is trained end-to-end, generalizes to new scenes in a single forward pass, and requires only sparse views at test time.

Video: [Stereo Radiance Fields (SRF): Learning View Synthesis for Sparse Views of Novel Scenes](https://youtu.be/3y5YzGUuIck)
Page: https://virtualhumans.mpi-inf.mpg.de/srf/
Code: https://github.com/jchibane/srf


### TurboNeRF

jperldev:
- https://youtu.be/TeWYAbhgaiU ... video explaining TurboNeRF for Blender
- https://github.com/JamesPerlman/TurboNeRF-Blender
- https://docs.google.com/document/d/1ilywYoQZ9SuD69yE5Pw-fOlJ-lDAAYigG_tIStacP-8/edit ... install guide by Andrew

### MegaNeRF

[Mega-NeRF](https://meganerf.cmusatyalab.org):  
Scalable Construction of Large-Scale NeRFs for Virtual Fly-Throughs

- https://github.com/cmusatyalab/mega-nerf
- https://github.com/cmusatyalab/mega-nerf-viewer

### PlenOctrees

Video: [PlenOctrees for Real-time Rendering of Neural Radiance Fields](https://www.youtube.com/watch?v=obrmH1T5mfI)
Video: [Real-time rendering of NeRFs with PlenOctrees - Angjoo Kanazawa](https://youtu.be/WzzCyCcqTjA)
Page: https://alexyu.net/plenoctrees/
Code: [sxyu/volrend](https://github.com/sxyu/volrend) PlenOctree Volume Rendering
Code: [sxyu/nerfvis](https://github.com/sxyu/nerfvis) ([readthedocs](https://nerfvis.readthedocs.io/en/latest/)()

Darauf basiert wohl der MegaNerf Viewer

#### Compile sxyu/volrend on M1 Macs

Build instructions are staight forward - only two minor changes needed to build on ARM:
```
export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/lib/; export ```
```

```
CPLUS_INCLUDE_PATH="/usr/local/Cellar/glfw/3.3.4/include"; make -j8
```

Texture size of the full resolution tree files does exceed some OpenGL limit on Apple silicon ... found some smaller resolution variants (for the web viewer iirc) that work - but I can't recall from where I had them.

![[NeRF plenoctree viewer on M1 mac.png]]



### NeRF++

Video: [Vladlen Koltun: Towards Photorealism (September 2020)](https://www.youtube.com/watch?v=Rd0nBO6--bM)

### pixelNeRF

Video: [pixelNeRF: Neural Radiance Fields from One or Few Images](https://www.youtube.com/watch?v=voebZx7f32g)

### DONeRF

Real-Time Rendering of Compact Neural Radiance Fields using Depth Oracle Networks

Video: https://www.youtube.com/watch?v=6UE1dMUjN_E
Paper: https://arxiv.org/abs/2103.03231
Page: https://depthoraclenerf.github.io

### nerfies

https://nerfies.github.io



