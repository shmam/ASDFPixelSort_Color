int mode = 2;

//MODE:
//0 -> black
//1 -> bright
//2 -> white
//b(16777216)

PImage img;
String imgFileName = "FullSizeRender";
String fileType = "jpg";

int loops = 1;

int blackValue = -13000000;
int brigthnessValue = 140;
int whiteValue = -10000000;

int row = 0;
int column = 0;
boolean saved = false;

void setup() {
  img = loadImage(imgFileName+"."+fileType);
  size(749,1087);
  image(img, 0, 0);
}


void draw() {
  while(column < width-1) {
    img.loadPixels(); 
    sortColumn();
    column= column + 1;
    img.updatePixels();
  }
  
  while(row < height-1) {
    img.loadPixels(); 
    sortRow();
    row=row+1;
    img.updatePixels();
  }
  
  image(img,0,0);
  if(!saved && frameCount >= loops) {
    saveFrame(imgFileName+"_"+mode+".png");
    saved = true;
    println("DONE"+frameCount);
    System.exit(0);
  }
}


void sortRow() {
  int x = 0;
  int y = row;
  int xend = 0;
  
 
  while(xend < width-1) {
    switch(mode) {
      case 0:
        x = getFirstNotBlackX(x, y);
        xend = getNextBlackX(x, y);
        break;
      case 1:
        x = getFirstBrightX(x, y);
        xend = getNextDarkX(x, y);
        break;
      case 2:
        x = getFirstNotWhiteX(x, y);
        xend = getNextWhiteX(x, y);
        break;
      default:
        break;
    }
    
    if(x < 0) break;
    
    int sortLength = xend-x;
    
    color[] unsorted = new color[sortLength];
    color[] sorted = new color[sortLength];
    
    color randomColor = color(random(255), random(255), random(255), 255);
    float d = 0;
    
    if(random(100) < 5 ){ 
         d = random(1000);
    }
    
    
    for(int i=0; i<sortLength; i= i+1) {
      if (d > 0 ){
          
          float mixPercentage = .5 + random(50)/100;
          color pixelColor = img.pixels[x + i + y * img.width];
          img.pixels[x + i + y * img.width] = lerpColor(pixelColor, randomColor, mixPercentage);
          d--;
      }
      unsorted[i] = img.pixels[x + i + y * img.width];
    }
    
    sorted = sort(unsorted);
    for(int i=0; i<sortLength; i=i+1) {
      img.pixels[x + i + y * img.width] = sorted[i];      
    }
    
    x = xend+1;
  }
}


void sortColumn() {
  int x = column;
  int y = 0;
  int yend = 0;
  
  while(yend < height-1) {
    switch(mode) {
      case 0:
        y = getFirstNotBlackY(x, y);
        yend = getNextBlackY(x, y);
        break;
      case 1:
        y = getFirstBrightY(x, y);
        yend = getNextDarkY(x, y);
        break;
      case 2:
        y = getFirstNotWhiteY(x, y);
        yend = getNextWhiteY(x, y);
        break;
      default:
        break;
    }
    
    if(y < 0) break;
    
    int sortLength = yend-y;
    
    color[] unsorted = new color[sortLength];
    color[] sorted = new color[sortLength];
    
    color randomColor = color(random(255), random(255), random(255), 255);
    float d = 0;
    
    if(random(100) < 5 ){ 
         d = random(1000);
    }
    
    
    for(int i=0; i<sortLength; i++) {
      if (d > 0 ){
          
          float mixPercentage = .5 + random(50)/100;
          color pixelColor = img.pixels[x + i + y * img.width];
          img.pixels[x + i + y * img.width] = lerpColor(pixelColor, randomColor, mixPercentage);
          d--;
      }
      unsorted[i] = img.pixels[x + i + y * img.width];
    }
    
    sorted = sort(unsorted);
    
    for(int i=0; i<sortLength; i++) {
      img.pixels[x + (y+i) * img.width] = sorted[i];
    }
    
    y = yend+1;
  }
}


//BLACK
int getFirstNotBlackX(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) < blackValue) {
    x++;
    if(x >= width) return -1;
  }
  return x;
}

int getNextBlackX(int _x, int _y) {
  int x = _x+1;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) > blackValue) {
    x++;
    if(x >= width) return width-1;
  }
  return x-1;
}

//BRIGHTNESS
int getFirstBrightX(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  while(brightness(c = img.pixels[x + y * img.width]) < brigthnessValue) {
    x++;
    if(x >= width) return -1;
  }
  return x;
}

int getNextDarkX(int _x, int _y) {
  int x = _x+1;
  int y = _y;
  color c;
  while(brightness(c = img.pixels[x + y * img.width]) > brigthnessValue) {
    x++;
    if(x >= width) return width-1;
  }
  return x-1;
}

//WHITE
int getFirstNotWhiteX(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) > whiteValue) {
    x++;
    if(x >= width) return -1;
  }
  return x;
}

int getNextWhiteX(int _x, int _y) {
  int x = _x+1;
  int y = _y;
  color c;
  while((c = img.pixels[x + y * img.width]) < whiteValue) {
    x++;
    if(x >= width) return width-1;
  }
  return x-1;
}


//BLACK
int getFirstNotBlackY(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) < blackValue) {
      y++;
      if(y >= height) return -1;
    }
  }
  return y;
}

int getNextBlackY(int _x, int _y) {
  int x = _x;
  int y = _y+1;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) > blackValue) {
      y++;
      if(y >= height) return height-1;
    }
  }
  return y-1;
}

//BRIGHTNESS
int getFirstBrightY(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  if(y < height) {
    while(brightness(c = img.pixels[x + y * img.width]) < brigthnessValue) {
      y++;
      if(y >= height) return -1;
    }
  }
  return y;
}

int getNextDarkY(int _x, int _y) {
  int x = _x;
  int y = _y+1;
  color c;
  if(y < height) {
    while(brightness(c = img.pixels[x + y * img.width]) > brigthnessValue) {
      y++;
      if(y >= height) return height-1;
    }
  }
  return y-1;
}

//WHITE
int getFirstNotWhiteY(int _x, int _y) {
  int x = _x;
  int y = _y;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) > whiteValue) {
      y++;
      if(y >= height) return -1;
    }
  }
  return y;
}

int getNextWhiteY(int _x, int _y) {
  int x = _x;
  int y = _y+1;
  color c;
  if(y < height) {
    while((c = img.pixels[x + y * img.width]) < whiteValue) {
      y++;
      if(y >= height) return height-1;
    }
  }
  return y-1;
}