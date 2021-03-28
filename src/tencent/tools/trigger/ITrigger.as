package tencent.tools.trigger
{
   public interface ITrigger
   {
       
      
      function setData(param1:int, param2:Array) : void;
      
      function initialize() : void;
      
      function execute() : Boolean;
      
      function notify(param1:String, param2:Array) : void;
      
      function get triggerType() : Array;
      
      function dispose() : void;
   }
}
