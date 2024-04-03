# Use an official Python runtime as a parent image
FROM python:3.12

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install DVC, MLFlow, and Jupyter
RUN pip install dvc mlflow jupyterlab

# Make port 8888 available to the world outside this container for Jupyter
EXPOSE 8888

# Start in bash
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]
