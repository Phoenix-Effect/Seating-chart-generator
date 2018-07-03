function fillSeat( item, index ){
  var seat = document.getElementsByClassName(item)[0];
  seat.style.backgroundColor = "red";
  seat.style.color = "white";
}

function clearAll(){
  for (var i = 0; i < 89; i++){
    var seat = document.getElementsByClassName('seat')[i];
    seat.removeAttribute('style');
  }
}

function clearManual(){
  for (var i = 0; i < 89; i++){
    var seat = document.getElementsByClassName('seat')[i];
    seat.removeAttribute('style');
  }
  var debug = document.getElementById('response');
  debug.innerText = "All cleared";
}

function loadFile(){
  var xobj = new XMLHttpRequest();
  var debug = document.getElementById('response');
          xobj.overrideMimeType("application/json");
      xobj.open('GET', 'output.txt', true);
      xobj.onreadystatechange = function () {
            if (xobj.readyState == 4 && xobj.status == "200") {
              debug.innerHTML = xobj.responseText;
              clearAll();
              updateContent();
            }
      };
      xobj.send(null);
    }

function updateContent(){
  var seatArray = document.getElementById('response').innerHTML;
  seatArray = JSON.parse(seatArray);
  seatArray.forEach(fillSeat);
}
