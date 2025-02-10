from fastapi import FastAPI, File, UploadFile, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from pathlib import Path
import shutil
import cv2
import torch
from ultralytics import YOLO
import numpy as np

# Initialize FastAPI app
app = FastAPI()

# Define paths for static files (images)
UPLOAD_FOLDER = Path("static/uploads")
PROCESSED_FOLDER = Path("static/processed")
UPLOAD_FOLDER.mkdir(parents=True, exist_ok=True)
PROCESSED_FOLDER.mkdir(parents=True, exist_ok=True)

# Load YOLOv8 model
model = YOLO("yolov8n.pt")

# Setup Jinja2 templates
templates = Jinja2Templates(directory="templates")

# Mount static files to serve images
app.mount("/static", StaticFiles(directory="static"), name="static")


@app.get("/", response_class=HTMLResponse)
def upload_form(request: Request):
    """Render the upload form."""
    return templates.TemplateResponse("index.html", {"request": request})


@app.post("/detect/")
async def detect_objects(request: Request, file: UploadFile = File(...)):
    """Handle file upload, run object detection, and return results."""
    
    # Save uploaded file
    img_path = UPLOAD_FOLDER / file.filename
    with img_path.open("wb") as buffer:
        shutil.copyfileobj(file.file, buffer)

    # Load image using OpenCV
    image = cv2.imread(str(img_path))

    # Run YOLOv8 inference
    results = model(str(img_path))

    # Extract detections
    detections = []
    for result in results:
        for box in result.boxes:
            label = model.names[int(box.cls)]
            confidence = float(box.conf[0])  # Confidence score
            detections.append({"label": label, "confidence": round(confidence, 2)})

    # Draw bounding boxes on the image
    processed_image = results[0].plot()
    
    # Save processed image
    processed_path = PROCESSED_FOLDER / file.filename
    cv2.imwrite(str(processed_path), processed_image)

    # Render results page
    return templates.TemplateResponse(
        "result.html",
        {
            "request": request,
            "original_image": f"/static/uploads/{file.filename}",
            "processed_image": f"/static/processed/{file.filename}",
            "detections": detections
        },
    )
