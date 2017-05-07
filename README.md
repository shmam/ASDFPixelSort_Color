# ASDFPixelSort_Color

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
