package com.qq.display
{
   import asgui.core.UIComponent;
   import asgui.managers.PopUpManagerImpl;
   import asgui.managers.SystemManager;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.getQualifiedClassName;
   
   public class QPopUpManagerImpl extends PopUpManagerImpl
   {
       
      
      public function QPopUpManagerImpl()
      {
         super();
      }
      
      override public function AddPopUp(param1:DisplayObject, param2:DisplayObjectContainer = null, param3:Boolean = false, param4:Boolean = true, param5:Point = null) : void
      {
         super.AddPopUp(param1,param2,param3,param4,param5);
         if(param1 is UIComponent && GameGloble.context)
         {
            GameGloble.context.dispatchEvent(new CommonEvent("onOpen" + getQualifiedClassName(param1).split("::")[1]));
         }
      }
      
      override public function RemovePopUp(param1:DisplayObject, param2:Boolean = true) : void
      {
         super.RemovePopUp(param1,param2);
         if(param1 is UIComponent && GameGloble.context)
         {
            GameGloble.context.dispatchEvent(new CommonEvent("onClose" + getQualifiedClassName(param1).split("::")[1]));
         }
      }
      
      public function closeAllVisibleComponents() : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:UIComponent = null;
         var _loc1_:Sprite = SystemManager.instance.popUpLayer;
         var _loc3_:int = _loc1_.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
            if((_loc5_ = _loc1_.getChildAt(_loc2_) as UIComponent) != null && _loc5_.visible)
            {
               this.RemovePopUp(_loc5_,false);
               _loc5_.Dispose();
               _loc4_ = _loc1_.numChildren;
               _loc2_ -= _loc3_ - _loc4_;
               _loc3_ = _loc4_;
            }
            _loc2_++;
         }
      }
      
      public function getOpenedComponent(param1:String) : UIComponent
      {
         var _loc3_:int = 0;
         var _loc4_:UIComponent = null;
         var _loc5_:String = null;
         var _loc2_:Sprite = SystemManager.instance.popUpLayer;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.numChildren)
         {
            if((_loc4_ = _loc2_.getChildAt(_loc3_) as UIComponent) != null)
            {
               if((_loc5_ = getQualifiedClassName(_loc4_).split("::")[1]) == param1)
               {
                  return _loc4_;
               }
            }
            _loc3_++;
         }
         return null;
      }
   }
}
