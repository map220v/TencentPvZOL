package asgui.air
{
   import asgui.core.ISoftKeyboardHintClient;
   
   public interface IAirManager
   {
       
      
      function AddListenToEditableText(param1:ISoftKeyboardHintClient) : void;
      
      function RemoveListenToEditableText(param1:ISoftKeyboardHintClient) : void;
   }
}
