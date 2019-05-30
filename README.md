# svelte app - now with more [Dev Container!!](https://code.visualstudio.com/docs/remote/containers)

This is based on the original project template for [Svelte](https://svelte.dev) apps
that can be found at https://github.com/sveltejs/template.

## Prereqs

- [Visual Studio Code Insiders](https://code.visualstudio.com/insiders/) - As of this time container development only works on the Insiders channel
- [Remote Development Extensions](https://aka.ms/vscode-remote/download) - For Visual Studio Code
- [Docker Desktop](https://www.docker.com/products/docker-desktop) - For Windows or Mac
- [degit](https://github.com/Rich-Harris/degit) ( `npm install -g degit` ) - Easy project scaffolding

## First Steps

Scaffold a fresh project off of this template:

1. Use [degit](https://github.com/Rich-Harris/degit) to clone this template to a new project
2. Change directory to the new project
3. Initialize a new repository
4. Open the project in [Visual Studio Code Insiders](https://code.visualstudio.com/insiders/)

```bash
npx degit code-chimp/dev-container-svelte3 new-svelte-app
cd new-svelte-app
git init
code-insiders .
```

**NOTE:** All git **_commits_** will need to happen from the Dev Container as it has static analysis tools and pre-commit hooks installed inside of the container

## Working

1. Open/build Development Container:
   - The first time you open the project in VSCode you should see a dialog box asking you to "Reopen folder to develope in a container" - select the "Reopen in Container" button.
   - Alternatively you can click the "remote window" icon in the lower-left corner of the IDE and select the option **Remote Containers: Reopen Folder in Container** option
   - Or hit <kbd>F1</kbd> and select the **Remote-Containers: Open Folder in Container...** command
2. Open a terminal inside the Dev Container, Press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>\`</kbd>, and start developing:
   - Start the server `npm run dev`
   - Open your host browser to http://localhost:5000
   - Start hacking
   - **NOTE:** you will need to refresh your browser after changes as autoreload does not appear to get picked up yet

## Saving Our Work

- The built-in **Source Control** (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>G</kbd>) window works well
- Or you can do it manually from the bash prompt as normal

```bash
git add -A
git commit -m ':tada: Fresh Template Clone'
```

## Create and Host a Docker Image

You can create a Docker image of a production build outside of the Dev Container environment when you are ready to see what the deployed production app would look like.

**FROM THE HOST SYSTEM** **_example_**:

```
docker build -t new-svelte-image .
docker run --name new-svelte-process -p 3000:80 -d new-svelte-image:latest
```

Open your browser to http://localhost:3000 and marvel at your brilliance

## Things Not Working

- Host machine's browser does not pick up on the autoreload, need to refresh page manually.
