# go.blueprint

A *Go* starter project.

## Directory Structure

- `build` contains all shell scripts needed to build and test the application.
- `cmd` contains the source code! By convention, the source directory is named `cmd`, within, there is another directory with the name of the project - in this case `blueprint`. The `blueprint` inside this directory the `main.go` file that runs the *Go* application. The rest of the source is further divided into modules in this directory.
- `config` contains files with all required environment variables.
- `pkg` contains a *Go* package that only contains the global app version string. This is substituted for the actual version computed from the commit hash during build.
