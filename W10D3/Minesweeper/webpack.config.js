const path = require("path");

module.exports = {
  entry: "./react_minesweeper.jsx",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js"
  },
  devtool: 'source-map',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  module: {
    rules: [
      { //we are saying here that for any jsx files we use babel loader
        test: /\.jsx?$/, //a regular expression that tests what kind of files to run through this loader.
        exclude: /(node_modules)/, //ignore these files
        use: {
          loader: 'babel-loader', //the name of the loader we are going to use (babel-loader).
          options: { // options for the loader
            // for webpack 5, this 'query' key should be 'options' key instead
            // for more info: https://webpack.js.org/configuration/module/#ruleoptions--rulequery
            presets: ['@babel/env', '@babel/react'] //tells loader to use @babel/env which transpiles back to es5 and @babel/react which converts jsx code
          }
        },
      }
    ]
  }

}