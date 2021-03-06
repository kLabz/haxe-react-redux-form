const path = require('path');
const webpack = require('webpack');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const dist = `${__dirname}/.build/`;

module.exports = {
	mode: 'development',
	entry: {
		app: './build.hxml'
	},
	output: {
		path: dist,
		publicPath: '/',
		filename: '[name].js'
	},
	resolve: {
		modules: ['node_modules'],
		extensions: ['.js']
	},
	devServer: {
		contentBase: dist,
		compress: true,
		port: 9070,
		https: false,
		overlay: true,
		historyApiFallback: true,
	},
	module: {
		rules: [
			{
				test: /\.hxml$/,
				loader: 'haxe-loader',
				options: {}
			}
		]
	},
	plugins: [
		new CopyWebpackPlugin([{
			from: 'public/index.html'
		}])
	]
};

