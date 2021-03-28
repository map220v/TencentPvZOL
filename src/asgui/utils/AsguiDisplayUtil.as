package asgui.utils
{
   import asgui.core.ILayoutComponent;
   import asgui.managers.SystemManager;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.utils.describeType;
   
   public final class AsguiDisplayUtil
   {
       
      
      public function AsguiDisplayUtil()
      {
         super();
      }
      
      public static function DisplayListToCode(param1:Array) : String
      {
         var code:String = null;
         var p:DisplayObject = null;
         var i:int = 0;
         var dp:DisplayObject = null;
         var xml:XML = null;
         var xList:XMLList = null;
         var displayList:Array = param1;
         var list:Array = displayList.concat();
         code = "";
         try
         {
            while(list.length > 0)
            {
               if(code.length > 0)
               {
                  code += "/";
               }
               dp = list.pop();
               if(dp is ILayoutComponent && (dp as ILayoutComponent).id != null)
               {
                  code += (dp as ILayoutComponent).id;
               }
               else if(dp.name.indexOf("instance") == -1)
               {
                  code += dp.name;
               }
               else if(p)
               {
                  xml = describeType(p);
                  xList = xml["variable"];
                  i = 0;
                  while(i < xList.length())
                  {
                     if(dp == p[String(xList[i].@name)])
                     {
                        code += String(xList[i].@name);
                        break;
                     }
                     i++;
                  }
               }
               else if(dp.parent)
               {
                  code += dp.parent.getChildIndex(dp);
               }
               else if(dp.name)
               {
                  code += dp.name;
               }
               else
               {
                  code += dp.toString();
               }
               p = dp;
            }
         }
         catch(e:Error)
         {
            return code;
         }
         return code;
      }
      
      public static function CodeToDisplay(param1:String, param2:DisplayObjectContainer = null, param3:Boolean = true) : DisplayObject
      {
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:ILayoutComponent = null;
         var _loc4_:Array = param1.split("/");
         if(param2 == null)
         {
            param2 = SystemManager.instance;
         }
         var _loc5_:DisplayObject = param2;
         while(_loc4_.length > 0)
         {
            _loc7_ = _loc4_.shift();
            _loc8_ = null;
            if(_loc5_ is DisplayObjectContainer)
            {
               _loc8_ = (_loc5_ as DisplayObjectContainer).getChildByName(_loc7_);
            }
            if(_loc8_ == null)
            {
               if(_loc5_ is DisplayObjectContainer)
               {
                  _loc6_ = 0;
                  while(_loc6_ < (_loc5_ as DisplayObjectContainer).numChildren)
                  {
                     if((_loc9_ = (_loc5_ as DisplayObjectContainer).getChildAt(_loc6_) as ILayoutComponent) && _loc9_.id == _loc7_)
                     {
                        _loc8_ = _loc9_ as DisplayObjectContainer;
                        break;
                     }
                     _loc6_++;
                  }
               }
            }
            if(_loc8_ == null)
            {
               if(_loc5_.hasOwnProperty(_loc7_))
               {
                  _loc8_ = _loc5_[_loc7_];
               }
            }
            if(_loc8_)
            {
               _loc5_ = _loc8_;
            }
            else if(!param3)
            {
               return null;
            }
         }
         return _loc5_;
      }
   }
}
