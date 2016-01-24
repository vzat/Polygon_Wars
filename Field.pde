public class Field extends Weapon
{
  PVector cellPosition;
  float fieldRadius;
  int lastFired;
  
  Field(float x, float y, color colour, float speed, float damage)
  {
    super(x, y, colour, speed, damage);
    cellPosition = new PVector(x, y);
    fieldRadius = 2 * cellSize + cellSize / 2;
    lastFired = millis();
  }
  Field()
  {
    this(0, 0, color(255), 0.5, 1);
  }
  
  public void render()
  {
    // Calculate the coordinates
    position.x = border.get("left") + cellSize / 2 + cellPosition.x * cellSize;
    position.y = border.get("top") + cellSize / 2 + (cellPosition.y - startCell) * cellSize + offset;
    
    strokeWeight(2);
    stroke(0, 0, 255, 50);
    fill(0, 0, 255, 50);
    ellipse(position.x, position.y, fieldRadius * 2, fieldRadius * 2);
    strokeWeight(1);
  }
  public void update()
  {
    if (lastFired + 1000 * speed < millis())
    {
      // Calculate the coordinates
      position.x = border.get("left") + cellSize / 2 + cellPosition.x * cellSize;
      position.y = border.get("top") + cellSize / 2 + (cellPosition.y - startCell) * cellSize + offset;
      
      for (int i = 0 ; i < objects.size() ; i++)
      {
        if (objects.get(i) instanceof Enemy)
        {
          // Reset the enemy speed
          Enemy e = (Enemy)objects.get(i);
          
          // Slow down the Enemy
          if (dist(position.x, position.y, objects.get(i).position.x, objects.get(i).position.y) <= fieldRadius)
          {
            e.health -= damage;
          }
        }
      }
      
      // Reset time
      lastFired = millis();
    }
  }
}