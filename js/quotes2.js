 var mydata = [
    {
        "mids": 26666749,
        "author": "来一发就走字幕组",
        "zmz": "来一发就走字幕组",
        "kw": ""
    },
    {
        "mids": 97990,
        "author": "小山君",
        "zmz": "大喜利王字幕组",
        "kw": ""
    }
]

 function Start () {
     var myrandom = Math.floor( Math.random() * (mydata.length));
     document.getElementById('quotedisplay').innerHTML =  mydata[myrandom].author + mydata[myrandom].mids;
 }

 Start();
