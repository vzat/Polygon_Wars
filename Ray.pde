public class Ray extends Weapon
{
  PVector sCell;
  PVector sPos;
  PVector ePos;
  float lastFired;
  
  Ray(float sX, float sY, color colour, float damage)
  {
    super(0, 0, colour, 0, damage);
    sCell = new PVector(sX, sY);
    sPos = new PVector(0, 0);
    ePos = new PVector(0, 0);
    lastFired = millis();
  }
  Ray()
  {
    this(0, 0, color(random(0, 255), random(0, 255), random(0, 255)), 1);
  }
  
  public void render()
  {
    if (isAlive)
    {
      // Calculate the coordinates
      sPos.x = border.get("left") + cellSize / 2 + sCell.x * cellSize;
      sPos.y = border.get("top") + cellSize / 2 + (sCell.y - startCell) * cellSize + offset;
      
      strokeWeight(5);
      stroke(0);
      line(sPos.x, sPos.y, ePos.x, ePos.y);
      strokeWeight(1);
    }
  }
  public void update()
  {
    float minDist = width;
    int enemyNo = -1;
    isAlive = false;
    for (int i = 0 ; i < objects.size() ; i++)
    {
      sPos.x = border.get("left") + cellSize / 2 + sCell.x * cellSize;
      sPos.y = border.get("top") + cellSize / 2 + (sCell.y - startCell) * cellSize + offset;
      if (objects.get(i) instanceof Enemy && dist(objects.get(i).position.x, objects.get(i).position.y, sPos.x, sPos.y) < 2 * cellSize + cellSize / 2)
      {
        /*
        isAlive = true;
        ePos.x = objects.get(i).position.x;
        ePos.y = objects.get(i).position.y;
        */
        
        if (dist(objects.get(i).position.x, objects.get(i).position.y, sPos.x, sPos.y) < minDist - 10)
        {
          enemyNo = i;
          minDist = dist(objects.get(i).position.x, objects.get(i).position.y, sPos.x, sPos.y);
        }
      }
    }
    
    if (enemyNo != -1)
    {
      ePos.x = objects.get(enemyNo).position.x;
      ePos.y = objects.get(enemyNo).position.y;
      isAlive = true;
      if (lastFired + 500 < millis())
      {
        Enemy e = (Enemy)objects.get(enemyNo);
        e.health -= damage;
        lastFired = millis();
      }
    }
    
  }
}