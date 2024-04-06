from ultralytics import YOLO

# Load a model
#model = YOLO("yolov8n.yaml")  # build a new model from scratch
model = YOLO("yolov8n.pt")  # load a pretrained model (recommended for training)

# Use the model
model.train(data=r"C:\Users\malik\Documents\VSC projects\GitHub\SafeVis\model\CarDetect.v1i.yolov8\data.yaml", epochs=3)  # train the model
metrics = model.val()  # evaluate model performance on the validation set

results = model.predict(r"C:\Users\malik\Documents\VSC projects\GitHub\SafeVis\model\106947859-GettyImages-167503543.jpg")  # predict on an image
path = model.export(format="onnx")  # export the model to ONNX format