package asgui.styles
{
   import asgui.core.ILoadingWatchable;
   import flash.events.IEventDispatcher;
   
   public interface IStyleManagerImpl extends IEventDispatcher, ILoadingWatchable
   {
       
      
      function GetSkinInfo(param1:String) : StyleSkinInfo;
      
      function GetStyleSkin(param1:StyleSkinInfo) : StyleSkin;
      
      function GetStyleDeclaration(param1:String, param2:Object = null) : StyleDeclaration;
      
      function GetTotalSkinDataMemSize(param1:Boolean = false) : int;
      
      function SetSwfAndCss(param1:Array, param2:Array) : void;
      
      function AddCss(param1:String) : void;
      
      function AddSwf(param1:String) : void;
      
      function CheckLoad() : void;
      
      function GetStyleNamesByUITypeName(param1:String) : Array;
      
      function GetStyleData(param1:SkinDataInfo) : SkinData;
   }
}
