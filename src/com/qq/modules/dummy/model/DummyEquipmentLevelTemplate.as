package com.qq.modules.dummy.model
{
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.dummy.model.templates.ce.DummyEquipmentLevelTemplateCE;
   
   public class DummyEquipmentLevelTemplate extends DummyEquipmentLevelTemplateCE
   {
       
      
      private var _needItemList:Array;
      
      public function DummyEquipmentLevelTemplate()
      {
         super();
      }
      
      public function get needItemList() : Array
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Dto_IdNum = null;
         if(this._needItemList == null)
         {
            this._needItemList = new Array();
            _loc1_ = needItems.split(";");
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if((_loc5_ = (_loc4_ = _loc1_[_loc3_]).split(":")).length == 2)
               {
                  (_loc6_ = new Dto_IdNum()).id = _loc5_[0];
                  _loc6_.num = _loc5_[1];
                  this._needItemList.push(_loc6_);
               }
               _loc3_++;
            }
         }
         return this._needItemList;
      }
   }
}
