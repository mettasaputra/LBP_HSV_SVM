# THE USE OF LBP AND HSV AS FEATURES TO DISTINGUISH FRESH AND ROTTEN FRUITS
Informatics Study of Program |
Thesis of Bachelor Computers |
Odd Semester of Year 2021/2022 |
Multi Data Palembang University

> Metta Saputra, Yohannes, M. Rizky Pribadi

Note: Public dataset from Kaggle, here dataset's [link](https://www.kaggle.com/sriramr/fruits-fresh-and-rotten-for-classification)

**Abstract**

Fruits are one of the intakes usually consumed by people of varied ages since they are a rich source of minerals, vitamins, and dietary fibers. People must consume fruits in fresh conditions to take advantage of them. The freshness of fruit can be easily seen since the physical appearance of either fresh or rotten fruits can tell. LBP (Local Binary Pattern) is a simple texture feature extraction method, and it is efficient to present texture characteristics, while HSV (Hue, Value, and Saturation) is a color space that is appropriate to identify basic colors used in the present study as the light identification color, and it can tolerate the changing of light intensity. This study employed a public dataset of fresh fruits and rotten fruits which consisted of six classes (fresh apple, fresh banana, fresh orange, rotten apple, rotten banana, and rotten orange). It had 13.599 pictures in total, which were divided into 10.901 trained data and 2.698 tested data. They were then resized into 300x300-pixel sizes. Furthermore, the LBP feature extraction with Neighbor=8 was done and continued by the HSV feature extraction. The results of the LBP and HSV Feature vector were combined and resulted in 1 x 68 feature vector as the classification input using the SVM method with Gaussian kernel, where the gamma value of 0.01 to 0.09 was used. The testing result by using the SVM method with Gaussian kernel showed that the highest accuracy value was 95.66% with the gamma value of 0.08.
