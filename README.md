# SequentialImageLoaderSandbox

This is a demo project for this [article](https://medium.com/@petrachkovsergey/images-loader-and-memory-footprint-e8142ffebf0f).

You can find different approaches to load images. The core is ImagesLoader swift package. To run and play with it you can go and open LoaderSandbox/LoaderSandbox.xcodeproj. 

## No optimizations, old-school loading

<img src="/ExperimentResults/Noautoreleasepool.png" width="50%" height="50%"/>

## Autoreleasepool, old-school loading

<img src="/ExperimentResults/Autoreleasepool.png" width="50%" height="50%"/>

## Combine

<img src="/ExperimentResults/Combine.png" width="50%" height="50%"/>

## Async await

<img src="/ExperimentResults/AsyncAwait.png" width="50%" height="50%"/>
