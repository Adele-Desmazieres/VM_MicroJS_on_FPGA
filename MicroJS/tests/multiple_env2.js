var g = 2;

function test2 (n4) {
  return g + n4;
}

function test1 (n1, n2, n3) {
  let x = 10;
  let y = 20;
  let z = 30;
  return test2(n1 + n2 + n3 + x + y + z);
}

test1(40, 50, 60);
