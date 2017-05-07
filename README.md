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
## Sample Images

All of these images were made using default values. 

Original:
![BLONDE no mutations](https://github.com/shmam/ASDFPixelSort_Color/blob/master/BLONDE.jpg?raw=true)

Mode 0:
![BLONDE some mutations](https://github.com/shmam/ASDFPixelSort_Color/blob/master/BLONDE_0.png?raw=true)
Mode 1:
![BLONDE some mutations ](https://github.com/shmam/ASDFPixelSort_Color/blob/master/BLONDE_1.png?raw=true)

Mode 2:
![BLONDE some mutations](https://github.com/shmam/ASDFPixelSort_Color/blob/master/BLONDE_2.png?raw=true)
