package asgui.blit.display
{
   public interface IBlitDisplayContainer extends IBlitDisplayObject
   {
       
      
      function AddChildAt(param1:IBlitDisplayObject, param2:int) : IBlitDisplayObject;
      
      function AddChild(param1:IBlitDisplayObject) : IBlitDisplayObject;
      
      function RemoveChildAt(param1:int) : IBlitDisplayObject;
      
      function RemoveChild(param1:IBlitDisplayObject) : IBlitDisplayObject;
      
      function RemoveAllChildren() : void;
      
      function Contains(param1:IBlitDisplayObject) : Boolean;
      
      function GetChildAt(param1:int) : IBlitDisplayObject;
      
      function GetChildIndex(param1:IBlitDisplayObject) : int;
      
      function GetChildByName(param1:String) : IBlitDisplayObject;
      
      function get numChildren() : int;
      
      function SwapChildren(param1:IBlitClip, param2:IBlitClip) : void;
      
      function SwapChildrenAt(param1:int, param2:int) : void;
      
      function get mouseEnabled() : Boolean;
      
      function set mouseEnabled(param1:Boolean) : void;
   }
}
