import tensorflow as tf
from tensorflow.keras.losses import SparseCategoricalCrossentropy
from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Load the trained model
model = tf.keras.models.load_model('capsicum_trained_model.h5', compile=False)
model.compile(loss=SparseCategoricalCrossentropy(), optimizer='adam')  # Specify the loss function here

# Define the class labels
class_labels = ["Pepper__bell___Bacterial_spot", "Pepper__bell___healthy"]

def predict_image(image_path, model, class_names):
    # Load the image
    img = tf.keras.preprocessing.image.load_img(image_path, target_size=(256, 256))
    img_array = tf.keras.preprocessing.image.img_to_array(img)
    img_array = tf.expand_dims(img_array, axis=0)  # Add batch dimension
    img_array = img_array / 255.0  # Normalize the image

    # Make predictions
    prediction = model.predict(img_array)
    predicted_label_index = np.argmax(prediction)
    predicted_label = class_names[predicted_label_index]

    return predicted_label

@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No image provided'})

    image_file = request.files['file']
    image_path = "temp_image.jpg"  # Temporarily save image

    image_file.save(image_path)

    predicted_label = predict_image(image_path, model, class_labels)

    return jsonify({'prediction': predicted_label})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
