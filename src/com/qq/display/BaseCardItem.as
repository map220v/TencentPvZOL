package com.qq.display
{
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.dummy.model.DummyZombieInfo;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.tencent.protobuf.Int64;
   
   public class BaseCardItem extends QCanvas
   {
       
      
      public function BaseCardItem(param1:Class = null)
      {
         super(param1);
      }
      
      public function setDummyData(param1:DummyZombieInfo) : void
      {
      }
      
      public function setData(param1:CardItemVO, param2:BattleLineupCardTemp = null) : void
      {
      }
      
      public function setDataBySetting(param1:BattleLineupCardTemp) : void
      {
      }
      
      public function set selected(param1:Boolean) : void
      {
      }
      
      public function get selected() : Boolean
      {
         return true;
      }
      
      public function setQuality(param1:int) : void
      {
      }
      
      public function setLevel(param1:int) : void
      {
      }
      
      public function setStrengthLv(param1:int) : void
      {
      }
      
      public function setQuiltyLv(param1:CardItemVO) : void
      {
      }
      
      public function setQuiltyLvNum(param1:int, param2:int) : void
      {
      }
      
      public function setEmbattle(param1:Boolean) : void
      {
      }
      
      public function setCardStatus(param1:int, param2:Int64) : void
      {
      }
      
      public function setStar(param1:int, param2:int) : void
      {
      }
   }
}
