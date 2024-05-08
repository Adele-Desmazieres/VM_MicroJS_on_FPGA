var g = 10;

function test2 (n2) {
  return g + n2;
}

function test1 (n1) {
  return test2(n1);
}

test1(20);
