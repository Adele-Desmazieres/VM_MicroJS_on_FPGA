var a = 10;
let b = 20;

function test2 (f1) {
  let g2 = f1 + 60;
  return a + b + g2 + b;
}

var c = 30;

function test1 (d) {
  var c1 = 50;
  let f1 = c + d;
  return test2(f1);
}

let d = 40;

test1(d);
