let canvas2 = document.getElementById("canvas2"); 
let context2 = canvas2.getContext('2d');

for (let i = 0; i <= 1; i++) {
    for (let j = 0; j <= 4; j++) {
        context2.beginPath();
        let x = 50 + j * 100;
        let y = 50 + i * 100;
        let radius = 40;
        let startAngle = 0;
        let endAngle = (Math.PI / 180) * (j + 1) * 80;
        let counterclockwise = j % 2 == 1; 
        context2.arc(x, y, radius, startAngle, 
        endAngle, counterclockwise);
        if (i) {
            context2.fill();
        } else {
            context2.stroke();
        } 
    }
};


