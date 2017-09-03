import _ from 'lodash';

function component() {
  var element = document.createElement('div');
  element.innerHTML = "hi";
  // element.innerHTML = _.join(['Hello','webpack'],' ');

  return element;
}
