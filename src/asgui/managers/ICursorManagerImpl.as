package asgui.managers
{
   public interface ICursorManagerImpl
   {
       
      
      function get currentCursorID() : int;
      
      function set currentCursorID(param1:int) : void;
      
      function HideCursor() : void;
      
      function RemoveAllCursors() : void;
      
      function RemoveBusyCursor() : void;
      
      function RemoveCursor(param1:int) : void;
      
      function SetBusyCursor() : void;
      
      function SetCursor(param1:Class, param2:int = 2, param3:Number = 0, param4:Number = 0) : int;
      
      function ShowCursor() : void;
   }
}
