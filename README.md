# template-datascience

Template for Data Science, Machine Learning and Deep Learning projects

## Summary

1. [Start Jupyter with Docker](#start-jupyter-with-docker)
2. [Python base env to `src/` dir](#python-base-env-to-src-dir)
3. [Project organization](#project-organization)

## Start [Jupyter](https://jupyter.org/) with [Docker](https://www.docker.com/get-started/)

### Image options

> Give it a try with the tag `python-3.11` or `ubuntu-22.04`

1. Machine Learning

    * Python, R and Julia

        * Pull the [image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-datascience-notebook)

            ```bash
            docker pull quay.io/jupyter/datascience-notebook
            ```

    * [Python](https://www.python.org/)

        * Pull the [image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook)

            ```bash
            docker pull
            ```

    * [R](https://www.r-project.org/)

        * Pull the [image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-r-notebook)

            ```bash
            docker pull quay.io/jupyter/r-notebook
            ```

    * [Julia](https://julialang.org/)

        * Pull the [image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-julia-notebook)

            ```bash
            docker pull quay.io/jupyter/julia-notebook
            ```

2. Deep Learning

    * [TensorFlow](https://www.tensorflow.org/)

        * Pull the [image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-tensorflow-notebook)

        ```bash
        docker pull quay.io/jupyter/tensorflow-notebook
        ```

    * [PyTorch](https://pytorch.org/)

        * Pull the [image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-pytorch-notebook)

        ```bash
        docker pull quay.io/jupyter/pytorch-notebook
        ```

3. [PySpark](https://spark.apache.org/docs/latest/api/python/index.html)

    * Pull the [image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-pyspark-notebook)

        ```bash
        docker pull quay.io/jupyter/pyspark-notebook
        ```

### Docker run command base

Run the following command inside your project folder to start the container

```bash
docker run \
    --name 'notebook' \
    --hostname 'notebook' \
    --workdir '/app' \
    --volume './:/app:delegated' \
    --network 'bridge' \
    --publish '8888:8888' \
    --rm \
    {{ YOUR IMAGE AND TAG GOES HERE }}
```

> The container will interrupt your terminal. If you want to avoid this, use the `-d` after the `run` command to run the container in detach mode. Take notice that, if in detach mode, the token used to connect to the server will not be displayed.

#### Bash aliases

Given the fact that is a long command to type every time, you maybe would like to create bash aliases to make things easier. The following code demonstrate an example of how to do it:

> Depend if you use some other shell (e.g. [ZSH](https://www.zsh.org/)), you will need edit the code to redirect the output to the correct rc file
>
> **PLEASE PAY ATTENTION**, make sure to use `>>` instead of `>`. Otherwise, you will overwrite **EVERYTHING** inside your shell rc file

```bash
cat <<EOF >> $HOME/.bashrc
_BASE_CMD="docker run --name 'notebook' --hostname 'notebook' --volume './:/home/jovyan' --network 'bridge' --publish '8888:8888' --env GRANT_USER=yes --rm"
alias docker-notebook-ml="${_BASE_CMD} quay.io/jupyter/datascience-notebook:python-3.11"
alias docker-notebook-dl-tf="${_BASE_CMD} quay.io/jupyter/tensorflow-notebook:python-3.11"
alias docker-notebook-dl-pt="${_BASE_CMD} quay.io/jupyter/pytorch-notebook:python-3.11"
alias docker-notebook-python="${_BASE_CMD} quay.io/jupyter/scipy-notebook:python-3.11"
alias docker-notebook-r="${_BASE_CMD} quay.io/jupyter/r-notebook:python-3.11:python-3.11"
alias docker-notebook-julia="${_BASE_CMD} quay.io/jupyter/julia-notebook:python-3.11"
alias docker-notebook-ps="${_BASE_CMD} quay.io/jupyter/pyspark-notebook:python-3.11"
EOF
```

### Notes

* If not modified, the default config starts Juyter on [127.0.0.1:8888](http://127.0.0.1:8888/lab)
* If you're interested in using VS Code as Jupyter Notebook's editor, make sure to get URL and Token credential in the container logs to successfully connect to the kernel. Look for something like: `http://127.0.0.1:8888/lab?token=<TOKEN_HASH>`

## Python base env to `src/` dir

### How to use with [Docker](https://www.docker.com/get-started/)

* Starting the project

    ```bash
    docker compose up [-d] app
    ```

* Enter the command line interface with bash inside the container

    ```bash
    docker compose run --rm app
    ```

## Project organization

```txt

    ├── LICENSE
    ├── README.md          <- The top-level README for developers using this project.
    ├── data
    │   ├── external       <- Data from third party sources.
    │   ├── interim        <- Intermediate data that has been transformed.
    │   ├── processed      <- The final, canonical data sets for modeling.
    │   └── raw            <- The original, immutable data dump.
    │
    ├── models             <- Trained and serialized models, model predictions, or model summaries
    │
    ├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
    │                         the creator's initials, and a short `-` delimited description, e.g.
    │                         `1.0-jqp-initial-data-exploration`.
    │
    └── src                <- Source code for use in this project.
        │
        ├── data           <- Scripts to download or generate data
        │   └── make_dataset.py
        │
        ├── features       <- Scripts to turn raw data into features for modeling
        │   └── build_features.py
        │
        ├── models         <- Scripts to train models and then use trained models to make
        │   │                 predictions
        │   ├── predict_model.py
        │   └── train_model.py
        │
        └── visualization  <- Scripts to create exploratory and results oriented visualizations
            └── visualize.py


```

> Project based on the [cookiecutter data science project template](https://drivendata.github.io/cookiecutter-data-science). #cookiecutterdatascience
>
> **Lucas Vidor Migotto - December, 2023**
