# CoreConX

> A simple CFML framework in use with our AutoConX applications.

CoreConX is a standalone CFC or an Application extender that providers many of the methods that we've found helpful in developing applications at [AutoConX Systems](http://www.autoconx.com).


## Using CoreConX

The latest build of the CoreConX framework lives in the master branch in the `dist` folder.


## Documentation

View the documentation wiki on Github: [The CoreConX Wiki](https://github.com/AutoConX/CoreConX/wiki)

It should document the major features of the framework. If you find something is missing, you can submit a pull request or create an issue on the project.


## Example Site

The project comes with an example website. It uses the Application extension that CoreConX offers to show a simple example of how you'd build off CoreConX to make your own website.

Dependencies:
  * [NodeJS](http://nodejs.org/)
  * [npm](https://www.npmjs.com/)
  * [Commandbox](http://www.ortussolutions.com/products/commandbox)

To view the example site:
  1. Clone the CoreConX project
  1. Run `npm install`
  1. Run `npm test`
  1. Click "Example"


## Testing

CoreConX comes with tests. If you want to extend CoreConX and add your own functionality, you are required to provide tests for that functionality. Only if your tests pass (and pass our inspection) will your pull request be accepted.

Dependencies:
  * [NodeJS](http://nodejs.org/)
  * [npm](https://www.npmjs.com/)
  * [Commandbox](http://www.ortussolutions.com/products/commandbox)
  * [Testbox](http://wiki.coldbox.org/wiki/TestBox.cfm)

To view the example site:
  1. Clone the CoreConX project
  1. Run `npm install`
  1. Run `npm test`
  1. Click "CFML" under "Tests"


## Contributing

We welcome contributors to the codebase and documentation. If you want to help out, here are some considerations and tips:

  1. Use a code editor that supports [EditorConfig](http://editorconfig.org/). This will keep the codebase consistent.
  1. Keep your pull request atomic. The smaller and more focused a pull request is, the more likely it is to be accepted.
  1. Write tests for your new functionality or improve tests for areas where you're fixing bugs.
  1. Add any relevant example code to the Example site.
  1. If your pull request is accepted, you may be asked to update the documentation to explain your functionality.


## License

MIT license
