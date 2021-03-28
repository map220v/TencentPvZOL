package asgui.blit.display
{
   public interface IBlitShape extends IBlitDisplayObject
   {
       
      
      function BeginFill(param1:uint, param2:Number = 1.0) : void;
      
      function Clear() : void;
      
      function MoveTo(param1:Number, param2:Number) : void;
      
      function LineTo(param1:Number, param2:Number) : void;
      
      function DrawRect(param1:Number, param2:Number, param3:Number, param4:Number) : void;
      
      function DrawCircle(param1:Number, param2:Number, param3:Number) : void;
   }
}
