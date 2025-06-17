# dwv-react

Medical viewer using [DWV](https://github.com/ivmartel/dwv) (DICOM Web Viewer) and [React](https://reactjs.org/).

All coding/implementation contributions and comments are welcome. Releases should be ready for deployment otherwise download the code and install dependencies with a `yarn` or `npm` `install`.

dwv-react is not certified for diagnostic use. Released under GNU GPL-3.0 license (see [license.txt](license.txt)).

[![Node.js CI](https://github.com/ivmartel/dwv-react/actions/workflows/nodejs-ci.yml/badge.svg)](https://github.com/ivmartel/dwv-react/actions/workflows/nodejs-ci.yml)

## Available Scripts

 - `install`: install dependencies
 - `start`: serve with hot reload at localhost:3000
 - `start:dicom`: serve with hot reload at localhost:3000/dicom
 - `test`: run unit tests
 - `build`: build for production
 - `build-dicom`: build for production with `/dicom` base path

## Docker Deployment

To build and run the application with Docker on the `/dicom` path:

```sh
# Build the Docker image
docker build -t dwv-react .

# Run the container
docker run -p 80:80 dwv-react
```

The application will be available at `http://localhost/dicom`.

## Custom Path Deployment

The application supports deployment on custom paths. Use the `PUBLIC_URL` environment variable:

```sh
# For development
PUBLIC_URL=/your-path npm start

# For production build
PUBLIC_URL=/your-path npm run build
```

Unit tests use [Jest](https://facebook.github.io/jest/).

This project was generated with the [Create React App](https://github.com/facebookincubator/create-react-app) version 1.1.1.

More details in the [user guide](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md).

## Steps to run the viewer from scratch

```sh
# get the code
git clone https://github.com/ivmartel/dwv-react.git

# move to its folder
cd dwv-react

# install dependencies
yarn install

# call the start script to launch the viewer on a local server
yarn run start
```

You can now open a browser at http://localhost:3000 and enjoy!
