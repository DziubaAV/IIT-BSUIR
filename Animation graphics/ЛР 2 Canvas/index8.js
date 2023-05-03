let canvas8 = document.getElementById("canvas8"); 
let context8 = canvas8.getContext('2d');

context8.beginPath(); 
context8.moveTo(50,50); 
context8.lineTo(50,150); 
context8.lineTo(100,50); 
context8.lineTo(100,150); 
context8.fill(); 
context8.closePath();
