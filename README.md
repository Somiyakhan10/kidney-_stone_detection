<div align="center">
    <h1>🩻 Kidney Stone Detection Using Image Processing</h1>
    <h3>Automated Detection and Localization of Kidney Stones from Medical Images</h3>
</div>

## 📖 About

A **MATLAB-based system** to automatically detect and localize kidney stones from medical images (CT scans/DICOM). The system uses image processing techniques including thresholding, morphological operations, and connected component labeling to identify stones and extract their dimensions.

For surgical procedures, it is critical to determine the exact and precise location of a kidney stone. This challenge can be overcome by applying suitable image processing techniques. The system pre-processes the image, identifies stones, and extracts relevant information about their dimensions.

##  Pipeline Overview
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   Input Image   │────▶│  Pre-processing │────▶│   Thresholding  │
│  (DICOM/CT)     │     │ (Grayscale,     │     │  (Binary Image) │
└─────────────────┘     │  Histogram)     │     └────────┬────────┘
                        └─────────────────┘              │
                                                         ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│    Stone Info   │◀────│  Morphological  │◀────│   Noise Removal │
│ (Bounding Box,  │     │   Operations    │     │  (Bwareaopen)   │
│  Dimensions)    │     │    (Imfill)     │     └─────────────────┘
└─────────────────┘     └─────────────────┘

##  Tech Stack

| Category | Technologies |
|----------|--------------|
| **Programming Language** | MATLAB |
| **Image Processing** | Image Processing Toolbox |
| **Medical Images** | DICOM format support |
| **Morphological Operations** | Imfill, Bwareaopen, Bwlabel |
| **Feature Extraction** | Regionprops, Bounding Box |

## 📊 Methodology

### Step 1: Image Pre-processing

| Step | Description |
|------|-------------|
| **Read Image** | Load DICOM/CT image using `imread()` |
| **Grayscale Conversion** | Convert RGB to grayscale using `rgb2gray()` |
| **Histogram Analysis** | Display pixel intensity distribution using `histogram()` |

### Step 2: Binary Image Refinement

| Step | Description |
|------|-------------|
| **Thresholding** | Create binary image using `graythresh()` and `imbinarize()` |
| **Hole Filling** | Fill regions and holes using `imfill()` |
| **Noise Reduction** | Remove small objects using `bwareaopen()` |

### Step 3: Stone Detection

| Step | Description |
|------|-------------|
| **Element-wise Multiplication** | Retain only stone regions by multiplying binary mask with original image |
| **Intensity Adjustment** | Enhance contrast using `imadjust()` |
| **Median Filtering** | Reduce noise using `medfilt2()` |
| **ROI Selection** | Define polygonal region of interest using `roipoly()` |
| **Isolate Stones** | Multiply binary image with ROI mask |
| **Remove Artifacts** | Eliminate small objects using `bwareaopen()` |
| **Label Components** | Label connected components using `bwlabel()` |

### Step 4: Stone Information Extraction

| Step | Description |
|------|-------------|
| **Detection Message** | Display "Stone is Detected" if stones found |
| **Bounding Box Extraction** | Extract stone dimensions using `regionprops()` |

## 📈 Results

### Sample Input and Output

*(Insert your original kidney scan image here)*

*Figure 1: Original DICOM/CT scan of kidney*

*(Insert your detection result image here)*

*Figure 2: Detected kidney stones highlighted with bounding boxes*

### Output Information

| Information Extracted | Description |
|-----------------------|-------------|
| **Detection Status** | "Stone is Detected" or "No Stone Found" |
| **Bounding Box** | [x, y, width, height] coordinates of each stone |
| **Stone Dimensions** | Size measurements for surgical planning |


