const path = require('path');
const CopyWebpackPlugin = require('copy-webpack-plugin');

const copyWebpackPlugin = new CopyWebpackPlugin({
  patterns: [
    { from: 'src/assets', to: 'assets/[name][ext]' },
    { from: 'src/content', to: 'content/[name][ext]' },
    { from: 'src/*.@(png|html|ico|css|webmanifest)', to: '[name][ext]' },
  ],
});

module.exports = {
  mode: 'development',
  entry: path.resolve(__dirname, 'src/index.js'),
  output: {
    path: path.resolve(__dirname, 'docs'),
    filename: 'index.js',
  },
  plugins: [copyWebpackPlugin],
  module: {
    rules: [
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'asset/resource'
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: { loader: 'babel-loader' },
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: [
          { loader: 'elm-hot-webpack-loader' },
          {
            loader: 'elm-webpack-loader',
            options: {
              debug: false,
              pathToElm: 'node_modules/.bin/elm',
              files: [
                path.resolve(__dirname, "src/elm/Main.elm"),
              ],
            },
          },
        ],
      },
    ],
  },
  devServer: {
    port: 8000,
    static: {
      directory: path.join(__dirname, 'src'),
    },
  },
};
