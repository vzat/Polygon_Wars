public class TowerField extends Tower implements DamageUp, SpeedUp, RangeUp
{
  TowerField(int x, int y)
  {
    super(x, y);
    speed = 0.8;
    damage = 1;
    colour = color(0, 0, 255);
    drawShape();
  }
  TowerField()
  {
    this(0, 0);
  }
  
  public void update()
  {
    // Create the field
    if (!created)
    {
      Field field = new Field(cellPosition.x, cellPosition.y, colour, speed, damage);
      weapons.add(field);
      created = true;
    }
  }
  
  public void DamageIncrease()
  {
    for (int i = 0 ; i < weapons.size() ; i++)
    {
      if (weapons.get(i) instanceof Field)
      {
        Field field = (Field)weapons.get(i);
        if (field.cellPosition.x == cellPosition.x && field.cellPosition.y == cellPosition.y)
        {
          field.damage += 1;
          break;
        }
      }
    }
    upgradeLevel[0] ++;
  }
    
  public void SpeedIncrease()
  {
    for (int i = 0 ; i < weapons.size() ; i++)
    {
      if (weapons.get(i) instanceof Field)
      {
        Field field = (Field)weapons.get(i);
        if (field.cellPosition.x == cellPosition.x && field.cellPosition.y == cellPosition.y)
        {
          field.speed -= 0.2;
          break;
        }
      }
    }
    upgradeLevel[1] ++;
  }
  
  public void RangeIncrease()
  {
    for (int i = 0 ; i < weapons.size() ; i++)
    {
      if (weapons.get(i) instanceof Field)
      {
        Field field = (Field)weapons.get(i);
        if (field.cellPosition.x == cellPosition.x && field.cellPosition.y == cellPosition.y)
        {
          field.fieldRadius += cellSize;
          break;
        }
      }
    }
    fieldRadius += cellSize;
    upgradeLevel[2] ++;
  }
}