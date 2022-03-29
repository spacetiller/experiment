 #include <stdio.h>
 #include <iostream>
 #include "opencv2/imgproc/imgproc.hpp"
 #include "opencv2/highgui/highgui.hpp"
 #include "opencv2/flann/miniflann.hpp"

 using namespace cv; // all the new API is put into "cv" namespace. Export its content
 using namespace std;
 using namespace cv::flann;

static void help()
{
    cout <<
    "\nThis program shows how to use cv::Mat and IplImages converting back and forth.\n"
    "It shows reading of images, converting to planes and merging back, color conversion\n"
    "and also iterating through pixels.\n"
    "Call:\n"
    "./image [image-name Default: lena.jpg]\n" << endl;
}

int main(int argc, char *argv[])
{
    help();
    const char* imagename = argc > 1 ? argv[1] : "lena.jpg";
    Mat img = imread(imagename); // the newer cvLoadImage alternative, MATLAB-style function
    if(img.empty())
    {
        fprintf(stderr, "Can not load image %s\n", imagename);
        return -1;
    }
    if( !img.data ) // check if the image has been loaded properly
        return -1;

    Mat img_yuv;
    cvtColor(img, img_yuv, CV_BGR2YCrCb); // convert image to YUV color space. The output image will be created automatically

    vector<Mat> planes; // Vector is template vector class, similar to STL's vector. It can store matrices too.
    split(img_yuv, planes); // split the image into separate color planes

    imshow("image with grain", img);

    waitKey();

    return 0;

}
