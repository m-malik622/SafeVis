from ultralytics import YOLO
from PIL import Image

model = YOLO(r"C:\Users\malik\Desktop\attempt2\threethousand.pt")
results = model(source=r"C:\Users\malik\Desktop\attempt2\farcar1.jpg", conf=0.15, iou=0.5, show=True)
model.export(format="coreml")
# Get the detected objects and their bounding boxes
#detected_objects = results.xyxy[0]

# Load the original image
#original_image = Image.open(r"C:\Users\malik\Desktop\attempt2\testimg1.jpg")

# Draw bounding boxes on the original image
#for obj in detected_objects:
 #   box = obj[:4]  # Extract bounding box coordinates
  #  original_image = original_image.copy()  # Make a copy of the original image to draw on
   # original_image.rectangle(box, outline="red", width=2)  # Draw bounding box

# Display the image with bounding boxes
#original_image.show()

# Save the image with bounding boxes
#original_image.save("detected_image.jpg")