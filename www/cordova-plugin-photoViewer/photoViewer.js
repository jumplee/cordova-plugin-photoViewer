
var exec = require("cordova/exec");
var PhotoViewer = function () {};
PhotoViewer.prototype.open = function (photoArray,index,successCallback, errorCallback) {
    if(typeof index !=='number'){
        throw new Error('没有传index');
    }
              if(typeof photoArray !=='object'){
              throw new Error('没有传photoArray');
              }
  exec(successCallback, errorCallback, "PhotoViewer", "openPhotoFromUrl", [photoArray,index]);
}
module.exports = new PhotoViewer();


