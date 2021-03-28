package asgui.resources
{
   import flash.display.LoaderInfo;
   
   public interface IAssetBundle
   {
       
      
      function get bundleName() : String;
      
      function GetContent(param1:String) : Object;
      
      function AddContent(param1:LoaderInfo, param2:String) : void;
      
      function RemoveContent(param1:String) : void;
      
      function AddResource(param1:String, param2:Class) : void;
   }
}
