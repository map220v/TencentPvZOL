package com.qq.modules.equipment
{
   import com.qq.modules.bag.model.vo.BagItemVO;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.equipment.model.EquipmentVO;
   import com.qq.templates.font.FontNormal;
   import com.tencent.protobuf.Int64;
   
   public class EquipmentUtils
   {
       
      
      public function EquipmentUtils()
      {
         super();
      }
      
      public static function checkEquipmentInCard(param1:EquipmentVO, param2:Int64) : Boolean
      {
         if(param1 && param2)
         {
            return param2.compare(param1.cardUID);
         }
         return false;
      }
      
      public static function getScore(param1:EquipmentVO) : int
      {
         var _loc2_:ServerConfigTemplateFactory = ServerConfigTemplateFactory.instance;
         return _loc2_.iEquipScoreA * param1.level + _loc2_.iEquipScoreB * param1.rank + _loc2_.iEquipScoreC;
      }
      
      public static function checkEquipmentPosition(param1:EquipmentVO, param2:int) : Boolean
      {
         if(param1 && param1.template)
         {
            return param1.template.position == param2;
         }
         return false;
      }
      
      public static function getQualityByRank(param1:int) : int
      {
         if(param1 >= 5)
         {
            return 5;
         }
         return param1;
      }
      
      public static function getStarByRank(param1:int) : int
      {
         if(param1 > 5)
         {
            return param1 - 5;
         }
         return 0;
      }
      
      public static function sortByScore(param1:BagItemVO, param2:BagItemVO) : int
      {
         var _loc3_:int = param2.equipmentVO.score - param1.equipmentVO.score;
         if(_loc3_ == 0)
         {
            _loc3_ = param2.equipmentVO.rank - param1.equipmentVO.rank;
         }
         return _loc3_;
      }
      
      public static function getTopScore(param1:Vector.<BagItemVO>) : int
      {
         var _loc2_:Vector.<BagItemVO> = param1.concat();
         _loc2_ = _loc2_.sort(EquipmentUtils.sortByScore);
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = Math.min(EquipmentConst.CLONE_COUNT_BOUNDS,_loc3_);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            if(_loc6_ < _loc3_)
            {
               _loc5_ += _loc2_[_loc6_].equipmentVO.score;
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      public static function getEquipmentTypeName(param1:int) : String
      {
         return FontNormal["EQUIPMENT_TYPE_" + param1];
      }
      
      public static function defaultSort(param1:BagItemVO, param2:BagItemVO) : int
      {
         var _loc3_:EquipmentVO = param1.equipmentVO;
         var _loc4_:EquipmentVO = param2.equipmentVO;
         if(_loc3_.score != _loc4_.score)
         {
            return _loc4_.score - _loc3_.score;
         }
         if(_loc3_.rank != _loc4_.rank)
         {
            return _loc4_.rank - _loc3_.rank;
         }
         if(_loc3_.template.position != _loc4_.template.position)
         {
            return _loc3_.template.position - _loc4_.template.position;
         }
         return _loc4_.template.id - _loc3_.template.id;
      }
   }
}
