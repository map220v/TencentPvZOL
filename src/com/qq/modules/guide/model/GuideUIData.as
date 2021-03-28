package com.qq.modules.guide.model
{
   import com.qq.GameGloble;
   import com.qq.modules.guide.model.templates.GuideTemplateFactory;
   import com.qq.modules.guide.model.templates.ce.OpenButtonInfoTemplateCE;
   
   public class GuideUIData
   {
      
      private static var _instance:GuideUIData;
       
      
      private var _uiLockList:Array;
      
      public function GuideUIData()
      {
         super();
         this._uiLockList = new Array();
      }
      
      public static function getInstance() : GuideUIData
      {
         if(_instance == null)
         {
            _instance = new GuideUIData();
         }
         return _instance;
      }
      
      public function init(param1:int) : void
      {
         var _loc5_:OpenButtonInfoTemplateCE = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:* = false;
         var _loc2_:Vector.<OpenButtonInfoTemplateCE> = GuideTemplateFactory.instance.cacheOpenButtonInfoTemplate;
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_];
            _loc6_ = String(_loc5_.id);
            _loc7_ = int(_loc5_.openLv);
            _loc8_ = !GameGloble.actorModel.checkIfOpenDaySatisfied(_loc5_.openDays,_loc7_);
            this._uiLockList[_loc6_] = _loc8_;
            _loc4_++;
         }
      }
      
      public function isLock(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         if(this._uiLockList[param1] != null)
         {
            _loc2_ = this._uiLockList[param1];
         }
         else
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public function unlock(param1:String) : void
      {
         if(this._uiLockList[param1] == null)
         {
            return;
         }
         this._uiLockList[param1] = false;
      }
   }
}
