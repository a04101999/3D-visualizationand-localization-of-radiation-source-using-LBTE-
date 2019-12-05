# 3D-visualization-and-localization-of-radiation-source-using-inverse-Boltzmann-transport-equation

## Description of folders:

Dataset - consits of dataset (x,y,z coordinates and dose values)

KNN approach - code for KNN approach and results of KNN approach (1D, 2D and 3D)

PPT - PPT that includes detailed explanation of codes, formula description and applications.

Line as source - Analytical code for line and result

Source as n points - N points visulization and analytical approach codes and their results


## Summary of the project (for more details please refer PPT):

Occupational workers carry wearable sensors for radiation dose data logging, datasets are generated due to movement of workers. A computer code running on GPU/CPU is required which can solve reverse Boltzman Transport Equations (BTE) in offline mode using collected datasets (X,Y,Z,Dose) for given area &amp; do 3D visualization of radiation source in that area. Radiation protection program can take corrective measures for removal of unwanted sources.
We have designed a gpu/cpu code to find out the missing source using given area dose.
we have used three approaches
### 1. K- Nearest Neighbour (KNN) 
### 2. Analytical 
### 3. Visulization 

## KNN approach:
We have wriiten CPU and GPU  code for KNN approach for given dataset in matlab using MATLAB parallel computing toolbox.
KNN folder consits of code and results of 1D,2D and 3D visulization (in both fig and png format)
In this approach we are visulizing the given data set according to their intensity of dose that it received at a point (xi,yi,zi)
K nearest points from the source location will receive the highest dose than other points. The points which are too far from the source location will recive less intensity of dose. Therefore, the source will be located nearer to the points which are having high intensity of dose.
In results of KNN it has been showed that the points nearer to source are darker in color than points far away from source. In this way we can find the location and geomentry of any given source. This code requires less computation power.


## Analytical approach:
We have written code using  Analytical approach in MATLAB for given dataset.
### Assumption 1:
We are considering that source is made up of n points and trying to find these n points location.
In our dataset we have considered m (  m > 3*n ) target points (points that recive dose from sources) and calculated 3*n  equations from these points to source (made up of n points) which have '3*n' unknow variables. By solving these 3*n equations we can get the values for these '3*n' unknows variables which gives the co-ordinates of these 'n' points.This method requires high computation power so we have used AGANAYA cluster ( processing power of 270 TFLOPS and 6440 cores + 20 9984 core GPU ). We have used MATLAB GPU computing toolbox to parallalise our code.

### Assumption 2:
Here we are considering the source is line souce, which can be considered as contionous infinite point sources. Here we have used the line integral to calculate the dose at a single target point (forward calculation) in reverse calculation we have solved four equations and calculated the values of limit of the line integral (position of the line source maybe x-limit, y-limit and z-limit) and value of other coordinates.

## Visulization approach:
From the formula of linear Boltzmann transport equation it was clear that the source and target points are separeted by distance D (radius). So, if we have drawn spheres from each n target points with radius 'r' (r is the distance between source and target points) all these spheres will intersect at a common region where the source is located at. This heuristic works well when the source is point sources. the resuts are uploded in source as n points folder (both in fig and png format).
