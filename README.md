# datascience

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

Template for Data Science, Machine Learning and Deep Learning projects.

## Getting started

Clone the repository into the desire folder

* With `ssh`

    ```bash
    git clone git@github.com:LucasVmigotto/datascience.git
    ```

* With `HTTPS`

    ```bash
    git clone https://github.com/LucasVmigotto/datascience.git
    ```

* With GitHub CLI

    ```bash
    gh repo clone LucasVmigotto/datascience
    ```

## Development

This template project aims to help, and bootstrap, the development of data science projects creating an environment with commonly tools and necessities required - such as a [Linux](https://www.linux.org/)  operational system, [_Jupyter Notebooks_](https://jupyter.org/) and _LLM_ models.

Although you can clone and get started with only the [Docker](https://www.docker.com/), it is highly recommended that you take advantage of the excellent tool that is the [Visual Studio Code](https://code.visualstudio.com/) support to Docker's Containers based development with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

Inside `.devcontainer` folder, there is a `devcontainer.json` specification file that take care of providing you with all the tools early listed to a data science project. In case of need, it is possible to deactivate, separably, the services that can be ignored depending of the scenario. Thus, just comment in the `runsServices` key that services you do not want to be initiated with the development container.

### Pre requisites

#### Mandatory

* [Docker Engine](https://docs.docker.com/engine/)

#### Recommended

* [Docker Compose](https://docs.docker.com/compose/)

#### Optional

* [Visual Studio Code](https://code.visualstudio.com/)
* [VSCode Extension Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)


### Environment variables

Copy and rename the `.env.example` file to `.env`.

> Customize the values if necessary

### Using Docker

#### App

This is a basic environment prepared to start some application development. It comes with [Python](https://www.python.org/), [`git`](https://git-scm.com/) and [`zsh`](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/)!

#### [Conda](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html) (Jupyter)

With this service, you can connect to a Jupyter Environment and use it to test ideias in Jupyter Notebooks. It is possible to connect, when editing a `.ipynb` file inside Visual Studio Code, to the Jupyter Server just informing the connection URL `http://jupyter:8888`

> You can, as well, access the browser Jupyter Notebook version in [localhost:8888](http://localhost:8888)

#### [Ollama](https://ollama.com/)

This service has few direct use not considering the connection inside a Notebook consuming a model for example. But it is possible to direct interact with the service using the CLI interface with the following command:

```bash
docker compose exec ollama ollama run ollama3 # Or, any other model that has been pulled already before
```

##### Pulling Models

The service, at first time, start without any model already downloaded. To download a model, you can make a request to the Ollama's API the pull the desired model. The following example shows how would be to pull the [llama3 8B](https://ollama.com/library/llama3:8b):

```bash
curl http://localhost:11434/api/pull \
    -d '{ "model": "llama3" }'
```

> This example consider that the command will be executed inside a terminal in the host.
>
> If you want to execute inside a terminal in the Visual Studio Code, change the request URL to `http://ollama:11414/api/pull` - in this case, it is necessary to consider the hostname inside the Docker network that binds all the services.

#### [Open WebUI](https://docs.openwebui.com/)

You can acess [locahost:8080](http://localhost:8080) to get access into the Open WebUI visual interface and test the models pulled with Ollama.

#### Docker Troubleshooting

List all Docker containers

```bash
docker ps -a
```

Remove Docker Compose containers

```bash
docker compose rm --stop -f
```

Prune containers

```bash
docker container prune --force
```

List all Docker images

```bash
docker ls -a
```

Remove Docker _dangling_ images

```bash
docker image rm -f $(docker image ls --filter "dangling=true" -aq)
```

List all Docker volumes

```bash
docker volume ls
```

Prune Docker volumes

```bash
docker volume prune --force
```

> **WARNING**: If you want to remove **ALL** Docker images, just remove the `--filter` flag and argument
>
> `docker image rm -f $(docker image ls -aq)`

## References

* [Visual Studio Code Dev Container creation](https://code.visualstudio.com/docs/devcontainers/create-dev-container)
* [Dev Container](https://containers.dev/)
* [Dev Container images](https://github.com/devcontainers/images/tree/main/src)
* [Docker](https://docs.docker.com/)
* [Jupyter Server](https://jupyter-server.readthedocs.io/en/latest/)
* [Ollama](https://github.com/ollama/ollama/tree/main/docs)
* [Open WebUI](https://docs.openwebui.com/)
