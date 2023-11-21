# template-datascience

Template for Data Science, Machine Learning and Deep Learning projects

## Project Organization

```txt

    ├── LICENSE
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── external       <- Data from third party sources.
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── docs               <- A default Sphinx project; see sphinx-doc.org for details
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    ├── references         <- Data dictionaries, manuals, and all other explanatory materials.
    │
    ├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
    │   └── figures        <- Generated graphics and figures to be used in reporting
    │
    └── src                <- Source code for use in this project.
        │
        ├── data           <- Scripts to download or generate data
        │   └── make_dataset.py
        │
        ├── features       <- Scripts to turn raw data into features for modeling
        │   └── build_features.py
        │
        ├── models         <- Scripts to train models and then use trained models to make
        │   │                 predictions
        │   ├── predict_model.py
        │   └── train_model.py
        │
        └── visualization  <- Scripts to create exploratory and results oriented visualizations
            └── visualize.py


```

## Using [Docker](https://www.docker.com/get-started/)

### Container for [Python](https://www.python.org/) project

* Starting the project

    ```bash
    docker compose up [-d] app
    ```

* Enter the command line interface with bash inside the container

    ```bash
    docker compose run --rm app
    ```

### [Jupyter Notebooks](https://jupyter.org/)

#### Launch Bash CLI inside container

```bash
docker compose run --rm [--service-ports] [notebook-ml|notebook-dl]
```

#### Machine Learning

```bash
docker compose up [-d] notebook-ml
```

#### Deep Learning

```bash
docker compose up [-d] notebook-dl
```

#### Notes

* If not modified, the default config starts Juyter on [http://127.0.0.1:8888/lab]
* If you're interested in using VS Code as Jupyter Notebook's editor, make sure to get URL and Token credential in the container logs to successfully connect to the kernel. Look for something like: `http://127.0.0.1:8888/lab?token=<TOKEN_HASH>`

#### **Lucas Vidor Migotto - November, 2023**

> Project based on the [cookiecutter data science project template](https://drivendata.github.io/cookiecutter-data-science). #cookiecutterdatascience
