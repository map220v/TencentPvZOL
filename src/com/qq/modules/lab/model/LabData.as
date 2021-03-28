package com.qq.modules.lab.model
{
   import PVZ.Cmd.Dto_LabItem;
   import com.qq.modules.lab.model.vo.LabTechVO;
   
   public class LabData
   {
       
      
      public var isHaveNewTech:Boolean;
      
      private var _labTechArr:Vector.<LabTechVO>;
      
      public function LabData()
      {
         super();
      }
      
      public function get labTechArr() : Vector.<LabTechVO>
      {
         return this._labTechArr.sort(this.sortAllTechLearned);
      }
      
      public function get allTechLearned() : Vector.<LabTechVO>
      {
         var _loc2_:LabTechVO = null;
         var _loc1_:Vector.<LabTechVO> = new Vector.<LabTechVO>();
         for each(_loc2_ in this._labTechArr)
         {
            if(_loc2_.dto.labStatus == 2)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_.sort(this.sortAllTechLearned);
      }
      
      private function sortAllTechLearned(param1:LabTechVO, param2:LabTechVO) : Number
      {
         return param1.labTechTemplate.sort - param2.labTechTemplate.sort;
      }
      
      public function get allTechNotLearned() : Vector.<LabTechVO>
      {
         var _loc2_:LabTechVO = null;
         var _loc1_:Vector.<LabTechVO> = new Vector.<LabTechVO>();
         for each(_loc2_ in this._labTechArr)
         {
            if(_loc2_.dto.labStatus == 1)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getInfoById(param1:int) : LabTechVO
      {
         var _loc2_:LabTechVO = null;
         for each(_loc2_ in this._labTechArr)
         {
            if(_loc2_.dto.labId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function setLabInfo(param1:Array) : void
      {
         var _loc2_:Dto_LabItem = null;
         this._labTechArr = new Vector.<LabTechVO>();
         for each(_loc2_ in param1)
         {
            this._labTechArr.push(new LabTechVO(_loc2_));
         }
      }
      
      public function updateTech(param1:Dto_LabItem) : LabTechVO
      {
         var _loc2_:LabTechVO = null;
         var _loc3_:int = this._labTechArr.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this._labTechArr[_loc4_].dto.labId == param1.labId)
            {
               _loc2_ = new LabTechVO(param1);
               this._labTechArr[_loc4_] = _loc2_;
               break;
            }
            _loc4_++;
         }
         if(!_loc2_)
         {
            _loc2_ = new LabTechVO(param1);
            this._labTechArr.push(_loc2_);
         }
         return _loc2_;
      }
   }
}
