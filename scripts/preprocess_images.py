import PIL
from PIL import Image as Image
import numpy as np
import glob
import os
from tqdm import tqdm

def convert_png_to_binary_gif(image_path):
        pimg = Image.open(image_path)
        numpy_image = np.array(pimg)
        binary_image = np.where(numpy_image > 0, 1, 0)
        pimg = Image.fromarray(binary_image.astype('uint8')*255, 'L')
        pimg.save(f"{image_path.removesuffix('.png')}.gif")

def preprocess_masks(image_directory):
    
    # get images from directory using glob
    image_paths = glob.glob(image_directory)
    
        
    for image_path in tqdm(image_paths):
        convert_png_to_binary_gif(image_path)

mask_directory = "data/masks/"
img_directory = "data/images/"
test_mask_directory = "data/test_masks/"
test_img_directory = "data/test_images/"

# print(glob.glob(img_directory + "*.png"))

preprocess_masks("data/test_masks/*.png")
preprocess_masks("data/masks/*.png")

for image in glob.glob("data/images/*.png"):
    os.rename(image, image.replace("_img", ""))
    
for image in glob.glob("data/test_images/*.png"):
    os.rename(image, image.replace("_img", ""))

# preprocess_masks("data/test_masks/*.png")

#preprocess_masks(mask_directory)
#preprocess_masks(test_mask_directory)



