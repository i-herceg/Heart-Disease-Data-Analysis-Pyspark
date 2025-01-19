
# Heart Disease Analysis using PySpark

This project analyzes the Heart Disease dataset using PySpark and provides insights into various factors associated with heart disease risk. The analysis results are saved in Parquet format for further use.

## Features
- Data cleaning and preprocessing.
- Analysis of heart disease distribution.
- Identification of significant risk factors.
- Generation of derived features and insights.

## Project Structure
- `Dockerfile`: Defines the Docker image for the project.
- `docker-compose.yml`: Configuration for Docker Compose to set up the environment.
- `data/`: Directory containing the input dataset.
- `heart-disease-analysis.ipynb`: Jupyter Notebook with the analysis code.
- Parquet files: Output data stored in Parquet format:
  - `all_correlations.parquet`: Correlation analysis results.
  - `chest_pain_heart_disease_analysis.parquet`: Analysis based on chest pain and heart disease.
  - Other Parquet files contain detailed insights.

## Dataset
The dataset used in this project can be found on Kaggle: [Heart Disease Dataset](https://www.kaggle.com/datasets/johnsmith88/heart-disease-dataset).

### About the Dataset
#### Context
This dataset dates back to 1988 and includes data from four sources: Cleveland, Hungary, Switzerland, and Long Beach V. It contains 76 attributes in total, though all published experiments refer to a subset of 14 attributes. The `target` field indicates the presence of heart disease in the patient, with values:
- `0`: No disease
- `1`: Disease

#### Content
The dataset includes the following attributes:
- `age`: Age of the patient
- `sex`: Gender of the patient
- `chest pain type`: Four categories of chest pain
- `resting blood pressure`: Measured in mm Hg
- `serum cholesterol`: Measured in mg/dl
- `fasting blood sugar`: Indicator for blood sugar > 120 mg/dl
- `resting electrocardiographic results`: Values 0, 1, or 2
- `maximum heart rate achieved`
- `exercise induced angina`: Boolean
- `oldpeak`: ST depression induced by exercise relative to rest
- `slope`: Slope of the peak exercise ST segment
- `number of major vessels`: (0-3) colored by fluoroscopy
- `thal`: Indicator for thalassemia (0 = normal; 1 = fixed defect; 2 = reversible defect)

Sensitive information like names and social security numbers has been replaced with dummy values.

## Prerequisites
- Docker (must be running)
- Docker Compose

## Setup Instructions
1. Ensure that Docker and Docker Compose are running on your system. You can check the version using the following commands:
   ```bash
   docker --version
   docker-compose --version
   ```
   If these commands return a version, Docker and Docker Compose are installed and functional.

2. If Docker is not running, start it:
   - **On Windows**: Open Docker Desktop and wait for it to start.
   - **On Linux**: Start Docker with the following command:
     ```bash
     sudo systemctl start docker
     ```

3. Clone the repository:
   ```bash
   git clone https://github.com/i-herceg/Heart-Disease-Data-Analysis-Pyspark.git
   cd HeartDisease-Analysis
   ```

4. Build and run the Docker container:
   ```bash
   docker-compose up --build
   ```

5. Open the Jupyter Notebook:
   - Open your browser and go to `http://localhost:8888`.
   - Use the token displayed in the terminal to log in.

6. Run the `heart-disease-analysis.ipynb` notebook to view and execute the analysis.

## Dockerfile Explanation
The `Dockerfile` sets up the environment for running the project:
- Starts from the `ubuntu:20.04` base image.
- Installs essential tools like JDK 11, Python 3, pip, and curl.
- Downloads and configures Apache Spark version 3.4.1.
- Installs Python packages, including PySpark and Jupyter.
- Exposes port 8888 for accessing the Jupyter Notebook.
- Defines the default command to start the Jupyter Notebook server.

## Docker Compose Configuration
The `docker-compose.yml` simplifies the container setup:
- **Version**: Uses version `3.9` of the Docker Compose file format.
- **Service**: Defines a single service named `pyspark`.
  - **Build**: Specifies that the image should be built using the `Dockerfile` in the current directory.
  - **Volumes**: Maps the current project directory to `/app` inside the container, allowing for real-time code changes.
  - **Ports**: Maps port `8888` on the host to port `8888` in the container, enabling access to the Jupyter Notebook.

This configuration makes it easy to set up and manage the PySpark environment without manually configuring dependencies.

## Deliverables
This project satisfies the following requirements:

### Data Processing
- **Loading and Cleaning**: The dataset is loaded and cleaned using PySpark DataFrame API. There are no missing values in the dataset, but a function for removing rows with missing values is included.
- **Data Type Conversion**: Appropriate data types were applied to all columns for accurate analysis.
- **Derived Features**: New features, such as age groupings and risk profiles, were generated for deeper insights.

### Analysis
- **Distribution Analysis**: The distribution of heart disease presence by age groups and gender is calculated and saved as `heart_disease_distribution_by_age_and_sex.parquet`.
- **Significant Factors**: The top 3 factors most correlated with heart disease are identified and saved as `top_3_significant_factors.parquet`.
- **Risk Profiles**: Age-based risk profiles using multiple features are created and saved as `risk_profile_counts.parquet`.
- **Chest Pain Patterns**: Patterns between chest pain types and heart disease presence are analyzed and saved as `chest_pain_heart_disease_analysis.parquet`.

## Testing
To ensure the reproducibility of results:
1. Follow the setup instructions to run the project in a Dockerized environment.
2. Verify the generated Parquet files in the `output_parquet/` directory.
3. Use the provided Jupyter Notebook to review and rerun the analysis.

## Author
Ivana Herceg
