# Object-Detection-API

# 🚀 Object Detection API

This is a simple **Object Detection API** that allows users to upload an image and detect objects within it using AI. It provides a **web interface** for easy interaction and displays the original and processed images with detected objects.

---

## 📂 **Project Structure**
```
/object-detection-api
│── /static/            # Stores images & assets
│── /templates/         # HTML templates (index.html, result.html)
│── app.py             # Main API logic
│── requirements.txt    # Dependencies
│── README.md           # Documentation
```

---

## 📥 **Installation & Setup**
### 1️⃣ **Clone the Repository**
```bash
git clone https://github.com/yourusername/object-detection-api.git
cd object-detection-api
```

### 2️⃣ **Create a Virtual Environment (Optional but Recommended)**
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3️⃣ **Install Dependencies**
```bash
pip install -r requirements.txt
```

### 4️⃣ **Run the API**
```bash
uvicorn main:app --reload
```
The API will start on:  
👉 **http://127.0.0.1:8000**

---

## 📌 **Usage**
### **🔹 Web Interface**
1. Open **http://127.0.0.1:8000** in a browser.
2. Upload an image and click "**Detect Objects**".
3. View the results with detected objects and confidence scores.

### **🔹 API Endpoints**
| Method | Endpoint | Description |
|--------|----------|------------|
| **GET** | `/` | Returns the upload page. |
| **POST** | `/detect/` | Uploads an image & performs object detection. |

#### **Example API Request**
```bash
curl -X POST -F "file=@example.jpg" http://127.0.0.1:8000/detect/
```

---

## 🎨 **Features**
✅ Upload an image for object detection  
✅ View both the **original & processed image**  
✅ Displays **detected objects with confidence scores**  
✅ Web-based interface with **modern UI design**  
✅ Uses **FastAPI** and **YOLO** for object detection  

---
Here is an example of the result

![image](https://github.com/user-attachments/assets/5dbb344e-e6a6-46d3-9326-474b8f5ca6de)
---
## 🛠 **Troubleshooting**
**1️⃣ Uvicorn not found?**  
   → Run: `pip install uvicorn`  

**2️⃣ Image not displaying?**  
   → Check if `/static/uploads/` has the uploaded file.  

**3️⃣ FastAPI not installed?**  
   → Run: `pip install fastapi`  

---

## 📜 **License**
This project is licensed under the **MIT License**.

---
💡 **Contributions are welcome!** Feel free to **fork & improve** the project. 🚀
```

---

### **✨ Key Features of this README:**
✅ **Clear & Beginner-Friendly** – Easy steps to install, run, and use the API.  
✅ **Formatted Commands** – `bash` & `curl` examples for clarity.  
✅ **Troubleshooting Section** – Quick fixes for common issues.  
✅ **Table for API Endpoints** – Makes it easy to understand.  
