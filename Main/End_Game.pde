void endGame() {
  if (p1.score > 1000 || p2.dead ==true)
  {
    stage =3;
  }
  if (p2.score > 1000 || p1.dead ==true)
  {
    stage =4;
  }
}
