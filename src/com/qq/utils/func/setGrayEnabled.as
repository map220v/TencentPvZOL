package com.qq.utils.func
{
   import com.qq.managers.FilterManager;
   import flash.display.InteractiveObject;
   
   public function setGrayEnabled(param1:InteractiveObject, param2:Boolean) : void
   {
      if(param1)
      {
         param1.mouseEnabled = param2;
         param1.filters = !!param2 ? null : [FilterManager.getGaryFilter()];
      }
   }
}
