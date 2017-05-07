# ASDFPixelSort_Color

Pixel sorting and image processing algorithm inspired heavily by @kimasendorf, but goes a step further and implements random color mutations to the pixel sorting. This further distorts the image, leading to different effects per usage.

## Instructions
- Select the file name and the extension

``` processing
String imgFileName = "FullSizeRender";
String fileType = "jpg";
```

- Enter the correct dimensions

``` processing
img = loadImage(imgFileName+"."+fileType);
size(749,1087);
```

- Set the mode to 0,1 or 2

``` processing
int mode = 2;
```

- (Optional) Adjust the values following default values

``` processing
int blackValue = -13000000;
int brigthnessValue = 140;
int whiteValue = -10000000;
```
