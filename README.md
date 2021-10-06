# sas2021_codeql_workshop

### example-flask-app
Example app for demo 1 (flask application runs debug mode) and demo 2 (taint tracking usage for xss).

### example-flask-app-clickhouse
Example app for demo 3 (implementing clickhouse sql injection sink).

### example-js-taint
Example app for demot 4. Improving taint propogation on cross middlware steps in express app.

### Setup the environment
1. Download VSCode 
2. Install CodeQL extension
3. Download codeql-cli-binaries: https://github.com/github/codeql-cli-binaries/releases
4. Get vscode-codeql-started project: https://github.com/github/vscode-codeql-starter
5. To build codeql snapshot for python project: `codeql database create -l python /path/to/resulting/codeql-database`
5. To build codeql snapshot for javascript project: `codeql database create -l javascript /path/to/resulting/codeql-database`

### queries
Queries that were written during the workshop:
1. `1-debug.ql` - query search for flask application that runs in debug mode.
2. `2-xss.ql` - query search for xss vulnerability using taint tracking.
3. `3-clickhouse-Customizations.qll` - extending standard library, to implement clickhouse_driver sql injection query sink.
4. `4-jstaint-Customizations.qll` - extending standard library, to improve quality of taint tracking. Adding one more taint propogation step between express middlewares and handlers.
5. `4-full-jstaint-Customizations.qll` - extending standard library, to improve quality of taint tracking. Adding one more taint propogation step between express middlewares and handlers. Extended example.

### Link to demos
1. https://www.youtube.com/watch?v=KeTfsZZShFM
2. https://www.youtube.com/watch?v=MrhPd8yYoaM
3. https://www.youtube.com/watch?v=-511AWFBSX8
4. https://www.youtube.com/watch?v=yLpafEygDTg
