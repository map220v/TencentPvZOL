package asgui.core
{
   import flash.events.IEventDispatcher;
   import flash.text.TextField;
   
   public interface ISoftKeyboardHintClient extends IEventDispatcher
   {
       
      
      function get textField() : TextField;
      
      function get text() : String;
      
      function set text(param1:String) : void;
      
      function set autoCapitalize(param1:String) : void;
      
      function get autoCapitalize() : String;
      
      function get autoCorrect() : Boolean;
      
      function set autoCorrect(param1:Boolean) : void;
      
      function get returnKeyLabel() : String;
      
      function set returnKeyLabel(param1:String) : void;
      
      function get softKeyboardType() : String;
      
      function set softKeyboardType(param1:String) : void;
   }
}
