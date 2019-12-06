
 function Start () {

     var mydata = [

    '> 美丽的花开了，可它也会有一天凋谢  ',
    '> 但是，最后还是只有一死......  ',
    '> 沙加啊，你忘记了  ',
    '> 死并不是一切的终结  ',
    '> 花开了，然后又会凋零  ',
    '> 春江潮水连海平，海上明月共潮生。  '


     ]
 
     // pick a random number between 1 and 10
     var myrandom = Math.floor( Math.random() * (mydata.length));
     document.getElementById('quotedisplay').innerHTML = mydata[myrandom]
 }

 Start();