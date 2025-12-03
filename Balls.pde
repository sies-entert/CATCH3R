float [] x = new float[21];
float [] y = new float[21];
float [] spX = new float[21];
float [] spY = new float[21];

float sz = 10;

int backgr = 0;

int fill = 255;

color[] col = new color[21];

int[] circlen = new int[21];

class balls {

  void setup() {

    ellipseMode(CENTER);

    for (int i = 1; i < circlen.length; i++)
    {
      x[i] = random(constrain(( ((boxRight - boxMinHighlight) - sz / 2) - ((boxLeft + boxMinHighlight) + sz / 2)), (boxLeft + boxMinHighlight * 2) + sz, (boxRight - boxMinHighlight * 2) - sz));
      y[i] = random(constrain(( ((boxDown - boxMinHighlight) - sz / 2) - ((boxUp + boxMinHighlight) + sz/2)), (boxUp + boxMinHighlight * 2) + sz, (boxDown - boxMinHighlight * 2) - sz));

      aus[i] = true;
      col[i] = color(random(255), random(255), random(255));

      spX[i] = random(-5, 5);
      spY[i] = random(-5, 5);

      ballcount = i;
    }
  }

  void draw()
  {
    noStroke();
    for (int i = 1; i < circlen.length; i++)
    {

      if (aus[i])
      {
        fill(col[i]);

        x[i] += spX[i];
        y[i] += spY[i];

        circle(x[i], y[i], sz);

        if (x[i] + sz / 2 >= boxRight - boxMinHighlight|| x[i] - sz / 2 <= boxLeft + boxMinHighlight)
        {
          spX[i] = -spX[i];
        }
        if (y[i] + sz / 2 >= boxDown - boxMinHighlight || y[i] - sz / 2 <= boxUp + boxMinHighlight)
        {
          spY[i] = -spY[i];
        }
      }
    }
  }
}
