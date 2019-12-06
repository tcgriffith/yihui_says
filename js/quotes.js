
 function Start () {
     var myrandom = Math.floor( Math.random() * (mydata.length));
     document.getElementById('quotedisplay').innerHTML = mydata[myrandom]
 }

 Start();