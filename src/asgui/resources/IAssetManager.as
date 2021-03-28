package asgui.resources
{
   import asgui.core.ILoadingWatchable;
   import flash.display.LoaderInfo;
   import flash.events.IEventDispatcher;
   
   public interface IAssetManager extends IEventDispatcher, ILoadingWatchable
   {
       
      
      function SetResourceModules(param1:Array, param2:Boolean = true) : void;
      
      function GetObject(param1:String) : *;
      
      function GetString(param1:String, param2:Array = null) : String;
      
      function GetStringArray(param1:String) : Array;
      
      function GetNumber(param1:String) : Number;
      
      function GetInt(param1:String) : int;
      
      function GetUint(param1:String) : uint;
      
      function GetBoolean(param1:String) : Boolean;
      
      function GetClass(param1:String) : Class;
      
      function GetNewClass(param1:String) : Object;
      
      function AddResourceModules(param1:String, param2:int) : void;
      
      function CheckLoad(param1:Vector.<int> = null) : void;
      
      function CheckUnload(param1:Vector.<int> = null) : void;
      
      function HasUrlsNeedToLoad(param1:Vector.<int>) : Boolean;
      
      function AddResource(param1:String, param2:Class) : void;
      
      function set urlChangeFunction(param1:Function) : void;
      
      function AddContent(param1:LoaderInfo, param2:String) : void;
   }
}
