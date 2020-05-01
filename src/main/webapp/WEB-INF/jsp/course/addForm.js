  function addForm(){
  var div = document.createElement('div');
  var str = document.getElementById('placeForm').innerHTML;
  str +=  '<button type="button" onclick="remove_div(this)"> 코스 삭제</button>';
  div.innerHTML = str;
  document.getElementById('field').appendChild(div);
  }
  function remove_div(obj){
  document.getElementById('field').removeChild(obj.parentNode);
  }