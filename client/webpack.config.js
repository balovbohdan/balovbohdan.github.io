const path = require('path');
const webpack = require('webpack');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const CaseSensitivePathsPlugin = require('case-sensitive-paths-webpack-plugin');

const copyWebpackPlugin = new CopyWebpackPlugin({
  patterns: [
    { from: 'src/assets', to: 'assets' },
    { from: 'src/content', to: 'content' },
    { from: 'src/*.@(png|html|ico|css|webmanifest)', to: '[name].[ext]' },
  ],
});

module.exports = (env, props) => {
  const mode = props.mode || 'development';

  return {
    mode,
    watch: mode === 'development',
    watchOptions: { aggregateTimeout: 200 },
    entry: [
      path.resolve(__dirname, 'src/index.js'),
      path.resolve(__dirname, 'src/elm/Main.elm'),
      path.resolve(__dirname, 'codemirror-elm'),
    ],
    output: {
      path: path.resolve(__dirname, 'dist'),
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
};
