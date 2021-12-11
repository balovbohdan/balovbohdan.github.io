const path = require('path');
const webpack = require('webpack');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const CaseSensitivePathsPlugin = require('case-sensitive-paths-webpack-plugin');

const copyWebpackPlugin = new CopyWebpackPlugin({
  patterns: [
    { from: 'src/assets', to: 'assets/[name].[ext]' },
    { from: 'src/content', to: 'content/[name].[ext]' },
    { from: 'src/*.@(png|html|ico|css|webmanifest)', to: '[name].[ext]' },
  ],
});

module.exports = {
  mode: 'development',
  watch: true,
  watchOptions: {
    aggregateTimeout: 200,
  },
  entry: [
    path.resolve(__dirname, 'src/index.js'),
    path.resolve(__dirname, 'src/elm/Main.elm'),
  ],
  output: {
    path: path.resolve(__dirname, 'docs'),
    filename: 'index.js',
  },
  resolve:   {
    extensions: ['.js', '.elm'],
  },
  plugins: [
    new CaseSensitivePathsPlugin(),
    new webpack.HotModuleReplacementPlugin(),
    copyWebpackPlugin,
  ],
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
              cwd: __dirname,
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
    contentBase: path.join(__dirname, 'src'),
  },
};
