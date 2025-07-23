import tensorflow as tf
from tensorflow.keras import models, layers
import matplotlib.pyplot as plt
import numpy as np
from tensorflow.keras.losses import SparseCategoricalCrossentropy

# Load the trained model
model = tf.keras.models.load_model('capsicum_trained_model.h5', compile=False)
model.compile(loss=SparseCategoricalCrossentropy(), optimizer='adam')  # Specify the loss function here

# Define the class labels
class_labels = ["Pepper__bell___Bacterial_spot", "Pepper__bell___healthy"]

def predict_and_plot(image_path, model, class_names):

    # Load the image
    img = tf.keras.preprocessing.image.load_img(image_path, target_size=(256, 256))
    img_array = tf.keras.preprocessing.image.img_to_array(img)
    img_array = tf.expand_dims(img_array, axis=0)  # Add batch dimension
    img_array = img_array / 255.0  # Normalize the image

    # Make predictions
    prediction = model.predict(img_array)
    predicted_label_index = np.argmax(prediction)
    predicted_label = class_names[predicted_label_index]

    # Plot the image
    plt.imshow(img)
    plt.xlabel("Prediction: {}".format(predicted_label), fontsize=12)
    plt.show()

    return predicted_label

# Example usage
image_path = 'hgic_veg_bacterial leaf spot_pepper_800.jpg'
predicted_label = predict_and_plot(image_path, model, class_labels)
print("Actual Label:", 'Pepper__bell___Bacterial_spot')
print("Predicted Label:", predicted_label)