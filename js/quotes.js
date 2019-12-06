
 function Start () {
 
      // read from filename
     var sr = new StreamReader(fileName);
     var fileContents = sr.ReadToEnd();
     sr.Close();
  
      // put data from filename into a variable
     var mydata = [

    '> 美丽的花开了，可它也会有一天凋谢  ',
    '> 但是，最后还是只有一死......  ',
    '> 沙加啊，你忘记了  ',
    '> 死并不是一切的终结  ',
    '> 花开了，然后又会凋零  ',
    '> 春江潮水连海平，海上明月共潮生。  '


     ]
 
     // pick a random number between 1 and 10
     var myrandom = Random.Range(0,mydata.Length);
     print(mydata[myrandom]);
 }

 Start();